Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CBAC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:05:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81080206B6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 09:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BtfpKBi1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81080206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ffoc8fXelQS1FZji5o81aACWWBCaN3fN0X7fUjdjtZk=; b=BtfpKBi1ovbGKTQpI/DnVSAHx
	CrdKH9O85QpMO5ZmnQdW1CA+5okWtUGy5ONb7UCLJ0MZ0Q1SAlmV7azc9jRT4iBmks3fse6d8ItWd
	1RocpNSY2GJmEUtSyj0w0x/0BGw15Rf6yW65LmWW3TTXArJOnXoVqq8hSXQv1jSThVeF3xPlQEDQz
	4HP2Vs9ZlXQZP7+7VFhlTnajY6UkebNJr4Y5CQvusEosZKMyWJPY2KViqFTMCcTWQm0cPymW4hXBb
	JaUB4b4/9IVxNm4qpZ5jgCBqDT6LzkqdN4EgrO/kRHEaa8M+WCq/A6fd/XstPtN/Q4pfvXOcmxF9T
	Hcxd/mUBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYgM-00081d-Mm; Wed, 01 Jul 2020 09:05:30 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqYbo-0005MO-Dl; Wed, 01 Jul 2020 09:00:50 +0000
IronPort-SDR: BPu61oXEcsshC9y+sdQ6u41quNd7zCQBT9kiwdJo4BebVjuxbixKkYC6AQMxBs7+3bg3XFpOqb
 iQp57fW+YzMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="133979544"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="133979544"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:00:46 -0700
IronPort-SDR: CIaSBSHvgTLeEmOmt1MEf4rcE6RNmN/9/cAISr7Z/nOW5kSJD5SlVNWRjnEUq3UBAg2t1zIM87
 Fkc0J1NC0J7A==
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="295498778"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:00:41 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id E3B1920760; Wed,  1 Jul 2020 12:00:39 +0300 (EEST)
Date: Wed, 1 Jul 2020 12:00:39 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200701090039.GM16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630170746.GD1212092@chromium.org>
 <20200630184702.GH16711@paasikivi.fi.intel.com>
 <1593593242.17166.48.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593593242.17166.48.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_050049_003744_FF9A3E4B 
X-CRM114-Status: GOOD (  27.24  )
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
 linux-mediatek@lists.infradead.org, louis.kuo@mediatek.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 01, 2020 at 04:47:22PM +0800, Dongchun Zhu wrote:
> Hi Tomasz, Sakari,
> 
> Thanks for the review.
> 
> On Tue, 2020-06-30 at 21:47 +0300, Sakari Ailus wrote:
> > On Tue, Jun 30, 2020 at 05:07:46PM +0000, Tomasz Figa wrote:
> > > Hi Dongchun,
> > > 
> > > On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > > > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > > > 
> > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > ---
> > > >  MAINTAINERS                 |    1 +
> > > >  drivers/media/i2c/Kconfig   |   13 +
> > > >  drivers/media/i2c/Makefile  |    1 +
> > > >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> > > >  4 files changed, 1067 insertions(+)
> > > >  create mode 100644 drivers/media/i2c/ov02a10.c
> > > 
> > > Thank you for the patch. Please see my comments inline.
> > > 
> > > [snip]
> > > > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > > > +				   struct v4l2_subdev_pad_config *cfg)
> > > > +{
> > > > +	struct v4l2_subdev_format fmt = {
> > > > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> > > 
> > > As we discussed before, this function is never called with cfg == NULL.
> > > Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
> > > V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?
> > > 
> > > Sakari, would that be a proper implementation of this function?
> > 
> > It's fine to test fmt, but it should be only done if the driver calls the
> > function with ACTIVE format. I.e. it can be removed here, and always use
> > TRY.
> > 
> 
> Sorry for my late coming.
> The implementation of this function should be common(similar to
> OV2680/OV5645).
> If it needs to update to be more proper or clear, as user always sets
> format.which to ACTIVE when calling set_fmt, we could only reserve the
> TRY format in init_cfg like this:
> struct v4l2_subdev_format fmt = {
> 	which = V4L2_SUBDEV_FORMAT_TRY,

Yes, please.

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
