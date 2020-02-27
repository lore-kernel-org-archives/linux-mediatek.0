Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E76AC11D3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 17:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4008D2469B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 17:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MObB7irN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4008D2469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGUMCXSXUwPbX1Q71UndNK+w1LIwWsDOx7RzVtOaWxY=; b=MObB7irNRR/LeH
	HMrFXp9Sg8EERUrdWCoLu6ppqs7ANesYpynneD+eS2XzFsX/asXtEqCXNg3ldF0FMvkd79c3O8sev
	syL0eFTqpMrRriCdHit8XUlc6/GSN/phmRpxUFEd4YfHM28CWWikvCwWTbx9aQKFOk4fS8/d/QR09
	rkdtX9eDaxxzp7ANxT1y9ZoU6cta/Fqqe4SVG8QgFgXlsDOzkfoUIrtnEZ97bKAwHqD5n50bPQMWD
	A5YtNIL84GhGstcDzrgSjnn8TniZo5Uvn8qf3peFplEwy/fNfE2QtI0FO5LFXrqdG4bmBrkeF2scb
	wVnnBGrkmRHN5I2WT1jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Mne-000620-Kh; Thu, 27 Feb 2020 17:18:14 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Mnb-00061L-Ac; Thu, 27 Feb 2020 17:18:12 +0000
Received: by mail-ot1-f68.google.com with SMTP id 66so3630701otd.9;
 Thu, 27 Feb 2020 09:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XZeF351ndR744jQMDSplVe35nCjD4JTzL+l4xDtw+Bw=;
 b=E6W9h+YhPti4ohcO1m2dfavNv0Oufk1L9NVOjdCD1v9tTX9GwYCjLBQYjGSwDLV6t2
 tHTdUFdJOcQryhQT34Xr5VjqJoWe/xNzsRrt+arNIOaAfkjnJnGmt6OYAKDtxhxXFFnc
 XGedobE+5AhNdestsFpskrtgxgbcZY8zabr1YsGwuFZRby14Zz5N0juyGWRxpywJlCeS
 QzyOnZBkgw2hDCDWZofaUEMegcuD1KbtFZ0AESW02S/tcIx934+ov0PcaFC/c6tKTMip
 6ZwjbHIxJWRi8JBplajumjDvqFXolLECDy1pVJHVR2AHJM1Zy7qN5rNWaCzP09qZGBUl
 a7Nw==
X-Gm-Message-State: APjAAAVAJn6OdVl59bhAzdHJcTPPvGUrJSYyyujuXHjlz4hcCSyvupu8
 qnpq/TpR3qSV+UtAo+msYg==
X-Google-Smtp-Source: APXvYqyxJP9z8nGYLwYOVzQtOy/w76xG4aTIepvKbnC66otUKEKBXXxHCjQtG595rcBsR3kyNOZgDQ==
X-Received: by 2002:a05:6830:128e:: with SMTP id
 z14mr650788otp.184.1582823890285; 
 Thu, 27 Feb 2020 09:18:10 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r26sm1109461otc.66.2020.02.27.09.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:18:09 -0800 (PST)
Received: (nullmailer pid 17673 invoked by uid 1000);
 Thu, 27 Feb 2020 17:18:08 -0000
Date: Thu, 27 Feb 2020 11:18:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 2/5] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200227171808.GA14590@bogus>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
 <20200226053238.31646-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226053238.31646-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_091811_364041_53CE61E4 
X-CRM114-Status: GOOD (  13.52  )
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
 cawa.cheng@mediatek.com, ck.hu@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 26, 2020 at 01:32:35PM +0800, Jitao Shi wrote:
> Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> pin mode to gpio oupput-low to avoid leakage current when dpi disable.

s/oupput/output/

> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt  | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index 58914cf681b8..a7b1b8bfb65e 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -17,6 +17,10 @@ Required properties:
>    Documentation/devicetree/bindings/graph.txt. This port should be connected
>    to the input port of an attached HDMI or LVDS encoder chip.
>  
> +Optional properties:
> +- pinctrl-names: Contain "gpiomode" and "dpimode".
> +  pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +
>  Example:
>  
>  dpi0: dpi@1401d000 {
> @@ -27,6 +31,9 @@ dpi0: dpi@1401d000 {
>  		 <&mmsys CLK_MM_DPI_ENGINE>,
>  		 <&apmixedsys CLK_APMIXED_TVDPLL>;
>  	clock-names = "pixel", "engine", "pll";
> +	pinctrl-names = "gpiomode", "dpimode";

The somewhat standard way to do this is '"default", "sleep"' if I 
remember the names right. And the normal operating mode is usually 
first.

> +	pinctrl-0 = <&dpi_pin_gpio>;
> +	pinctrl-1 = <&dpi_pin_func>;
>  
>  	port {
>  		dpi0_out: endpoint {
> -- 
> 2.21.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
