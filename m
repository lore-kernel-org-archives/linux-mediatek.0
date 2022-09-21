Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA9FC6FA90
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 02:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZ8TKW4921hpmzu6cbHG4qSi1zO+4c+6IQ2eX6a4QM4=; b=xmnrapbAaaZjLgkGMMMuU104PD
	irsJ+eX1pr8xSmbvj6jJj9eZi8avHnW4iPmule6pLIsojZOF/wDSrRSDMjRDkq0ihYASLtdgJ2ZcV
	QREjfQGF8jNoW6I2weGr5FfyiVSpnktKt+Fc8tXppdDUX7Me5NvXUsT1myjRzQPFX4U1KxB6viEJq
	V8Q7l32IBoWyH5tdkHkoVHdbVdmL8j+b0zV+okM3oxd152/xQFnhEvyZh3k2O8oJLYy0I2FB+YCTW
	DArbC06SeecKgsqokFWvpJKjkfX9Aeno/o3+ybdZdLx224BaYK5ZxKVEvcaTMKYxzOQ5erZx5/UW+
	09cKGNoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapnk-008LSj-Jt; Wed, 21 Sep 2022 02:49:28 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oapnh-008LQy-Gg; Wed, 21 Sep 2022 02:49:26 +0000
X-UUID: c31a548724bf4f9e867a43d51f80f6e8-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LZ8TKW4921hpmzu6cbHG4qSi1zO+4c+6IQ2eX6a4QM4=;
	b=CmDrPdM/jhHPPWeKlLGjCQBSTtFlSwi1cyd2vsnDYHoT99pZ0pCs0t2CRnwIvj63ELpMM/L11PrE8rQHXtKy+IvHgcT7/XWcKYCmDAQJsJB3PqDDDD4YguAardt4J0h8vwR+l/rtBP8JiHyB5a1Gga5kdN2dc/dqEzKrde5gO/4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:c2b5489a-1073-4a2c-96f1-150e1e5a8893,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d8f2595e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c31a548724bf4f9e867a43d51f80f6e8-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 390124207; Tue, 20 Sep 2022 19:49:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 21 Sep 2022 10:48:44 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 21 Sep 2022 10:48:44 +0800
Message-ID: <ca635a06d36a7815ae16013fd916cda682c3ab7c.camel@mediatek.com>
Subject: Re: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI
 clocks
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>, Rob Herring
	<robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter
	<daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu
	<ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	Pablo Sun <pablo.sun@mediatek.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mattijs Korpershoek
	<mkorpershoek@baylibre.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>
Date: Wed, 21 Sep 2022 10:48:44 +0800
In-Reply-To: <20220919-v1-1-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
	 <20220919-v1-1-4844816c9808@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_194925_570259_DD555E77 
X-CRM114-Status: GOOD (  17.03  )
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

On Mon, 2022-09-19 at 18:55 +0200, Guillaume Ranquet wrote:
> From: Pablo Sun <pablo.sun@mediatek.com>
> 
> Expand dt-bindings slot for VDOSYS1 of MT8195.
> This clock is required by the DPI1 hardware
> and is a downstream of the HDMI pixel clock.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> 
> diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-
> bindings/clock/mt8195-clk.h
> index 95cf812a0b37..d70d017ad69c 100644
> --- a/include/dt-bindings/clock/mt8195-clk.h
> +++ b/include/dt-bindings/clock/mt8195-clk.h
> @@ -859,6 +859,8 @@
>  #define CLK_VDO1_DPINTF				47
>  #define CLK_VDO1_DISP_MONITOR_DPINTF		48
>  #define CLK_VDO1_26M_SLOW			49
> -#define CLK_VDO1_NR_CLK				50
> +#define CLK_VDO1_DPI1_HDMI			50
> +#define CLK_VDO1_NR_CLK				51
> +
>  
>  #endif /* _DT_BINDINGS_CLK_MT8195_H */

Hello Guillaume,

I am not sure the reason, but it seems patches in this series lack of
something like this for whole series:

---
 Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
 1 file changed, 1 insertion(+)

BRs,
Bo-Chen


