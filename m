Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vRe7Cd2GEjPDpcv1GzW4DBKbGMmZ/Y11zFuLYc1uksM=; b=0Ia0M9cGnK22HX
	7Tun4IAfzGY90REgZZBvpqLXVfkaWgDoSjjl7yLDFvyih33OAwLyQL3TxM63n7huFA85AOPq7ETT1
	qyninPh6U+TaMhbi8xLk7j63m7C30yDmFIrUcnXe1zpTtYzFoiB4awJ5oBG8qoUkPMuo9dAeCW2Ox
	/3ynwpw5GuZbzGMc5Y2NFNWSwnTT5xyuBVpDzI0lLvgNud3XsjLotwOjQB0AYTEnDzuQ/JH3dPaOJ
	ooFMVZ0xQ06Tj4Zs1PoK1SA2PF5ZUuUNvgpHGjZMCXJ6BaCkUcv402cv7yV0tWWQtns9/PxUopeLV
	7zMAKy7BocktRyCJ82lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRGSQ-000ssM-HI; Mon, 07 Mar 2022 16:43:38 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRGSD-000so7-Si; Mon, 07 Mar 2022 16:43:27 +0000
Received: by mail-oo1-f41.google.com with SMTP id
 n5-20020a4a9545000000b0031d45a442feso18416424ooi.3; 
 Mon, 07 Mar 2022 08:43:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6ahRBp9yt0ZPpBFG2Tzui7hdIn/8fP27GT8DryPqqNA=;
 b=XafXmyvg0NGEujjJKfIyeQ1PCdmxZ3yeRh/UO6ZYmj2heqizNdtYOdV+gXiAMHqJuN
 Qepd41ire8TwG2d8Z1SRVfzcTWB+z5I5AJUoFgz9OcnkRE/BNZrgES+sLq8ovqAkOaA7
 AApMVcK47Xk7Ojn//5ZfJwbEmMqfYD10APr52zW7c8HV8enqMFPLcYLo5+KPs2WPcaVd
 8hlYgXkjGnNJtt6FLopbHSZHThwK9A4BXBjrR+w0PefYyetESoEW6llK8LQpoCLcvJej
 o2njjqgq6MWzDP9qEs24BBKagH2JQdcW6nVx3Y/NZWUTee2DAYriJ1x4YTePaKE7mzJ1
 q9DA==
X-Gm-Message-State: AOAM532WKlzd6VRjtZpkD1SsoxHmjZdsJLuOLiCbNevWjpQOsYoSVqxo
 dOBTfqVjASwHgyMHser6KQ==
X-Google-Smtp-Source: ABdhPJwK7Z8VahsxmcSCvl23V4RUpi+Y1xGPVc+4r9GinlZLpWcbqoisF16Xe98HLqEc7r2Fua2VNA==
X-Received: by 2002:a05:6870:315:b0:d9:a20e:c0bf with SMTP id
 m21-20020a056870031500b000d9a20ec0bfmr6530459oaf.128.1646671404592; 
 Mon, 07 Mar 2022 08:43:24 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g2-20020a9d5f82000000b005af678c9cfdsm6527808oti.41.2022.03.07.08.43.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:43:23 -0800 (PST)
Received: (nullmailer pid 2731161 invoked by uid 1000);
 Mon, 07 Mar 2022 16:43:22 -0000
Date: Mon, 7 Mar 2022 10:43:22 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com,
 xji@analogixsemi.com, hsinyi@chromium.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v1 2/2] Revert "arm64: dts: mt8183: jacuzzi: Fix bus
 properties in anx's DSI endpoint"
Message-ID: <YiY2KiXz1qsFQvuM@robh.at.kernel.org>
References: <20220307154558.2505734-1-robert.foss@linaro.org>
 <20220307154558.2505734-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307154558.2505734-3-robert.foss@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_084325_947188_8E04D213 
X-CRM114-Status: GOOD (  13.49  )
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

On Mon, Mar 07, 2022 at 04:45:58PM +0100, Robert Foss wrote:
> This reverts commit 32568ae37596b529628ac09b875f4874e614f63f.
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index e8f133dc96b95..8f7bf33f607da 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,8 +171,6 @@ port@0 {
>  
>  			anx7625_in: endpoint {
>  				remote-endpoint = <&dsi_out>;
> -				bus-type = <5>;
> -				data-lanes = <0 1 2 3>;

Well, this was clearly wrong. Connected to a DSI output, but parallel 
interface with lanes...

We should have a schema to disallow this combination.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
