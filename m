Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A242C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:58:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C221206A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 08:58:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v3M5aqH1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eBS5eSnT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C221206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/aDaiAEwtaO7Zn1ji4nG8UR4g7uqmJoZYhcmzg8876o=; b=v3M5aqH1QmOAg9jtrgTenqA4S
	/SKicr+Rs4wTNb40YlCK1/3AVdujacN5lYkNLWTwEuXz2O2J6++TNKZbMrpG3cnx0KSOaiZ3Ri9d1
	ICtazVpb5yzdsRzfohC6SMEZQo5uChrJK1h3Bo9dm5g49iWvltUSdaEytidwGf5q6pl4mh5CkDiSf
	O5QbJhggaRf2p13hM2eZRlXhhtYiMxVF98+coC5Ts4oQEVgI/usAmLGMT+1aIu1l6kQSfND3Avdfq
	IcMvYsarQco9zGkXvGhL2tXPDvM8ISkk+e5EodWtvNN3l09q5CGeYnQap4+hbpEIVvsZxMwCjX0Q3
	LP51udPQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYZE-0004jw-8T; Wed, 01 Jul 2020 08:58:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYZC-0004jV-5e; Wed, 01 Jul 2020 08:58:07 +0000
X-UUID: 89f2459e68c34852973294364095b3ee-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SDn5+tQnbteYq/qm4PoeIfk0TU0/1SzsqgINczT+k7o=; 
 b=eBS5eSnT44i1wuDO2eKZLeoIDz8HaKq7ry/mB9Nm9FvA/qCPqfVcPoFkzuNGJ5wEs5FEsaKUoJSH3326njWiPpCqOOtmtKWPRgHDHsgRUp46c9njg7+f1cRC4yfj7nSTkgWSESRWJaYXF1hXLdA68/XWtawxy34uLp+fmle6nt0=;
X-UUID: 89f2459e68c34852973294364095b3ee-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 363893070; Wed, 01 Jul 2020 00:57:48 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 01:47:46 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Jul 2020 16:47:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 16:47:42 +0800
Message-ID: <1593593242.17166.48.camel@mhfsdcap03>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 1 Jul 2020 16:47:22 +0800
In-Reply-To: <20200630184702.GH16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630170746.GD1212092@chromium.org>
 <20200630184702.GH16711@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B41849E7468EBFC9B60FC92E7E7E845B75FAEEA141398C78B5F99E380EA612E52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_045806_453683_1A0C1F6D 
X-CRM114-Status: GOOD (  24.85  )
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
 shengnan.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 bgolaszewski@baylibre.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com,
 louis.kuo@mediatek.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz, Sakari,

Thanks for the review.

On Tue, 2020-06-30 at 21:47 +0300, Sakari Ailus wrote:
> On Tue, Jun 30, 2020 at 05:07:46PM +0000, Tomasz Figa wrote:
> > Hi Dongchun,
> > 
> > On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                 |    1 +
> > >  drivers/media/i2c/Kconfig   |   13 +
> > >  drivers/media/i2c/Makefile  |    1 +
> > >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 1067 insertions(+)
> > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > 
> > Thank you for the patch. Please see my comments inline.
> > 
> > [snip]
> > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > +				   struct v4l2_subdev_pad_config *cfg)
> > > +{
> > > +	struct v4l2_subdev_format fmt = {
> > > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > 
> > As we discussed before, this function is never called with cfg == NULL.
> > Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
> > V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?
> > 
> > Sakari, would that be a proper implementation of this function?
> 
> It's fine to test fmt, but it should be only done if the driver calls the
> function with ACTIVE format. I.e. it can be removed here, and always use
> TRY.
> 

Sorry for my late coming.
The implementation of this function should be common(similar to
OV2680/OV5645).
If it needs to update to be more proper or clear, as user always sets
format.which to ACTIVE when calling set_fmt, we could only reserve the
TRY format in init_cfg like this:
struct v4l2_subdev_format fmt = {
	which = V4L2_SUBDEV_FORMAT_TRY,

> > 
> > > +		.format = {
> > > +			.width = 1600,
> > > +			.height = 1200,
> > > +		}
> > > +	};
> > > +
> > > +	ov02a10_set_fmt(sd, cfg, &fmt);
> > > +
> > > +	return 0;
> > [snip]
> > 
> > With this and Sakari's comment about the initial state of the reset pin
> > fixed, feel free to add my
> > 
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > 
> > Best regards,
> > Tomasz
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
