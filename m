Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00638C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCQRLZyxLIgfs3GDLHRvFSoUC93PVZohv3Gs4GYYDZE=; b=IIkf+gcElChMSv
	L/cZgvr8Qn8Y486p7i5n9Z2FHDHP7G25u8eSpflIR2sfbOymKVpztyaCaed/eNxrVggb+PaXQ09+q
	mU+ta81HZIrLw2coVEGEKCxNqrskBSxGaLVeuzTxpDpK0s0GLsRdIZDqyEBqNWjiQfNeb254DuxuR
	493H/QH/jJAlV0VoFjsduiCZSRyJBKWhsmV1UI29uW0fZBBodAZ4iG44Uy+zfwi881GHSM5gz5cC6
	hdBP1CtG6t5hwe8OVWC8SD760C5flSzoXt62Exv84/xB6hXDZJXzAt1o4mBvuuFcSw0VolwyprqRG
	rUEvekH0YnX3g4LdhIYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdqv-001nEx-F2; Thu, 03 Feb 2022 15:16:53 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdqh-001n7u-Vy; Thu, 03 Feb 2022 15:16:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 023A81F45DA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901398;
 bh=emTF1W1AOfACykguchNAeQXAxGRzZACcQ0bCDOOa4T0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=liO/NV1+KbO9j5QZG24vwp0MQXhofctxUvUtTiRlw0pp5Nt5K1+YvT6wQOwF9I7+W
 nL9M5YUR0xWUGT2MSjOwr6umSJmIFBPot8WGRUMfYvWGMWHEJq/xyW2jpJT1sKfkFS
 JiZrBJtM7kjMiRmopH0Nthh9+c0jeGAYuvNq5FEIFHVPLuCmSWcziiiVRO2FRNyhrB
 o22Fs6DkiHYVRsn/tg9X6Rnt99PJUN1Gwflpr+gVc/NlH2ErGOVQR0ICd76woFz8PH
 dz5rfm4fuJt9zG/dST6v0SK8q0Fb2ZeMkJldB9pnzQ9/v74UR+oafOavuJqOsTIK4n
 ED4GQ5kUEWnZA==
Message-ID: <e08c8a92-a4c6-61a0-4fe7-6d8e2d83163b@collabora.com>
Date: Thu, 3 Feb 2022 16:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11,PATCH 16/19] arm64: dts: mt8183: add dvfsrc related nodes
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao
 <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-17-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-17-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_071640_191624_10A9FC2D 
X-CRM114-Status: GOOD (  13.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/08/21 10:58, Dawei Chien ha scritto:
> From: Henry Chen <henryc.chen@mediatek.com>
> 
> Add DDR EMI provider dictating dram interconnect bus performance found on
> MT8192-based platforms
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>

This patch definitely has to be squashed with patch 07/19.

Same for patch 17 and 19.

Also, sign-off.

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 7ad4cf646579..86f85c34c88a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -7,6 +7,7 @@
>   
>   #include <dt-bindings/clock/mt8183-clk.h>
>   #include <dt-bindings/gce/mt8183-gce.h>
> +#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/memory/mt8183-larb-port.h>
> @@ -586,6 +587,7 @@
>   		ddr_emi: dvfsrc@10012000 {
>   			compatible = "mediatek,mt8183-dvfsrc";
>   			reg = <0 0x10012000 0 0x1000>;
> +			#interconnect-cells = <1>;
>   		};
>   
>   		pwrap: pwrap@1000d000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
