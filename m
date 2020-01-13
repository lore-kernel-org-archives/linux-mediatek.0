Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60329C33CAB
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 308C821556
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 04:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O2YFiDTE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nJa1RC4I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 308C821556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmfdRME9LHeaV460pNuF7okEWE4nLwAFEUJirFFtEkc=; b=O2YFiDTEmxQzPE
	OZjRvxl02GwNFjCwGlRS8qgXqt1amaGe7j5oWD1xzlG1MKBGpxBkMEavWKUKknGV+9sdpqriDvLJ/
	trJ0qxsEShsUKckZTljt2KJxoccfrSbqzNuCwZcPCesJ1Lobp39pa+O9giU9XH6KYADu6BMm7lIM9
	GWfkLLO+NOHbl5iliuyFs/M6ut9bsY1B2b7CbK3OVdXi0A1brDKQHsqIZfrjlw0YM9KHSLsx+ByUW
	F/MujnSKx30iQA9jwMJ84aM8IV4uPlT4PQ6SKCKexddt5yFHjeEtHEBaJrptGp8lD6+SgwE6j3vKt
	EW6Xu8YOUtMcHymz5BLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqrii-0004FI-6l; Mon, 13 Jan 2020 04:52:56 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqri6-0003b4-16
 for linux-mediatek@lists.infradead.org; Mon, 13 Jan 2020 04:52:20 +0000
Received: by mail-qk1-x742.google.com with SMTP id c16so7411192qko.6
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jan 2020 20:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e91pGy24VVvYbYr4rZmi8ICedLezu/8qcs1+qti5PJ0=;
 b=nJa1RC4Is4dH0rAe9i+D5MWd8LXDimOk6ZHr02eCBlWBA8xjfA1YwLeH281ThOQo26
 3n0FogtRyfXpjYPLqCmbEwWd6PleQsb+MViHIIAEWMv1TouAMJ/z0HNp/N2WOxWDQey8
 01RkACdWQwDmWqyqttBUE7JWHXXbHLKWKmir0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e91pGy24VVvYbYr4rZmi8ICedLezu/8qcs1+qti5PJ0=;
 b=DrFJ/15WHNuMxGLzLVklGQhQ0xVqR6jtrI9ZdpaZSQH0N4VATlEgqQGQkccwNPNaae
 4toO5uLoKbFOzvPq0l70nU9yR3HkEyt3QlInjliHUbdlu0znAerW5Iq6fMxERlmIkHXz
 V7iIez7FGXRefTfOs15XaD3cIfQn4ovUufvLL+a9VxuhN9IdX/FARrhjrWCWWjVYdkx2
 yeZg8AjJLjNSGBrmj58If/ekpecJ8yqmdfVDWUhZYT2QAbNRw0bKlvhUJBv3LtFhTTlP
 wq+2Vqygi9gQB1H0yvCZtVsCQfAc4UX7CtYFLPXhzgQI2ixV7TEEkn52zgshw51N7DGG
 1Pkw==
X-Gm-Message-State: APjAAAX7Y2ObM3GRAWBcbyNOT11GyHNVicECUOrVxIoOYB2YNgVsuUeN
 vBHLzGl2tckDbtxh8/9HB/Sb4BNVw3XRVsMc7p3Rtg==
X-Google-Smtp-Source: APXvYqxQiKAiE5eUtsTQf70lo04q3M2951zkP4HBkJ3NdNMiSbRwCRCDOu23qOqzzIb3z7Vd3CR6g4sfwUCYbV478kw=
X-Received: by 2002:ae9:f003:: with SMTP id l3mr9903798qkg.457.1578891136362; 
 Sun, 12 Jan 2020 20:52:16 -0800 (PST)
MIME-Version: 1.0
References: <20191226093930.22413-1-yong.liang@mediatek.com>
 <20191226093930.22413-2-yong.liang@mediatek.com>
 <675aa211-eba5-e44c-0931-32c1b6d5ca8b@gmail.com>
In-Reply-To: <675aa211-eba5-e44c-0931-32c1b6d5ca8b@gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 12:52:05 +0800
Message-ID: <CANMq1KDAsgxaxU+GTuDMLbQ-MSQHsk+iQCNDSRJ+SPRODyebDw@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] amr64: dts: modify mt8183.dtsi
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_205218_513209_72431920 
X-CRM114-Status: GOOD (  14.73  )
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
 Yong Liang <yong.liang@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 8, 2020 at 10:05 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 26/12/2019 10:39, Yong Liang wrote:
> > From: "yong.liang" <yong.liang@mediatek.com>
> >
> > Include mt8183-reset.h and add reset-cells in infracfg
> > in dtsi file
> >
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
>
> applied with fixed subject line to v5.5-next/dts64

Well the subject line here still says amr64 ,-P

https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.5-next/dts64&id=42f8e5356122feb2003d7696c83cfec46daa8d44

I guess you can still fix this up as the branch has nothing else on it
and we shoudn't care about stability.

>
> Thanks
>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > index 10b32471bc7b..76bfcbdf097a 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> > @@ -8,6 +8,7 @@
> >  #include <dt-bindings/clock/mt8183-clk.h>
> >  #include <dt-bindings/interrupt-controller/arm-gic.h>
> >  #include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/reset-controller/mt8183-resets.h>
> >  #include "mt8183-pinfunc.h"
> >
> >  / {
> > @@ -227,6 +228,7 @@
> >                       compatible = "mediatek,mt8183-infracfg", "syscon";
> >                       reg = <0 0x10001000 0 0x1000>;
> >                       #clock-cells = <1>;
> > +                     #reset-cells = <1>;
> >               };
> >
> >               pio: pinctrl@10005000 {
> >
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
