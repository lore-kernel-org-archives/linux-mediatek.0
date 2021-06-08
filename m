Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72727C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:04:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A4F6135A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39A4F6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I/yOgOxoz4ylX03CLbwBFoq5KYbWpdZK125lib1GGwY=; b=XpjQzmng5fMgigBUlFRJ81TrKG
	q/UiJQC4OVumL8AwUVTc849grDYMa/WDBJLFDsfUGXl5YQQ8y2c+R6plFtv/7e1wpSulOnQ5dviKr
	yI0vTe+UqzUDVkYtiUIMq+SU/R/lH0+K7yyOjg+pkIi/n2YQOzfVghL0nBH7PdogjN8Xhf8ufQt9g
	tDgXIvc5mj8L4pQzdTXE5Wx4rAEm0rd0lQFam+xQYmfVeabHW88CMHwNZ+ZAwywFpVGMj35XgYgAl
	tIKHpIbcBsIbNjl00dNX6fh449eNGSm3Sx/640L795NLnxkDPMXLGBwnobvIJXDYL+ZlWrkT6uCjS
	u3a312Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqcLJ-008jZq-GS; Tue, 08 Jun 2021 14:04:33 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqcLH-008jYz-3L; Tue, 08 Jun 2021 14:04:32 +0000
Received: by mail-wr1-f52.google.com with SMTP id i94so16677732wri.4;
 Tue, 08 Jun 2021 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NaK1+lYG1Dq2ohG86ztg+A+J19QU+VeexGuHlrBTL4M=;
 b=QnR0ZPeDMVl5mFkTYoygIuB2xrRtp7A5EldyhgMPKAHRC4Zz+elCvghiHn+3QJhqVW
 X4NhajY9aUbN8z00rH6unAvRvV7tOhqotN1kv61ATApWUUrBFCU7N2yInSJgXlLqsZmZ
 AADPPQ1MHoyhPmtZXZGiqjNWvfEuEXpPYockBslll/VkydgphiGndXQo7RSELtK0ezz3
 99/60z2PYTwT8Bkpg5sgmOTZ2t/wf+2Ok5HYL8ZXHIAaXU5arIuK2NUV10z01lXcGWdU
 EcqP4Vn5pOJ1xVz7YTJ3skG4iUACmK1OMjrIZqSpRQ6kghTcD6uAvFArRkkfvzDBDQEB
 HAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NaK1+lYG1Dq2ohG86ztg+A+J19QU+VeexGuHlrBTL4M=;
 b=FkkVUE1B89K1z6q9aIYipDB1IOodoJSvgf5iIkrPnsBqLO87leq2E9uec2ep7g5Joz
 eMGZfojpwYIOCbP4obJpwgJEiENbb2OP9koiROQAzRkDUTEqwZtMAxvDrmRtOSC5gjOQ
 TX3qodKhap75/nZW8pSs3P0kaT1JaUu0HtI95yG//vvDK6zf2VKCbSMR80FyaaJ6fkVA
 garaSdxgzxPqfIs1EokBN21XtMOY/Kn6kpghuzVg6QnQ/wb/i93LO287sCCLHkbD95dL
 vS4eDRtCYdI3yGmfmGWiloeDrpjvvY3Lz7pGzh2et9JtlpWj1uLqsXE9wB92CnoUSBiU
 qPLA==
X-Gm-Message-State: AOAM531hhuhMeoZzv2kjpT+MeTbzM8uIjacfYfD82XYsmQ+bEDtRp6UN
 aTKyrI5FbgGljULf/D6twvc=
X-Google-Smtp-Source: ABdhPJw7hiK5UyCsmwgNkBj09BL5a7zqwZAAPJozK804Fu94hcGYc6OWe1h82lrHqE7VIfU6yKq15Q==
X-Received: by 2002:a5d:4538:: with SMTP id j24mr5253449wra.391.1623161009316; 
 Tue, 08 Jun 2021 07:03:29 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j11sm7014740wmq.4.2021.06.08.07.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:03:28 -0700 (PDT)
Subject: Re: [PATCH] irqchip/irq-mst: Use ARCH_MSTARV7 as default value for
 MST_IRQ
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yj.chiang@mediatek.com
References: <20210607035943.30292-1-mark-pk.tsai@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <90e2330d-4e7b-17ed-1c63-eafdf6db89fa@gmail.com>
Date: Tue, 8 Jun 2021 16:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210607035943.30292-1-mark-pk.tsai@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_070431_193383_6A0C6E38 
X-CRM114-Status: GOOD (  17.25  )
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



On 07/06/2021 05:59, Mark-PK Tsai wrote:
> Only TV SoCs of Mediatek products have this controller
> which inherit from MStar TV SoCs.
> Don't enable it by default if ARCH_MEDIATEK is selected.
> Instead, use ARCH_MSTARV7 as default value.
> 
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> ---
>  drivers/irqchip/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 62543a4eccc0..30f578e18a11 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -576,7 +576,7 @@ config LOONGSON_PCH_MSI
>  config MST_IRQ
>  	bool "MStar Interrupt Controller"
>  	depends on ARCH_MEDIATEK || ARCH_MSTARV7 || COMPILE_TEST

We should also delete ARCH_MEDIATEK dependency.

Regards,
Matthias

> -	default ARCH_MEDIATEK
> +	default ARCH_MSTARV7
>  	select IRQ_DOMAIN
>  	select IRQ_DOMAIN_HIERARCHY
>  	help
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
