Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E896FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 16:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBIAlvyACCv4oqM4b14a4QBXNbvV1T1iHe8svEuiAAw=; b=btzv+qQSsp0IGAAYYkZHO45V/A
	pAr/gMFXhmZxefCHzymw5ssiP8fvTkoOc57oMYl6rTeiJiYmnLPAqa6EKYljijg9s+Quqxp1HY4iP
	sWSFeybJFNASWjbgGYC9O2Mkls1UMJK9uLPaYvOk7MG6C67EJZRQRpsy7QX7LCo7XQBZ6V9J7+v8A
	5z6TDfmeEkVksPqWZyLGVdAcwne40p1qwvh1gSZzyPVOszb8fTkw314OLAZkETtoWRzF5G2b3sI2S
	god43VhE6NZZy/LZAhoh3bbZkkOg1AZjA2YKgxZ4k589OriKlEmfaw3Ov4wzQLaxXu5FNKFhNnLs7
	HgHW2Q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3Jyi-001Oc2-VO; Mon, 20 Jun 2022 16:10:17 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3JyX-001OYQ-SV; Mon, 20 Jun 2022 16:10:07 +0000
Received: by mail-pf1-x434.google.com with SMTP id i64so10627876pfc.8;
        Mon, 20 Jun 2022 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rBIAlvyACCv4oqM4b14a4QBXNbvV1T1iHe8svEuiAAw=;
        b=QMrWZIVTHTH9oYFZYWYSKbYr9x/YdYUZyN9p/qHWdHsNEKqpFwIrIo49F/9vNEBqAq
         9g+bIVMa/rGGpt/ng70XZ1t2pXOPNqqso8xYfMQYiJ7rHiC+pmOOkJJuNbh3yo4ADS3Y
         SDzlNIi4OHFBV3cfwdIYefp7d87WCKEYgjMXUWmwCXNfyGitwo4/9qoAXpF3EC61gbA1
         WNtY4KCRFGPcGCC23UK5RHcMgaDmySA2n5cXuwyDVjSbBIqWdX0DqL5RxZEcm+uJE40c
         QUgHNMWa03iewa9ZZcFM1XVPJuUfC+WvF2INGLRVcw5/wr4LQ7GKLDq66m2yDye/jhkB
         ku6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rBIAlvyACCv4oqM4b14a4QBXNbvV1T1iHe8svEuiAAw=;
        b=Liqcocy5xDBd7cIYP4FtkTe3hNt16XK7hbBK/hCdT0Z43RKceXVncSU3KJ8vqLsZwB
         BA58U6DMnyMKmfXnu0h7b7PARibvVRqWnaqHBq/hnxwyz6UaJo1+P0b9wE2PPAqPWckp
         U6e0AU+KX2aizywZ7fYFwBBSJoU4K3BVXnKvOn+T2aGYh5TB1M1H789+qMU2zevWW4Lt
         C2kUnJAqUuOr5xYRmTIXkkUDUnrxghNRDJEngXt/dlxYziACC0nN7iCbNa9lTUiQC1u0
         0cKsb8q9mK8nx7WENjlJ5HlZ0LK16W4JNONEKvIqtsCa3c4HnEZeQ4iHCPRF1vhVlJRc
         4TUQ==
X-Gm-Message-State: AJIora+bMxDlNnaXL2IF/5iOdcQbng9EH0m4iQFIgvfXICulIA94pKs2
	jmFpyUe7Rm+CpdHWWZ9KLGWq39BNm5M=
X-Google-Smtp-Source: AGRyM1tz9KzTVukoZW4ey4gS7ooBo6YPROyVpJ+1IZn9Q2owoPdqnsWoNM8WPAGKn2JBxG9Qd8yZJA==
X-Received: by 2002:a05:6a00:430e:b0:525:26c1:973e with SMTP id cb14-20020a056a00430e00b0052526c1973emr4489658pfb.52.1655741402397;
        Mon, 20 Jun 2022 09:10:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l2-20020a170903120200b00168c523032fsm8913363plh.269.2022.06.20.09.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 09:10:01 -0700 (PDT)
Message-ID: <2280dc86-92eb-57b5-e67c-78731a9660f4@roeck-us.net>
Date: Mon, 20 Jun 2022 09:09:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v10 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Content-Language: en-US
To: Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, jli@analogixsemi.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220613095957.1669829-1-xji@analogixsemi.com>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220613095957.1669829-1-xji@analogixsemi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_091005_974550_B50EFBE7 
X-CRM114-Status: GOOD (  16.15  )
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

On 6/13/22 02:59, Xin Ji wrote:
> USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> and a port controller (TCPC) - may require that the driver for the PD
> controller accesses directly also the on-chip port controller in some cases.
> 
> Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> 
> ---
> V9 -> V10: Rebase on the latest code
> V8 -> V9 : Add more commit message
> V7 -> V8 : Fix Guanter's comment, remove unnecessary explain
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


