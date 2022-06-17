Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 05:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lBVrvFmqOJZpIsySZZDiDGINCvuniBPAJYrh+R0dg/A=; b=hzKAu1RnjHCcPsZ7ORWpfgK25T
	hT5SbUDnBNUizqRPs1kgrEjyCvLB6AtHSDJA63tu7RCHecsnhK7hza/tqCFaVs6k4cFnreVSqYwft
	7SBcGmP/D5fO+3oJg08JvmON8a6SZuaFz0Y/wBHUkc8RXWtVnRw5biWSk4GkL8Vwu9JqgRiS+HaR/
	7n6zm4vMg++MObf/REqPYo0leIwAz5WFsmcbcK4G+ILli2H89CQ3ezfhU++2bkAE5Cb/KttEQq4kY
	84BDlfC9O8lWYLlLCq5p/M78luTYJ69ZgpMu9uTTNsoxs6xHrikPHOeJO33Wu752enxhl5/crSLgO
	y0A9tCCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24a8-005aNk-Bp; Fri, 17 Jun 2022 05:31:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o24a6-005aMM-33; Fri, 17 Jun 2022 05:31:43 +0000
X-UUID: 995e05f73e4941d489ba8a34c279fd93-20220616
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:e99ffe84-58d2-47e0-9457-849c6cdf43e5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:7dd397f6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 995e05f73e4941d489ba8a34c279fd93-20220616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2038378453; Thu, 16 Jun 2022 22:31:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 16 Jun 2022 22:31:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 13:31:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 13:31:29 +0800
Message-ID: <1c53c2c73875cf565b819f67267d0e725d49f3c2.camel@mediatek.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: mediatek: dpi: add
 power-domains property
From: CK Hu <ck.hu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>, <matthias.bgg@gmail.com>,
	<jitao.shi@mediatek.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<robh+dt@kernel.org>
CC: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Fri, 17 Jun 2022 13:31:29 +0800
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_223142_163222_4592607A 
X-CRM114-Status: GOOD (  15.54  )
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

Hi, Fabien:

On Mon, 2022-05-30 at 22:14 +0200, Fabien Parent wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs, and
> always have a power-domain (at least in the upstream device-trees).
> Add the power-domains property to the binding documentation.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml  | 6
> ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> index 77ee1b923991..caf4c88708f4 100644
> ---
> a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> +++
> b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yam
> l
> @@ -57,6 +57,9 @@ properties:
>        Output port node. This port should be connected to the input
> port of an
>        attached HDMI or LVDS encoder chip.
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> @@ -64,6 +67,7 @@ required:
>    - clocks
>    - clock-names
>    - port
> +  - power-domains
>  
>  additionalProperties: false
>  
> @@ -71,11 +75,13 @@ examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/power/mt8183-power.h>

Why do you include mt8183 power header file for mt8173 dpi node?

Regards,
CK

>  
>      dpi0: dpi@1401d000 {
>          compatible = "mediatek,mt8173-dpi";
>          reg = <0x1401d000 0x1000>;
>          interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_LOW>;
> +        power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks = <&mmsys CLK_MM_DPI_PIXEL>,
>               <&mmsys CLK_MM_DPI_ENGINE>,
>               <&apmixedsys CLK_APMIXED_TVDPLL>;


