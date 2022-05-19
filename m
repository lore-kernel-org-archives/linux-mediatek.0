Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 04:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLC4tBwCNOwnRP2yGJH5ell1V7ul6w6POVRzpeIvlhk=; b=jOFCwNeB0rU4m/
	XweXbxj7iOyE7qD20obMxrNFIQ7nKSKBmGkicEVKvg9iRSZ71cYp9zPAHhcM9lTG+oP0DZtWuWbUE
	mX6Imjfoq0FB5lbWlna1khS6WoFbiiB/lK2+BXta4i9Z+7bGx4XbW8h0BdyrnHS6e/61B7HZWlW+f
	bZt+H7mwQeGbxHAPRkov+CiNJEM23OiDm/5bfkb4xsGWZGnJybOdnCc6SWdg+kjCG1yTZzXt8Bbla
	LMHO0Cg87gJotuDbeJRxyAZaBMYTVFBd9wiLdNfxZqEQeZj/Ze5aS7cwaxWohdWVrYfFB2rfxhvEQ
	OaWiqP/n7HLi7z5SExsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrY8t-0050el-2r; Thu, 19 May 2022 04:52:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrY8o-0050dj-Mi; Thu, 19 May 2022 04:52:05 +0000
X-UUID: f5f2597bbc70430a96ad3a655e0ddf5c-20220518
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:30508bcc-9514-4000-a336-4927430feb9a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:75fcbde2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: f5f2597bbc70430a96ad3a655e0ddf5c-20220518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 828181442; Wed, 18 May 2022 21:51:56 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 21:41:55 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 19 May 2022 12:41:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 May 2022 12:41:53 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <bgolaszewski@baylibre.com>, <chun-jie.chen@mediatek.com>,
 <ck.hu@mediatek.com>, <devicetree@vger.kernel.org>, <fparent@baylibre.com>,
 <ikjn@chromium.org>, <jason-jh.lin@mediatek.com>, <kernel@collabora.com>,
 <konrad.dybcio@somainline.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <marijn.suijten@somainline.org>, <martin.botka@somainline.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <mturquette@baylibre.com>, <p.zabel@pengutronix.de>,
 <paul.bouchara@somainline.org>, <phone-devel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>, <sam.shih@mediatek.com>,
 <sboyd@kernel.org>, <tinghan.shen@mediatek.com>, <weiyi.lu@mediatek.com>,
 <wenst@chromium.org>, <y.oudjana@protonmail.com>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v2 6/7] clk: mediatek: Export required symbols to compile
 clk drivers as module
Date: Thu, 19 May 2022 12:41:53 +0800
Message-ID: <20220519044153.11078-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
References: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_215202_772603_3A2DE559 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi Angelo,

>In order to compile the clock drivers for various MediaTek SoCs as
>modules, it is necessary to export a few functions from the MediaTek
>specific clocks (and reset) libraries.
>
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>---
> drivers/clk/mediatek/clk-apmixed.c | 1 +
> drivers/clk/mediatek/clk-cpumux.c  | 2 ++
> drivers/clk/mediatek/clk-mtk.c     | 2 ++
> drivers/clk/mediatek/reset.c       | 1 +
> 4 files changed, 6 insertions(+)
>
>diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
>index 6b0ab0a346e8..f126da693a7f 100644
>--- a/drivers/clk/mediatek/clk-apmixed.c
>+++ b/drivers/clk/mediatek/clk-apmixed.c
>@@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
> 
> 	return &tx->hw;
> }
>+EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
> 
> MODULE_LICENSE("GPL");
>diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
>index 2b5d48591738..25618eff6f2a 100644
>--- a/drivers/clk/mediatek/clk-cpumux.c
>+++ b/drivers/clk/mediatek/clk-cpumux.c
>@@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
> 
> 	return PTR_ERR(hw);
> }
>+EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
> 
> void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> 				 struct clk_hw_onecell_data *clk_data)
>@@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
> 		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
> 	}
> }
>+EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
> 
> MODULE_LICENSE("GPL");
>diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>index 05a188c62119..41e60a7e8ff9 100644
>--- a/drivers/clk/mediatek/clk-mtk.c
>+++ b/drivers/clk/mediatek/clk-mtk.c
>@@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> 	mtk_free_clk_data(clk_data);
> 	return r;
> }
>+EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
> 
> int mtk_clk_simple_remove(struct platform_device *pdev)
> {
>@@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
> 
> 	return 0;
> }
>+EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);

Thanks, I need this too. I am preparing a patch to use mtk_clk_simple_remove/mtk_clk_simple_probe
for MT6779 clks first and maybe I can apply this to all MediaTek clk drivers.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

thanks,
Miles
> 
> MODULE_LICENSE("GPL");
>diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
>index 179505549a7c..290ceda84ce4 100644
>--- a/drivers/clk/mediatek/reset.c
>+++ b/drivers/clk/mediatek/reset.c
>@@ -228,5 +228,6 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
> 
> 	return 0;
> }
>+EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
> 
> MODULE_LICENSE("GPL");
>-- 
>2.35.1
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
