Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2AAE7718D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 20:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbAk/HdmpgVVtT2hPmFyjpjPt8qQD0rsrEXpX/xNLRw=; b=vbCapl318Dren/yVZkVKhm/i8Q
	EfIXNs9haFfIfGSQJEZ9F8HC2z76t63IlxOQDjYPDE1JZ+SUfF0lxLqzW/nrwCgbVbQxfYZ6HcnTn
	WciZB1VQqJwN41/QfzpJmZ0Wfuc/IIH9b/tCxHw1Fcvg7DNh7QY3oBcZvkgN9D/7+5vKvti+j8RYm
	GpKkGwnciANviL/vOIHQb9WaicJiGvIFsvNb9FtBkWJV9a/NP3Js8lrWNm6cUYSKluiQ/RZXuv1VW
	YcvymU6grgwzM3UbHApRiozteKVe2fOG7ypxF9KtyZQK0Hd5KwSIQKAbAJRMi5ewkbEZdEyuLe1a9
	wycBhVbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPp7F-0000000AhSy-1KEA;
	Mon, 23 Dec 2024 20:33:25 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPp7C-0000000AhSF-2O3I
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 20:33:23 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH8nr5fC3z6L774;
	Tue, 24 Dec 2024 04:32:00 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 11634140A70;
	Tue, 24 Dec 2024 04:33:13 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 21:33:11 +0100
Date: Mon, 23 Dec 2024 20:33:09 +0000
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
	<netdev@vger.kernel.org>, Zijun Hu <quic_zijuhu@quicinc.com>, "Alison
 Schofield" <alison.schofield@intel.com>, Takashi Sakamoto
	<o-takashi@sakamocchi.jp>
Subject: Re: [PATCH v4 04/11] driver core: Constify API device_find_child()
 then adapt for various usages
Message-ID: <20241223203309.00004d51@huawei.com>
In-Reply-To: <20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
	<20241211-const_dfc_done-v4-4-583cc60329df@quicinc.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_123322_897044_518CD593 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, 11 Dec 2024 08:08:06 +0800
Zijun Hu <zijun_hu@icloud.com> wrote:

> From: Zijun Hu <quic_zijuhu@quicinc.com>
>=20
> Constify the following API:
> struct device *device_find_child(struct device *dev, void *data,
> 		int (*match)(struct device *dev, void *data));
> To :
> struct device *device_find_child(struct device *dev, const void *data,
>                                  device_match_t match);
> typedef int (*device_match_t)(struct device *dev, const void *data);
> with the following reasons:
>=20
> - Protect caller's match data @*data which is for comparison and lookup
>   and the API does not actually need to modify @*data.
>=20
> - Make the API's parameters (@match)() and @data have the same type as
>   all of other device finding APIs (bus|class|driver)_find_device().
>=20
> - All kinds of existing device match functions can be directly taken
>   as the API's argument, they were exported by driver core.
>=20
> Constify the API and adapt for various existing usages by simply making
> various match functions take 'const void *' as type of match data @data.

There are a couple of places I noticed where you changed types
that aren't related to the specific change this is making.
They are almost certainly fine but I'd either like a specific note
on that in this patch description or just change the elements
that are directly affected by this change.

>=20
> Reviewed-by: Alison Schofield <alison.schofield@intel.com>
> Reviewed-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>


> diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
> index d778996507984a759bbe84e7acac3774e0c7af98..bfecd71040c2f4373645380b4=
c31327d8b42d095 100644
> --- a/drivers/cxl/core/region.c
> +++ b/drivers/cxl/core/region.c

> @@ -1722,10 +1722,12 @@ static struct cxl_port *next_port(struct cxl_port=
 *port)
>  	return port->parent_dport->port;
>  }
> =20
> -static int match_switch_decoder_by_range(struct device *dev, void *data)
> +static int match_switch_decoder_by_range(struct device *dev,
> +					 const void *data)
>  {
>  	struct cxl_switch_decoder *cxlsd;
> -	struct range *r1, *r2 =3D data;
> +	const struct range *r1, *r2 =3D data;

As below. I'd not touch type of things you don't need to touch.

> +
> =20
>  	if (!is_switch_decoder(dev))
>  		return 0;
> @@ -3176,9 +3178,10 @@ static int devm_cxl_add_dax_region(struct cxl_regi=
on *cxlr)
>  	return rc;
>  }
> =20
> -static int match_root_decoder_by_range(struct device *dev, void *data)
> +static int match_root_decoder_by_range(struct device *dev,
> +				       const void *data)
>  {
> -	struct range *r1, *r2 =3D data;
> +	const struct range *r1, *r2 =3D data;

=46rom the point of view of keeping the patch to what it 'needs'
to touch, should leave type of r1 alone.
I've not looked at whether this causes any problems, just whether
it is relevant to this change.

>  	struct cxl_root_decoder *cxlrd;
> =20
>  	if (!is_root_decoder(dev))
> @@ -3189,11 +3192,11 @@ static int match_root_decoder_by_range(struct dev=
ice *dev, void *data)
>  	return range_contains(r1, r2);
>  }
> =20
> -static int match_region_by_range(struct device *dev, void *data)
> +static int match_region_by_range(struct device *dev, const void *data)
>  {
>  	struct cxl_region_params *p;
>  	struct cxl_region *cxlr;
> -	struct range *r =3D data;
> +	const struct range *r =3D data;
>  	int rc =3D 0;
> =20


