Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82395C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 11:03:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F36F2065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 11:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLEWi98x";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="igTHKJzI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F36F2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqqIcHSJUJ1bJ3PcfFtd4G92Lz+VtxcT5kpL5+PvnJg=; b=KLEWi98xFZKzFS
	gNms1Mw7LrcCEu8HcaAflG45aaEAZDho6JSSJmcAdKtNWIOsOWoMItQj3MuaaW4CgnHt/tMwsS+vX
	2IJHKyokUjIiRNQKlJgucsHO/yusGt2bStupgW/HY7JC/fz4i7f9+hp/9RhKdkZ23VXdt3IOtYkxd
	NG/X5QPmjtJG0xd1BIMCUpk4csxSVtIbcCEEErTGzFAxHiHour6J4//oaS2CXgWx90M411rJ4ZtL+
	sH+kgmbOLBjtnp0VP3p2T2rC5woJcYT2yHStgeYYXctZIynr0tlD6S4QHVs+IkKFUQoVA6HqtpUKn
	URt/7okOpIpvlF3VNIKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjhTT-0006Jd-KB; Fri, 12 Jun 2020 11:03:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjhTQ-0006JB-MN; Fri, 12 Jun 2020 11:03:50 +0000
X-UUID: e006689d72d84fef8f5534474b8d6ba5-20200612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qaglRPWqGP4IdwsQlkYgHrfbKPtnhQyQo7nkYFx8tsM=; 
 b=igTHKJzImv7DlxphxtOwvGwI+rkJhaHBD08sBPAe8E5+8xuU8waWuBHyekqNUp/vmoYB94egC6wYq3Cm6+kAL1RRztewkOeLwr0ZgyzqqLuv4Xn14gDtxXtK6O6ZJUHQ8K+JQqftMcg3HW8FxxPDJOKZBCYGH1u04a4lJsLakjI=;
X-UUID: e006689d72d84fef8f5534474b8d6ba5-20200612
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1866389502; Fri, 12 Jun 2020 03:03:35 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Jun 2020 04:03:42 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 12 Jun 2020 19:03:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Jun 2020 19:03:38 +0800
Message-ID: <1591959682.8804.665.camel@mhfsdcap03>
Subject: Re: [V9, 2/2] media: i2c: ov02a10: Add OV02A10 image sensor driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 12 Jun 2020 19:01:22 +0800
In-Reply-To: <20200611100322.GL16711@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-3-dongchun.zhu@mediatek.com>
 <20200610194455.GK201868@chromium.org>
 <20200611095333.GK16711@paasikivi.fi.intel.com>
 <CAAFQd5BBxBEs=gCohOzOGzkTDNkL1yyu7dtEY26K52=CmFAWnA@mail.gmail.com>
 <20200611100322.GL16711@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9664EE831528CD8C24C98DDB589FA69B119B312FFEA3696E45D9240344133E872000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_040348_740968_BCD310EA 
X-CRM114-Status: GOOD (  30.63  )
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
Cc: Mark
 Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Shengnan
 Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongchun.zhu@mediatek.com, Louis Kuo <louis.kuo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Thu, 2020-06-11 at 13:03 +0300, Sakari Ailus wrote:
