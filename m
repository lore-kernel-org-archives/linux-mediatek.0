Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FEFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:32:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 911D0610E6
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 15:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 911D0610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tqVlrftaarARueSaos38YQhYfLBwZxahtQJ7myLdMIg=; b=kVSitXp0cLZXxOI+Qx6LKsuSUX
	h+Vbkt0wS1ml39d3+NxL7dUEeDTXzELuZlBlXciFzn6DDEDzheAQsBfJiNNbvzn0/B1SeMCnXFwKR
	y4EJYjDNkJTLKY5aA6b1EjkVYbHyoRW4paH2y+LVD2gjMCxMc/j9ltbS5jsH7yp9EYKzSdkr2/IUM
	nSHtErLikvHozTlctCSnxvoJHDVLtbIiCm4VQ4nHpPwiPBmrny4Jj/FKUlF9J1Yx6crfRTeVWjdtc
	3kXJOOsrmX7o36zTGIU8rla5dU9cBVwEwttdNUF8hQi2GLUUW+Kbh1USM1i20M0tJH3e17u0QbAki
	VmfwyciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDZa-0053HY-3N; Wed, 20 Oct 2021 15:32:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdDOA-004ySh-3i; Wed, 20 Oct 2021 15:20:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1C10F1F441E0
Subject: Re: [PATCH v16 2/7] arm64: dts: mt8183: add svs device information
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-3-roger.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <70e71210-6d17-92e3-4e3f-01b83380be42@collabora.com>
Date: Wed, 20 Oct 2021 17:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210428065440.3704-3-roger.lu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_082022_343474_17BE50E3 
X-CRM114-Status: GOOD (  16.48  )
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

Il 28/04/21 08:54, Roger Lu ha scritto:
> add compitable/reg/irq/clock/efuse setting in svs node
> 
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 80519a145f13..441d617ece43 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -657,6 +657,18 @@
>   			status = "disabled";
>   		};
>   
> +		svs: svs@1100b000 {
> +			compatible = "mediatek,mt8183-svs";
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_THERM>;
> +			clock-names = "main";
> +			nvmem-cells = <&svs_calibration>,
> +				      <&thermal_calibration>;
> +			nvmem-cell-names = "svs-calibration-data",
> +					   "t-calibration-data";
> +		};
> +
>   		pwm0: pwm@1100e000 {
>   			compatible = "mediatek,mt8183-disp-pwm";
>   			reg = <0 0x1100e000 0 0x1000>;
> @@ -941,9 +953,15 @@
>   			reg = <0 0x11f10000 0 0x1000>;
>   			#address-cells = <1>;
>   			#size-cells = <1>;
> +			thermal_calibration: calib@180 {
> +				reg = <0x180 0xc>;
> +			};
>   			mipi_tx_calibration: calib@190 {
>   				reg = <0x190 0xc>;
>   			};
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x64>;
> +			};
>   		};
>   
>   		u3phy: usb-phy@11f40000 {
> 

This patch doesn't apply on the latest linux-next due to some new commits in
mt8183.dtsi, can you please rebase?

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
