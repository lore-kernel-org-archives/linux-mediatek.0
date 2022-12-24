Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91DFFC4332F
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Dec 2022 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TRIB/uqq1D1ds14eihu2u9/Z/nUyFPPLNm+Ijo9Q/C8=; b=27xJu3l9ZM58hq
	pWhaP/H8yyIfrK45irwEeBZrhEQbBgvIo94GGr6j8iXyulM533HJbkjEJZ3FV4NOSp8K9CCLjfqAN
	YQrltRUpRa56A/4fRsX9/bvi68gl1KqbWTg4OSvfS8TFBzJ2vZjI9NRfYIUTbTkoFVDV55Rt0EXme
	+IN/3KCCwpcH9p/6jK/J4PYflah1aEYrKoT0XyRxBRE+V/a6spuhOqlcM/C/AMjh+RGp5RpN1KZ3Y
	r1EAQZhvYEMgX2MQ0o48ljh7AWcMx9OTgEdWVn3D2ora3zzLyywvx5UO3JrnPuqiPENElFQgkQ7Ym
	Q/yL3uYUYVN6E1NmuL0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96Jr-0011nv-L8; Sat, 24 Dec 2022 15:20:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p90p4-00GfOt-CJ; Sat, 24 Dec 2022 09:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=TRIB/uqq1D1ds14eihu2u9/Z/nUyFPPLNm+Ijo9Q/C8=; b=TI+XS+T9fpqDYhBETJwTtRFkes
	kAYsWCA2okTuidM/6+6EY17vHszn/q1Sa7bJYUeoP2NXWl5L/vZtP/u30K2bQFG6Q4EaQKiH7OHPR
	+xHKBU1vZvL91+gbpv1ghxYBzvhl5XJSCS/Xdf6X7CDtEt4H8Og+BBYKLioErnNP2+hAAz/fekOSQ
	uEf1SGLPazUmKgVHLtCtjSa9qoQ3FtNa9HrSK0evLi4GSzJ7ZTkF48SuCJHVJPz/lKRog2NsN/KOd
	NBRAp5QHUvwOv+nTpe3dJiwSHLPY95EEapP+IDPOZMvPz9FGgQxGznjB8NRcdZEDj1g92MZmmwAzs
	VJkp4MhA==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1p8yjG-00EVMd-1p;
	Sat, 24 Dec 2022 07:14:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so4819140wmb.5;
        Fri, 23 Dec 2022 23:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TRIB/uqq1D1ds14eihu2u9/Z/nUyFPPLNm+Ijo9Q/C8=;
        b=dJhcufzpI8v7auHG2F7vYYXvc4SKzUN3cGCkrzIwmcp8j/CDEqE6qve3Q7qfMsiCvB
         pj2xFJ9JrATBheS0CPByKqX7fhozBw7ONDd3Z6LQo47As9CiEyLHPHewEPQ0d12crCXG
         tLH7t760elDFi3wBXyYFkS1wpq28v5MFWUvuMFtBNILtP1p2GRhDCYsGOkPgeJfjFddQ
         r/2NIl7kDf3w/pOuuAH2NF+3jSE7KIKJSa1kfbiakwQ2aQpf9n4pSAC6TuMZ3THCbrnT
         6aQA/tMF7D6llq7+ROkxBVtbsZ9+rhxAzNFpMAnw0KlwuFyMhdefhzz7ZaRAy9eqQxyA
         3bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRIB/uqq1D1ds14eihu2u9/Z/nUyFPPLNm+Ijo9Q/C8=;
        b=Xf09dhJXwAZCzIwLzl2iCHFrKUB+O9iBSP54WSQHW/UYQLw3cCrUy3Q6SQU+C77iJE
         832R2lukFqhubM4feprBWCqg8iQDjxRuk3NN2re80W+o2YA9teXH5wifCVJH1oEzmJ1G
         htQzmAIpraLvZx+QS02V9kDrBbvf7ZRo7KMsjkUudY1n9/+AhouoJ+qK5swAyQZVh7TG
         QpxsRGGBaevyC+CYHiaHCHxeQziD/NigeD6vVUH4NdDmFyi4VJyANfLbDV+w/TJQFOyZ
         ZSnWXy4OIX/vkS09r5dmYMPSrfZDeGuT7OYyb+kr1KggzcpHcN3VBi1vR6Is+HaCzgZw
         JuJw==
