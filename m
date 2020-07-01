Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F04C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 07:59:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E432073E
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 07:59:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfPYzybN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hVLKW+fC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E432073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jhAvJaQyy7AFAYzSaVCQhYncaabhhB4oOkcnP7Y4bZc=; b=PfPYzybN7VfOKojbkGBkwQFSq
	fsV/W1MWenLiN3Bf7WMMN/W9Il+RhR6gc34Zzo4xsNVe66xCp+DNrbojlRyu66KTvUYak/2hfsQAM
	41tqKviJ1JKnDh4vj8GSGQqeoZzPFkZgGRKfWF2LJ3KoJB+Z1vy5boqVu9S1iHh0ffOadmFkzHvWn
	v/Thzej11hjwNlIaLfjEKIev3dGqe7S8wq3vwlZPq7N8j3YJBAO8cGzbRXhkIwp9Q42PcI9FiGwzz
	06e5HUgt4ywvLJcdA0qPqNhtEVKa050BnEfMio+dV4YUxISqQXxiMj0912IAY27GXuMzNiZSQ8ZG3
	ysT+Rj7nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXeK-0005Fa-Bg; Wed, 01 Jul 2020 07:59:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXeG-0005Dm-V6; Wed, 01 Jul 2020 07:59:18 +0000
X-UUID: a4c873eb83fd4097a4844c2d545f6e21-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3gRfBix7JRQ6WuG18aqDYF+havpIPRvkgdziQJ/XMHU=; 
 b=hVLKW+fCyLF2nWvvCtLLBF9slJPyX1HaRGHaoeGWdV3NR9pM4Yp+Hl2WUvqTkj/9sFz4M+SgFcSSPTPzfoqmftk3M1WiIQX+pNFWb5MphuSEf86DNgSFY+lWoB49D0e6s58UG9HbqYEMv32DSjuQvh1+J2wKhEQ9WQNCjVpfIlc=;
X-UUID: a4c873eb83fd4097a4844c2d545f6e21-20200630
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1227687794; Tue, 30 Jun 2020 23:59:15 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 00:59:08 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Jul 2020 15:59:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 15:59:05 +0800
Message-ID: <1593590324.17166.30.camel@mhfsdcap03>
Subject: Re: [PATCH V11 2/2] media: i2c: ov02a10: Add OV02A10 image sensor
 driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 1 Jul 2020 15:58:44 +0800
In-Reply-To: <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
References: <20200630024942.20891-1-dongchun.zhu@mediatek.com>
 <20200630024942.20891-3-dongchun.zhu@mediatek.com>
 <20200630095430.GF16711@paasikivi.fi.intel.com>
 <CAAFQd5AGeL7+qhgxDGxWYgTcOVrNGqE8P-L40WWM2JDrY=YYZQ@mail.gmail.com>
 <CAAFQd5B0GxPpGm750rVKfPJi-gtn7w9KouFhXZc4k5OEtiKqBg@mail.gmail.com>
 <20200630143705.GW3703480@smile.fi.intel.com>
 <CAAFQd5CwwLzGKiCPdd_EzipmXPA2aYBrk0QRPv6Bacy++tXrHA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 560D0B0501A9BD5D2873241F011FACDD2523717978D3BD25795468ED446CA7E02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_035917_214398_54BBA774 
X-CRM114-Status: GOOD (  23.19  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Louis Kuo <louis.kuo@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>, dongchun.zhu@mediatek.com,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "list@263.net:IOMMU
 DRIVERS <iommu@lists.linux-foundation.org>,  Joerg  Roedel
 <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-06-30 at 16:40 +0200, Tomasz Figa wrote:
> On Tue, Jun 30, 2020 at 4:37 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Tue, Jun 30, 2020 at 04:21:31PM +0200, Tomasz Figa wrote:
> > > On Tue, Jun 30, 2020 at 4:19 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > > > On Tue, Jun 30, 2020 at 11:54 AM Sakari Ailus
> > > > <sakari.ailus@linux.intel.com> wrote:
> >
> > ...
> >
> > > > > > +     ov02a10->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> > > > >
> > > > >
> > > > > Shouldn't this be GPIOD_OUT_HIGH? That's the state it'll be after powering
> > > > > the sensor off the first time. Alternatively make reset signal high in
> > > > > runtime suspend callback.
> > > >
> > > > We might want to keep the signals low when the regulators are powered
> > > > down, to reduce the leakage.
> > >
> > > Ah, I actually recall that the reset pin was physically active low, so
> > > we would indeed better keep it at HIGH. Sorry for the noise.
> >
> > Here HIGH means "asserted", so in the code above it's LOW, means "deasserted",
> > i.o.w. non-reset state. I dunno what is better, it depends to the firmware /
> > driver expectations of the device configuration (from the power point of view,
> > HIGH makes sense here, and not LOW, i.o.w. asserted reset line).
> >
> > And nice of the logical state that it doesn't depend to the active low / high
> > (the latter just transparent to the user).
> 
> Yeah, after reading through the GPIO subsystem documentation and
> discussing with a bunch of people on how to interpret it, we concluded
> that the driver needs to deal only with the logical state of the
> signal.
> 
> Actually, I later realized that the problem of leakage should likely
> be solved by pinctrl suspend settings, based on given hardware
> conditions, rather than the driver explicitly.
> 

Thank you for all your explanation.
Fixed in next release.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
