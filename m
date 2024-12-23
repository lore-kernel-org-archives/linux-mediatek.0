Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26524E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fy5aUEhpXeIseqCdJlLVOlqgPZJNIZaYxR1LzffJU2o=; b=IzSkMBFP5GrHagRithhqsZc5bC
	+zjVZtvx7+MTC2EQWBsH5Mtt5lOQbMGWrL2VSK6FWt/RXpe/IP0cOI3Z6ZiGEsWO+dFg+fNPuWVP1
	1/B/udALm4Dlp6uPAYxCYxwmi82bswFaWAkl9zeXUZp7kKxBBSIT5O+z0RQolLf4DcwOzfQpBx8Lu
	z4KaFT5rdC4lDZ8PLvoikSFWHQTnA3FtqOB8j1LVHymkhsO29tDDnaT2A+TjMeCwgH8FI/zPPtY34
	/6rRCFCvbez3MIgo8mU8R60kQNAHd+PoLf1XmDR58y14XqdWhQCL9PHDL1yGwD6dRNg0n0dAM6ANy
	Cd/dK73w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpDU-0000000Ahzv-0buP;
	Mon, 23 Dec 2024 20:39:52 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpDS-0000000AhzJ-1Nyl
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 20:39:51 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH8tC65GQz6K5VT;
	Tue, 24 Dec 2024 04:35:47 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CFA67140524;
	Tue, 24 Dec 2024 04:39:38 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:39:37 +0100
Date: Mon, 23 Dec 2024 20:39:35 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Zijun Hu <zijun_hu@icloud.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
	<linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>, James Bottomley
	<James.Bottomley@HansenPartnership.com>, Thomas =?ISO-8859-1?Q?Wei=DFschu?=
 =?ISO-8859-1?Q?h?= <thomas@t-8ch.de>, <linux-kernel@vger.kernel.org>,
	<nvdimm@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<sparclinux@vger.kernel.org>, <linux-block@vger.kernel.org>,
	<linux-cxl@vger.kernel.org>, <linux1394-devel@lists.sourceforge.net>,
	<arm-scmi@vger.kernel.org>, <linux-efi@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-hwmon@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>
Subject: Re: [PATCH v4 05/11] driver core: Simplify API
 device_find_child_by_name() implementation
Message-ID: <20241223203935.00003de0@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-5-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
	<20241211-const_dfc_done-v4-5-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_123950_513802_23B15E2F 
X-CRM114-Status: GOOD (  13.23  )
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

On Wed, 11 Dec 2024 08:08:07 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Simplify device_find_child_by_name() implementation by both existing
> API device_find_child() and device_match_name().
There is a subtle difference.  In theory old code could dereference a NULL
if parent->p == NULL, now it can't.  Sounds at most like a harmless change but
maybe you should mention it.

Otherwise LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/base/core.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bc3b523a4a6366080c3c9fd190e54c7fd13c8ded..8116bc8dd6e9eba0653ca686a90c7008de9e2840 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4110,18 +4110,7 @@ EXPORT_SYMBOL_GPL(device_find_child);
>  struct device *device_find_child_by_name(struct device *parent,
>  					 const char *name)
>  {
> -	struct klist_iter i;
> -	struct device *child;
> -
> -	if (!parent)
> -		return NULL;
> -
> -	klist_iter_init(&parent->p->klist_children, &i);
> -	while ((child = next_device(&i)))
> -		if (sysfs_streq(dev_name(child), name) && get_device(child))
> -			break;
> -	klist_iter_exit(&i);
> -	return child;
> +	return device_find_child(parent, name, device_match_name);
>  }
>  EXPORT_SYMBOL_GPL(device_find_child_by_name);
>  
> 


