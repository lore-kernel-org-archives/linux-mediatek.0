Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC458C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O9B7zjjXR3xngfSkqpCb4WiMHxmzXLuuFBYBdJUhTs0=; b=JGydG4/BfPb3JPBKxFqjp8pNpO
	JF3+t51F9aLmcAHIQVOGfpVW+yuCpzWHT56n6MO+wLQdrXxU2heiaS9xw5mCICEtS/nS/Q3I8cj4g
	6rNv2EiXBfIuJJNI2BoapOkDKPbmMFPg371t3jHwfa+sxEfZ/qnj5iChkup5EWIOHz3IX0pYr/hVc
	AOOf1mq5BC6ulLNefBoEPniRRf/bLj9wFBKzU2tfWiweyb6Nk0d2uf90SV24/b7Vt35Jnwp8rn+fH
	5xMuQXj7AYpNe5Jmb1xexqidH+uKaNw3Zkf92FDeYjKtADB4Ov2ZDsCtltlVSBpqaC0yVrDK81e/s
	sGcA21gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKbO-006yuh-2E; Fri, 15 Jul 2022 12:39:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCKav-006yea-6A; Fri, 15 Jul 2022 12:39:01 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 820746601A60;
	Fri, 15 Jul 2022 13:38:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1657888730;
	bh=/TkDguAmwrQGEReJEUwEbAbHZt9Am5gC3Cijy8SnuRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VoDxu0JROMcD2NU4mSc6KU2oGQ7nEERAimPhTXO1VD8zFmQrbHNDwrMwNlUWql2ae
	 Zuvmkm0S3xwbgzI0zpP/kz9v3yoK04k3QoNZnwBwykuKhQHbqzG51CGtKCFA96Q6hi
	 SeMAcSwP8M3CnBQZ7d6ejvM7cYBoV2bb/L1QWCeHDzIDpF5HfiphDmwnkVigH/QEC8
	 cacBNFGX1b0Sx2GeWa+fRrekL7Ugtuq2wO6cDNApOe8OIX/YGGcz0ksVK6jkZ1EswM
	 /7iGpFbZ+/xKc21HN8XGBZCqDFsk5RLnoa5rUbp9NV/sxPAYXZ8QaDApGSE/izbOhf
	 dhsY8N99yXETA==
Message-ID: <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
Date: Fri, 15 Jul 2022 14:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220715112607.591-14-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_053857_411577_E3A8435F 
X-CRM114-Status: GOOD (  11.16  )
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

Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> From: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> driver, display bias voltage supply, one general purpose LDO, and the
> USB Type-C & PD controller complies with the latest USB Type-C and PD
> standards.
> 
> This adds support for MediaTek MT6370 Backlight driver. It's commonly used
> to drive the display WLED. There are 4 channels inside, and each channel
> supports up to 30mA of current capability with 2048 current steps in
> exponential or linear mapping curves.
> 
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>

Hello ChiaEn,

I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
registering a backlight device, register a PWM device.

This way you will be able to reuse the generic backlight-pwm driver, as you'd
be feeding the PWM device exposed by this driver to the generic one: this will
most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
with a devicetree that looks like...

	pwmleds-disp {

		compatible = "pwm-leds";



		disp_led: disp-pwm {

			label = "backlight-pwm";

			pwms = <&pwm0 0 500000>;

			max-brightness = <1024>;

		};

	};



	backlight_lcd0: backlight {

		compatible = "led-backlight";

		leds = <&disp_led>, <&pmic_bl_led>;



		default-brightness-level = <300>;

	};

Regards,
Angelo



