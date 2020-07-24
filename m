Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CA95C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 06:42:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CC92070B
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 06:42:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gbxE2QMP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kLjudVaa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CC92070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ApYgyh6L/M0MKJzfPo/+z2OPOwOE1chzRsAsiK5qEhM=; b=gbxE2QMPnmiLwTsyfmrd+PY8u
	RsfHC3ljPW/uVtkUe7Bez2l+dB34EMg7dS/vZSpbSMZ2K6256rc6EsBT9Wf7WN7Uhrs2q9LZsSVxE
	7GyHi+ByymHAKHl8uHerQ18/0jXGk3oXXUl49nORa9cVV/rFxijtn0IwDLkvxdt+tDude/zUe95sJ
	wzwADmpc37qHlir3ffR+zraRGRDMLvJw16vmueFerf2Y0nQbe0h0h+I09XYynsGzp5LJD+dqVM3Hi
	Ir+b+QhOVNKfADaBGs/H0fVnoCohJKchWeRQnvl05BzEkNvFSaD88ywoit7M7MtBME1BVh/3AFLPA
	ASETeIuZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyrPJ-0006H8-7K; Fri, 24 Jul 2020 06:42:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyrPE-0006GT-3K; Fri, 24 Jul 2020 06:42:09 +0000
X-UUID: 6baaf1927d1c412896e297e16ecc9084-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LqLck1fwSu4qq9+0rFPa49nhL2/61wPAzLCarhjNGK4=; 
 b=kLjudVaaDc3VZsa4tfkCBMxFX8cXhjc2nkENJm3OeKEVG9KG4+T6i7qoFaaqbZilzeibpJWX5jHbQnv7DtXVeVfvfI/F2o1oRqc8zCnS7NmOzOc7vvoRVyDPNbSbsK4+ZiTSQjCmmF00j55yWO3pju/ci5xw+QgE0jwJljFOr00=;
X-UUID: 6baaf1927d1c412896e297e16ecc9084-20200723
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 103697750; Thu, 23 Jul 2020 22:36:41 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 23:36:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Jul 2020 14:36:37 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jul 2020 14:36:35 +0800
Message-ID: <1595572526.15289.9.camel@mhfsdcap03>
Subject: Re: [PATCH 4/4] dt-binding: mediatek: mt8192: update mtk-wdt document
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 24 Jul 2020 14:35:26 +0800
In-Reply-To: <d69d441d-b8c7-f4a4-7ae1-a0012d8001f3@gmail.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
 <20200723090731.4482-5-seiya.wang@mediatek.com>
 <20200723212935.GA889594@bogus>
 <d69d441d-b8c7-f4a4-7ae1-a0012d8001f3@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_024208_339422_54F4DC5A 
X-CRM114-Status: GOOD (  16.26  )
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
Cc: Rob Herring <robh@kernel.org>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-07-24 at 06:02 +0800, Matthias Brugger wrote:
> 
> On 23/07/2020 23:29, Rob Herring wrote:
> > On Thu, Jul 23, 2020 at 05:07:31PM +0800, Seiya Wang wrote:
> >> From: Crystal Guo <crystal.guo@mediatek.com>
> >>
> >> update mtk-wdt document for MT8192 platform
> >>
> >> Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> >> ---
> >>   Documentation/devicetree/bindings/watchdog/mtk-wdt.txt | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> >> index 4dd36bd3f1ad..d760ca8a630e 100644
> >> --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> >> +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> >> @@ -12,6 +12,8 @@ Required properties:
> >>   	"mediatek,mt7629-wdt", "mediatek,mt6589-wdt": for MT7629
> >>   	"mediatek,mt8183-wdt", "mediatek,mt6589-wdt": for MT8183
> >>   	"mediatek,mt8516-wdt", "mediatek,mt6589-wdt": for MT8516
> >> +	"mediatek,mt8192-wdt": for MT8192
> >> +
> > 
> > So, not compatible with "mediatek,mt6589-wdt"? Is so, perhaps summarize
> > what the differences are.
> > 
> 
> Hm, looks to me as if the binding description for mt2712 and mt8183 isn't 
> correct, as we have a OF data just as we have for mt8192 now. Could you fix this 
> in a separate patch?
> 
> Regards,
> Matthias
> 
> Besides watchdog, mt8192 toprgu module also provide sub-system software reset features.
> mt2712 and mt8183 are same as mt8192. But mt6589 not support sub-system software reset.
> 
> >>   
> >>   - reg : Specifies base physical address and size of the registers.
> >>   
> >> -- 
> >> 2.14.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
