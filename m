Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5708CC43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jul 2022 13:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3aaFPCS7vGOHjN5dK09gzi8+XKJwlcyQXccy2uYk8o=; b=xWCLGKlZsiDkwz8IJc0wRuUfyz
	Nmox2yg4F0ThPvQ+qVlwzN+4DpzyC0SzOHPyirrzNJOWQwMa8gyFiIvfvdEyWUjfCWxbiHVsyhyr4
	Jo3C4LaVjZvdSJpcGgEEg9QlTCeWudsUCu/y606OfWOpQAN/2TmvkPe7bJ9JTzZ585rQG+gDvDDNQ
	qUxSKPDfcbCFD27gc0CVCQOJ1wIZ5yyhdBog4c+4JMBs6pU2v47BokecL0EEhrV4gfjTG6RTotS0L
	C0Fjv6u6YyPvmSnZAb71u2fUB2bWznUjM7E5nREUllgkejKFvT1GTBtBXEqA4ipdnsb1js5C2OhV4
	TazIbnLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFzJ-00BMZJ-GS; Tue, 12 Jul 2022 13:31:41 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBFz6-00BMSQ-FR; Tue, 12 Jul 2022 13:31:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id w22so705696ply.12;
        Tue, 12 Jul 2022 06:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B3aaFPCS7vGOHjN5dK09gzi8+XKJwlcyQXccy2uYk8o=;
        b=ZCXktgbeDUwYBalguqqfZgziscEy8VsThdXbtTHirW6covpv2JWFMPBq+F3C2G+FoQ
         qtye4zLPApS0xJHWJiC7J7ml9RRNIVGwBDLY17IAcR9bgzk0iemU3KZ1hxb3wbgEnnFu
         tHzlGBkNWUIxWWMF7IbRnWDdX+wAuq62BmfUEwFVfRVjvESRQIInTguaIeO/ymRMDwb+
         tB0uwlWyB6kjjf5/PX7y/RIP9iTxEKKDgu8bvB1kOq6UdGdZW92OpyYWaNW6XRRrtZDc
         1R8Zf3qxHSJTWYoNxdM7n5CQGNMFe/PDxo4yL+i+0UBteTxYBCaAoCfX+Nc3iP9fapPr
         RUNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=B3aaFPCS7vGOHjN5dK09gzi8+XKJwlcyQXccy2uYk8o=;
        b=wZlzIR3r0VrVUoZhq2zKEC74/ECPH2m8VxxiDuG31QTgv8H+qpIMDN0ldFw+WPdt5u
         uMcxYyGTdw3uu8R1UQdL+m/OXCGCAhv6aiXWciBXQs/T9a9jbIvNSmpUBMyWPWnz2r2E
         7v3YiZCKagAX/I4V42EIgVG96jZG/8k/nkI4cBkvKOKbl9mHXbFn63ccM1nZuQt25AvG
         f/+1Waa4ONHMmXdK1t/zL4qOXp2Pbs8bxop7uC/FoDb+YAG0r7JjhBkCsewYd+rdrIMY
         rhz9j6ylpR4KEwHjEi4naDu/S/SpcxPkAsnfbxJf9XGXEvEuPe1dUO8N8jJIvkJucXCW
         rOlQ==
X-Gm-Message-State: AJIora+0OxvjYcCeaWHWEfDEWwwwLjW2CGVkofD82LgP3tosm1W9EzLm
	WFL07fH9WROWmudv3RtGC18=
X-Google-Smtp-Source: AGRyM1vre6tOG2CNXGX+k+r6JDaJUdz2zNMZpOP4Z1D8JN26SxhyeaXI4mTwdOquYkzRpHSUvcIUbQ==
X-Received: by 2002:a17:902:e841:b0:16c:3053:c7e6 with SMTP id t1-20020a170902e84100b0016c3053c7e6mr18781277plg.163.1657632684220;
        Tue, 12 Jul 2022 06:31:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c204-20020a624ed5000000b00528c4c770c5sm6757058pfb.77.2022.07.12.06.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 06:31:23 -0700 (PDT)
Message-ID: <0bd85140-f006-8b29-0a43-500733f1654c@roeck-us.net>
Date: Tue, 12 Jul 2022 06:31:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Content-Language: en-US
To: Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, jli@analogixsemi.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220712090534.2783494-1-xji@analogixsemi.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220712090534.2783494-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_063128_546032_B85B9C13 
X-CRM114-Status: GOOD (  17.46  )
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

On 7/12/22 02:05, Xin Ji wrote:
> USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> and a port controller (TCPC) - may require that the driver for the PD
> controller accesses directly also the on-chip port controller in some cases.
> 
> Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> V9 -> V10: Rebase on the latest code
> V8 -> V9 : Add more commit message
> V7 -> V8 : Fix Guanter's comment, remove unnecessary explain

We are now at v16. The change log has not been updated since v10,
making it all but worthless.

Guenter

> ---
>   drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
>   drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
>   drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
>   drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
>   {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
>   5 files changed, 5 insertions(+), 7 deletions(-)
>   rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index f33e08eb7670..812784702d53 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -13,11 +13,10 @@
>   #include <linux/property.h>
>   #include <linux/regmap.h>
>   #include <linux/usb/pd.h>
> +#include <linux/usb/tcpci.h>
>   #include <linux/usb/tcpm.h>
>   #include <linux/usb/typec.h>
>   
> -#include "tcpci.h"
> -
>   #define	PD_RETRY_COUNT_DEFAULT			3
>   #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
>   #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index df2505570f07..4b6705f3d7b7 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -11,11 +11,10 @@
>   #include <linux/module.h>
>   #include <linux/regmap.h>
>   #include <linux/usb/pd.h>
> +#include <linux/usb/tcpci.h>
>   #include <linux/usb/tcpm.h>
>   #include <linux/usb/typec.h>
>   
> -#include "tcpci.h"
> -
>   #define PD_ACTIVITY_TIMEOUT_MS				10000
>   
>   #define TCPC_VENDOR_ALERT				0x80
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index 8a952eaf9016..1b7c31278ebb 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -11,10 +11,9 @@
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
>   #include <linux/regmap.h>
> +#include <linux/usb/tcpci.h>
>   #include <linux/usb/tcpm.h>
>   
> -#include "tcpci.h"
> -
>   #define MT6360_REG_PHYCTRL1	0x80
>   #define MT6360_REG_PHYCTRL3	0x82
>   #define MT6360_REG_PHYCTRL7	0x86
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index b56a0880a044..3291ca4948da 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -10,9 +10,9 @@
>   #include <linux/i2c.h>
>   #include <linux/interrupt.h>
>   #include <linux/gpio/consumer.h>
> +#include <linux/usb/tcpci.h>
>   #include <linux/usb/tcpm.h>
>   #include <linux/regmap.h>
> -#include "tcpci.h"
>   
>   #define RT1711H_VID		0x29CF
>   #define RT1711H_PID		0x1711
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/include/linux/usb/tcpci.h
> similarity index 99%
> rename from drivers/usb/typec/tcpm/tcpci.h
> rename to include/linux/usb/tcpci.h
> index b2edd45f13c6..20c0bedb8ec8 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/include/linux/usb/tcpci.h
> @@ -9,6 +9,7 @@
>   #define __LINUX_USB_TCPCI_H
>   
>   #include <linux/usb/typec.h>
> +#include <linux/usb/tcpm.h>
>   
>   #define TCPC_VENDOR_ID			0x0
>   #define TCPC_PRODUCT_ID			0x2


