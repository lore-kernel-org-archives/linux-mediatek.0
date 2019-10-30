Return-Path: <SRS0=ckAq=YX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9328DCA9EAF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2019 09:09:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6248A2083E
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Oct 2019 09:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfK0oRy+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6248A2083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mq6n+Riht3Yfz75gQzxp/CucWow4DPvs4J0VDO2pQY=; b=lfK0oRy+erjQO9
	qSzV+KAzgm1AijNMNekwYSkIxv2Zr97LbwC4Sxjd9qm8RBW9qMo7CNVgyPHNAYp4O0h1YGkB9lb6J
	kJHLPU1b3/hlCQgQn0yNFyrN9Zd+0yHQ+gm7+WuKhO2dkThV3bxmeQid9YOJLz0uruZbpgZWBMN2G
	a5HQce8N+TBaJ5yYufzgmK3ee7B8/83TGPgozwoGiKih0eaLh3QbFz+2p/Q9WazpxhulTsluPgupz
	83Ll6DZx6bd2DXIMpyXhYGxkWAb48qcy4MfvMJhp3oaLqOZCiq3/VsJTB8QCa/3sUHemAhYLAdXnI
	oGmkHrC9zSE0fgMF1yDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iPjyU-0007rd-12; Wed, 30 Oct 2019 09:09:06 +0000
Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iPjyE-0007cU-2d; Wed, 30 Oct 2019 09:08:51 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 02:08:49 -0700
X-IronPort-AV: E=Sophos;i="5.68,246,1569308400"; d="scan'208";a="401441344"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Oct 2019 02:08:45 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 97D7A208A0; Wed, 30 Oct 2019 11:08:43 +0200 (EET)
Date: Wed, 30 Oct 2019 11:08:43 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V2, 1/2] media: dt-bindings: media: i2c: Add bindings for ov8856
Message-ID: <20191030090843.GG10211@paasikivi.fi.intel.com>
References: <20190910130446.26413-1-dongchun.zhu@mediatek.com>
 <20190910130446.26413-2-dongchun.zhu@mediatek.com>
 <20190910173743.GI2680@smile.fi.intel.com>
 <20190917120205.GO5781@paasikivi.fi.intel.com>
 <20190917144412.GA23952@bogus>
 <1572426023.21623.257.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572426023.21623.257.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_020850_131396_F7695402 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: mark.rutland@arm.com, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 shengnan.wang@mediatek.com, tfiga@chromium.org, louis.kuo@mediatek.com,
 sj.huang@mediatek.com, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 bingbu.cao@intel.com, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dongchun,

On Wed, Oct 30, 2019 at 05:00:23PM +0800, Dongchun Zhu wrote:
> Hi Rob,
> 
> On Tue, 2019-09-17 at 09:44 -0500, Rob Herring wrote:
> > On Tue, Sep 17, 2019 at 03:02:06PM +0300, Sakari Ailus wrote:
> > > On Tue, Sep 10, 2019 at 08:37:43PM +0300, Andy Shevchenko wrote:
> > > > On Tue, Sep 10, 2019 at 09:04:45PM +0800, dongchun.zhu@mediatek.com wrote:
> > > > > From: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > 
> > > > > This patch adds device tree bindings documentation for the ov8856 CMOS
> > > > > image sensor.
> > > > 
> > > > New bindings in YAML, please.
> > > 
> > > My understanding is text documents are still fine.
> > 
> > Schema are preferred, but still up to the subsystem for now.
> >  
> 
> It seems that there are no bindings in YAML under the path:
> Documentation/devicetree/bindings/media/i2c.
> So we would keep the text documents for OV8856.

That is going to change very soon with the addition of IMX296 bindings:

<URL:https://lore.kernel.org/linux-media/20191029220928.GA17996@bogus/T/#mdd27731659215b1e35049892ef82bb6b62e80b61>

-- 
Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
