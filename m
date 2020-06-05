Return-Path: <SRS0=fggR=7S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEB1C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 03:31:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9E6207D5
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2020 03:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VUEITaRp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="L5uQgRV2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC9E6207D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8s/fRjdb5+2nuY3F6ODjAHOnzOP8uKl/uCDpPQmOlw=; b=VUEITaRpO7CljV
	TiBNkTUK/Mki4VxFPG2vdn9Nj+qjp3FrshYKN100XiYNr/JkIwCALQZViQwvL1xbxd6NRjzQpvk5l
	hMITFT4JB12ZMkhYTqQ/ZMkCFPJZs/1DTDwYE171Hcb1qmooahv5v82JKkvSyoh+bHctMwy3uVHd9
	Ea7xyPAHhDVS66747sVYwrSHrH5HNdsRMVc9T/bQ9yL3uYrxY3HohRTrUlaw4rTni9h8cM/caoS2H
	N64MChofhx4Ns2QNKXlbroHSs84KK2Q9TyiaJk0c+zO381UwR5nfbLud6W8WUEyMjZZH+EMgj2TzX
	bxD4W914nLV6wj24pUEw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jh34p-0005mW-1Y; Fri, 05 Jun 2020 03:31:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jh34m-0005j1-Ha; Fri, 05 Jun 2020 03:31:26 +0000
X-UUID: 1dd8fcf38c0f40d184364e7f8f57d9fe-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=04uARMuEAI3fSF9KF2DXT7abIE8uC44WP1+LksONuRI=; 
 b=L5uQgRV2jIIsDI24KPEDQTvY5sBQGr+6qdFuD9sz8z3q8A00W/vuBJWQ3S9moALtXme6zE4ZFcV+RnNyjSuhulhLAZZ/BroZlCF8+fU2I9Cngfa5/Um148SazwgHFN1YfYZ/D8OKBtzHRZqPll1c9zILJc+7vWMvCXAg1Fd9CSI=;
X-UUID: 1dd8fcf38c0f40d184364e7f8f57d9fe-20200604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 182426181; Thu, 04 Jun 2020 19:31:14 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 20:31:02 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 5 Jun 2020 11:30:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 5 Jun 2020 11:30:57 +0800
Message-ID: <1591327734.8804.564.camel@mhfsdcap03>
Subject: Re: [V6, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Fri, 5 Jun 2020 11:28:54 +0800
In-Reply-To: <20200604081032.GG16711@paasikivi.fi.intel.com>
References: <20200518132731.20855-1-dongchun.zhu@mediatek.com>
 <20200518132731.20855-3-dongchun.zhu@mediatek.com>
 <20200521195113.GC14214@chromium.org>
 <1590139561.8804.390.camel@mhfsdcap03>
 <CAAFQd5CCsT_oM9aij_imV+NABzByi94RmCj97Dx0Tk3S0WDsTg@mail.gmail.com>
 <1590570089.8804.453.camel@mhfsdcap03>
 <CAAFQd5Dgboh8om68546ADELX3g-0y40rdBxY+H3WsX5xAD1_FQ@mail.gmail.com>
 <1591238018.8804.555.camel@mhfsdcap03>
 <20200604081032.GG16711@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D090CB165FCCEF44021FC7838239E93BBCC7EC861B9949712203DF71BC628EC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_203124_602709_313493B6 
X-CRM114-Status: GOOD (  19.75  )
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

On Thu, 2020-06-04 at 11:10 +0300, Sakari Ailus wrote:
> On Thu, Jun 04, 2020 at 10:33:38AM +0800, Dongchun Zhu wrote:
> > Hi Tomasz,
> > 
> > On Mon, 2020-06-01 at 20:47 +0200, Tomasz Figa wrote:
> > > On Wed, May 27, 2020 at 11:03 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > >
> > > > Hi Tomasz,
> > > >
> > > > On Mon, 2020-05-25 at 13:45 +0200, Tomasz Figa wrote:
> > > > > On Fri, May 22, 2020 at 11:27 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> > > > > >
> > > > > > Hi Tomasz,
> > > > > >
> > > > > > Thanks for the review. My replies are as below.
> > > > > >
> > > > > > On Thu, 2020-05-21 at 19:51 +0000, Tomasz Figa wrote:
> > > > > > > Hi Dongchun, Sakari,
> > > > > > >
> > > > > > > On Mon, May 18, 2020 at 09:27:31PM +0800, Dongchun Zhu wrote:
> > > > > [snip]
> > > > > > > > +   pm_runtime_enable(dev);
> > > > > > > > +   if (!pm_runtime_enabled(dev)) {
> > > > > > > > +           ret = dw9768_runtime_resume(dev);
> > > > > > > > +           if (ret < 0) {
> > > > > > > > +                   dev_err(dev, "failed to power on: %d\n", ret);
> > > > > > > > +                   goto entity_cleanup;
> > > > > > > > +           }
> > > > > > > > +   }
> > > > > > > > +
> > > > > > > > +   ret = v4l2_async_register_subdev(&dw9768->sd);
> > > > > > > > +   if (ret < 0)
> > > > > > > > +           goto entity_cleanup;
> > > > > > > > +
> > > > > > > > +   return 0;
> > > > > > > > +
> > > > > > > > +entity_cleanup:
> > > > > > >
> > > > > > > Need to power off if the code above powered on.
> > > > > > >
> > > > > >
> > > > > > Thanks for the reminder.
> > > > > > If there is something wrong with runtime PM, actuator is to be powered
> > > > > > on via dw9768_runtime_resume() API.
> > > > > > When actuator sub-device is powered on completely and async registered
> > > > > > successfully, we shall power off it afterwards.
> > > > > >
> > > > >
> > > > > The code above calls dw9768_runtime_resume() if
> > > > > !pm_runtime_enabled(dev), but the clean-up code below the
> > > > > entity_cleanup label doesn't have the corresponding
> > > > > dw9768_runtime_suspend() call.
> > > > >
> > > >
> > > > Did you mean the 'entity_cleanup' after v4l2_async_register_subdev()?
> > > 
> > > Yes.
> > > 
> > > > Actually I made some changes for OV02A V9, according to this comment.
> > > > Could you help review that change? Thanks.
> > > 
> > > Sure, I will take a look.
> > > 
> > 
> > Thanks.
> > Sorry, I just wanna make sure the change is okay for next release.
> > May we use the check like OV02A V9 did?
> > ret = v4l2_async_register_subdev(&dw9768->sd);
> > if (ret < 0) {
> > 	if (!pm_runtime_enabled(dev))
> > 		dw9768_runtime_suspend(dev);
> 
> Please do this part where you're jumping to, if possible.
> 

Fine.
Fixed in next release.

> > 	goto entity_cleanup;
> > }
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
