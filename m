Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2B8C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 11:14:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD18613D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 11:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDD18613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fTwAUduvSMA+Df8R0zAg6PSptfGuqWSkZ3v7AsZAmmY=; b=LRlXdZX2Qnzrcj0LXU6mF7POm
	RuNeSV7FWycmVmetfGP58wN8oDtg6AwuAT8jFNdnpF+wyN6TIEUxvIIQGjzLo4xqmcPgSbfRFhi8y
	gaBG+PIwRAvXZFqute2XJDIuiC9mBkq1TBd9oC76s3PsxRkPyrTRzfJQbAQoHYmP9AQhss4k+h8QP
	3+FlAEcCfpV4U2FMY1BQHOyhRarOU2elnkA7y2zp8U62SUZAoBNDtHCTbICmBmLsL6z71domDfQXx
	aaj7YosyuMyFQ73SIo4GLr9+PTJuk4Rt3VXw2WoQXwyQWK2wld6/EQZ5Zx8bKzspHqUDk3wVR3tjv
	6H9JLj7wQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhVmG-007sB7-HN; Fri, 14 May 2021 11:14:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhVmF-007sAZ-3i
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 11:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AobE3rqWzAR5whOCqPuXrD/28KwqAfI01k8Xsr9LaIQ=; b=yotIlJVD3jACExqLrdw4Rj/jBE
 81gucMK73YJvuOvrAdhfoRS85Ifmp1L9EAKmnXeFw3Vi0C0i5Hg5cGTqNuAQiDBePomT1W2j25s48
 rYM/pjTmfUCaR4E/GOJGDluf4rpVKsboQ130NZ8BNRnD2ru2655ItwyCutZE9YJ/aBRCUWnrO1zEB
 THvFQnPqVkvPPSqfr9D6EMnhH6K9wrKLa3AmUgMki3/Z5jwk7bkl2qFAOlTZ7notd+tVNjaP1BEKH
 DKuyJphOAzuX/l/Kgl7l16/YcgWly0XXSPV/6XH44WqsDsG9QNH5GnEFcKazDNcWVgcx45cQC5Mc5
 QDIXIJOg==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhVmC-00BvlQ-0r
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 11:14:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id t30so2539585pgl.8
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 04:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AobE3rqWzAR5whOCqPuXrD/28KwqAfI01k8Xsr9LaIQ=;
 b=oYiFUcpoI5mc4qXcCTHNdjkzQyGcqlPV2dBqIpLLg1p1i6pV0e8esUCkHWl6GOs3+L
 HtrYY2xNR1Sob1F68xp3HluEr+snyZTiOYThD47YrOQv+cVfNsqWy/pMfe3aJIL5ZcQu
 R2X7KK4wFkgCHgxGRnnixEsSXJGGistXO3dc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AobE3rqWzAR5whOCqPuXrD/28KwqAfI01k8Xsr9LaIQ=;
 b=ARRQh3OpVg2KASwtK4/gYjPV07tEJp3EQML+XHkSWaPM7FO5cmjPua3XWF7N0Vj0qw
 jgGC2DSngWFxCFgL05iu4DMGWpdfPRCkZs1zqhLkwP3b1zGyY+gMAohmHbCSVQN22+pD
 5vZ+COlZPObzzW2uLzQsBnjS8S2VuprwetuG95DylJYi1vgXqc5cZDWP8pFXRoD08/1T
 ElNDt0X9mPccgtKnZ2L65wquhJf5TNRxWs5rfUmE/iKEK2ff1GA1+8AziFT7T5+Iwc/u
 Bd4OWm0WJZpKOlcWE6ktkw65izG/71Uo4TFIfPeTkVlAx/tvaLGOz7higpBjRthGx480
 ftHw==
X-Gm-Message-State: AOAM531t9SjXOek9qZVxrAUeb4l9Z95HNC49Nj0CFWb1Eb82feLdA4Yd
 Rog6gtopkXLQsJNbBsnnw2WmwBUB8BOFx4CKqr2vHQ==
