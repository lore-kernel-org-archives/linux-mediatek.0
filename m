Return-Path: <SRS0=tlsQ=F6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B972CC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 08:56:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C4D4221E9
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Dec 2020 08:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C4D4221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q2QDECRyv73ccf8GKtmplj3gPXYKTYiQeXSHVb8f8cI=; b=H7sU1JExUjkpOPCdQpiRpOQy+
	6FxJDAtMB5EzH5Qc1N4of72vKAc7oeejjZzPf+IgFEB6j55e1EGMZm8we3vAdPVG0D86tJAhNHixO
	sUGfp4jRfRXipprLpmpvSQ125KH24sUCGyEa355lQeeA/yy5RmQZzX9/ReF1/9RvMe8gPKaEoMhkD
	/8LsLN+ctMogZdr7IY3iEjVzrjDp3FykmP2rqNSYG6tu149gaI1eOt8Q6Gnt5Ks5DU1SHvAu/OXzW
	QXJWHlNZxh/8++SKN+3YTRgKzuAby7tyPEw0/O1jHgwSZNya2fG3+1VraMj2kQHPSuW1RrzXm+H+g
	aMbqOKk1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kt5My-00036o-BL; Sat, 26 Dec 2020 08:56:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kt5Mo-000364-Qf; Sat, 26 Dec 2020 08:56:05 +0000
X-UUID: 45ed466f9b3445adb8ddda7a7db57b91-20201226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O8MvIzbgoKP0EJFUCZCWVgh+fi1X2o9IdCQSOOz75XU=; 
 b=mfoIGD3BMNLAhuX0tVP+8pCUbuybGmEgiboapJzSh9WU6cxfhGqDudx5hgyZVH9D7n/4geVwKVRPqqDTTE3l1KD9ZmLEP0zttT19xbmL4IczcWepvK5HNMKCHdpPvFeaPLsz6E679QOTtX9kj4yImRB7zsvOYgV3F6T3djeCAg0=;
X-UUID: 45ed466f9b3445adb8ddda7a7db57b91-20201226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2085782467; Sat, 26 Dec 2020 00:55:51 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 26 Dec 2020 00:55:49 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 26 Dec 2020 16:55:43 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 26 Dec 2020 16:55:42 +0800
Message-ID: <1608972946.14806.75.camel@mhfsdcap03>
Subject: Re: [v6,2/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From: Crystal Guo <crystal.guo@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, "wim@linux-watchdog.org"
 <wim@linux-watchdog.org>, "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>
Date: Sat, 26 Dec 2020 16:55:46 +0800
In-Reply-To: <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
References: <20201014131936.20584-1-crystal.guo@mediatek.com>
 <20201014131936.20584-3-crystal.guo@mediatek.com>
 <1605529631.14806.57.camel@mhfsdcap03>
 <CANMq1KDB5W9ON0+ormDjFy=9oJUnAq4A41zNTUMHcWsAJ449Zg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201226_035603_063564_5DFE029E 
X-CRM114-Status: GOOD (  20.44  )
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
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-21 at 08:59 +0800, Nicolas Boichat wrote:
> On Mon, Nov 16, 2020 at 8:27 PM Crystal Guo <crystal.guo@mediatek.com> wrote:
> >
> > Hi Maintainers,
> >
> > Gentle pin for this patch.
> >
> > Thanks
> >
> > On Wed, 2020-10-14 at 21:19 +0800, Crystal Guo wrote:
> > > update mtk-wdt document for MT8192 platform
> 
> Rob: I assume your input is required here? Any chance we could have
> your ack/review on this trivial patch? It seems like the series is
> blocked pending on a review of this patch -- and I don't think it has
> been reviewed before.
> 
> Thanks,
> 
> 

Hi Maintainers,

Just a gentle ping, can you help to review or give some suggestions
about this patch set?

Many thanks.

> > >
> > > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > > ---
> > >  Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > > index 45eedc2c3141..e36ba60de829 100644
> > > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > > @@ -12,6 +12,7 @@ Required properties:
> > >       "mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> > >       "mediatek,mt8183-wdt": for MT8183
> > >       "mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > > +     "mediatek,mt8192-wdt": for MT8192
> > >
> > >  - reg : Specifies base physical address and size of the registers.
> > >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
