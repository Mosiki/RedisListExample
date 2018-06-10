package io.github.mosiki.web.controller;

import io.github.mosiki.entity.Phone;
import io.github.mosiki.service.PhoneService;
import io.github.mosiki.vo.DynamicVO;
import io.github.mosiki.vo.PhoneVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
public class PhoneController {
    List<Phone> phones = Arrays.asList(new Phone(1, "苹果"),
            new Phone(2, "小米"),
            new Phone(3, "华为"),
            new Phone(4, "一加"),
            new Phone(5, "vivo"));

    @Autowired
    private PhoneService phoneService;

    @RequestMapping("/")
    public ModelAndView home() {
        for (Phone phone : phones) {
            int ranking = phoneService.phoneRank(phone.getId()) + 1;
            phone.setRanking(ranking == 0 ? "榜上无名" : "销量排名：" + ranking);
        }

        ModelAndView view = new ModelAndView("index");
        view.addObject("phones", phones);

        List<PhoneVO> phbList = phoneService.getPhbList();
        List<DynamicVO> dynamicList = phoneService.getBuyDynamic();
        view.addObject("dynamicList", dynamicList);
        view.addObject("phbList", phbList);
        return view;
    }

    /**
     * 模拟购买手机
     *
     * @param phoneId
     * @return
     */
    @RequestMapping("/buy/{phoneId}")
    public String buyPhone(@PathVariable int phoneId) {
        phoneService.buyPhone(phoneId);
        return "redirect:/";
    }

    /**
     * 获得指定手机的排名
     *
     * @param phoneId
     * @return
     */
    @RequestMapping("/ranking/{phoneId}")
    @ResponseBody
    public int phoneRanking(@PathVariable int phoneId) {
        return phoneService.phoneRank(phoneId);
    }

    /**
     * 清空缓存
     * @return
     */
    @RequestMapping("/clear")
    public String clear() {
        phoneService.clear();
        return "redirect:/";
    }
}
