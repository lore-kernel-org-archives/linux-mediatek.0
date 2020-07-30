Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8215CC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 01:46:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE4320809
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 01:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SF+eUEM+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U/UqmNOS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE4320809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CfLZalHzgVzCo9qhVGBfWDwLoiA3rP0pUoOvfGlaffg=; b=SF+eUEM+ZxYSZjNNoDO/WfNyr
	tO1L3NmBEaTIRcmkFKxgPtTXdAc/XEiStZWm1kAI1UHGQ3fMELyNbS50/rw7y8E5HIJeXeATKIeou
	ZAZ3YHA7vCuT4VF8lX3u+lfVTquEVkdUPPUes+p9b4mkCW7YK7Zp0y6g/JQ5fDGnF/ucLUuJLAqex
	NlXCA5T5da6NFJBQuEwkU6KsCLU2ZZ5Cfzlmbntx4V4R5sKMHSG2hdz/icJUIm9PdTGPnlCgZNi1O
	mz+ujK8MwH2IeLvfZYRbdFyzsGq2oGmVsa5gYHbzPOYvWENfMVwNT5tb7Rskh2IKuGBeWusAo0W5A
	2cjFqwcWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0xeI-000348-3b; Thu, 30 Jul 2020 01:46:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0xe0-0002yZ-VJ; Thu, 30 Jul 2020 01:46:08 +0000
X-UUID: ea7615c66c7043fe913a758d089bd84d-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Gf/Mo8xD23Vb19E0FPpkZ0VSoaVgKK6weloMaegtMYM=; 
 b=U/UqmNOSPY8iLhJYGE2iCjLo1at5CC047hJsaj+EG9ii89RAh3CjgpxO6sRX4x6lq/BV4a870Pwunmkg05uaDcffUS4iBuyrWDjWSJYmn5T6yEaKMo1D6z40Uo/Li1z7HXeazxUXATryXNS4p/LTeRQ/UXrDbDrAeJpiyYBvtXI=;
X-UUID: ea7615c66c7043fe913a758d089bd84d-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 845982008; Wed, 29 Jul 2020 17:46:20 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:35:53 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs02n1.mediatek.inc
 (172.21.101.77) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 30 Jul 2020 09:35:39 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 09:35:38 +0800
Message-ID: <1596072913.11360.12.camel@mhfsdcap03>
Subject: Re: [v2,1/3] dt-binding: mediatek: mt8192: update mtk-wdt document
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Thu, 30 Jul 2020 09:35:13 +0800
In-Reply-To: <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
References: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
 <1596016922-13184-2-git-send-email-crystal.guo@mediatek.com>
 <c6ea8852-0381-0924-185e-083ea167f8fa@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_214605_243611_09C1C019 
X-CRM114-Status: GOOD (  17.29  )
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
 Erin Lo =?UTF-8?Q?=28=E7=BE=85=E9=9B=85=E9=BD=A1=29?= <erin.lo@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 18:18 +0800, Matthias Brugger wrote:
> 
> On 29/07/2020 12:02, Crystal Guo wrote:
> > update mtk-wdt document for MT8192 platform
> 
> 
> should be two patches. one fixing the compatibles and second adding new board.
> 
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 4dd36bd..e36ba60 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -4,14 +4,15 @@ Required properties:
> >   
> >   - compatible should contain:
> >   	"mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> > -	"mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> > +	"mediatek,mt2712-wdt": for MT2712
> >   	"mediatek,mt6589-wdt": for MT6589
> >   	"mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> >   	"mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> >   	"mediatek,mt7623-wdt", "mediatek,mt6589-wdt": for MT7623
> >   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> > -	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
> > +	"mediatek,mt8183-wdt": for MT8183
> 
> We will need to update the DTSI in a seperate patch as well.

Yes, this patch is based on
https://patchwork.kernel.org/patch/11690401/ , which modify description
for mt2712 and mt8183.

> 
> >   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> > +	"mediatek,mt8192-wdt": for MT8192
> >   
> >   - reg : Specifies base physical address and size of the registers.
> >   
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
