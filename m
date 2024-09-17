Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2A1C35FEA
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 07:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3iLbLomyZlJW0ECeLLAcxf4FS7ClALn0nW1BK89+3cg=; b=YK+Oe/MDe0DOzJwuucN4ezR5sF
	XIMo6d63uFEwLJpT5u1mDY/kONnCdsRzzsbVnnonLDjvTSEojh2FOlkKFh7eF3HSDzWVPeoWZd1TN
	rsqqXE5dBLyUtgWj+0G9bZ7h3ErUYZcFDdPOVwydnvl4K+DKEe32pOMQ+x21tqh3sh/78zBia0vZg
	tyotsLSjnsLgzyeUrBBxaUqnKT/M2TIFKjz5B4F4Lyxi9cahgXt4hVMYEpHClDXYnfzfKB1/f8RPm
	wkjo3t4RvxQXcfY8xAWLHUvuR+50Iz+sCkpISM/9AkvBBAGzKF+LP4RfUip+3euQwd3aDI9bdkB4L
	LxUKM/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSDR-00000005XgI-2l5i;
	Tue, 17 Sep 2024 07:01:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSCK-00000005XTX-1NUG;
	Tue, 17 Sep 2024 07:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 053555C5932;
	Tue, 17 Sep 2024 07:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA3FC4CEC6;
	Tue, 17 Sep 2024 07:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726556426;
	bh=xYXjLgKIgVQVJl/mI7hl5hLIk1cdSp8r/KFLQ4nwxgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nXJ/DXixRjjDtOwXrUIh1eVPfuQ3jMIC7ZCco3EQFL4PNFnS8+SNHzXil7GkmG+Wv
	 +re5wFT9lDF+2K3ZmYXDhGY5uViKGt3AbEyjhQXiYGsoY4Rn4BGgLwoZw29/zpzAiD
	 W+tWDKUdHWrKr86gPrfGplJnUJh1TQ1Oed4gUl6BjTWgFzk+wX2l7J+Pbujqf+umyW
	 2IjmIzCBf2BnvnOtGycrodoh6oCQ53Id2Mphp5LZ7U2yg41Elqezl29tbDEEuKlp9h
	 T8dvp/BY5tcBunj6V+MSfFDgD8IxctyDLW0kgRSjsgCyhZxeuTVb0l0zNpAq32q0u5
	 envyKvvKyTDtg==
Date: Tue, 17 Sep 2024 09:00:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Sen Chu <sen.chu@mediatek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v5 2/3] dt-bindings: mfd: mediatek: mt6397: Convert to DT
 schema format
Message-ID: <iudkiamza3lsl33tsby3sghfy66rj2tgg3kqjjwzeba46oxtpi@yrri5m5skjld>
References: <20240916151132.32321-1-macpaul.lin@mediatek.com>
 <20240916151132.32321-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240916151132.32321-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_000028_537786_7B9BDFD3 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, Sep 16, 2024 at 11:11:31PM +0800, Macpaul Lin wrote:
> Convert the mfd: mediatek: mt6397 binding to DT schema format.
> 
> MT6323, MT6358, and MT6397 are PMIC devices with multiple function
> subdevices. They share a common PMIC design but have variations in
> subdevice combinations.
> 
> Key updates in this conversion:

...

