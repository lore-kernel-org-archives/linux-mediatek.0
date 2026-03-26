Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B269106F2E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hJidR7QlZb7c5WIdyj3iesak/Jfa6pt2GqscpVScNO0=; b=d7PD3/DSFTLKnF
	q/Dw2Oemp4eim2Aw5rkbl4EHyn4CN80Qhp9Os68yTP1DoZR3Ljo+7UdWqHmIM5VCOEoESZxEGTh4l
	FmKjrpbP1ZrkkbMPjOLeizl/Y/2PSmWOYOoU9ZlEmV/k/JQXZhtFK81GWG6wLEZQlSDgbv4b1ZBvc
	TtEHAQE25ZnU8DaosalGRPm3jGcgTikHd2QeNuIGWC/zOa2LVfOL0khxAiw0sPNwqMc+SnIiBWJwL
	rdHsMcnA9koh2JLnfKYXajY9UjCjBpawZouzblWJ0eqwX8ABuSYBeoJtYFKblKzaQlAF4YTb74twV
	/qLxL9RkqM8jnIh1nQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fc4-00000004yTb-1Z0c;
	Thu, 26 Mar 2026 07:58:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fc1-00000004ySO-257I
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 07:58:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-439bcec8613so408341f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 00:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774511919; x=1775116719; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJidR7QlZb7c5WIdyj3iesak/Jfa6pt2GqscpVScNO0=;
        b=egh2YDgdpkODhKY3puBoNIZUC/hCmJBfGHtUTa/4qgcliLhVCpvsLISCvSy6CqoO9i
         H5OgVK4vA19wBtMrnh5j5nm2035XJFcPHKj04zgQCg+o8GdmnQ/nN9TFkGcFJeGpvMQN
         ulu31aBqiAp8iIt5WgwKWEKdJzYqIhHsBimLR+ZsF+U5zbZA6hAXfvtqrNcjQyrp7sfq
         rX5dEoLxOlVrGDEXXn70AuCufEVmrTBtsy9dUvr0/MpE4dupv4ZSmrQnurNJ+EiSGkSP
         +Cs8BgR4F3NeTHcTh9UkM3CPRtdbzeH8B7eV2o65e3zeR1Au9qCJny7TTxbmDyzJ1o5l
         t3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511919; x=1775116719;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJidR7QlZb7c5WIdyj3iesak/Jfa6pt2GqscpVScNO0=;
        b=HBK82vg1+ojO+cXQzHlD4xliH8SXXtytev64/YHM76VTyIIiAmQM+kAvdkqZozbMek
         opuZYP7Jd0A9p5p0IXO4wLpHHA+3VF19m77asAMAp0AoounI2S+OlgDooo4naY2hOIs1
         MbhC6EMR+lJMnsH1LOZ/4m9U88Q9oxPfDDu9l12HaSU/g/9KGyH8VvVvlmGCKIF3JNYt
         ime6ys8kozg/NxW1Q2XtUOMrs2gdHqxQw5WXCHuZGRzETMZlKnPI4kWziouttiXayE2f
         iyu7uaY497LmgwfTao6dvObTssZ25gx/35gT/HwEmDdYh9IjBCh+wtAF3j0yroY3mMmJ
         20pQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIMrroC6oZutdIZxkIe13rtdvuJOlgjIzayu0hYxiC32h/Qt387z8BPkJ6SDGwzg49jjm6/M8JUhbf/BILEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQbQ7HHQvwXgWJlcaUhF4qKS5wDB1sgDt+xUbS+ANbQpC5WmXy
	rFvijm9ZN2FZVkYyXX2RQMA5kn/F+klYVDawYqm6UG7sPtdVbDT87S9ThyP8ShbexGQ=
X-Gm-Gg: ATEYQzxVTEr+z3ah1gvzAlrWYvYDRCStziizrrZV/aNyeZ32XaTxy109w/2/WhwZ39r
	eppuv6VfXXbVon76SwDbSB8B+kvQcywoLHnD3bQcUkslSUjEQ+iPra2Fxv9LpwYuUdm9xRU0aG/
	bAx90bxzM0w3QN0GF9a9OY2xMAYIsNQRnrN7GmcdnL49Lav+gPIem6wmG0kPo7zZE4k98JDTuo5
	F6VFosGwn2pHd3wjPQ1Lvs/qCZjMra/GZjFwDIkh6Z7mJPETIXIkE45d/w+rpU0bnNdFdQt5jVR
	o52Si5lZ+YwwuI4FKMJGFNbRQodlkC72PDjKMXhMBklvN8AFOpnUcyyuPYwmM4KWZKWRKsi21Vp
	zz87E4SY7tBiZo1avE/81lkMp/v4vH+XvmfokPbEf6U/f8kbOeRG7r3yyEw5EDUo5d1OfU4tH3P
	6og+jR1zu1Pbait7LIugye8WbPz1PI
X-Received: by 2002:a05:6000:438a:b0:43b:564d:c123 with SMTP id ffacd0b85a97d-43b8898d57amr9770384f8f.3.1774511918517;
        Thu, 26 Mar 2026 00:58:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e7111sm5918551f8f.37.2026.03.26.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:58:37 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:58:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chen-Yu Tsai <wenst@chromium.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Chen-Yu Tsai <wenst@chromium.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
