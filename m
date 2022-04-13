Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A9FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jf3kbOG0OULIwiNvqnFjuZ05CztEnb+Tknwbw799d+w=; b=eaeiNL6ZlZfOXs
	JuPoSOqEYWTi6LhH1567EgtpNSwMlXXi1tVF+KSqnLjsjJFnKICvw9RYJCCpg6gRwcJu9U8AgNsPn
	EI6DxaE37MyjRrlksREh0BKoaBO3rL1652DFBZzoDwN7Bg38QhVXIe/2G9ugkpGgPZXFrbRck4NJI
	zy/F/satkbbv+6YEquxSvE0VaXLiCA0MlrDeadD3/pKKOD76cZy8Z1ndLgvVw7pqahedRWJZLB1/1
	5vwcixTnkGQ01rHxNvkDzc7cIWL5yF4Cl7rhvncWEIoQRK+GbCaFTLY7WM7A/dvRzAnUqsjQG2aEf
	j84zzhQ+y6p+tDnz1Z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neYbF-0009Ff-Lv; Wed, 13 Apr 2022 08:43:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neYas-00094T-MD; Wed, 13 Apr 2022 08:43:20 +0000
X-UUID: d0dd45cd813d4f16a7bccce9318b3456-20220413
X-UUID: d0dd45cd813d4f16a7bccce9318b3456-20220413
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 834182670; Wed, 13 Apr 2022 01:43:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Apr 2022 01:43:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 13 Apr 2022 16:43:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 13 Apr 2022 16:43:10 +0800
Message-ID: <1c37ca0eb8fad7afd4eb4e32566d8affd71c894f.camel@mediatek.com>
Subject: Re: [PATCH v18 03/10] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, <kbuild@lists.01.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Wed, 13 Apr 2022 16:43:10 +0800
In-Reply-To: <202204130935.urqkcDrG-lkp@intel.com>
References: <202204130935.urqkcDrG-lkp@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_014318_785345_D1CB1794 
X-CRM114-Status: GOOD (  17.06  )
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
Cc: devicetree@vger.kernel.org, moudy.ho@mediatek.com, kbuild-all@lists.01.org,
 lkp@intel.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>, David
 Airlie <airlied@linux.ie>, singo.chang@mediatek.com, roy-cw.yeh@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 hsinyi@chromium.org, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dan,

Thanks for the reviews.