> +                regulator-name = "vproc";
> +                regulator-min-microvolt = < 700000>;
> +                regulator-max-microvolt = <1350000>;
> +                regulator-ramp-delay = <12500>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            buck_vsys {
> +                regulator-name = "vsys";
> +                regulator-min-microvolt = <1400000>;
> +                regulator-max-microvolt = <2987500>;
> +                regulator-ramp-delay = <25000>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            buck_vpa {
> +                regulator-name = "vpa";
> +                regulator-min-microvolt = < 500000>;
> +                regulator-max-microvolt = <3650000>;
> +            };
> +
> +            ldo_vtcxo {
> +                regulator-name = "vtcxo";
> +                regulator-min-microvolt = <2800000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-enable-ramp-delay = <90>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vcn28 {
> +                regulator-name = "vcn28";
> +                regulator-min-microvolt = <2800000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-enable-ramp-delay = <185>;
> +            };
> +
> +            ldo_vcn33_bt {
> +                regulator-name = "vcn33_bt";
> +                regulator-min-microvolt = <3300000>;
> +                regulator-max-microvolt = <3600000>;
> +                regulator-enable-ramp-delay = <185>;
> +            };
> +
> +            ldo_vcn33_wifi {
> +                regulator-name = "vcn33_wifi";
> +                regulator-min-microvolt = <3300000>;
> +                regulator-max-microvolt = <3600000>;
> +                regulator-enable-ramp-delay = <185>;
> +            };
> +
> +            ldo_va {
> +                regulator-name = "va";
> +                regulator-min-microvolt = <2800000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-enable-ramp-delay = <216>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vcama {
> +                regulator-name = "vcama";
> +                regulator-min-microvolt = <1500000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vio28 {
> +                regulator-name = "vio28";
> +                regulator-min-microvolt = <2800000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-enable-ramp-delay = <216>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vusb {
> +                regulator-name = "vusb";
> +                regulator-min-microvolt = <3300000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <216>;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vmc {
> +                regulator-name = "vmc";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <36>;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vmch {
> +                regulator-name = "vmch";
> +                regulator-min-microvolt = <3000000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <36>;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vemc3v3 {
> +                regulator-name = "vemc3v3";
> +                regulator-min-microvolt = <3000000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <36>;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vgp1 {
> +                regulator-name = "vgp1";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vgp2 {
> +                regulator-name = "vgp2";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <3000000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vgp3 {
> +                regulator-name = "vgp3";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vcn18 {
> +                regulator-name = "vcn18";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vsim1 {
> +                regulator-name = "vsim1";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <3000000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vsim2 {
> +                regulator-name = "vsim2";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <3000000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vrtc {
> +                regulator-name = "vrtc";
> +                regulator-min-microvolt = <2800000>;
> +                regulator-max-microvolt = <2800000>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vcamaf {
> +                regulator-name = "vcamaf";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vibr {
> +                regulator-name = "vibr";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <3300000>;
> +                regulator-enable-ramp-delay = <36>;
> +            };
> +
> +            ldo_vrf18 {
> +                regulator-name = "vrf18";
> +                regulator-min-microvolt = <1825000>;
> +                regulator-max-microvolt = <1825000>;
> +                regulator-enable-ramp-delay = <187>;
> +            };
> +
> +            ldo_vm {
> +                regulator-name = "vm";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +            ldo_vio18 {
> +                regulator-name = "vio18";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +                regulator-always-on;
> +                regulator-boot-on;
> +            };
> +
> +           ldo_vcamd {
> +                regulator-name = "vcamd";
> +                regulator-min-microvolt = <1200000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +
> +            ldo_vcamio {
> +                regulator-name = "vcamio";
> +                regulator-min-microvolt = <1800000>;
> +                regulator-max-microvolt = <1800000>;
> +                regulator-enable-ramp-delay = <216>;
> +            };
> +        };
> +
> +        keys {
> +            compatible = "mediatek,mt6323-keys";
> +            mediatek,long-press-mode = <1>;
> +            power-off-time-sec = <0>;
> +
> +            power {
> +                    linux,keycodes = <116>;

Messed indentation.

> +                    wakeup-source;
> +            };
> +
> +            home {
> +                    linux,keycodes = <114>;
> +            };
> +        };
> +
> +        power-controller {
> +            compatible = "mediatek,mt6323-pwrc";
> +            #power-domain-cells = <0>;
> +        };
> +
> +        rtc {
> +            compatible = "mediatek,mt6323-rtc";
> +        };
> +    };

Keep one complete example. Maybye two if they are significantly
different, but I don't see these differences.


> +
> +  - |
> +    #include <dt-bindings/input/input.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pmic {
> +        compatible = "mediatek,mt6358">


....

> -	Required properties:
> -		- compatible: "mediatek,mt6397-pinctrl"
> -	For details, see ../pinctrl/pinctrl-mt65xx.txt

Best regards,
Krzysztof


