Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417BEE7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+J37kb9MrnUS+L6EjBua9uJKUuUy3HnpbG136HKrQPU=; b=C1HgBDkn7AOOFpngZSJAvlU2cX
	pQ2H8TUfIiuGWSlC1FJfTzj0mF1AvSjoAWW4+Fflem/Z1tMpKBzxs3gnJQjsfGF0bWQlttLpM+zCV
	2QqnYEO0W637vpOkv+XUOErUFlfc9lWD9Ca0SxRLmRQfMBCMiPP47L5FmZLwMSpL+8Mxbwzqz3mzV
	2sJzyTycV9nSYGA5LZG/Bfbh2/oRLv7BPP/QUGndewRSiAq+ZR5mOtUvjc6AzgvddfZly2toy8DpJ
	VEV0Qzf3ELMLZ+Fk8woacvL71c5uemF34stn2Xq41c/w19K40mVEli0KOVBmKsUhb6TTZp9QXb1Fn
	K6wXQWAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpIb-0000000Aia0-1370;
	Mon, 23 Dec 2024 20:45:09 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpIY-0000000AiYk-0Oy2
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 20:45:07 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH90J5wVhz6K5VT;
	Tue, 24 Dec 2024 04:41:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C7FFB140A70;
	Tue, 24 Dec 2024 04:44:55 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:44:54 +0100
Date: Mon, 23 Dec 2024 20:44:52 +0000
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
Subject: Re: [PATCH v4 07/11] slimbus: core: Remove of_slim_match_dev()
Message-ID: <20241223204452.000067e6@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-7-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
	<20241211-const_dfc_done-v4-7-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_124506_274340_17855610 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, 11 Dec 2024 08:08:09 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> static of_slim_match_dev() has same function as API device_match_of_node().
> 
> Remove the former and use the later instead.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
Nice tidy up given the current code is dance up and down containing structure to exactly
the same device it started with.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  drivers/slimbus/core.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
> index ab927fd077cb4fe1e29c004269fe52b2896c302f..005fa2ef100f526df5603d212b6334c06a366c94 100644
> --- a/drivers/slimbus/core.c
> +++ b/drivers/slimbus/core.c
> @@ -385,21 +385,13 @@ struct slim_device *slim_get_device(struct slim_controller *ctrl,
>  }
>  EXPORT_SYMBOL_GPL(slim_get_device);
>  
> -static int of_slim_match_dev(struct device *dev, const void *data)
> -{
> -	const struct device_node *np = data;
> -	struct slim_device *sbdev = to_slim_device(dev);
> -
> -	return (sbdev->dev.of_node == np);
> -}
> -
>  static struct slim_device *of_find_slim_device(struct slim_controller *ctrl,
>  					       struct device_node *np)
>  {
>  	struct slim_device *sbdev;
>  	struct device *dev;
>  
> -	dev = device_find_child(ctrl->dev, np, of_slim_match_dev);
> +	dev = device_find_child(ctrl->dev, np, device_match_of_node);
>  	if (dev) {
>  		sbdev = to_slim_device(dev);
>  		return sbdev;
> 


