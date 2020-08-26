Return-Path: <SRS0=weZ6=CE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32648C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:11:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0223C2080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Aug 2020 11:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RaQ2Wk0b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aqoihg3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0223C2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xoexyYXqm/Fc5ePHlLOxf67L+f2fTHLzGW8UrdKNfAU=; b=RaQ2Wk0bUlV2qanOg4WnIZRs1
	4kPFkIy7tkPR//fS5TOJS1UcFt9W8q+uL22uY3UKgDzUjC+HTj2nMB1slBtFL6YrUKDfS8bMIW2jR
	6CoIPWGs5rYFbp/E4zFXYNDUttVqUys52NHuFqiccHws9ja7W4zptn18AjNiXQzTfskR/+gDPbkl+
	Ii1P1SkC0EvRA9kQ6DfQGOGVGr3/M8FOqKsVKwIDHsdURQsvH8JGEPRJ671dC0CB673B2t56H0qvB
	jKpY/qEYhe6t02hUNrtC11VD4hNxJc0VMTXRx9Itoo5u+60XKh7XANWL1ntycx+cpqxfA7C0v92Wi
	lMgNjY3Bg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAtKn-0003mN-4N; Wed, 26 Aug 2020 11:11:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAtKj-0003l1-DU; Wed, 26 Aug 2020 11:11:14 +0000
X-UUID: 6273f392ca7249eaba3055d0916ef99f-20200826
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A/c+zO1Bn8tRKZBh2n+Hldsc4ufJubZKEbW6ppLUBsk=; 
 b=aqoihg3It/4Hf77PUejyDJWtM8XDztDF4++8he97g9PETyl31mp4aRKcZXGqci+A4SstpPsqQXDjuCeN+PkqIHCvhgmUFfohx+rv77y71cXcBVRibEDJdTA+fo2ADJUXK4dAaqtb3sm4mdOU1dt+DIgzzqPQMzC1cmSCCfokloY=;
X-UUID: 6273f392ca7249eaba3055d0916ef99f-20200826
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 433719935; Wed, 26 Aug 2020 03:11:10 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Aug 2020 04:11:07 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 Aug 2020 19:11:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 Aug 2020 19:11:05 +0800
Message-ID: <1598440183.30048.14.camel@mhfsdcap03>
Subject: Re: [v4,2/4] dt-binding: reset-controller: ti: add
 'mediatek,infra-reset' to compatible
From: Crystal Guo <crystal.guo@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 26 Aug 2020 19:09:43 +0800
In-Reply-To: <20200825190219.GA1125997@bogus>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
 <20200817030324.5690-3-crystal.guo@mediatek.com>
 <20200825190219.GA1125997@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F5BA3F4B05E182D188D3A309D1F49535F9637CD33A5A9DB6DAE3FFCC36DBD5282000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_071113_624604_2793F2E2 
X-CRM114-Status: GOOD (  19.88  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Yong Liang =?UTF-8?Q?=28=E6=A2=81=E5=8B=87=29?= <Yong.Liang@mediatek.com>,
 Stanley Chu =?UTF-8?Q?=28=E6=9C=B1=E5=8E=9F=E9=99=9E=29?=
 <stanley.chu@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "afd@ti.com" <afd@ti.com>,
 Fan Chen =?UTF-8?Q?=28=E9=99=B3=E5=87=A1=29?= <fan.chen@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, "s-anna@ti.com" <s-anna@ti.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-08-26 at 03:02 +0800, Rob Herring wrote:
> On Mon, Aug 17, 2020 at 11:03:22AM +0800, Crystal Guo wrote:
> > The TI syscon reset controller provides a common reset management,
> > and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
> > which denotes to use ti reset-controller driver directly.
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > index ab041032339b..5a0e9365b51b 100644
> > --- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > +++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
> > @@ -25,6 +25,7 @@ Required properties:
> >  			    "ti,k2l-pscrst"
> >  			    "ti,k2hk-pscrst"
> >  			    "ti,syscon-reset"
> > +			    "mediatek,infra-reset", "ti,syscon-reset"
> 
> You need your own binding doc. If you can use the same driver then fine, 
> but that's a separate issue. There's also reset-simple driver if you 
> have just array of 32-bit registers with a bit per reset.
> 
> Don't repeat 'ti,reset-bits' either.

Do you mean I should add a Mediatek reset binding doc, although Mediatek
reuse the TI reset controller directly?

Best Regards
Crystal
> 
> >   - #reset-cells		: Should be 1. Please see the reset consumer node below
> >  			  for usage details
> >   - ti,reset-bits	: Contains the reset control register information
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
