Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64475C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvXK7IjPr/dvxpOEs8Wgz5utHO2JpiAKUO7kvolbpGE=; b=EwguyQ9bKLQf5xU+QgEl/jm061
	MlIm2lqHVJjkKWInstchGr4TshfPkQTxSsIWLmfhGBwrQ3xmyI2UHwvJdJ/1k8Czzd4kPi79AZPPm
	hFUqRR5lwcO5/+LguBeAnFYHBnTUy87iy4R/dkxIsJrhIr8fpYFOb0nH6HuDRS+7HcWc1eqMX0wQy
	INdWGs/BLzj+UXDbzD/mulcbE18vUEw4QPDXIf6E8AYDTFqUie4yrMUmT1uRmjZnxwsWEMXZjCfBm
	EKs/x5B8nZd6MDN1jNFmFVEjM+GHrCodWwFfcCg6e3k+R/h1S0lHor48EYADpLKDpI/oaAOjCzYFU
	nuLr9v9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oez-0017aa-Iu; Mon, 27 Jun 2022 13:20:13 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5oel-0017Vx-KN; Mon, 27 Jun 2022 13:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656335999; x=1687871999;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FSVsuowTJal0OK/kAa7GOJ1gXDKBsLcY9rOM056n4Mk=;
  b=F9gsMNnVJyUE7SZUgcaBSgadipAX2jkZFIufirctV1lmG17Dk1QbE12n
   8251UM/HWZU4W3Uxru+lUp1MHKAPgWgTqoPgN/m1X9YwDYHZcaoDJGwX4
   k3fRA/aQV8CQKehrvhLh1xywVaA60QEiytphPLU3BIsglyR/nqv9Ph4it
   OJf9nDYLUPQ1GUvQy7StelXWHOYa98a7WlJj99lnUulUWOb8kTpMUlNCb
   QBQoVtgaXR8UKQGDk/A95qwZ778lDbG+1ktS9njbBpwgRBru9Q1n64rfz
   J0JDFfh5l7dpQemzBsLA/WpustEYawI0kO7OSBeptNwaL7l6yn5sRNIpZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10390"; a="343133896"
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="343133896"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2022 06:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,226,1650956400"; 
   d="scan'208";a="732309491"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 27 Jun 2022 06:19:53 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 27 Jun 2022 16:19:52 +0300
Date: Mon, 27 Jun 2022 16:19:52 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xin Ji <xji@analogixsemi.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, bliang@analogixsemi.com,
	qwen@analogixsemi.com, jli@analogixsemi.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v11 1/3] usb: typec: tcpci: move tcpci.h to
 include/linux/usb/
Message-ID: <YrmueL99Hr8iqXeA@kuha.fi.intel.com>
References: <20220627044331.2180641-1-xji@analogixsemi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220627044331.2180641-1-xji@analogixsemi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_061959_757747_F72ED5FE 
X-CRM114-Status: GOOD (  19.51  )
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

On Mon, Jun 27, 2022 at 12:43:29PM +0800, Xin Ji wrote:
> USB PD controllers which consisting of a microcontroller (acting as the TCPM)
> and a port controller (TCPC) - may require that the driver for the PD
> controller accesses directly also the on-chip port controller in some cases.
> 
> Move tcpci.h to include/linux/usb/ is convenience access TCPC registers.
> 
> Signed-off-by: Xin Ji <xji@analogixsemi.com>

This one looks good to me.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> V9 -> V10: Rebase on the latest code
> V8 -> V9 : Add more commit message
> V7 -> V8 : Fix Guanter's comment, remove unnecessary explain
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
> index f33e08eb7670..812784702d53 100644
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
> index 8a952eaf9016..1b7c31278ebb 100644
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
>  #define MT6360_REG_PHYCTRL1	0x80
>  #define MT6360_REG_PHYCTRL3	0x82
>  #define MT6360_REG_PHYCTRL7	0x86
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

