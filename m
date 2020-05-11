Return-Path: <SRS0=Nu0C=6Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C128C54E4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 12:08:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40667206F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2020 12:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BeHxRmR7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nijYdYWK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40667206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RRB3TKa/D4/Cwr06/CzBjR1ABu74ZTyF+3OB5JPwctU=; b=BeHxRmR7YCdrju
	me1uLOC8d+WoK48afGC411+2pKEjZvUR2mLka+0OSDJECDaiKEMdoL5sz2W/8TwYpK/EkMHNrYHlu
	72ZqLN0dGsqTV8KGtEQ0zFJ9JluIpZ02QFiJnigkaJ/NwfFPltOuFhokqDdqMC7N7u+uzUVDK6MHF
	dsR6VRmL17+knyjAKmHun0CzC6hd1QXr0+u0VQrYO9cPJ+zKVgX8B+fjC/FrOKCd994ijgLNBOd8d
	sm22WMVwI++b/YLjHHVEGAYNzAr8d5dedHRWYryJy2hNJ6K3ycyKudQ7vxJrjP920YYJnSk2ttdwk
	DfpCxSKHgApmW8F4jzEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jY7Dz-0006Uo-3V; Mon, 11 May 2020 12:07:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jY7Dx-0006UA-3q; Mon, 11 May 2020 12:07:58 +0000
X-UUID: 5f75d4f11dcc41e5a94868badf489859-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vMipxxyx4vvbm6f5PGT2B9rTKQUVPBjJU6zHZu06PhY=; 
 b=nijYdYWKJk1lzibIVt030yqGOvFax/1AxuCU4dnlCz1eTIQp9rhRPGj1G390+fSzgtzOZRF0CuVjULyhUffyV3kbsL6BSV7UdjVL6TBQTZ6WOJMb3/hy65sJWYUIDMmyKrA+0U0DooE3Kpyd1ac9uBkFsdaMoATLZkTNX33QycU=;
X-UUID: 5f75d4f11dcc41e5a94868badf489859-20200511
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 545490689; Mon, 11 May 2020 04:07:50 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 05:07:51 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 11 May 2020 20:07:49 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 May 2020 20:07:47 +0800
Message-ID: <1589198795.8804.276.camel@mhfsdcap03>
Subject: Re: [V8, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Mon, 11 May 2020 20:06:35 +0800
In-Reply-To: <20200511093308.GF185537@smile.fi.intel.com>
References: <20200509080627.23222-1-dongchun.zhu@mediatek.com>
 <20200509080627.23222-3-dongchun.zhu@mediatek.com>
 <20200511093308.GF185537@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1C8EC2EFA9EA89E9356A83C33519571046D31C38383666B09EF4913B1E4D0A3F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_050757_164799_DF586DE1 
X-CRM114-Status: GOOD (  15.28  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 louis.kuo@mediatek.com, srv_heupstream@mediatek.com, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Andy,

Thanks for the kindly review.

On Mon, 2020-05-11 at 12:33 +0300, Andy Shevchenko wrote:
> On Sat, May 09, 2020 at 04:06:27PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> 
> ...
> 
> > +#define OV02A10_ID(_msb, _lsb)				((_msb) << 8 | (_lsb))
> 
> How often do you use this macro?
> 

Just once.
I would try to use the macro function directly in next release.

> ...
> 
> > +static int ov02a10_read_smbus(struct ov02a10 *ov02a10, unsigned char reg,
> > +			      unsigned char *val)
> > +{
> > +	struct i2c_client *client = v4l2_get_subdevdata(&ov02a10->subdev);
> > +	int ret;
> > +
> > +	ret = i2c_smbus_read_byte_data(client, reg);
> 
> > +
> 
> Extra blank line.
> 

Thanks for the carefully reminder.
This error can easily be neglected.
I would remove it in next release.

> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	*val = (unsigned char)ret;
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct v4l2_subdev_format fmt = {
> 
> > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
> > +			     : V4L2_SUBDEV_FORMAT_ACTIVE,
> 
> I think it would be fine to have it on one line.
> 

Got it.
Fixed in next release.

> > +		.format = {
> > +			.width = 1600,
> > +			.height = 1200,
> > +		}
> > +	};
> > +
> > +	ov02a10_set_fmt(sd, cfg, &fmt);
> > +
> > +	return 0;
> > +}
> 
> ...
> 
> > +	if (!ret) {
> > +		if (rotation == 180) {
> 
> if (a) {
> 	if (b) {
> 		...
> 	}
> }
> 
> ==
> 
> if (a && b) {
> 	...
> }
> 

Thanks for the reminder :-)
Next release would use:
if (!ret && rotation == 180) {
	...
}

> > +			ov02a10->upside_down = true;
> > +			ov02a10->fmt.code = MEDIA_BUS_FMT_SRGGB10_1X10;
> > +		}
> > +	}
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
