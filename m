Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9A0E7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ORO62ojBA893VwmGUN3cGBfU18wXHGc+4Lbb0vP8ZM=; b=BVcLr6VdYjDLZebNlUU2Ddsc6S
	onDhOOysHSoX11qvdJ3MbrwG8MhvO26VS17Rixi8n72LSBvMLZ8eJ0MGZMFmZrOSwEFn7/NkCPzAv
	uCDQAgjmFu3qTBbGRvmKzoIz6imdSN/JjDZ1uhY6vWko1k+zCb4/VJHAai/vod0ZCs6zH5DRQmLw/
	VH4HhI2dGKSyNX+LoZC4ZyBAeXYv5KXmC4ZSNKrL04LqfA74C6yDrnsSZWRraxqCbCT8aWRnaqdHn
	ruTs1Za36nulu1ACaMGfHHhBfRtamjEDhiZGWH5N1Whto+y5LYnovfBPZ4xawS6dra46x4JPAfPND
	rTMwUivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpEf-0000000AiEU-2GaA;
	Mon, 23 Dec 2024 20:41:05 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPpEd-0000000AiCy-0kuZ
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 20:41:04 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH8yn0rpCz67FbS;
	Tue, 24 Dec 2024 04:39:45 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AA56140A70;
	Tue, 24 Dec 2024 04:40:57 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:40:55 +0100
Date: Mon, 23 Dec 2024 20:40:54 +0000
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
Subject: Re: [PATCH v4 06/11] driver core: Remove match_any()
Message-ID: <20241223204054.000056db@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-6-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
	<20241211-const_dfc_done-v4-6-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_124103_372180_FCEF6DF0 
X-CRM114-Status: GOOD (  13.28  )
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

On Wed, 11 Dec 2024 08:08:08 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
> 
> Static match_any() is exactly same as API device_match_any().
is now exactly...

perhaps to call out that it wasn't prior to this set!

> Remove the former and use the later instead.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/base/core.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 8116bc8dd6e9eba0653ca686a90c7008de9e2840..289f2dafa8f3831931d0f316d66ee12c2cb8a2e1 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4114,11 +4114,6 @@ struct device *device_find_child_by_name(struct device *parent,
>  }
>  EXPORT_SYMBOL_GPL(device_find_child_by_name);
>  
> -static int match_any(struct device *dev, const void *unused)
> -{
> -	return 1;
> -}
> -
>  /**
>   * device_find_any_child - device iterator for locating a child device, if any.
>   * @parent: parent struct device
> @@ -4130,7 +4125,7 @@ static int match_any(struct device *dev, const void *unused)
>   */
>  struct device *device_find_any_child(struct device *parent)
>  {
> -	return device_find_child(parent, NULL, match_any);
> +	return device_find_child(parent, NULL, device_match_any);
>  }
>  EXPORT_SYMBOL_GPL(device_find_any_child);
>  
> 


