Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7960CC7EE25
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMknbctRj5+dTfmL4pVElnzVvyo7p9s2adUpiYawLm8=; b=V1hFLO+mFIKFToiY7Td0f5lWk7
	Kclxku+a+GT7GOAiD2R3J4gZAfuJaAMKZ+KuazG+UzgbSAnfoNfswqqiBjfzBPZI1Sg80BtdCdPMn
	4rTEo4fo+E/k8GKvNoR1Ms0EvZWNRYo7kobUtRoTePUm2GECpZDRnaMGh82PmyC/TtDymYomfHI3h
	U8xzdefSbxu4UNnJKYFfU4VdUhRJoS6ZRrGsDWR6IkvO3gP8QRD1fQlxMdZWY/mklZ7isdTugi7P2
	dV4NVKNzN6fCPi3Kewm76mbUHGm0VZfW3A4Xqc6G+ePJPGDLt6zbJd+tySJy1QyzodIaUMAJnUNF2
	EvnXw3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Ats-008WjY-3D;
	Thu, 08 Jun 2023 08:21:45 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7Atp-008Wh1-0o;
	Thu, 08 Jun 2023 08:21:42 +0000
Received: from ip5b412278.dynamic.kabel-deutschland.de ([91.65.34.120] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q7AtT-0004g7-L9; Thu, 08 Jun 2023 10:21:19 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Date: Thu, 08 Jun 2023 10:21:18 +0200
Message-ID: <1820986.VLH7GnMWUR@diego>
In-Reply-To: <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
References: <20230608081153.441455-1-alexander.stein@ew.tq-group.com>
 <20230608081153.441455-3-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_012141_287669_93C264D1 
X-CRM114-Status: GOOD (  14.76  )
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

Am Donnerstag, 8. Juni 2023, 10:11:53 CEST schrieb Alexander Stein:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi                 | 2 +-

Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip


>  23 files changed, 26 insertions(+), 26 deletions(-)

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> index aa3e21bd6c8f4..20e3f41efe97f 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi
> @@ -27,7 +27,7 @@ module_led: led-0 {
>  
>  	extcon_usb3: extcon-usb3 {
>  		compatible = "linux,extcon-usb-gpio";
> -		id-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
> +		id-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_HIGH>;
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&usb3_id>;
>  	};
> 





