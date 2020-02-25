Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38E7C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F5E2176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 07:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OT3Y28gt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tUljZGnP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74F5E2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+gt8+XvSCrE4Awj+wZU+LUqovsoQ0yWlH3xSgfCtWdg=; b=OT3Y28gtJWHdxr
	g5CH/f8KxGbKlmUE29LfxFcWRETrGkmMVYGtPPNbh8gBMC1ZGxWa4hQYz1cUqsGXImCPRPhRnSacQ
	rqlz4L62mKCwXtHnQOL7aelGSFlWbaoemiBfjxKLx3Q34PXAuiGhvahA3JumJCWDO2ygP0d8iVqYe
	iOp+rkg8Gpyv5DQ88ghiyys8uGO2F0WwsG/FD/+EslWxIdKKtmvOdGEphJ0rZxy4058o/+pKOXDka
	1rV23oc823n1lDmFsJnpVBRsL4AlWG2DbiCQ+c2oGz/qKk/nqvf724kdMimzYfZJohSOToHXXWQKg
	rIGf2KTAi9tHmzVEhw3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6UVu-00032W-Co; Tue, 25 Feb 2020 07:20:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6UVk-0002c7-8L; Tue, 25 Feb 2020 07:20:09 +0000
X-UUID: 92f565236a844ff9934b24c559d7aee9-20200224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vtL1iILHsFW94yP0jBQ/SNoSG9C8HGFiyrsycu7XsME=; 
 b=tUljZGnPBYfB+xLMxjzAar5PvLc7DRpXaXOHfOU/tQGO/7uSIty2ySbze5cBCjPAVzvzsMVGgjEPZJLKWTdKJHGHoz/9ZwRxeNuog933GVYoztDsmCHWnLySewgi8/TxVu32hWQSN2a172t3Fr8+bam/TqLiC86t7/lWNaamO9w=;
X-UUID: 92f565236a844ff9934b24c559d7aee9-20200224
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1596919323; Mon, 24 Feb 2020 23:20:03 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 23:21:04 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 15:18:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 15:19:40 +0800
Message-ID: <1582615193.21887.15.camel@mtksdaap41>
Subject: Re: [PATCH v7 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Tue, 25 Feb 2020 15:19:53 +0800
In-Reply-To: <20200225064638.112282-2-jitao.shi@mediatek.com>
References: <20200225064638.112282-1-jitao.shi@mediatek.com>
 <20200225064638.112282-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200224_232008_313985_985A4C04 
X-CRM114-Status: GOOD (  16.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Tue, 2020-02-25 at 14:46 +0800, Jitao Shi wrote:
> Add decriptions about supported chips, including MT2701 & MT8173 &
> mt8183

descriptions

> 
> 1. Add more chips support. ex. MT2701 & MT8173 & MT8183
> 2. Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
>    pin mode to gpio oupput-low to avoid leakage current when dpi disable.
> 3. Add property "pclk-sample" to config the dpi sample on falling (0),
>    rising (1), both falling and rising (2).

The title is just about supported chips, so I prefer you move other
modification to another patch. Of course, you could use a more rough
title to include all what you do so you need not to break this patch.

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index b6a7e7397b8b..0dee4f7a227e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -7,6 +7,7 @@ output bus.
>  
>  Required properties:
>  - compatible: "mediatek,<chip>-dpi"
> +  the supported chips are mt2701 , mt8173 and mt8183.
>  - reg: Physical base address and length of the controller's registers
>  - interrupts: The interrupt signal from the function block.
>  - clocks: device clocks
> @@ -16,6 +17,11 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- pinctrl-names: Contain "gpiomode" and "dpimode".
> +- pclk-sample: 0: sample in falling edge, 1: sample in rising edge, 2: sample
> +  in both falling and rising edge.

pinctrl-names & pclk-sample are defined in another document, please list
the reference document, [1] is the sample. For pclk-sample, I think you
should modify [2] to add 'sampling in both failing and rising edge'.

[1] Documentation/devicetree/bindings/display/bridge/ti,tfp410.txt
[2] Documentation/devicetree/bindings/media/video-interfaces.txt

> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -26,6 +32,10 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	pclk-sample = 0;

I think you should move pclk-sample into the port node according to [2].

Regards,
CK

> +	pinctrl-names = "gpiomode", "dpimode";
> +	pinctrl-0 = <&dpi_pin_gpio>;
> +	pinctrl-1 = <&dpi_pin_func>;
>  
>  	port {
>  		dpi0_out: endpoint {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