X-Google-Smtp-Source: ABdhPJwjE+6SUc2igDiKD6aOkPfhQ+moPvTk2uBOhn2pCVuVe74ruIEn3ws/XYYPLnK6BryC/P/y8TZxqH/yf+1UFQc=
X-Received: by 2002:a63:8149:: with SMTP id t70mr46454849pgd.299.1620990878139; 
 Fri, 14 May 2021 04:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210510092631.3141204-1-ikjn@chromium.org>
 <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
 <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
 <daeb031a-1992-704b-49bf-c935078f15f8@collabora.com>
In-Reply-To: <daeb031a-1992-704b-49bf-c935078f15f8@collabora.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 14 May 2021 19:14:27 +0800
Message-ID: <CAATdQgAK3VL69DuyWziYi=4ZTXTd1r7fuOXTHgw33Xu6HCvTXA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Input <linux-input@vger.kernel.org>, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Hsinyi Wang <hsinyi@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_041440_124083_08684BBE 
X-CRM114-Status: GOOD (  32.60  )
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

On Fri, May 14, 2021 at 4:55 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> Hi Ikjoon,
>
> Thank you for the patch.
>
> On 13/5/21 3:45, Ikjoon Jang wrote:
> > On Thu, May 13, 2021 at 12:38 AM Matthias Brugger
> > <matthias.bgg@gmail.com> wrote:
> >>
> >> Hi Ikjoon,
> >>
> >> On 10/05/2021 11:26, Ikjoon Jang wrote:
> >>> Add a 'cbas' device node for supporting table mode switch in
> >
> > tablet
> >
> >>> kukui devices.
> >>>
> >>> Kukui platforms with detacheable base have an additional input
> >>> device under cros-ec, which reports SW_TABLET_MODE regarding
> >>> its base state (e.g. base flipped or detached).
> >>>
> >>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>> ---
> >>>
> >>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> index ff56bcfa3370..40030ed48854 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> >>> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
> >>>                       compatible = "google,extcon-usbc-cros-ec";
> >>>                       google,usb-port-id = <0>;
> >>>               };
> >>> +
> >>> +             base_detection: cbas {
>
>
> This should be just cbas, remove base_detection. It was a bit confusing follow
> these series. If [v5, 2/2] is already applied in hid tree, I'd suggest send a v7
> version including:
>
> [v7, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
> [v7, 2/2] arm64: dts: mt8183: add cbas node under cros_ec

sure, let me upload v7 with dt-bindings + mt8183.dtsi together.

>
> Both patches can go through the Matthias tree, but the first one also needs an
> Ack from Lee Jones, MFD maintainer, which I think is not cc'ied, so unlikely to
> give you the needed ack.

Oops.. :-S
(Why did I think this should go through hid?)
Thanks a lot for pointing out the basic but critical mistake.

>
> Thanks,
>   Enric
>
>
> >>> +                     compatible = "google,cros-cbas";
> >>
> >> I'm not able to find any binding description for this. It seems linux-next has
> >> driver binding to this compatible, but the description is missing.
> >>
> >> Can you please clarify.
> >
> > Yep, that's correct.
> > Let me resend this with v2 after the dt-binding patch is applied.
> >
> > In this series, I requested queueing these to hid tree:
> >
> > [v5, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
> > https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-2-ikjn@chromium.org/
> >
> > [v5, 2/2] HID: google: Add of_match table to Whiskers switch device.
> > https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-3-ikjn@chromium.org/
> >
> > Later I found that I missed a comment from [v5, 1/2]
> > But only [v5, 2/2] part is already applied to hid tree as I asked for it.
> >
> > I sent a v6 dt-binding patch is here (not yet applied)
> > https://patchwork.kernel.org/project/linux-input/patch/20210512100832.3878138-1-ikjn@chromium.org/
> >
> >>
> >> Thanks,
> >> Mathias
> >>
> >>> +             };
> >>>       };
> >>>  };
> >>>
> >>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