Message-ID: <202603261444.jANdMbNC-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325071951.544031-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_005841_565307_46FC9A45 
X-CRM114-Status: UNSURE (   8.40  )
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

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/dt-bindings-clock-mediatek-Add-mt8173-mfgtop/20260325-202618
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20260325071951.544031-3-wenst%40chromium.org
patch subject: [PATCH v2 2/5] clk: mediatek: Add mt8173-mfgtop driver
config: csky-randconfig-r073-20260326 (https://download.01.org/0day-ci/archive/20260326/202603261444.jANdMbNC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202603261444.jANdMbNC-lkp@intel.com/

smatch warnings:
drivers/clk/mediatek/clk-mt8173-mfgtop.c:163 clk_mt8173_mfgtop_probe() warn: missing error code 'ret'

vim +/ret +163 drivers/clk/mediatek/clk-mt8173-mfgtop.c

edc2074329e271 Chen-Yu Tsai 2026-03-25  153  	ret = mtk_clk_register_gates(dev, node, mfg_clks, ARRAY_SIZE(mfg_clks),
edc2074329e271 Chen-Yu Tsai 2026-03-25  154  				     data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  155  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  156  		dev_err_probe(dev, ret, "Failed to register clock gates\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  157  		goto put_pm_runtime;
edc2074329e271 Chen-Yu Tsai 2026-03-25  158  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  159  
edc2074329e271 Chen-Yu Tsai 2026-03-25  160  	data->clk_26m = clk_hw_get_clk(data->clk_data->hws[CLK_MFG_26M], "26m");
edc2074329e271 Chen-Yu Tsai 2026-03-25  161  	if (IS_ERR(data->clk_26m)) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  162  		dev_err_probe(dev, PTR_ERR(data->clk_26m), "Failed to get 26 MHz clock\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25 @163  		goto unregister_clks;

ret = dev_err_probe() or ret = PTR_ERR(data->clk_26m)?

edc2074329e271 Chen-Yu Tsai 2026-03-25  164  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  165  
edc2074329e271 Chen-Yu Tsai 2026-03-25  166  	ret = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  167  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  168  		dev_err_probe(dev, ret, "Failed to add clk OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  169  		goto put_26m_clk;
edc2074329e271 Chen-Yu Tsai 2026-03-25  170  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  171  
edc2074329e271 Chen-Yu Tsai 2026-03-25  172  	data->genpd.name = "mfg-top";
edc2074329e271 Chen-Yu Tsai 2026-03-25  173  	data->genpd.power_on = clk_mt8173_mfgtop_power_on;
edc2074329e271 Chen-Yu Tsai 2026-03-25  174  	data->genpd.power_off = clk_mt8173_mfgtop_power_off;
edc2074329e271 Chen-Yu Tsai 2026-03-25  175  	ret = pm_genpd_init(&data->genpd, NULL, true);
edc2074329e271 Chen-Yu Tsai 2026-03-25  176  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  177  		dev_err_probe(dev, ret, "Failed to add power domain\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  178  		goto del_clk_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  179  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  180  
edc2074329e271 Chen-Yu Tsai 2026-03-25  181  	ret = of_genpd_add_provider_simple(node, &data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  182  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  183  		dev_err_probe(dev, ret, "Failed to add power domain OF provider\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  184  		goto remove_pd;
edc2074329e271 Chen-Yu Tsai 2026-03-25  185  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  186  
edc2074329e271 Chen-Yu Tsai 2026-03-25  187  	ret = of_genpd_add_subdomain(&data->parent_pd, &data->child_pd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  188  	if (ret) {
edc2074329e271 Chen-Yu Tsai 2026-03-25  189  		dev_err_probe(dev, ret, "Failed to link PM domains\n");
edc2074329e271 Chen-Yu Tsai 2026-03-25  190  		goto del_pd_provider;
edc2074329e271 Chen-Yu Tsai 2026-03-25  191  	}
edc2074329e271 Chen-Yu Tsai 2026-03-25  192  
edc2074329e271 Chen-Yu Tsai 2026-03-25  193  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  194  	return 0;
edc2074329e271 Chen-Yu Tsai 2026-03-25  195  
edc2074329e271 Chen-Yu Tsai 2026-03-25  196  del_pd_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  197  	of_genpd_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  198  remove_pd:
edc2074329e271 Chen-Yu Tsai 2026-03-25  199  	pm_genpd_remove(&data->genpd);
edc2074329e271 Chen-Yu Tsai 2026-03-25  200  del_clk_provider:
edc2074329e271 Chen-Yu Tsai 2026-03-25  201  	of_clk_del_provider(node);
edc2074329e271 Chen-Yu Tsai 2026-03-25  202  put_26m_clk:
edc2074329e271 Chen-Yu Tsai 2026-03-25  203  	clk_put(data->clk_26m);
edc2074329e271 Chen-Yu Tsai 2026-03-25  204  unregister_clks:
edc2074329e271 Chen-Yu Tsai 2026-03-25  205  	mtk_clk_unregister_gates(mfg_clks, ARRAY_SIZE(mfg_clks), data->clk_data);
edc2074329e271 Chen-Yu Tsai 2026-03-25  206  put_pm_runtime:
edc2074329e271 Chen-Yu Tsai 2026-03-25  207  	pm_runtime_put(dev);
edc2074329e271 Chen-Yu Tsai 2026-03-25  208  put_of_node:
edc2074329e271 Chen-Yu Tsai 2026-03-25  209  	of_node_put(data->parent_pd.np);
edc2074329e271 Chen-Yu Tsai 2026-03-25  210  	return ret;
edc2074329e271 Chen-Yu Tsai 2026-03-25  211  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


