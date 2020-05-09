Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29178C38A2A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:25:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F11BB2192A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3HUyDG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NkcZRKPV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F11BB2192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nS+sg3koNs9nqMzCFeRgsO/TbJktMyxOarttcBcym6M=; b=b3HUyDG3PFh+J3
	nZtIPucheUf05K4IxQ8QGnytd1tTVJ7ujNQ0U0qayx3SvCHmFxTOtbzTFFIAL0fBMBKg7eLSQX9Yh
	YppE2PuGUJenWEaQKr6d0nHW6vRtY/tOTvrBwDLZ6H8phWXvv244MSMXGlfkEThExwzNnTQWJ0ZX8
	LlB/hlYcPLMRFSWzvgQB3qrfAni+kY2x6lfdW5P+Fsuw7WIlF7PwYqiq3AKU54jxWrcqLTt+AtWZb
	sFcacgdphEH1UHFzSifk/eLwxa359mMCtyNMdTUpqgMd2RFLatE4iSKSIXdWeZDBa7xGGEepPTxdt
	BT3kAF84gdWORCjKBZjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXFAv-0005MP-UT; Sat, 09 May 2020 02:25:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXFAt-0004Qn-1b; Sat, 09 May 2020 02:25:12 +0000
X-UUID: 61cddcb16d8e41fa804a7288033bdb47-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e29juNg1HoLgK0xyBynVp9fscLLhjBSGEnzupie2VT4=; 
 b=NkcZRKPVYkJ6bdNeSqpOoZEUs000+iow4MNA41ijaDVmFM7jMcHlZzqptQRUd2/0ZJj5QpSrwnXEsSDsmYuYevGpmL9caaucVE1JzTdINTfT3eFkbcMHtVkp6V20cUt8V9Mr54pHYgY+2df6bRQp34Stp5v5C/3THSJZgpSQ+T4=;
X-UUID: 61cddcb16d8e41fa804a7288033bdb47-20200508
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1493148401; Fri, 08 May 2020 18:25:02 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 19:25:03 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 9 May 2020 10:24:55 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 10:24:54 +0800
Message-ID: <1588991026.8804.235.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Sat, 9 May 2020 10:23:46 +0800
In-Reply-To: <20200508211319.GJ9190@paasikivi.fi.intel.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03>
 <20200508211319.GJ9190@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3BBB81766EA864AEE615CDE2A4B27D9C91784377AC6494691DAE4A17F0C047FD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_192511_107857_7634E07D 
X-CRM114-Status: GOOD (  26.74  )
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
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Sat, 2020-05-09 at 00:13 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> > Hi Sakari, Tomasz,
> > 
> > Thanks for the review.
> > 
> > On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > > Hi Sakari, Dongchun,
> > > 
> > > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > HI Dongchun,
> > > >
> > > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > > Hi Sakari,
> > > > >
> > > > > Thanks for the review.
> > > > >
> > > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > > Hi Dongchun,
> > > > > >
> > > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > > control to set the desired focus via IIC serial interface.
> > > > > > >
> > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > ---
> > > > > > >  MAINTAINERS                |   1 +
> > > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > >  4 files changed, 453 insertions(+)
> > > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > > >
> > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > index 8d72c41..c92dc99 100644
> > > > > > > --- a/MAINTAINERS
> > > > > > > +++ b/MAINTAINERS
> > > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > > >  S:       Maintained
> > > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > > >
> > > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > index 125d596..6a3f9da 100644
> > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > > >     capability. This is designed for linear control of
> > > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > > >
> > > > > > > +config VIDEO_DW9768
> > > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > >
> > > > > > Please check how this works in the media tree master branch now --- it's
> > > > > > largely select based.
> > > > > >
> > > > >
> > > > > The actuator driver uses some structures that require the
> > > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > > dependency to avoid possible build error when it's not enabled.
> > > >
> > > > Please make sure this works with current media tree master. Right now it
> > > > does not.
> > > >
> > > 
> > > Dongchun, as Sakari said, please make sure to base the patches on the
> > > master branch of the media tree.
> > > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > > dependency selection there seems to have changed recently.
> > > 
> > 
> > I searched the patches on the media tree master branch.
> > It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> > Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> > v4l2-subdev code.
> > The change mainly is to make build pass, and don't return ENOTTY if
> > SUBDEV_API is not set.
> > Am I right?
> 
> Please see Kconfig entries for other similar drivers from Dongwoon.
> 

Sorry for the mistake :-)
Just found the current media tree master branch code...
I would update Kconfig entries in next release by referring to:
https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/Kconfig

...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
