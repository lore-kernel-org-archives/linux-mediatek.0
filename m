Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE46C4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:15:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2520A21D7F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wvIA0Ltp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="J6mnUGz1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2520A21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m68sYGBfplfzsgZvc/ODJobFgGzbDb0rZ990oc7v/Y8=; b=wvIA0Ltpd/F2fjvf6vwNHJ2Ja
	JyYJsX2MBQeEvJOpB+KaVgGf8a+cj0hVfqGGLjJNR9TLxvChl0pHJkL4/O+MuEpgZyoifxu661zI6
	RWkHBjtJaKbsMTIzYSmVmTPKOdTvgGkIfvdKxtwgOK1M59k35YdAS35bg2HmDIlgvGA7Mfa+EczIh
	ZmUdAcUFjsygjH6QGXZVED9xdOkdCT0RF2YLRhYU7S4pb4S6exV9jyfDSs2Sz7wgPSRwJI5QVuNg0
	znxxH051a8SEV7ipjuUG0x+IkzXwattIh049QKFqdmkxE21Ea/rQW0F7x5bPXekbYMCcrLlu6g4ZT
	0apj7prDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLh0k-0001z7-TO; Fri, 25 Sep 2020 06:15:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLh07-0001da-7V; Fri, 25 Sep 2020 06:14:36 +0000
X-UUID: 623d9df8c3f54c15b1cf40489aad3397-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lCgaTSUPHWkgc/8WNh9JxAl73KwNmTV0GbbyUTGaT54=; 
 b=J6mnUGz1e9K24qgubeFCUWDeUgaHlgClywkXoQTu1FoTr1XQi3w7qt0s7iOlgxLEHQfYreht65cUAgIb64Ur/jijly25/AHW9XI2FGXEGzfDv51lGSmm8nvJgrEqEtcz1DkQVhfdlaYrs2uAPR5XH/zF2XxZ4ompABryIifaSEs=;
X-UUID: 623d9df8c3f54c15b1cf40489aad3397-20200924
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1648902955; Thu, 24 Sep 2020 22:14:29 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 23:12:46 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 25 Sep 2020 14:12:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Sep 2020 14:12:44 +0800
Message-ID: <1601014218.29336.1.camel@mhfsdcap03>
Subject: Re: [PATCH 01/11] usb: gadget: bdc: fix improper SPDX comment style
 for header file
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
Date: Fri, 25 Sep 2020 14:10:18 +0800
In-Reply-To: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1601013499-28920-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89EE0F742F0CA53589BE25D621EC5784B4073B641089054406C361DAE99296EC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_021435_446228_330D9D1A 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Al
 Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>, Nathan
 Chancellor <natechancellor@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Felipe,

    Sorry, please ignore the series! forget version changes log

On Fri, 2020-09-25 at 13:58 +0800, Chunfeng Yun wrote:
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
> 
> Change-Id: I70ad2038e20ba92497028d687c62d63c9ff93991
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  drivers/usb/gadget/udc/bdc/bdc.h     | 2 +-
>  drivers/usb/gadget/udc/bdc/bdc_cmd.h | 2 +-
>  drivers/usb/gadget/udc/bdc/bdc_dbg.h | 2 +-
>  drivers/usb/gadget/udc/bdc/bdc_ep.h  | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/bdc/bdc.h b/drivers/usb/gadget/udc/bdc/bdc.h
> index ac75e25..fcba77e 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * bdc.h - header for the BRCM BDC USB3.0 device controller
>   *
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_cmd.h b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> index 29cc988..373e674 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc_cmd.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * bdc_cmd.h - header for the BDC debug functions
>   *
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_dbg.h b/drivers/usb/gadget/udc/bdc/bdc_dbg.h
> index 373d5ab..859d588 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_dbg.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc_dbg.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * bdc_dbg.h - header for the BDC debug functions
>   *
> diff --git a/drivers/usb/gadget/udc/bdc/bdc_ep.h b/drivers/usb/gadget/udc/bdc/bdc_ep.h
> index a37ff803..5bbd73f 100644
> --- a/drivers/usb/gadget/udc/bdc/bdc_ep.h
> +++ b/drivers/usb/gadget/udc/bdc/bdc_ep.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>  /*
>   * bdc_ep.h - header for the BDC debug functions
>   *

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
