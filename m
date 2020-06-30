Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCF8C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 18:47:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB6082068F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 18:47:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CEWnRbX2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB6082068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aldg73cjSo0DJdQwUygBthdU91VFNRHxbPUqO+qyAnw=; b=CEWnRbX2sd6Sj2qGQ+Oad28MY
	ih678TM2EDh3PrfyUVIFs7q8N1ey3nAzSOnnVO0qIBguh7nggUqAzTXOV3GnvSAwoxBfffFDZ2HzC
	YPdI9dgoIdbugORug0UeJ3f1TQHDaYMMNYVdMK7Xh9Y/jsqyAv+BdEuTFEy7LPsBi+Jsgso0ro6qi
	09SHk/DZUfQo/ibk5OA3MfhdY9szwmqrZVlPvFPz/tr0bWYFh278vwTQqi7YoeD5QmzITIoR/iCGW
	NFGU/yMUYzuO+Aey5CQjL9REoxC//UvdL7NyHa5JUztS1PgMmtrFfRqmZgkaDZ5h8DJeU4jny00Aa
	jXk8+Jw1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqLI3-0005mn-E6; Tue, 30 Jun 2020 18:47:31 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqLHz-0005lo-4J; Tue, 30 Jun 2020 18:47:27 +0000
IronPort-SDR: k//TeBo9HuqcOQiMLHUKR0VpNcVtVfGpl7mu8Lou/v4zirQNALl7+DepgsSrZrkznqO2juDfrZ
 e5jJ4laZETZg==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="146355443"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="146355443"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 11:47:25 -0700
IronPort-SDR: rwVGtmfbR0pwoeXCRYv2ynGhpocdPidy3VhMUffP6vE5ltM9z9q9Ro5H3oFtn6JmunWuAzBog5
 RkAH5/3FZT7A==
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="481025031"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 11:47:21 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 1B272207F6; Tue, 30 Jun 2020 21:47:03 +0300 (EEST)
Date: Tue, 30 Jun 2020 21:47:03 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
Message-ID: <20200630184702.GH16711@paasikivi.fi.intel.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630170746.GD1212092@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630170746.GD1212092@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_144727_298696_576895CC 
X-CRM114-Status: GOOD (  21.45  )
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
 shengnan.wang@mediatek.com, bgolaszewski@baylibre.com, sj.huang@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 Dongchun Zhu <dongchun.zhu@mediatek.com>, louis.kuo@mediatek.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 05:07:46PM +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Tue, Jun 30, 2020 at 10:49:42AM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for OV02A10 image sensor.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                 |    1 +
> >  drivers/media/i2c/Kconfig   |   13 +
> >  drivers/media/i2c/Makefile  |    1 +
> >  drivers/media/i2c/ov02a10.c | 1052 +++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 1067 insertions(+)
> >  create mode 100644 drivers/media/i2c/ov02a10.c
> 
> Thank you for the patch. Please see my comments inline.
> 
> [snip]
> > +static int ov02a10_entity_init_cfg(struct v4l2_subdev *sd,
> > +				   struct v4l2_subdev_pad_config *cfg)
> > +{
> > +	struct v4l2_subdev_format fmt = {
> > +		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY : V4L2_SUBDEV_FORMAT_ACTIVE,
> 
> As we discussed before, this function is never called with cfg == NULL.
> Perhaps what we need here is to call ov02a10_set_fmt() twice, once for
> V4L2_SUBDEV_FORMAT_ACTIVE and then for V4L2_SUBDEV_FORMAT_TRY?
> 
> Sakari, would that be a proper implementation of this function?

It's fine to test fmt, but it should be only done if the driver calls the
function with ACTIVE format. I.e. it can be removed here, and always use
TRY.

> 
> > +		.format = {
> > +			.width = 1600,
> > +			.height = 1200,
> > +		}
> > +	};
> > +
> > +	ov02a10_set_fmt(sd, cfg, &fmt);
> > +
> > +	return 0;
> [snip]
> 
> With this and Sakari's comment about the initial state of the reset pin
> fixed, feel free to add my
> 
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> 
> Best regards,
> Tomasz

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
