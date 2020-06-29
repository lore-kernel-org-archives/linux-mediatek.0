Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71509C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:38:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B30C23130
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 06:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wlHhlc1x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mt2g0rb9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B30C23130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AMAJ3a6PCmhfYpfm9+gNvsYeF1TQpddb/ow61/DKWqw=; b=wlHhlc1xowu+XJIhjdRKBIcg+
	nrieZaYl4BNoBKOotsY8vrQFC/gR2+AZmw8h5kIEgWR2Bcyu2b+eFhTRDlR9rWpdhxN1e11kMTRUZ
	3QhJ8aIQhyoL8cwzfssfiPwGIT0d1tb2bZTXzCHpta0PNUkYqLVJigMccCpuQGVwHzObFN3ql0OXN
	GzPwzTskUBTqJ6Hw3KNiL5JIYd1DC9FzIr/RblOXnO/4nAsWbFc0GmPJuQAHLGhtuH8XlI9tAytAd
	iPkDlnnRL2/47O4cMFZqcxEPfasEEQg0lqnmDZZ91dtbdWubAHHd9g8etaklxhcDdWkhfwKJOGFeb
	1C6pdvcSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpnQd-00035W-MC; Mon, 29 Jun 2020 06:38:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpnQb-00034W-GT; Mon, 29 Jun 2020 06:38:06 +0000
X-UUID: 5a145288d7004103af4600bb613227b5-20200628
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SDmeP6s5er2Wb3MOX1JYPwWoT5CvmXlv75iJ7wRSypY=; 
 b=mt2g0rb9mydjX1ifp7dR/NKZ0S99TXTSBIkq0TiAzNNB2BvBdHB19QZp68wnQC/i0zV7AQ4Bt9d7hiKbTiA2J0HbhqyckeHXhiNCwC3MwPe6ixP7qBQOGS6M5+u8T/N3HuZzLDD8Zmnqe3++3iCleYVUnJ27G9jmjvJEdOrEHgo=;
X-UUID: 5a145288d7004103af4600bb613227b5-20200628
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 36802756; Sun, 28 Jun 2020 22:30:38 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Jun 2020 23:30:38 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Jun 2020 14:30:36 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Jun 2020 14:30:34 +0800
Message-ID: <1593412218.17166.3.camel@mhfsdcap03>
Subject: Re: [PATCH V10 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 29 Jun 2020 14:30:18 +0800
In-Reply-To: <20200622152350.GB260716@chromium.org>
References: <20200615122937.18965-1-dongchun.zhu@mediatek.com>
 <20200615122937.18965-3-dongchun.zhu@mediatek.com>
 <20200618191026.GA73379@chromium.org>
 <1592639284.8804.712.camel@mhfsdcap03>
 <20200622152350.GB260716@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 648417C71CF3BFA0574A8EA4D54895793F1336B2637F79028BEA642818AF069B2000:8
X-MTK: N
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

Thanks for the review.

On Mon, 2020-06-22 at 15:23 +0000, Tomasz Figa wrote:
> On Sat, Jun 20, 2020 at 03:48:04PM +0800, Dongchun Zhu wrote:
> > Hi Tomasz,
> > 
> > Thanks for the review.
> > 
> > On Thu, 2020-06-18 at 19:10 +0000, Tomasz Figa wrote:
> > > Hi Dongchun,
> > > 
> > > On Mon, Jun 15, 2020 at 08:29:37PM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > 
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   13 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/ov02a10.c | 1042 +++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1057 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > 
> > > 
> > > Thank you for the patch. Please see my comments inline.
> > > 
> > > [snip]
> > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > +			   struct v4l2_subdev_pad_config *cfg,
> > > > +			   struct v4l2_subdev_format *fmt)
> > > > +{
> > > > +	struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > +	struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > +
> > > > +	mutex_lock(&ov02a10->mutex);
> > > > +
> > > > +	if (ov02a10->streaming) {
> > > > +		mutex_unlock(&ov02a10->mutex);
> > > > +		return -EBUSY;
> > > > +	}
> > > > +
> > > > +	/* Only one sensor mode supported */
> > > > +	mbus_fmt->code = ov02a10->fmt.code;
> > > > +	ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > +	ov02a10->fmt = fmt->format;
> > > > +
> > > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > > +		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> > > 
> > > If fmt->which is V4L2_SUBDEV_FORMAT_TRY, the internal driver state must not
> > > be affected. It also should not depend on whether the sensor is streaming
> > > or not. Basically it should be considered a special "candidate" format,
> > > which isn't programmed to the hardware, but just stored aside.
> > > 
> > 
> > Hmm. Maybe we shall use FORMAT_TRY like this:
> > struct v4l2_mbus_framefmt *frame_fmt;
> > ...
> > if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > 	frame_fmt = v4l2_subdev_get_try_format(sd, cfg, 0);
> > else
> > 	frame_fmt = &ov02a10->fmt;
> > 
> > *frame_fmt = *mbus_fmt;
> > 
> > (Remove 'ov02a10->fmt = fmt->format;' above)
> >
> 
> Yes, I guess that should work. Also the ov02a10->streaming condition
> shouldn't be checked if fmt->which is V4L2_SUBDEV_FORMAT_TRY).
> 

Maybe we shall use more strict condition to check streaming state:
'if (ov02a10->streaming)' --> 'if (ov02a10->streaming && fmt->which ==
V4L2_SUBDEV_FORMAT_ACTIVE)'

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
