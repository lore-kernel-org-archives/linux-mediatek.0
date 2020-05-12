Return-Path: <SRS0=Mjju=62=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCEDC54E8B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 03:43:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 066502068D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 May 2020 03:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcrPVZxO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YoNoqwv/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 066502068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xoPTeTNBeI1xq5shWxVt8th/FehYgj3bJ9JPLUmcvHQ=; b=RcrPVZxOaElxkb
	rstvOozp0Kt/83stXI70dLnPcD7kv8GyqM4sKzfGDwUujq3eENdaOfZI6+HS/CoONxDuUVdWpdDzz
	NGaNawoKb9CHdoxYOfpAnJ5X0bUgD2XBB/mmkq3YCGpMCKWRpfs6bZsyTqqJ0cf1XKWUH69sy4n/2
	N34wqADCPBWWsKmFr+XQznHMPTqiEY21ulvtop8Z9I1kpaGrrZyg/GO3biHGvq2FkDckJhiVEZbMw
	ul03jEiP3kJD8nfCFkcMymnbpn2VDkM1NaxKs0cK7BgqZFsKYHDIh2beazoB+k8pBN1JN5veqRCWI
	ecLXOY2eVcDR0YyLOb7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYLou-0005oY-3l; Tue, 12 May 2020 03:43:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYLop-0005nh-RG; Tue, 12 May 2020 03:43:02 +0000
X-UUID: 39ec0487233e40f697d9d9a33aa514fb-20200511
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gzRrirgWI6RFHcvKQwsR25zvfvdlxabazbvPiYB63TY=; 
 b=YoNoqwv/g1QhmEL3TLi2w4GEMQT/sWRjkxCQcxiBY0imVB2Yjv6EFxPs8MzNlKzmrXjLV+MQRBEZM2cv0El5G7wEPtKzOa0fExCLbV8KKcZuWUVF2XmPTT7o7XedcqXsepGsZmHFmwMU3DtmtY/NdlgNNtWt+Sy2hXGshnF0bp4=;
