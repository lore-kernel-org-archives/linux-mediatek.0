Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46FCC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qa6LT37fItDVXm6FMFB0dFzllQX1z52WxfSxqqGA5ss=; b=1zuqE3AE8II0yN
	IaIwAG/KPy1lKLTYfNXMZ/p2+0PG/kgnA5q0cAFzFKmhWFGSTa5+lMFI4z+P2q2c1T4Fku4Ona1Z5
	VaaWEyipljznAn8C85nRKtNOiw6l5/Tmvp98JxYlEQtUTXUkLY30gx1wHgDjGkr85yiADUOF0+7yK
	m7HkQjPR7A7rsKn8Vgy+O0vnYMv47RAmUmArEwY2yZHEqUUVF5ZoRIqF9SvL1bfc8yGi70c+KVq5y
	8XIdVpsonixcSsb2sZPRNINOZWUC0NhiBMWIjoXN/gZdfuZn82d0WFot8U2jL3CZOG2xv/my7K+uW
	aafc3wgo1TM6XZF8M8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREgj-000W04-4p; Mon, 07 Mar 2022 14:50:17 +0000
Received: from gateway23.websitewelcome.com ([192.185.50.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nREfn-000Vc4-VS
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 14:49:21 +0000
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway23.websitewelcome.com (Postfix) with ESMTP id 5402319558
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 08:49:07 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id REfbnWOQDb6UBREfbnAC3v; Mon, 07 Mar 2022 08:49:07 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ffdy6z+jLWtdsYT/cAqK0cKmbp/7CaFfPazFLQ9MlP4=; b=mwhYzltTsMKEaWhoQ519z8wv1I
 zbpB0D48oE9bMgRLfOFycU/Dc2898RIRKoK1cdDpCzGtK3QxZygcj2gr/OUsmF1cHoTBkb8ckwGRy
 JtMlijix34aDR6Rw1NrOzdd2Zm+6CQdMGt9UzLuYn5Hon7yylQaIMtLxsWJzufkN3x1dyZkjA8jF0
 P+2B+bCIqh+5gaixxah86BojuqcHAEUPAdf0p/WXRzzwQeUGCrs5qQOyYPu1AQmt2hbPJqre5vsAt
 6z1IMAOb45XtS1wBFZr2ZyFfvgGj/5DP+W1ABA3G7HAiDWaA06oH4iTz7rz0Yp/UTRgzpZapvY+Ts
 +OwNnEUQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:38094)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nREfa-002KX7-2w; Mon, 07 Mar 2022 14:49:06 +0000
Message-ID: <4252cd9d-a761-e064-58cf-eebc3b9d0bb7@roeck-us.net>
Date: Mon, 7 Mar 2022 06:49:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Xin Ji <xji@analogixsemi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: bliang@analogixsemi.com, qwen@analogixsemi.com, jli@analogixsemi.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220307090929.701137-1-xji@analogixsemi.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v7 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/ directory
In-Reply-To: <20220307090929.701137-1-xji@analogixsemi.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nREfa-002KX7-2w
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 [108.223.40.66]:38094
X-Source-Auth: linux@roeck-us.net
X-Email-Count: 29
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_064920_199424_72B9A37E 
X-CRM114-Status: GOOD (  13.30  )
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

On 3/7/22 01:09, Xin Ji wrote:
> Move tcpci.h as a global file, better for other USB Type-C driver
> access.
> 

The idea was to have tcpci compliant drivers in the tcpm/ subdirectory.
If I recall correctly, the reason for having this driver elsewhere is
that it doesn't support tcpm. That should be explained here.
"better for other USB Type-C driver" is not a reason for moving
a header file.

> Fix compiling error after moving tcpci.h to include/linux/usb/.
> 
I don't think this should be part of the commit description.

Guenter

> Signed-off-by: Xin Ji <xji@analogixsemi.com>
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
> index e07d26a3cd8e..9c907296596f 100644
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
> index f1bd9e09bc87..9e0338bce7ef 100644
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
>   #define MT6360_REG_VCONNCTRL1	0x8C
>   #define MT6360_REG_MODECTRL2	0x8F
>   #define MT6360_REG_SWRESET	0xA0
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