On Wed, 2022-04-13 at 09:07 +0300, Dan Carpenter wrote:
> Hi "jason-jh.lin",
> 
> url:    
> https://urldefense.com/v3/__https://github.com/intel-lab-lkp/linux/commits/jason-jh-lin/Add-Mediatek-Soc-DRM-vdosys0-support-for-mt8195/20220412-183359__;!!CTRNKA9wMg0ARbw!wAjdEcyQM5SvYaLtDA1d-7DTP-0V0x2EYmyKkpr3QDeGXEknO3vUGir-oiGEYodb6RAr$
>  
> base:   git://anongit.freedesktop.org/drm/drm drm-next
> config: arc-randconfig-m031-20220411 (
> https://urldefense.com/v3/__https://download.01.org/0day-ci/archive/20220413/202204130935.urqkcDrG-lkp@intel.com/config__;!!CTRNKA9wMg0ARbw!wAjdEcyQM5SvYaLtDA1d-7DTP-0V0x2EYmyKkpr3QDeGXEknO3vUGir-oiGEYvQ-IvSq$
>  )
> compiler: arc-elf-gcc (GCC) 11.2.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> smatch warnings:
> drivers/soc/mediatek/mtk-mmsys.c:315 mtk_mmsys_probe() warn: passing
> zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +315 drivers/soc/mediatek/mtk-mmsys.c
> 
> 13032709e23285 Matthias Brugger       2020-03-25  281  static int
> mtk_mmsys_probe(struct platform_device *pdev)
> 13032709e23285 Matthias Brugger       2020-03-25  282  {
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  283  	struct
> device *dev = &pdev->dev;
> 13032709e23285 Matthias Brugger       2020-03-25  284  	struct
> platform_device *clks;
> 667c769246b01c Enric Balletbo i Serra 2020-03-25  285  	struct
> platform_device *drm;
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  286  	const
> struct mtk_mmsys_match_data *match_data;
> ce15e7faa2fc54 CK Hu                  2021-03-17  287  	struct
> mtk_mmsys *mmsys;
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  288  	struct
> resource *res;
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  289  	int
> ret;
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  290  
> ce15e7faa2fc54 CK Hu                  2021-03-17  291  	mmsys =
> devm_kzalloc(dev, sizeof(*mmsys), GFP_KERNEL);
> ce15e7faa2fc54 CK Hu                  2021-03-17  292  	if
> (!mmsys)
> ce15e7faa2fc54 CK Hu                  2021-03-17  293  		
> return -ENOMEM;
> ce15e7faa2fc54 CK Hu                  2021-03-17  294  
> ce15e7faa2fc54 CK Hu                  2021-03-17  295  	mmsys-
> >regs = devm_platform_ioremap_resource(pdev, 0);
> ce15e7faa2fc54 CK Hu                  2021-03-17  296  	if
> (IS_ERR(mmsys->regs)) {
> ce15e7faa2fc54 CK Hu                  2021-03-17  297  		
> ret = PTR_ERR(mmsys->regs);
> cc6576029aedc7 Enric Balletbo i Serra 2020-10-06  298  		
> dev_err(dev, "Failed to ioremap mmsys registers: %d\n", ret);
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  299  		
> return ret;
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  300  	}
> 2c758e301ed95a Enric Balletbo i Serra 2020-03-25  301  
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  302  	spin_lo
> ck_init(&mmsys->lock);
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  303  
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  304  	mmsys-
> >rcdev.owner = THIS_MODULE;
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  305  	mmsys-
> >rcdev.nr_resets = 32;
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  306  	mmsys-
> >rcdev.ops = &mtk_mmsys_reset_ops;
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  307  	mmsys-
> >rcdev.of_node = pdev->dev.of_node;
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  308  	ret =
> devm_reset_controller_register(&pdev->dev, &mmsys->rcdev);
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  309  	if
> (ret) {
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  310  		
> dev_err(&pdev->dev, "Couldn't register mmsys reset controller: %d\n",
> ret);
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  311  		
> return ret;
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  312  	}
> f27ef2856343e2 Enric Balletbo i Serra 2021-09-30  313  
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  314  	res =
> platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12 @315  	if
> (PTR_ERR(res)) {
> 
> You probably meant IS_ERR() instead of PTR_ERR().  But actually
> platform_get_resource() does not return error pointers, it returns
> NULL so the correct check is:
> 
> 	if (!res) {
> 
Yes, I missed this fix and I will also apply the fix to 
mtk_drm_drv.c:639 in [v18,07/10] of this series.

Thank you!

Regards,
Jason-JH.Lin

> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  316  		
> dev_err(dev, "Couldn't get mmsys resource\n");
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  317  		
> return -EINVAL;
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  318  	}
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  319  	mmsys-
> >io_start = res->start;
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  320  
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  321  	match_d
> ata = of_device_get_match_data(dev);
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  322  	if
> (match_data->num_drv_data > 1) {
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  323  		
> /* This SoC has multiple mmsys channels */
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  324  		
> ret = mtk_mmsys_find_match_drvdata(mmsys, match_data);
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  325  		
> if (ret < 0) {
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  326  		
> 	dev_err(dev, "Couldn't get match driver data\n");
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  327  		
> 	return ret;
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  328  		
> }
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  329  		
> mmsys->data = match_data->drv_data[ret];
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  330  	} else
> {
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  331  		
> dev_dbg(dev, "Using single mmsys channel\n");
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  332  		
> mmsys->data = match_data->drv_data[0];
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  333  	}
> 8cfc54a36d3e79 jason-jh.lin           2022-04-12  334  
> ce15e7faa2fc54 CK Hu                  2021-03-17  335  	platfor
> m_set_drvdata(pdev, mmsys);
> 13032709e23285 Matthias Brugger       2020-03-25  336  
> ce15e7faa2fc54 CK Hu                  2021-03-17  337  	clks =
> platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
> 13032709e23285 Matthias Brugger       2020-03-25  338  		
> 			     PLATFORM_DEVID_AUTO, NULL, 0);
> 13032709e23285 Matthias Brugger       2020-03-25  339  	if
> (IS_ERR(clks))
> 13032709e23285 Matthias Brugger       2020-03-25  340  		
> return PTR_ERR(clks);
> 13032709e23285 Matthias Brugger       2020-03-25  341  
> 667c769246b01c Enric Balletbo i Serra 2020-03-25  342  	drm =
> platform_device_register_data(&pdev->dev, "mediatek-drm",
> 667c769246b01c Enric Balletbo i Serra 2020-03-25  343  		
> 			    PLATFORM_DEVID_AUTO, NULL, 0);
> ff34e17cf9bce8 Wei Yongjun            2020-05-06  344  	if
> (IS_ERR(drm)) {
> ff34e17cf9bce8 Wei Yongjun            2020-05-06  345  		
> platform_device_unregister(clks);
> 667c769246b01c Enric Balletbo i Serra 2020-03-25  346  		
> return PTR_ERR(drm);
> ff34e17cf9bce8 Wei Yongjun            2020-05-06  347  	}
> 667c769246b01c Enric Balletbo i Serra 2020-03-25  348  
> 13032709e23285 Matthias Brugger       2020-03-25  349  	return
> 0;
> 13032709e23285 Matthias Brugger       2020-03-25  350  }
> 
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
