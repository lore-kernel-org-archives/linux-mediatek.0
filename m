Return-Path: <SRS0=jGCy=DP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 320FFC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0AFF22241
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Oct 2020 21:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIOtQguZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/gPcsXu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0AFF22241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=stcIr8hoZaehfaeq3Y7wz08zDewuXBDdEbd6a/prZ84=; b=uIOtQguZcQnZi7LiV+1YFgNgM
	AB3wKHDIFY6sJT8ukEnL8VvUFpKxcllXGUzmucpC0Ku7EC1YvWAmefrXgihSn5/bpablv/k5yqPjr
	qQ76HqWr3ECIcKt6CkFIpdLVAagacMkN9nVDjqpVysRh0LSSlFADgznnBC99JkVgyLf9Ujmu5+xIE
	Z7yw9cv4RdTv3kzTBeYup07fTpy9gvPXJMXw/l1l/2VsWOtAjMq8eCMH97oZCMw2z7X9FC4cEUVYr
	FCq97SS2j90EGmWMtzfcJ5hyyywH+/zOqGlzvE2cO9otuGorIr9zzt4PaXyVxmLcGDWzpvfHmcVPI
	rP2mCix3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQdow-0000UQ-Dn; Thu, 08 Oct 2020 21:51:30 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQdou-0000Th-01; Thu, 08 Oct 2020 21:51:28 +0000
Received: by mail-ed1-x541.google.com with SMTP id l16so7360479eds.3;
 Thu, 08 Oct 2020 14:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=937MMq6nZ+u8EQvLMqKOO+SU66NmCNZt9Udn4Wz7dCc=;
 b=n/gPcsXufTW9uavvXSx1jBullekgIigmYKZUjVebfsHHlMg0MMcqmwOuUAhdXrbhsH
 Q+xA/LFeqFO69CeIG5CsFX7ukwdCauDbX5t/Md7PIEejYLAUCLnxXfE6TKUj6GepjDWX
 rBtTRsO0rB+gpaDIzPkZ3Ms64MIs79E8UdTgqAbynOmXjEPFsKp7tplsj3zCymveJzSf
 vmuoDQV7W6PJFuWFh8Ai6e08CtaEmhKLU/bGpzfJjkY4vkHTLadlwldu4gDUGurq7nLk
 RJBgsubC/SxdqkMZYzxPcLbaMCfO53Er+U9obVTYRbfVYTu64MEq2OTyXyN8/N0Z17sW
 /g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=937MMq6nZ+u8EQvLMqKOO+SU66NmCNZt9Udn4Wz7dCc=;
 b=mre8JbtPGZ9anfeextD3ckxhKpYpG7klSknJffVsRdO29kSQWK9G+PtkfcDoesGX6O
 /oVzNDOGkLD8vU6cW8wntqIEoOkduieKLL6XETOnlcE40V6MHVlmU3wTpdfxJfmdx03b
 XcAykBZ/Cno1gzHp+4R2xE69Ani090JlVFDplKvMvgz9VUOli6efmQTF0bWc3+rsH2gG
 u6LBMwN8IiYeix8598WYWGdJOd9Sy+gofMVmY3o8j6izcWpIXNfOjVgDHXns+51kYWCx
 YBBVnRxNrzB6jcWWwLKGcCZW1kStM9hM71c5shXIDKum5VDFZ0mJRkK+4+fySKI6no5C
 7EhA==
X-Gm-Message-State: AOAM532XmcFa+JH0sNtAHsjzoid32pTn7tv3T82FJv+2E31NUc38LGkz
 /M6lJJiXUD/5aQM+njETm7k=
X-Google-Smtp-Source: ABdhPJzig8i/zEh6Ruxm9Ga8WfdfIsoFnQi4KGyIp/SyDrK5QDZr3bgIYhDIgw2Eu7O2N9XIDMbGqA==
X-Received: by 2002:aa7:d689:: with SMTP id d9mr11655949edr.128.1602193886641; 
 Thu, 08 Oct 2020 14:51:26 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:a188:5df3:7e17:9e85?
 ([2a01:110f:b59:fd00:a188:5df3:7e17:9e85])
 by smtp.gmail.com with ESMTPSA id m2sm5041400ejo.4.2020.10.08.14.51.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Oct 2020 14:51:25 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Gene Chen <gene.chen.richtek@gmail.com>, pavel@ucw.cz,
 robh+dt@kernel.org, matthias.bgg@gmail.com
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
Date: Thu, 8 Oct 2020 23:51:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_175128_047539_C23EC64B 
X-CRM114-Status: GOOD (  21.86  )
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

On 10/7/20 3:42 AM, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add MT6360 LED driver include 2-channel Flash LED with torch/strobe mode,
> 3-channel RGB LED support Register/Flash/Breath Mode, and 1-channel for
> moonlight LED.
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>   drivers/leds/Kconfig       |  12 +
>   drivers/leds/Makefile      |   1 +
>   drivers/leds/leds-mt6360.c | 783 +++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 796 insertions(+)
>   create mode 100644 drivers/leds/leds-mt6360.c
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 1c181df..c7192dd 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -271,6 +271,18 @@ config LEDS_MT6323
>   	  This option enables support for on-chip LED drivers found on
>   	  Mediatek MT6323 PMIC.
>   
> +config LEDS_MT6360
> +	tristate "LED Support for Mediatek MT6360 PMIC"
> +	depends on LEDS_CLASS_FLASH && OF
> +	depends on LEDS_CLASS_MULTICOLOR

Since CONFIG_LED_CLASS_MULTICOLOR can be turned off you need to have
below instead:

depends on LEDS_CLASS_MULTICOLOR || !!LEDS_CLASS_MULTICOLOR

Unless you want to prevent enabling the driver without RGB LED,
but that does not seem to be reasonable at first glance.

> +	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
> +	depends on MFD_MT6360
> +	help
> +	  This option enables support for dual Flash LED drivers found on
> +	  Mediatek MT6360 PMIC.
> +	  Independent current sources supply for each flash LED support torch
> +	  and strobe mode.
> +

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
