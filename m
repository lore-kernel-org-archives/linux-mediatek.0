Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62E0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 13:38:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C7EF2070B
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 13:38:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pfZsVyou"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C7EF2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGu+04c7WpS5L1bqrS6Cwid0f5ZfoDqIMIKhCXc2JIc=; b=pfZsVyouY6lnSW
	pHuXOCVZDlGNNXTv+miseJdlThTqgcuLlGiPHogUr993tCysM//tHh2JW6Lkhj2uIjmgZ3WYZVa4U
	tr77n1OrL8Dw0pASCMdDon//kBIfYK5vwTBOu2uj60L6AwqlFCPhVXoNAsOFQXPCq75vtWuC5MtFu
	JAIGoGezmtuvu7UUDUBY08DqHKw6soXjKOjf3aAWOAMw6i9OQrorgqFfT64NYOa+DRfaSNFIS9tap
	XU/lQvDtE9UMZUY6jo3kC2ENvEiZjLi72YdaxP1p0R83mePntwEzw4E/Byhschy9NJmAbQcH6ILsq
	qTbHlLW6ARwQ5OBB59iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhCY9-0002KU-WE; Fri, 05 Jun 2020 13:38:22 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhCXj-0001sw-QG; Fri, 05 Jun 2020 13:37:57 +0000
IronPort-SDR: A4Pr9ha1bVg4jvim7c69tE4dbAFfRpj9hiWapMrGazrBQd/27un9biOmNYwnf7ocw+e60JoHea
 95nXL8bkskFw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 06:37:54 -0700
IronPort-SDR: sEuqSwtS1beAn9U/dor4KFif5mC7H1OQoHPNSGTgH1eIhuIxgbPQgzhOO1jlDprNegKarlDQyT
 nnX93WLEycyA==
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; d="scan'208";a="445895020"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2020 06:37:50 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 0C3BC205D2; Fri,  5 Jun 2020 16:37:48 +0300 (EEST)
Date: Fri, 5 Jun 2020 16:37:47 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomasz Figa <tfiga@chromium.org>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200605133747.GU16711@paasikivi.fi.intel.com>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605121459.GS16711@paasikivi.fi.intel.com>
 <20200605130212.GA6303@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200605130212.GA6303@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_063755_913579_0FC8ECDA 
X-CRM114-Status: GOOD (  16.25  )
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

On Fri, Jun 05, 2020 at 01:02:12PM +0000, Tomasz Figa wrote:
> On Fri, Jun 05, 2020 at 03:14:59PM +0300, Sakari Ailus wrote:
> > Hi Dongchun,
> > 
> > Thank you for the update.
> > 
> > On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > control to set the desired focus via IIC serial interface.
> > > 
> > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > ---
> > >  MAINTAINERS                |   1 +
> > >  drivers/media/i2c/Kconfig  |  13 ++
> > >  drivers/media/i2c/Makefile |   1 +
> > >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> > >  4 files changed, 581 insertions(+)
> > >  create mode 100644 drivers/media/i2c/dw9768.c
> [snip]
> > > +static int dw9768_runtime_suspend(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > > +
> > > +	dw9768_release(dw9768);
> > > +	regulator_bulk_disable(ARRAY_SIZE(dw9768_supply_names),
> > > +			       dw9768->supplies);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int dw9768_runtime_resume(struct device *dev)
> > 
> > __maybe_unused for this and the suspend callback.
> >
> 
> These are always used. If runtime PM is disabled, they are called
> explicitly in probe and remove.

Ah, right. Thanks for pointing that out.

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
