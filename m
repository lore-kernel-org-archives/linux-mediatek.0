Return-Path: <SRS0=GRN7=PA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48047C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 10:30:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0372461100
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Oct 2021 10:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0372461100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=11E8Cuz4IUNpSqcrZdwyhv7izWQ0i1X5FlDpCuLKYH4=; b=v3LD5CH2LAL2v6
	yzPUO/Z4h7GmrAvpdBFZK1GHUh0S11jrBxgXFkAZp9aXXolyLfOguKqNYrkH979nsExP/6+AcwseL
	xYAtcEO2tBNht6eKB3TouKQyJOxeVJQ5MAUqt02xyiJ/1kNOXxntWmmNygGSIUNAiQiqcl2PL6VL7
	JQcmxYyYFCT3lkoUBsQJBrMityWAMbpD2V1fbfX1ui8CQWSMzDFLCo372CkefkLKqYXOyaU8gZXnl
	d2U4/xE/5RuqmU05nT9At1Z5qHZwCDfcwW6vpIypX3DDXRL0mBb0OcVqqjvXVG37MTqhEDgEDsLPM
	aLalR+73fJD/UC9eyRjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maF3E-00CRAN-W8; Tue, 12 Oct 2021 10:30:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maF35-00CR8d-Oc; Tue, 12 Oct 2021 10:30:21 +0000
X-UUID: 0f1a6b8534574cdf9f4b0bb3cd2c5a13-20211012
X-UUID: 0f1a6b8534574cdf9f4b0bb3cd2c5a13-20211012
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1881505248; Tue, 12 Oct 2021 03:30:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 03:29:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Oct 2021 18:29:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Oct 2021 18:29:28 +0800
Message-ID: <315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com>
Subject: Re: [v3,7/9] dt-bindings: arm64: dts: mediatek: Add mt7986 series
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <enric.balletbo@collabora.com>, <fparent@baylibre.com>,
 <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
 <hsinyi@chromium.org>, <john@phrozen.org>, <linus.walleij@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux@roeck-us.net>, <mpm@selenic.com>, <mturquette@baylibre.com>,
 <robh+dt@kernel.org>, <sboyd@kernel.org>, <sean.wang@kernel.org>,
 <seiya.wang@mediatek.com>, <wim@linux-watchdog.org>
Date: Tue, 12 Oct 2021 18:29:28 +0800
In-Reply-To: <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
References: <9552b0dc-337f-7edc-2997-50603dfe8bcd@gmail.com>
 <20210924114046.26070-1-sam.shih@mediatek.com>
 <bc29d5bc-9ce7-6147-a708-e6304249b600@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_033019_846118_988D2D09 
X-CRM114-Status: GOOD (  33.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

On Fri, 2021-10-08 at 15:53 +0200, Matthias Brugger wrote:
> Hi Sam,
> 
> I'd advise to split this series in parts for:
> - basic device support via dts.
> - pinctrl driver + dts
> - clk driver + dts

Okay, I will split the patches that are still under review into the
above patch series.

But I have a dumb question, currently, we have some patches that have
been assigned version numbers.
If I want to seprate original patch series, and resend 3 new patch
series (basic / pinctrl / clock) according to your comment, if I want
to keep the preview change log, tags in the patch set: 

like:
---
v3: changed 'MT7986' to 'MT7986 series' in the commit message
v2: added an Acked-by tag
---

Which version number should I use for these new patch series ?

Does the version number in corver-letter and the version number in each
patch need to be the same in the entire patch series ?

// (Original patch series/thread, version number is v3)
[PATCH v3 0/3] Add basic SoC support for mediatek mt7986
  [PATCH v3 1/3] dt-bindings: arm64: dts: mediatek: Add mt7986 series
  // (the version number has been updated to v5 previously)
  // (basic part only, not include pinctrl and clock nodes)
  [PATCH v5 2/3] arm64: dts: mediatek: add mt7986a support
  [PATCH v5 3/3] arm64: dts: mediatek: add mt7986b support

// (New clock driver patch series)
[PATCH 0/3] Add clock driver support for mediatek mt7986
  [PATCH v3,1/3] dt-bindings: clock: mediatek: document clk bindings   
for mediatek mt7986 SoC
  // (the version number has been updated to v3 previously)
  [PATCH v3 2/3] clk: mediatek: add mt7986 clock IDs
  [PATCH v2 3/3] clk: mediatek: add mt7986 clock support

// (New pinctrl driver patch series)
[PATCH 0/4] Add pinctrl driver support for mediatek mt7986
  // (the version number has been updated to v6 previously)
  [PATCH v6 1/4] dt-bindings: pinctrl: update bindings for MT7986 SoC
  // (the version number has been updated to v2 previously)
  [PATCH v2 2/4] pinctrl: mediatek: add support for MT7986 SoC
  [PATCH 3/4] arm64: dts: mediatek: add mt7986a pinctrl support
  [PATCH 3/4] arm64: dts: mediatek: add mt7986b pinctrl support

> 
> I would also advise to not send new versions of patches as new
> threads and don't 
> respond in the same thread. At least for me that breaks my workflow
> as I use b4.

If I don't respond to the next patch set in the same thread, should I
create an entire new patch series ?

For example, if I want to update PATCH 2/3 in the bellows patch series,
and my PATCH 1/3 has been accepted by reviewer previously

[PATCH v2 0/3] Add basic SoC support for mediatek mt7986
  [PATCH v2 1/3] ...   (patch set v1, applied by matainer)
  [PATCH v2 2/3] ...   (patch set v2, need to be upgrade to v3)
  [PATCH v2 3/3] ...   (patch set v1, waiting for review)

Is this correct to send patch mail to maintaiers for the above
situation ?

[PATCH v3 0/2] Add basic SoC support for mediatek mt7986
  [PATCH v3 1/2] ...   (patch set v3)
  [PATCH v3 2/2] ...   (still patch set v1, waiting for review)


> 
> Regards,
> Matthias
> 
> 
> On 24/09/2021 13:40, Sam Shih wrote:
> > MT7986 series is Mediatek's new 4-core SoC, which is mainly for
> > wifi-router application. The difference between mt7986a and mt7986b
> > is that some pins do not exist on mt7986b.
> > 
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > 
> > ---
> > v3: changed 'MT7986' to 'MT7986 series' in the commit message
> > v2: added an Acked-by tag
> > ---
> >   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 80a05f6fee85..a9a778269684 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -76,6 +76,14 @@ properties:
> >             - enum:
> >                 - mediatek,mt7629-rfb
> >             - const: mediatek,mt7629
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7986a-rfb
> > +          - const: mediatek,mt7986a
> > +      - items:
> > +          - enum:
> > +              - mediatek,mt7986b-rfb
> > +          - const: mediatek,mt7986b
> >         - items:
> >             - enum:
> >                 - mediatek,mt8127-moose
> > 

Thanks,
Sam


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
