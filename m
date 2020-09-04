Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6351AC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:19:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DE9206D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:19:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAqVhKAh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="naMaf6/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29DE9206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=27p2Mz2wPuZYQwaqIDTTBs1l/u/mTzY1dUaUC7rbVqU=; b=dAqVhKAhTt8L6cZXUjU3UD9Z0
	PlWiWGSo4a6Nxa1NKmPm+OgQIL0s411i45m+MC1pgZ9jE7HsqJ1Yd1ohsGZDuVLUUWYniRu1clZy/
	2/qs6ZxXnZY6iX20b66tqpqY26HP0N8MOHwpl2ZSTstFqSaMjm1lXSTpjT5/2fK/iEXM1B8uK8hVf
	u23NHVfhjVZteHajGsrMBniOxqciJV/BSvVzuKJM4o6yJZv0Vz9/p8elqvShxDJenXIBhBqbhL65n
	hAn1O3/ybXnXVDc7E7yK6+Kn4o5bYuDuCRWXLrLMwWWrz5IjwboJV0+i0HREBwME78IW0jUgByEu9
	lJjwoetag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2GL-0001q2-8J; Fri, 04 Sep 2020 03:19:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2GJ-0001os-D8; Fri, 04 Sep 2020 03:19:40 +0000
X-UUID: 80d7a0fe18244ece99b4bed5718991a2-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=81j54tuoiKV3uK8sKV8TMOkBCYp/9eQY2ZBo8fSyYog=; 
 b=naMaf6/fXReeS7rdBRhh7m3WudxeJ/vTHqDBSQCO25oJ0jkK1/boaR93wDjepLMW5Jn8GvO0XFsbDrawwzLzMSFcp+o5aJFfbfECHhBu6KK109IwgGuvVRwVrNh995unOEkIi5ip5V1+Cbkj9iF8FafFs0AJRcQi2VWFyCjy6jw=;
X-UUID: 80d7a0fe18244ece99b4bed5718991a2-20200903
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1488158223; Thu, 03 Sep 2020 19:19:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 20:19:13 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 4 Sep 2020 11:19:09 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Sep 2020 11:19:08 +0800
Message-ID: <1599189448.11403.33.camel@mhfsdcap03>
Subject: Re: [PATCH v2 01/11] usb: gadget: bdc: fix improper SPDX comment
 style for header file
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 4 Sep 2020 11:17:28 +0800
In-Reply-To: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6437F811FE63FA34E3E573D3346DC7F53866220D91CCF2E752ABCF714B765FAD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_231939_568065_3971D25F 
X-CRM114-Status: GOOD (  16.71  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Peter Chen <peter.chen@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Minas Harutyunyan <hminas@synopsys.com>,
 linux-usb@vger.kernel.org, Sasi Kumar <sasi.kumar@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Colin
 Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Florian, 

On Thu, 2020-08-20 at 19:30 +0800, Chunfeng Yun wrote:
> For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used).
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: add Cc Florian
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
Would you please take a look at this series?
I'll drop the patches that not fine with you.
Thanks


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