X-UUID: 39ec0487233e40f697d9d9a33aa514fb-20200511
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 781838054; Mon, 11 May 2020 19:42:56 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 May 2020 20:34:42 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 May 2020 11:34:38 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 May 2020 11:34:37 +0800
Message-ID: <1589254403.8804.306.camel@mhfsdcap03>
Subject: Re: [V5, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 12 May 2020 11:33:23 +0800
In-Reply-To: <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
References: <20200502161727.30463-1-dongchun.zhu@mediatek.com>
 <20200502161727.30463-3-dongchun.zhu@mediatek.com>
 <20200506151352.GZ9190@paasikivi.fi.intel.com>
 <1588855524.8804.168.camel@mhfsdcap03>
 <20200507131220.GC9190@paasikivi.fi.intel.com>
 <CAAFQd5DO9FGx9OF2RpcSprg0oLiVuS90w2qLAHCOSc3w6tKUWw@mail.gmail.com>
 <1588907288.8804.188.camel@mhfsdcap03>
 <20200508211319.GJ9190@paasikivi.fi.intel.com>
 <1588991026.8804.235.camel@mhfsdcap03>
 <CAAFQd5DZBEUJUq65WT7i_QjAtgxjhxmfdsjQoyG2UZy8zBih+A@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DA68AA50845AF29D2688D88BB4FD0C4D483C870F8F7DCE4E80D492F383CA908E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_204259_886862_755CD74F 
X-CRM114-Status: GOOD (  39.11  )
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
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, "list@263.net:IOMMU DRIVERS
 <iommu@lists.linux-foundation.org>, Joerg  Roedel <joro@8bytes.org>,
 " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

On Mon, 2020-05-11 at 20:20 +0200, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Sat, May 9, 2020 at 4:25 AM Dongchun Zhu <dongchun.zhu@mediatek.com> wrote:
> >
> > Hi Sakari,
> >
> > On Sat, 2020-05-09 at 00:13 +0300, Sakari Ailus wrote:
> > > Hi Dongchun,
> > >
> > > On Fri, May 08, 2020 at 11:08:08AM +0800, Dongchun Zhu wrote:
> > > > Hi Sakari, Tomasz,
> > > >
> > > > Thanks for the review.
> > > >
> > > > On Thu, 2020-05-07 at 15:46 +0200, Tomasz Figa wrote:
> > > > > Hi Sakari, Dongchun,
> > > > >
> > > > > On Thu, May 7, 2020 at 3:12 PM Sakari Ailus
> > > > > <sakari.ailus@linux.intel.com> wrote:
> > > > > >
> > > > > > HI Dongchun,
> > > > > >
> > > > > > On Thu, May 07, 2020 at 08:45:24PM +0800, Dongchun Zhu wrote:
> > > > > > > Hi Sakari,
> > > > > > >
> > > > > > > Thanks for the review.
> > > > > > >
> > > > > > > On Wed, 2020-05-06 at 18:13 +0300, Sakari Ailus wrote:
> > > > > > > > Hi Dongchun,
> > > > > > > >
> > > > > > > > On Sun, May 03, 2020 at 12:17:27AM +0800, Dongchun Zhu wrote:
> > > > > > > > > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > > > > > > > > control to set the desired focus via IIC serial interface.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > > > > > > > ---
> > > > > > > > >  MAINTAINERS                |   1 +
> > > > > > > > >  drivers/media/i2c/Kconfig  |  11 ++
> > > > > > > > >  drivers/media/i2c/Makefile |   1 +
> > > > > > > > >  drivers/media/i2c/dw9768.c | 440 +++++++++++++++++++++++++++++++++++++++++++++
> > > > > > > > >  4 files changed, 453 insertions(+)
> > > > > > > > >  create mode 100644 drivers/media/i2c/dw9768.c
> > > > > > > > >
> > > > > > > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > > > > > > index 8d72c41..c92dc99 100644
> > > > > > > > > --- a/MAINTAINERS
> > > > > > > > > +++ b/MAINTAINERS
> > > > > > > > > @@ -5157,6 +5157,7 @@ L:  linux-media@vger.kernel.org
> > > > > > > > >  S:       Maintained
> > > > > > > > >  T:       git git://linuxtv.org/media_tree.git
> > > > > > > > >  F:       Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > > > > > > > > +F:       drivers/media/i2c/dw9768.c
> > > > > > > > >
> > > > > > > > >  DONGWOON DW9807 LENS VOICE COIL DRIVER
> > > > > > > > >  M:       Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > > > > > > > index 125d596..6a3f9da 100644
> > > > > > > > > --- a/drivers/media/i2c/Kconfig
> > > > > > > > > +++ b/drivers/media/i2c/Kconfig
> > > > > > > > > @@ -1040,6 +1040,17 @@ config VIDEO_DW9714
> > > > > > > > >     capability. This is designed for linear control of
> > > > > > > > >     voice coil motors, controlled via I2C serial interface.
> > > > > > > > >
> > > > > > > > > +config VIDEO_DW9768
> > > > > > > > > + tristate "DW9768 lens voice coil support"
> > > > > > > > > + depends on I2C && VIDEO_V4L2 && MEDIA_CONTROLLER
> > > > > > > > > + depends on VIDEO_V4L2_SUBDEV_API
> > > > > > > >
> > > > > > > > Please check how this works in the media tree master branch now --- it's
> > > > > > > > largely select based.
> > > > > > > >
> > > > > > >
> > > > > > > The actuator driver uses some structures that require the
> > > > > > > VIDEO_V4L2_SUBDEV_API code, so here we add VIDEO_V4L2_SUBDEV_API
> > > > > > > dependency to avoid possible build error when it's not enabled.
> > > > > >
> > > > > > Please make sure this works with current media tree master. Right now it
> > > > > > does not.
> > > > > >
> > > > >
> > > > > Dongchun, as Sakari said, please make sure to base the patches on the
> > > > > master branch of the media tree.
> > > > > (https://git.linuxtv.org/media_tree.git/). The approach for Kconfig
> > > > > dependency selection there seems to have changed recently.
> > > > >
> > > >
> > > > I searched the patches on the media tree master branch.
> > > > It seems that we need to remove the VIDEO_V4L2_SUBDEV_API dependency in
> > > > Kconfig, and add #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API to include
> > > > v4l2-subdev code.
> > > > The change mainly is to make build pass, and don't return ENOTTY if
> > > > SUBDEV_API is not set.
> > > > Am I right?
> > >
> > > Please see Kconfig entries for other similar drivers from Dongwoon.
> > >
> >
> > Sorry for the mistake :-)
> > Just found the current media tree master branch code...
> > I would update Kconfig entries in next release by referring to:
> > https://git.linuxtv.org/media_tree.git/tree/drivers/media/i2c/Kconfig
> 
> Sorry for last minute comments again. We had a short discussion
> offline with Sakari and we think there are some changes needed to this
> driver, namely:
> 
> 1) The hardware being driven in our case is a gt9769, which could be
> compatible with dw9768, but it's still a different implementation and
> could have slightly different characteristics. Thus we think the
> driver name and compatible strings should be renamed from
> dongwoon,dw9768 to giantec,gt9769. In the future, if there is a device
> with exactly a dw9768 chip, the same driver could be reused by adding
> a dongwoon,dw9768 compatible string.
> 
> 2) The chip has some default configuration, which is lost because the
> driver overrides it with its own values. For use cases where one would
> want to keep the default values, we should make it possible to prevent
> the driver from overriding them. We could achieve this by adding
> optional DT properties for the custom parameters and if they are not
> present, defaults would be used.
> 
> Do you think that is doable? Thanks!
> 
> Best regards,
> Tomasz

For the renaming, I cannot agree with you more.
I would try to adjust it in next release.

For actuator driver, it seems our initial idea is that driver registers
should always use the default or reserved values.
Indeed, nowadays lens drivers on the community don't have such
configuration registers.
Albeit I don't quite sure whether it is reasonable for this summary.

As you discussed, for the current kernel, it would be nice to keep the
same with the traditional style.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
