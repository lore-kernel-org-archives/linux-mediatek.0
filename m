Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98752C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C792075A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 18:16:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vW7QFqNm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P86nohJJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C792075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6YVys9g/tSwkuE+eA5+FyIXAbFhRRZI5N+wOv1II8vc=; b=vW7QFqNmAyzXsVFzloHMObpG0
	shvw9azn+imNzXjyInsYqcpz1U4QOO6pfMpr4d/eYYxet3XoVf6SHD7XQGQmN5tvbS2POLflJCK29
	nv9uW6S11dZh9V8xSFrGqg0HoTsZ9c+Xm3bELvIJudK0hY1+aV738ukOdxkHFp9NjVIlaivayxmcn
	kQFCWHonast2wUcvgm+ei7m1tJrjKn3hVLPvP7OlgAh847btsgvnKg5c9Mwb9EAdETiFnCt2juCPW
	LojkdbOVJZ29She9MSq2l2DHk6UntArldKF7SDPq3P0VEN0NdYKvM+0gLfi/HmURmRt/9r+lYJPfz
	+GKI0ZW7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khzL4-0000dz-Rv; Wed, 25 Nov 2020 18:16:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khzL1-0000cq-OS; Wed, 25 Nov 2020 18:16:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id k14so863386wrn.1;
 Wed, 25 Nov 2020 10:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LoqWHN9+Qg4UFSxhhJfMuuZN/qPZlzzFucYRh+TRFe0=;
 b=P86nohJJq3cr+OQJ2wjf2hc+oL30Dp66VhxX/CkprRV5QW1SyyqsOc6Dl9eaxFAuEq
 7W98DRZEmAV/E6C+pFokXtWjsTce9xfD7pYnPPUClXy62xy0UDjJXPR+X0iTKsTbrOYu
 4cxglb7q+zceSThPqzJ3dXCyFgSjh+7BQL/7MiaEgpnZMf/y9jIEtvd/23x91j4BuHvi
 Gj6ORPStfK8knLRHpOiILumknIxm0AgwNfNwadDAXw3sLS1I0wRsxSemJ0h5dr+6T/tb
 6rnQB03VqcFi1zeidhUmw77Sw0y8jQLixuV3uvdBHPz0vEdHoQwIE3r0mC5fiUkbbrcd
 H2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LoqWHN9+Qg4UFSxhhJfMuuZN/qPZlzzFucYRh+TRFe0=;
 b=rlIFQXFTePEH2GaAkCzEHbtsWOgzc8gGH3uBiHhowVqDUj3YVegaimTBcELRd4N0Fz
 KoL7iyPb5JiVTzkcg+SW6lBQw+pox560Z++o9r/5on81fl/GiuyCVkaskt6T8RrqxDy9
 tfXZCW6BLvCG4SS6vshuAPDykwUFPR5m8i2IvcwcUgs5zKNSOMO/ZdG9+Sn+a4nihyAz
 8Z8kWfne1SAh9DRtq+uZEEuEEwTd2VOc4NFMFBGoJq0ZblNtRjs0lo7zUUaU0QXZdcGs
 7/hAcK1ZZ7PDPXtlCvmAIItQhs5s3FGbSrCfjmT6+nod+YcACZo/kw9LnII7p9523uCU
 8lQw==
X-Gm-Message-State: AOAM5318iwcy+s18V5oEQ/H5OotmWU4NoZ0eKc1hSjZpzTIHGr47B7ia
 Eppu//kMh6KB0+j2CmHcIoU=
X-Google-Smtp-Source: ABdhPJyy9eaAoEXWVeIF8FDIaouES9oluGB2/979Jkt9NYDm9G+W1nWY6CnzkbxpX2Ksau4qAmAPow==
X-Received: by 2002:adf:fa4a:: with SMTP id y10mr5625395wrr.122.1606328178813; 
 Wed, 25 Nov 2020 10:16:18 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:a410:510b:ab5:5694?
 ([2a01:110f:b59:fd00:a410:510b:ab5:5694])
 by smtp.gmail.com with ESMTPSA id w1sm5158538wmi.24.2020.11.25.10.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 10:16:18 -0800 (PST)
Subject: Re: [PATCH v8 6/6] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
 <1606301475-7030-7-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <995b4c25-33f4-fb1e-39ab-3435c57488d3@gmail.com>
Date: Wed, 25 Nov 2020 19:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606301475-7030-7-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_131619_930359_833C9549 
X-CRM114-Status: GOOD (  19.16  )
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

Thank you for the update.

On 11/25/20 11:51 AM, Gene Chen wrote:
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
>   drivers/leds/leds-mt6360.c | 811 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 825 insertions(+)
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

Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
