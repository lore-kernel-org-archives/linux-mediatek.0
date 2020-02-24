Return-Path: <SRS0=9HQ0=4M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E691CC35679
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2020 07:51:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B75AF20675
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2020 07:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i4muNCLu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="C0vHqBRd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B75AF20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlyiaLb0xxfuh7Psx+fDp0vinMtnUAJFm87BQ7RNShY=; b=i4muNCLum53GDm
	XcBMhemMX7B2HZ2aCpk/iFVel50woYzYKuAutPr/3ebwoQriXivib3KTaxO38yoOubY7TUgPkAUD3
	PChfaPdEYb7BKsP8dh7LCQfFJg85ndOmBzJoRQM2IjoEq2VHIA5HsGYKowsJ6Wf9nm2fvFyHYHBc1
	X3EnPwifgVM1I4G7V27icF3nWV45rgZlTrMjiKe55OXrQ+dJWyDRCeIbP91kfd5H5416eZt5YT01a
	s5lFzOBfPVRE618CU7gXdqqOnP2rkkbKfpUvwKmxJSVM36dsaNCJowg9SSR6ZmHCDb+NXTGG/WawU
	HTx2uLMQrwHivtR63aZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j68WB-0001oF-RS; Mon, 24 Feb 2020 07:51:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j68W0-0001f6-Bf; Mon, 24 Feb 2020 07:50:57 +0000
X-UUID: d718dfb7f5964d37989ecd5c17b6939d-20200223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=b1f8R5VKx8rDI0QkQ5z0LpeMG+bYnjwu6UVhc1lPbgo=; 
 b=C0vHqBRd5slR4DY+Y1TysXkifRyJaX3oLSWyXSHKdCUahpGzFeHebOHtNQRKdmP1Ts/uJq9bNGTmlfZv+JBSRPLazr7LBKgwu4C3vApGTTYVB773a+1zu1XC9rnQt+MCHht1VakDW32vcyWoyoMItar7E1i/fD8IDhq6h2RSLnw=;
X-UUID: d718dfb7f5964d37989ecd5c17b6939d-20200223
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1328591989; Sun, 23 Feb 2020 23:50:50 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 23 Feb 2020 23:51:23 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 24 Feb 2020 15:48:14 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 24 Feb 2020 15:50:32 +0800
Message-ID: <1582530646.6520.2.camel@mtksdaap41>
Subject: Re: [PATCH v6 1/4] dt-bindings: display: mediatek: update dpi
 supported chips
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Mon, 24 Feb 2020 15:50:46 +0800
In-Reply-To: <20200221112828.55837-2-jitao.shi@mediatek.com>
References: <20200221112828.55837-1-jitao.shi@mediatek.com>
 <20200221112828.55837-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: C3E3BC25D0A0281A4E03E48A0124703D8325F29AC83D197F9454C0F43EB7827A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_235056_405947_0AA2EEE8 
X-CRM114-Status: GOOD (  14.73  )
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

On Fri, 2020-02-21 at 19:28 +0800, Jitao Shi wrote:
> Add decriptions about supported chips, including MT2701 & MT8173 &
> mt8183
> 
> 1. Add more chips support. ex. MT2701 & MT8173 & MT8183
> 2. Add property "dpi_pin_mode_swap" and "pinctrl-names" gpio mode dpi mode and
>    gpio oupput-low to avoid leakage current.
> 3. Add property "dpi_dual_edge" to config the dpi pin output mode dual edge or
>    single edge sample data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index b6a7e7397b8b..cd6a1469c8b7 100644
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
> +- dpi_pin_mode_swap: Swap the pin mode between dpi mode and gpio mode.

When you have both pinctrl-name of "gpiomode" and "dpimode", it imply
that dpi_pin_mode_swap = true, isn't it? If so, I think this property is
redundant.

Regards,
CK

> +- pinctrl-names: Contain "gpiomode" and "dpimode".
> +- dpi_dual_edge: Control the RGB 24bit data on 12 pins or 24 pins.
> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -26,6 +32,11 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	dpi_dual_edge;
> +	dpi_pin_mode_swap;
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
