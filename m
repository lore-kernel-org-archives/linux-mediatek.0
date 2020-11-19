Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD69C388F9
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:56:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D26352078D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lb9gIXEy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVFgh01T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D26352078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ubLY/6C9Dix8m5zSFbkAIR2ojUORm299RGZmzwcb9Dc=; b=lb9gIXEy+KjndZJiCGFfUvo70
	F/s9qUKIxQfz3fF1cyj1CVeHCCuWDVeF6EXEKZyDJnQaDf5oX4i4VIiNdTriuW+tnFxoce3EBzZDL
	InHDdPBisdlUlUOJx/s5aVKfwouuyTxCoX3zplOQydXa2xTiv1dBlXkVQ06L7kCnx8Ttht0xgI5EK
	UENM0Sbcl5Z6RNhp27DKnWN4ZyNq69ZoiRlzqburVpp/MnH6oezKQfJz8snbcdH0ieBla/RvBkV2S
	qWLj3zIRVYQ771ZwyWFhJVpiI6+xmFLe8W8KDBmUuipniJIJYGYwD+kMVG6GkOyJBvWIf6hRHjftr
	SCdgpgcOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfsqU-00037U-3i; Thu, 19 Nov 2020 22:56:06 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfsqS-00036i-3Q; Thu, 19 Nov 2020 22:56:04 +0000
Received: by mail-ed1-x543.google.com with SMTP id d18so7572670edt.7;
 Thu, 19 Nov 2020 14:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5eqjYwEZ98jSZ4sIfy98oOLOZL2ZZaBhBxuzzcS6ds4=;
 b=RVFgh01TuNnGRg9e1I2TSwvc9mWqYjyGdBh8ZZRJa+fO5GhbYu6Rz+IjmSJ8dzpXET
 NMqrkFs1jKFR15yDSQj6CvOwtZSv3yFwCKngMxkQ95OKiJxW0j6flYtxeoVSTZnsAgKA
 uoS5tIdR9OtPHOpTUdWL95O2snY/RYhEseIxlcll2CatQkU/caDVn/2LTFBgGsDn42gf
 QbmorFCYPuw4MTtx4iErHB18im3R4tNzDm7ayVqxoPCLogh3iazE04OVMtsvEn1deXiM
 sK4mDJc3IbjqSh/SRZVIv3Pc6T1I6N/IGLKYbZttlh0xAhcuW8Xo1g7vsiWeW0l3iByg
 iizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5eqjYwEZ98jSZ4sIfy98oOLOZL2ZZaBhBxuzzcS6ds4=;
 b=VAWMyFEXohhFnoamhmgSm/i7E6r4xJjXzkB+su0uyrGPEilYpxcH34RpQwLTHK6/SP
 v8tYj5IM9CW6rpil1NOXQe4116pxiP6zdZqMlfYTRHMSwhk/hOBd1IaytXagdzVcIhZm
 kZO+g6srBUThWOh/9C9DL8IEx4L5A6gRabqfhHzQtyIRxzSyImBYb2aCpgpeRpDNOdiz
 ySmEeRgokzCPac9KDxJBSREUgzuTMh9vcitUdNVAbAgM6KDZCuY9CJw9vXpvOajXJrSO
 JyKF1C2AG7w0PaRTnlytlPsn1vu732uNUvpzpqie9Zu0tfD4ye5w1Pi0E4oTlvlIC+iZ
 E/vA==
X-Gm-Message-State: AOAM5317JXQRLenyIxS85Gf/nVAdbTr40zTCIVrijl0iSp6uySgfqUGP
 7NIzgxhxfLuLj0JaCP9Qz47ijvoDQlE=
X-Google-Smtp-Source: ABdhPJzLlYaF17/SdQJKv+opOtZ+2ug5eJVRXwbx+0bRly313igL8YqWJ3fZnN2DxuIpDu9d61FItA==
X-Received: by 2002:aa7:c508:: with SMTP id o8mr33219975edq.339.1605826562782; 
 Thu, 19 Nov 2020 14:56:02 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be?
 ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
 by smtp.gmail.com with ESMTPSA id w7sm431066ejz.43.2020.11.19.14.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:56:02 -0800 (PST)