> On Thu, Jun 11, 2020 at 11:57:43AM +0200, Tomasz Figa wrote:
> > On Thu, Jun 11, 2020 at 11:53 AM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Tomasz,
> > >
> > > On Wed, Jun 10, 2020 at 07:44:55PM +0000, Tomasz Figa wrote:
> > > > Hi Dongchun,
> > > >
> > > > On Sat, May 23, 2020 at 04:41:03PM +0800, Dongchun Zhu wrote:
> > > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > >
> > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > ---
> > > > >  MAINTAINERS                 |    1 +
> > > > >  drivers/media/i2c/Kconfig   |   13 +
> > > > >  drivers/media/i2c/Makefile  |    1 +
> > > > >  drivers/media/i2c/ov02a10.c | 1025 +++++++++++++++++++++++++++++++++++++++++++
> > > > >  4 files changed, 1040 insertions(+)
> > > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > > >
> > > >
> > > > Thank you for the patch. Please see my comments inline.
> > > >
> > > > [snip]
> > > > > diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
> > > > > new file mode 100644
> > > > > index 0000000..160a0b5
> > > > > --- /dev/null
> > > > > +++ b/drivers/media/i2c/ov02a10.c
> > > > [snip]
> > > > > +static const char * const ov02a10_test_pattern_menu[] = {
> > > > > +   "Disabled",
> > > > > +   "Color Bar",
> > > >
> > > > nit: We should normalize this to one of the standard names. What is the
> > > > pattern on this sensor? Is it perhaps "Eight Vertical Colour Bars"?
> > > >
> > > > > +};
> > > > [snip]
> > > > > +static int ov02a10_set_fmt(struct v4l2_subdev *sd,
> > > > > +                      struct v4l2_subdev_pad_config *cfg,
> > > > > +                      struct v4l2_subdev_format *fmt)
> > > > > +{
> > > > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > > +
> > > > > +   mutex_lock(&ov02a10->mutex);
> > > > > +
> > > >
> > > >
> > > > Don't we need to handle the case when fmt->which is V4L2_SUBDEV_FORMAT_TRY,
> > > > which is used for trying the format, but not applying it to the hardware?
> > >
> > > Yes.
> > >
> > > >
> > > > > +   if (ov02a10->streaming) {
> > > > > +           mutex_unlock(&ov02a10->mutex);
> > > > > +           return -EBUSY;
> > > > > +   }
> > > > > +
> > > > > +   /* Only one sensor mode supported */
> > > > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > > +   ov02a10->fmt = fmt->format;
> > > > > +
> > > > > +   mutex_unlock(&ov02a10->mutex);
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static int ov02a10_get_fmt(struct v4l2_subdev *sd,
> > > > > +                      struct v4l2_subdev_pad_config *cfg,
> > > > > +                      struct v4l2_subdev_format *fmt)
> > > > > +{
> > > > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +   struct v4l2_mbus_framefmt *mbus_fmt = &fmt->format;
> > > > > +
> > > > > +   mutex_lock(&ov02a10->mutex);
> > > > > +
> > > > > +   fmt->format = ov02a10->fmt;
> > > >
> > > > Ditto.
> > > >
> > > > > +   mbus_fmt->code = ov02a10->fmt.code;
> > > > > +   ov02a10_fill_fmt(ov02a10->cur_mode, mbus_fmt);
> > > > > +
> > > > > +   mutex_unlock(&ov02a10->mutex);
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > > > +static int ov02a10_enum_mbus_code(struct v4l2_subdev *sd,
> > > > > +                             struct v4l2_subdev_pad_config *cfg,
> > > > > +                             struct v4l2_subdev_mbus_code_enum *code)
> > > > > +{
> > > > > +   struct ov02a10 *ov02a10 = to_ov02a10(sd);
> > > > > +
> > > > > +   if (code->index >= ARRAY_SIZE(supported_modes))
> > > > > +           return -EINVAL;
> > > >
> > > > Hmm, supported_modes[] doesn't seem to hold the information about mbus
> > > > codes. Should this just perhaps be "!= 0"?
> > > >
> > > > > +
> > > > > +   code->code = ov02a10->fmt.code;
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > [snip]
> > > > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > > > +                              struct v4l2_subdev_pad_config *cfg)
> > > > > +{
> > > > > +   struct v4l2_subdev_format fmt = {
> > > > > +           .which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > > > +           .format = {
> > > > > +                   .width = 1600,
> > > > > +                   .height = 1200,
> > > > > +           }
> > > > > +   };
> > > > > +
> > > > > +   ov02a10_set_fmt(sd, cfg, &fmt);
> > > > > +
> > > > > +   return 0;
> > > > > +}
> > > > > +
> > > >
> > > > I'm not familiar with this init_cfg operation and the documentation is very
> > > > sparse about it. Sakari, is this a correct implementation?
> > >
> > > The purpose is to initialise a pad configuration (format and selection
> > > rectangles) to the device defaults. As there seem to be no selection
> > > rectangles, this seems fine to me.
> > 
> > Thanks. I traced the code and could only see one place where the
> > callback is being called and that was with cfg != NULL. Still, the
> > code above uses "cfg ?" as a check to determine whether TRY or ACTIVE
> > should be passed to which. Is that also correct?
> 
> It could be used in setting the active format in probe. That would probably
> be cleaner than what it currently does.
> 

Sakari, did you mean that we need to update _probe API?
Like this:
struct v4l2_subdev_format fmt = {
	.which = V4L2_SUBDEV_FORMAT_ACTIVE,
};

> But apart from that, the framework always calls init_cfg with cfg non-NULL.
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