X-Gm-Message-State: AFqh2kpOw8VMYoCJR0GK6wWZVWL0XQUIDZrOG5R5kp0CtsvnpFYKRmT4
	EgzW/e9vtuyv9StfirOxPm8=
X-Google-Smtp-Source: AMrXdXs1TWgBnGsltnpH+XplZfqjbDa61uyuzwMISc+4HbT/go1y6J3QQ9zAkCYFUJsj8oLlBzOzsA==
X-Received: by 2002:a05:600c:4f48:b0:3c6:f7ff:6f87 with SMTP id m8-20020a05600c4f4800b003c6f7ff6f87mr9065324wmq.11.1671866036633;
        Fri, 23 Dec 2022 23:13:56 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t184-20020a1c46c1000000b003b4a699ce8esm11568562wma.6.2022.12.23.23.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 23:13:56 -0800 (PST)
Date: Sat, 24 Dec 2022 10:13:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mturquette@baylibre.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, sboyd@kernel.org,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	johnson.wang@mediatek.com, miles.chen@mediatek.com,
	fparent@baylibre.com, chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com, y.oudjana@protonmail.com,
	nfraprado@collabora.com, rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org, daniel@makrotopia.org,
	jose.exposito89@gmail.com, yangyingliang@huawei.com,
	pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
	ikjn@chromium.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v2 10/23] clk: mediatek: mt8173: Break down clock drivers
 and allow module build
Message-ID: <202212240437.1D3FXJyP-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223094259.87373-11-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_071358_773955_C93D082E 
X-CRM114-Status: UNSURE (   6.91  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi AngeloGioacchino,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/clk-mediatek-mt8192-Correctly-unregister-and-free-clocks-on-failure/20221223-174705
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20221223094259.87373-11-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v2 10/23] clk: mediatek: mt8173: Break down clock drivers and allow module build
config: parisc-randconfig-m031-20221219
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/clk/mediatek/clk-mt8173-apmixedsys.c:95 clk_mt8173_apmixed_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +95 drivers/clk/mediatek/clk-mt8173-apmixedsys.c

c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   85  static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   86  {
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   87  	struct device_node *node = pdev->dev.of_node;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   88  	struct clk_hw_onecell_data *clk_data;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   89  	void __iomem *base;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   90  	struct clk_hw *hw;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   91  	int r;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   92  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   93  	base = of_iomap(node, 0);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   94  	if (!base)
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  @95  		return PTR_ERR(base);

return -ENOMEM?

c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   96  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   97  	clk_data = mtk_alloc_clk_data(CLK_APMIXED_NR_CLK);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   98  	if (IS_ERR_OR_NULL(clk_data))
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23   99  		return -ENOMEM;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  100  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  101  	r = mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  102  	if (r)
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  103  		goto free_clk_data;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  104  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  105  	hw = mtk_clk_register_ref2usb_tx("ref2usb_tx", "clk26m", base + REGOFF_REF2USB);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  106  	if (IS_ERR(hw)) {
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  107  		r = PTR_ERR(hw);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  108  		dev_err(&pdev->dev, "Failed to register ref2usb_tx: %d\n", r);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  109  		goto unregister_plls;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  110  	}
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  111  	clk_data->hws[CLK_APMIXED_REF2USB_TX] = hw;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  112  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  113  	hw = devm_clk_hw_register_divider(&pdev->dev, "hdmi_ref", "tvdpll_594m", 0,
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  114  					  base + REGOFF_HDMI_REF, 16, 3,
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  115  					  CLK_DIVIDER_POWER_OF_TWO, NULL);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  116  	clk_data->hws[CLK_APMIXED_HDMI_REF] = hw;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  117  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  118  	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  119  	if (r)
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  120  		goto unregister_ref2usb;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  121  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  122  	return 0;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  123  
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  124  unregister_ref2usb:
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  125  	mtk_clk_unregister_ref2usb_tx(clk_data->hws[CLK_APMIXED_REF2USB_TX]);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  126  unregister_plls:
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  127  	mtk_clk_unregister_plls(plls, ARRAY_SIZE(plls), clk_data);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  128  free_clk_data:
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  129  	mtk_free_clk_data(clk_data);
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  130  	return r;
c10b45573221c8 AngeloGioacchino Del Regno 2022-12-23  131  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp


