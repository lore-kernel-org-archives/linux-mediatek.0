Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9467BC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 21:42:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282F264EF6
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 21:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282F264EF6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9O6+Nlg1zEudeBaZMMd5iPDgkpvkIWYsWBl9m8zvp2E=; b=I2rGXV4JN5OkAtmwEa3EN1l1L
	iZ3wCH8SucwI5PDlQ78s97FiX0oJXK7zAvpbcCwDAZIG0K4fdnyYQOckp6RDSbZ7zlECz5ATU21jW
	CEMjjaYqvh6NK0JWFk/ECxc8GW1vKJFAd9oS0hIzAct8l7nzItdv3SJRguymt3tOROTcx7c2VuOSL
	4/fNJvVsxS1Knzb2QMhkNpSmP/nAmmORab9Jhrw387vkWxfqH6ZrczD87fQeaKPI7X+fhhTIripiB
	oCLBq2wqGOUn6nhdiEABT/qKO5BpT4I0Vi9WRGSCujqWi+hYOtjmHezQ5tl7PHFmjNAK54UEo1oV+
	WrQDN7AvQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHZG0-006cti-8B; Wed, 03 Mar 2021 21:42:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHT8p-005Jvg-7J; Wed, 03 Mar 2021 15:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JhBAMhp4xuEUP7sLRBkVlS2lefSvLB3PbPrAHCi6sA0=; b=JC1DJlWG0cdVyf8I5WcL8U3MLr
 UPxMdSF+7ANcVtbtJhGJYBxVnGcvYgwhfDlNEvSDyPLmsZ6bi4h99M0r3UyOMhmOL7V0oBnE97PGx
 SrTlnGu8Cr7e8r/XYNqbnmyw0dJ7z1kOz2bZBfLdQZXEwnTbLLtB82++rNZx32KcAv38sZWXuRnGH
 7zglXPU9kBcDQdtFCsDKZSdLC7KXDgLmbvoqC3G7QxnuwWY/PRQNeYymrAwkjlgkpG0dXF/qb8DMR
 s6Ew9yp3Jn4TPGwyC/TDpawb8N/8SJd13GeN672QSWbbzZhVEIuc0bO6IjIgq1DFTA+/ftzuRIcfv
 Su6xKdrA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHLm3-001ePV-Tt; Wed, 03 Mar 2021 07:18:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC46864E0C;
 Wed,  3 Mar 2021 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614755899;
 bh=oibBBAUG0mkc/tNAJlnnhJitnQ/NskrsB1wpjPpIDmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qN4NSDcWgLOTmDGj/nCGBQU2XDKeToFVV/kLxVv7kgL7dcHh1GgZm8a7B/YJ5bOo3
 AaV7R5CBFILuHM5J+qrQY12Ixf0hmiDuwXAWFIexJFWhxp0CfZ06D3KdnT0IWBuTPF
 XxpvekYWQJZegA8UbghNxhYLzYCNmNPwANqMRI3s=
Date: Wed, 3 Mar 2021 08:18:16 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: Re-license MTK SPI driver as Dual MIT/GPL
Message-ID: <YD84OKr4vNwA7vnz@kroah.com>
References: <20210303025636.795-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303025636.795-1-leilk.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_071826_594187_17A84702 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mediatek@lists.infradead.org,
 Nicolas Boichat <drinkcat@chromium.org>, Wei Yongjun <weiyj.lk@gmail.com>,
 fparent@baylibre.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Mark Brown <broonie@kernel.org>, "luhua . xu" <luhua.xu@mediatek.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Axel Lin <axel.lin@ingics.com>, Thomas Gleixner <tglx@linutronix.de>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 03, 2021 at 10:56:36AM +0800, Leilk Liu wrote:
> From: "leilk.liu" <leilk.liu@mediatek.com>
> 
> It is wanted to use MTK spi bus driver with GPL-2.0 or MIT license.
> But now it is only licensed as GPL-2.0, so re-license it as dual
> MIT/GPL.
> 
> Signed-off-by: leilk.liu <leilk.liu@mediatek.com>

Please use your name here, not an email alias for where your name goes.


> ---
>  drivers/spi/spi-mt65xx.c                 | 4 ++--
>  include/linux/platform_data/spi-mt65xx.h | 2 +-

Given that these files have been licensed under the GPL only since 2015,
all changes contributed to it have only been licensed under the GPL as
well, so have you gotten approval for all of the contributors for this
change?

Can you please get your lawyer to also sign off on this license change
patch, so that we know that you have their approval for this incase
there are questions about it in the future?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
