Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BA4C33CA1
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 04:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2032E206ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 04:01:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tJ/2JGH/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ho+sL122"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2032E206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JChznnXCxUWc7MIi5pd0VKbSMep0VGB1s+/4/gCf7HM=; b=tJ/2JGH/K68cDJ
	yqgdpeBnbwqvpUFPO6OWRAUMWM4i7CdWoWGbLP37gERlMaGdndZIdfyi/dbh72k4/KnFxwCt23qwf
	cLX4ycVkbDUcpNw3Bko3MmbOkodQBjSo34Pib92Ah315AQzfLcwB86093TFvwmw5i7r24DEPzZqRb
	/W4/3dlEtRj3zApf13WnK9WQ6EV2nEloDMOFTUzMWv4wTLHpfrb7WYpu0sWd/MnSDQ2YMSCWH6FID
	Tly+qCHX6BKmbS18NKtUosYmyGF0SBEVNM8c/9C+3i4l+Vgi8R/NfxwUKC+5D5yGlsQXieXqjPzN0
	UVi8iRkt0zJ1yLBluvYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipP0k-0005Oj-Bx; Thu, 09 Jan 2020 04:01:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipP0g-0005OB-HH; Thu, 09 Jan 2020 04:01:28 +0000
X-UUID: 27c0d400ae1b419b9b7168aae1470d22-20200108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KCps6BgWrvdtsekJVTQpLbQ7cnpqG3IPNr8iggRA7dM=; 
 b=ho+sL122t//pXEShp7xu2qqXD4Jfem52dZMrA54A+CSHK9bzs7t7EzmRvsCTlml02icv1dXggfeysvFkwekJS7wbAPuk72kVutgjrx7bNSIdfvHQkJf7NMeSq2GwAVhOhQk4zhZb7l/E3XgRW1lLIfFsEN7Ern/85328KKXL6+4=;
X-UUID: 27c0d400ae1b419b9b7168aae1470d22-20200108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2033126045; Wed, 08 Jan 2020 20:01:23 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 19:59:32 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 9 Jan 2020 11:58:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 11:59:40 +0800
Message-ID: <1578542359.20923.16.camel@mhfsdcap03>
Subject: Re: [PATCH v3 1/2] amr64: dts: modify mt8183.dtsi
From: Yong Liang <yong.liang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 9 Jan 2020 11:59:19 +0800
In-Reply-To: <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
References: <20191227141405.3396-1-yong.liang@mediatek.com>
 <20191227141405.3396-2-yong.liang@mediatek.com>
 <CANMq1KD=jAPn4Y7zQZrsg9FB7Cq6tNX0R8OF4qX21Sjy2=0Naw@mail.gmail.com>
 <CANMq1KB4PzAUdp03go0Ur_khi2bM3+oNUhHtMK=--V6DmGXiDA@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 54C315E0B98D2A87DB338729E419450348F525FF59E3EDFD3BC0ECB9CBA3B6422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_200126_580906_889D68F2 
X-CRM114-Status: GOOD (  14.83  )
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
 Devicetree List <devicetree@vger.kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-01-08 at 17:14 +0800, Nicolas Boichat wrote:
> On Wed, Jan 8, 2020 at 4:56 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > minor nit, s/amr64/arm64/ in the commit title.
> >
> > On Fri, Dec 27, 2019 at 10:15 PM Yong Liang <yong.liang@mediatek.com> wrote:
> > >
> > > From: "yong.liang" <yong.liang@mediatek.com>
> > >
> > > 1. Include mt8183-reset.h and add reset-cells in infracfg
> > > in dtsi file
> 
> Err, wait, doesn't this depend on
> http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026170.html
> ?
> 
  Yes, but this patch can be delay a while, We will ensure jiaxin's
patch be send out prioritly.

  Yong.Liang

> > > 2. Add watchdog device node
> 
> Can we have a patch with just this change instead, since you're
> sending the binding with it.

  I will remove binding txt file from this patch.
  And we will ensure jiaxin's patch be send out prioritly.

> 
> > >
> > > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> >
> > Tested-by: Nicolas Boichat <drinkcat@chromium.org>
> >
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > [snip]
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
