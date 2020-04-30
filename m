Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11ADC8300A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A583520787
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 08:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IEqlkz0K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gfi1O1nL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A583520787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yp5VgfchWwfB37ek08xQIWHHb+Sj+LnCxaMkL6xEtvc=; b=IEqlkz0K+SgRoK
	WZ2zT7CkWZyKZ5nzeA0XeeB2OyhTgPWAcPWzYclRIUZmIql4H1aYPMUCGNjHCUYxSGPkaE1ssaf3f
	HpkZ6QWctTADowg240H0Fb0o2g0BoHvD6MaypK67nJuoQ8gsTXRxPa9MnY4z4GnOtfLiADU9UEpHa
	tyf54lIY07o8+LnIA0btPFEZnK0/B0WVAiVASB3Zbm5SMIpeOWt7TVQaygZcnk1d9oYPcmrNvu6Vh
	fs5yGDTz0LH4FDTZ7VAFyOabS9yIXMQx7glFqLMgE+SefG+ObCP6quoVVsUHGOX2ZgHRkOitYZ7lV
	UrbBZyuVtkPj6B6I/3Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4uo-00039H-7p; Thu, 30 Apr 2020 08:51:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4tV-0000Ra-3m; Thu, 30 Apr 2020 08:50:11 +0000
X-UUID: 56bbe1b7c2144b25b49a3942c0b40f8a-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qEHPZ0vJ9YaDzRAN0qw3MdQ9byhSepyxaXxCWBvrE5g=; 
 b=gfi1O1nLD0z/k7SSqXn5aLDlASNVa2jqazrXSiMBWSm2XEQeEdl1nmbd/eRtrSKW8kCDgzRlk64tC4QkpcBTyJiyIDu/1D+epSsbdGihsrDXZjExysMK/1tSULoN4dqicEskW9a98ZDMWz9z8uDTrLhlRfcoIIEN7QS2JwW0hH4=;
X-UUID: 56bbe1b7c2144b25b49a3942c0b40f8a-20200430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 667662918; Thu, 30 Apr 2020 00:49:59 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 01:48:40 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Apr 2020 16:48:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Apr 2020 16:48:36 +0800
Message-ID: <1588236466.8804.92.camel@mhfsdcap03>
Subject: Re: [V4, 2/2] media: i2c: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 30 Apr 2020 16:47:46 +0800
In-Reply-To: <20200331101456.GG1922688@smile.fi.intel.com>
References: <20200330123634.363-1-dongchun.zhu@mediatek.com>
 <20200330123634.363-3-dongchun.zhu@mediatek.com>
 <20200330135751.GQ1922688@smile.fi.intel.com>
 <1585620980.5781.80.camel@mhfsdcap03>
 <20200331101456.GG1922688@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E3566C996091720B35FA9D701A04146A9F434F3E2FE424D79D363A9BF88C6DB62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_015009_244689_898EC6EF 
X-CRM114-Status: GOOD (  12.14  )
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
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com, tfiga@chromium.org,
 louis.kuo@mediatek.com, sj.huang@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Andy,

Thanks for the review.

On Tue, 2020-03-31 at 13:14 +0300, Andy Shevchenko wrote:
> On Tue, Mar 31, 2020 at 10:16:20AM +0800, Dongchun Zhu wrote:
> > On Mon, 2020-03-30 at 16:57 +0300, Andy Shevchenko wrote:
> > > On Mon, Mar 30, 2020 at 08:36:34PM +0800, Dongchun Zhu wrote:
> > > > This patch adds a V4L2 sub-device driver for DW9768 voice coil moter,
> > > > providing control to set the desired focus via I2C serial interface.
> > > 
> > > ...
> > > 
> > > > +static const struct dev_pm_ops dw9768_pm_ops = {
> > > > +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > > > +				pm_runtime_force_resume)
> > > > +	SET_RUNTIME_PM_OPS(dw9768_runtime_suspend, dw9768_runtime_resume, NULL)
> > > > +};
> > > > +
> > > > +static struct i2c_driver dw9768_i2c_driver = {
> > > > +	.driver = {
> > > > +		.name = DW9768_NAME,
> > > 
> > > > +		.pm = IS_ENABLED(CONFIG_PM) ? &dw9768_pm_ops : NULL,
> > > 
> > > What is this conditional for?
> > > 
> > 
> > For the dw9768_pm_ops, here my idea is to use an IS_ENABLED() check to
> > avoid defining the structure when CONFIG_PM is not set.
> 
> Have you looked at the implementation of SET_SYSTEM_SLEEP_OPS() and another one?
> 
> Have you tried to actually compile with !CONFIG_PM? In your case the warning
> should be issued.
> 

Understood.
Follow Sakari's advice, the condition would be dropped in next release.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
