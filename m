Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD3C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l05+3v2zahe1UirT+BYnQMZg7ihcKt0aUrKjGiGE6c=; b=qN5WohvxyfufL+
	PHcXTta8jwy7jWd+MzXLDAfDbszLxO+UPIVALReykIhYnYtENCORdK5/HqCzbshpiYTXvW0Ws3DV/
	RH625vrrHFaZEa/I7dx//nOa+hMPT2s53LGBxrkRWiLmqPOuPFIrK/EkI028QQDrHX4UfTK014+My
	PB/QOYyQQnQz86kGTjcv0JIXY3nzkzNV8vT63RUVT2krBZRldk4xYIqytOTuOiPTygxHoA55LQrUw
	LJdfCSzriLfaMLPZ/T0dev4lwhc+rk1sfGbxraC6xpyE51poI7yzlOYpym7ozPgEzWfHrwU5OEvKw
	SuLBYIynX93HL6myqbnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRX4u-003rka-Cs; Tue, 08 Mar 2022 10:28:28 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnr-003kQd-Eh; Tue, 08 Mar 2022 10:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646734251; x=1678270251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7ejrIRDi0eLEWqSUSsS80pzyQyiNB/5BCzaO1wi9Cco=;
 b=MuVVWLn00E4rDjYb3CXhOmQy1peLd/7+zJsLKTpHkaBoPNf0mFCbvLfu
 z79FDKAFdqWZBhBuA2Al0VgSilM8y9IUGWR1UoqS9yaMJWJ2LkFSlIKNb
 83xWONKgiBcihDHOweQU4qJx9IElNMxgiWhFYyPn2fg+HPif8NiHDNCXH
 OIHyqbs3kka8Wml+jBFbSwJ7MfeizHsjbOQNotRcFFd9/8vwC61YJIPdj
 E9BX6iLFYjq5rty9Xvv98RdMlsGTlewqGlWxoG3qd/EZD67skcrWZaNh5
 rBO1PEGsfKMutjIH5ffynjg/Q8w/DR8wsNxSu24N/MRf2i3ehG4lmSYd6 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="234601063"
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="234601063"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 02:10:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,164,1643702400"; d="scan'208";a="687874826"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 08 Mar 2022 02:10:46 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 08 Mar 2022 12:10:45 +0200
Date: Tue, 8 Mar 2022 12:10:45 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
 qwen@analogixsemi.com, jli@analogixsemi.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v8 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/ directory
Message-ID: <YicrpWig4kwdh2lg@kuha.fi.intel.com>
References: <20220308073431.1217890-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220308073431.1217890-1-xji@analogixsemi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021051_800066_BB846451 
X-CRM114-Status: GOOD (  18.18  )
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

On Tue, Mar 08, 2022 at 03:34:28PM +0800, Xin Ji wrote:
> As for convenience use TCPCI register definition, move tcpci.h to
> include/linux/usb/ directory.

To be honest, I was still hoping for a better explanation here.

The reason why this header is made global is because some USB PD
controllers - PD controllers consisting of a microcontroller
(acting as the TCPM) and a port controller (TCPC) - may require that
the driver for the PD controller accesses directly also the on-chip
port controller in some cases.

I was hoping that that was explained in the commit message somehow.

> Signed-off-by: Xin Ji <xji@analogixsemi.com>
> 
> ---
> V7 -> V8: Fix Guanter's comment, remove unnecessary explain.
> ---
>  drivers/usb/typec/tcpm/tcpci.c                        | 3 +--
>  drivers/usb/typec/tcpm/tcpci_maxim.c                  | 3 +--
>  drivers/usb/typec/tcpm/tcpci_mt6360.c                 | 3 +--
>  drivers/usb/typec/tcpm/tcpci_rt1711h.c                | 2 +-
>  {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h | 1 +
>  5 files changed, 5 insertions(+), 7 deletions(-)
>  rename {drivers/usb/typec/tcpm => include/linux/usb}/tcpci.h (99%)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index e07d26a3cd8e..9c907296596f 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -13,11 +13,10 @@
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/usb/pd.h>
> +#include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec.h>
>  
> -#include "tcpci.h"
> -
>  #define	PD_RETRY_COUNT_DEFAULT			3
>  #define	PD_RETRY_COUNT_3_0_OR_HIGHER		2
>  #define	AUTO_DISCHARGE_DEFAULT_THRESHOLD_MV	3500
> diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
> index df2505570f07..4b6705f3d7b7 100644
> --- a/drivers/usb/typec/tcpm/tcpci_maxim.c
> +++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
> @@ -11,11 +11,10 @@
>  #include <linux/module.h>
>  #include <linux/regmap.h>
>  #include <linux/usb/pd.h>
> +#include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec.h>
>  
> -#include "tcpci.h"
> -
>  #define PD_ACTIVITY_TIMEOUT_MS				10000
>  
>  #define TCPC_VENDOR_ALERT				0x80
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index f1bd9e09bc87..9e0338bce7ef 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -11,10 +11,9 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
>  
> -#include "tcpci.h"
> -
>  #define MT6360_REG_VCONNCTRL1	0x8C
>  #define MT6360_REG_MODECTRL2	0x8F
>  #define MT6360_REG_SWRESET	0xA0
> diff --git a/drivers/usb/typec/tcpm/tcpci_rt1711h.c b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> index b56a0880a044..3291ca4948da 100644
> --- a/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> +++ b/drivers/usb/typec/tcpm/tcpci_rt1711h.c
> @@ -10,9 +10,9 @@
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/usb/tcpci.h>
>  #include <linux/usb/tcpm.h>
>  #include <linux/regmap.h>
> -#include "tcpci.h"
>  
>  #define RT1711H_VID		0x29CF
>  #define RT1711H_PID		0x1711
> diff --git a/drivers/usb/typec/tcpm/tcpci.h b/include/linux/usb/tcpci.h
> similarity index 99%
> rename from drivers/usb/typec/tcpm/tcpci.h
> rename to include/linux/usb/tcpci.h
> index b2edd45f13c6..20c0bedb8ec8 100644
> --- a/drivers/usb/typec/tcpm/tcpci.h
> +++ b/include/linux/usb/tcpci.h
> @@ -9,6 +9,7 @@
>  #define __LINUX_USB_TCPCI_H
>  
>  #include <linux/usb/typec.h>
> +#include <linux/usb/tcpm.h>
>  
>  #define TCPC_VENDOR_ID			0x0
>  #define TCPC_PRODUCT_ID			0x2
> -- 
> 2.25.1

-- 
heikki

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