Subject: Re: [PATCH v7 5/5] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-6-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <f36fbe3a-1857-081a-a9c8-9ddf9769298c@gmail.com>
Date: Thu, 19 Nov 2020 23:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <1605696462-391-6-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_175604_165889_22FFEF7E 
X-CRM114-Status: GOOD (  25.57  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Gene,

On 11/18/20 11:47 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  13 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 808 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 822 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..4f533bc 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,19 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS && OF
> +	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
> +	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.
> +
>   config LEDS_S3C24XX
>   	tristate "LED Support for Samsung S3C24XX GPIO LEDs"
>   	depends on LEDS_CLASS
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index c2c7d7a..5596427 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -66,6 +66,7 @@ obj-$(CONFIG_LEDS_MIKROTIK_RB532)	+= leds-rb532.o
>   obj-$(CONFIG_LEDS_MLXCPLD)		+= leds-mlxcpld.o
>   obj-$(CONFIG_LEDS_MLXREG)		+= leds-mlxreg.o
>   obj-$(CONFIG_LEDS_MT6323)		+= leds-mt6323.o
> +obj-$(CONFIG_LEDS_MT6360)		+= leds-mt6360.o
>   obj-$(CONFIG_LEDS_NET48XX)		+= leds-net48xx.o
>   obj-$(CONFIG_LEDS_NETXBIG)		+= leds-netxbig.o
>   obj-$(CONFIG_LEDS_NIC78BX)		+= leds-nic78bx.o
> diff --git a/drivers/leds/leds-mt6360.c b/drivers/leds/leds-mt6360.c
> new file mode 100644
> index 0000000..8432901
> --- /dev/null
> +++ b/drivers/leds/leds-mt6360.c
> @@ -0,0 +1,808 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
[...]
> +static int mt6360_fault_get(struct led_classdev_flash *fl_cdev, u32 *fault)
> +{
> +	struct mt6360_led *led = container_of(fl_cdev, struct mt6360_led, flash);
> +	struct mt6360_priv *priv = led->priv;
> +	u16 fled_stat;
> +	unsigned int chg_stat, strobe_timeout_mask, fled_short_mask;
> +	u32 rfault = 0;
> +	int ret;

You need mutex here as well because you're making two readouts and
you have to assure atomicity of this operation.

> +	ret = regmap_read(priv->regmap, MT6360_REG_CHGSTAT2, &chg_stat);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_raw_read(priv->regmap, MT6360_REG_FLEDSTAT1, &fled_stat, sizeof(fled_stat));
> +	if (ret)
> +		return ret;
> +
> +	if (led->led_no == MT6360_LED_FLASH1) {
> +		strobe_timeout_mask = MT6360_FLED1STRBTO_MASK;
> +		fled_short_mask = MT6360_FLED1SHORT_MASK;
> +	} else {
> +		strobe_timeout_mask = MT6360_FLED2STRBTO_MASK;
> +		fled_short_mask = MT6360_FLED2SHORT_MASK;
> +	}
> +
> +	if (chg_stat & MT6360_FLEDCHGVINOVP_MASK)
> +		rfault |= LED_FAULT_INPUT_VOLTAGE;
> +
> +	if (fled_stat & strobe_timeout_mask)
> +		rfault |= LED_FAULT_TIMEOUT;
> +
> +	if (fled_stat & fled_short_mask)
> +		rfault |= LED_FAULT_SHORT_CIRCUIT;
> +
> +	if (fled_stat & MT6360_FLEDLVF_MASK)
> +		rfault |= LED_FAULT_UNDER_VOLTAGE;
> +
> +	*fault = rfault;
> +	return 0;
> +}
> +
[...]

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
