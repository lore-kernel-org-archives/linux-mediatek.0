Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72544C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:45:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADFAF613CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 01:45:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADFAF613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=flbabTvNzHCNtkMpfdcgPvCyAn3W1cVPtsMvxZqQfik=; b=Tj+eu8dm5gjh97pz4sit20IlC
	/1zzFzGAiBmlMcQJGZJ0M7938V5pKFNFVBPxhUzCPT64GP5sOaz9tsGpSrkMvii7pPhhHxuCUiTdU
	Du66soD5xPyp9tl1PFVrC+ab27RETRRKQCJuottGEjzf+nZzsQ2RkNQ1A54jbKON85hUbwmcjkxIn
	RLdUthjJ9C+sojWZUwbt/I1UxUboY0rZmwLQzNYoKsRfMOl+6Y6FLL37F7TnlM4vf3XZqKHsdRPhA
	ZmwEo23GJEOBw+NwAVIcwn5ms3qfjgqPT044ZqfAak6pwz5ShccLa8TxaRzwg9HDD5PRQwteReOjR
	WcAyIz2iQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh0Pg-004Pnn-Sk; Thu, 13 May 2021 01:45:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0Pd-004PnO-Va
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 01:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Y9OSOdifwJ/U6Y7EVaNtB+dGpCcruOcZL8rYhMqEey4=; b=svfZnqSj4QXQCpLZGDQ6xyjHfZ
 Nv+fbXIaKqts/NoQVMaWiC6oQOA8x8jPQRFzyaa4VNxQFFB32KZH9SWeRiXKUYVbNJobc+qGOsmOc
 Vq1AkhqJWWwcOyrimHfNtGdNGR7FfaleesinHNA6o48dGXeDVh/Rc/4gdl1pgqB07JBMdZDSHS4Cl
 faUHjCdurVbfun+nT4OL+L5bAd1TF87Uo4ShbreKm/Su1jElpXVmf2WATGJX74hYTilOFueT2Jr20
 O4rkAeG9uEoGiEE9WYeKo9eEwYPR6muwpGR5tZ/WmKNmcQ3RglZqdA38h1VraAhqMk5tB7id7i9/E
 fRZ9r7nw==;
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh0Pa-00AxYb-U4
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 01:45:16 +0000
Received: by mail-pg1-x529.google.com with SMTP id m124so19778556pgm.13
 for <linux-mediatek@lists.infradead.org>; Wed, 12 May 2021 18:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y9OSOdifwJ/U6Y7EVaNtB+dGpCcruOcZL8rYhMqEey4=;
 b=Fr4qTZMcIVQwesgH7iOol4OkmW1/52NmyRhF1zWTYJmRVZh7G00+iiQr0xSE7Jn55R
 bSoByr7woQr/XQI3sZVzZJlUo7RlWqaDd1xyh6mCTJRUF+W2hoSl7SN9RdZnIq1w+HmM
 A4DBdX0Nx7PnFWJoZO+OXIARomsPVvsJ04ANA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y9OSOdifwJ/U6Y7EVaNtB+dGpCcruOcZL8rYhMqEey4=;
 b=Jz/LJ1asSVtmWscnbU7owZQvTA6TMiK4FWA+PgqbitgP7EQOT374etNzSNgf+3kSHf
 prZhraP+PEuAwUjJBMDD7FvB2eTHmOQaeBcQ26k3rXH3dpySRVSRTeruJOwda0J57u/p
 CyuKIuICpMmhdFq6/HjENRWxkRV+vmhxCHdan0uClsGvpEZEKaQ2jxbNcaINBv+mTsrG
 zRTPn8QOKgJ7JQC1MJKv5g8Ty2ZO2dtYit3MmFxFXQa9j9U7KiVoZuJZOQeEYxed/LaA
 /sBOT6AetyD8bggi6OhDuZ8OPhWRelkkLDqexdARFSk0Mf89Mn9WvEzx3/+pfyu2QS7i
 0MZw==
X-Gm-Message-State: AOAM533QhqPz9Pg7cZTC20pPTwuZjX+p0KavVa4odxXX3cTqMq+dVZZD
 te32mqk5H8euGEF209R0+pfrL2POkYkBOq6Od4BdVA==
X-Google-Smtp-Source: ABdhPJx9FdyNW+2z7f/xqG8Mk4Yok0erOgCRj+tZ6RPtmwF2b1M4b7JDdPpu10FSJnZjOXEFDHY2ToGEW5Y+7H7xlX8=
X-Received: by 2002:a17:90a:4298:: with SMTP id
 p24mr1758687pjg.144.1620870312282; 
 Wed, 12 May 2021 18:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210510092631.3141204-1-ikjn@chromium.org>
 <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
In-Reply-To: <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Thu, 13 May 2021 09:45:01 +0800
Message-ID: <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-input@vger.kernel.org, 
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Hsinyi Wang <hsinyi@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_184515_014261_C607B79A 
X-CRM114-Status: GOOD (  22.54  )
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

On Thu, May 13, 2021 at 12:38 AM Matthias Brugger
<matthias.bgg@gmail.com> wrote:
>
> Hi Ikjoon,
>
> On 10/05/2021 11:26, Ikjoon Jang wrote:
> > Add a 'cbas' device node for supporting table mode switch in

tablet

> > kukui devices.
> >
> > Kukui platforms with detacheable base have an additional input
> > device under cros-ec, which reports SW_TABLET_MODE regarding
> > its base state (e.g. base flipped or detached).
> >
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > index ff56bcfa3370..40030ed48854 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> > @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
> >                       compatible = "google,extcon-usbc-cros-ec";
> >                       google,usb-port-id = <0>;
> >               };
> > +
> > +             base_detection: cbas {
> > +                     compatible = "google,cros-cbas";
>
> I'm not able to find any binding description for this. It seems linux-next has
> driver binding to this compatible, but the description is missing.
>
> Can you please clarify.

Yep, that's correct.
Let me resend this with v2 after the dt-binding patch is applied.

In this series, I requested queueing these to hid tree:

[v5, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-2-ikjn@chromium.org/

[v5, 2/2] HID: google: Add of_match table to Whiskers switch device.
https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-3-ikjn@chromium.org/

Later I found that I missed a comment from [v5, 1/2]
But only [v5, 2/2] part is already applied to hid tree as I asked for it.

I sent a v6 dt-binding patch is here (not yet applied)
https://patchwork.kernel.org/project/linux-input/patch/20210512100832.3878138-1-ikjn@chromium.org/

>
> Thanks,
> Mathias
>
> > +             };
> >       };
> >  };
> >
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
