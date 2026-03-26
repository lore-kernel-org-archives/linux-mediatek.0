Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85882109E557
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 05:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=; b=RwlVsoLn6vwDF63HzxkKH1bo8Q
	DaUxNLLuUc1mp1WsVFaQREjpcjturxzXw2QQZokTV4r9iEKHtmqK4mhMsY1m53FwLx3i1+fw9SLfe
	fJ8Sn4WguvlGqcRJwGx9iUx+0ycL0q9eDKm55l20XqQOJk5K8DvAARxBX602QUAEtT0VRYO2N88y5
	xpX9vpJOiG3PTd19BcZDSm05QyhCkfuFZPTpPrLuBFBEw3KkUW4VRKzZf/q81tnpg6FCq+k04Yijg
	3Ms8yJOu+F6AVLiNrWZXlCJ2YNT+04C/A7A5TAPVd1QV8xlUbxEcUN99VponLRYnFp1e6LgZPxrad
	NW5nCmlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dV9-00000004kz0-1vgd;
	Thu, 26 Mar 2026 05:43:27 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5dV6-00000004kyD-2Lpq
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 05:43:25 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-829781b2b01so360911b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 22:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774503804; x=1775108604; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=m6jDIV9wNxnWkLUTXDlaGXwgep9BqBNvLq5Kq5ZKrEtZfX/c3GtW6xkL6rM9fPXEh9
         URWlbjGNw41gID1gTw8yUq/5o2/5olt6PQS74+SxR7o8VlDc5f7BLNq8gpZexf+QaPI5
         f4OCakYlLUa3fBbRconGrYKt0jyVL2b4iLNKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774503804; x=1775108604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MC8YZMrpOiVQXaQsK16bopjggMD7NER7fOf0qrCs7A0=;
        b=st2CvfG8Q8NtOaZggkaWwZxGdfBNGFuTjUzRhb6cG30GXQm6tvlkkjTuxMeiMLyHo/
         pbdN/WgYdEfsIXRvcb7D683oXjEXKjBZA00+1JAgkaoToqEl5gGwVanK7Rj1vYsWn0pJ
         qdLi6IrryMKLCPC7xFZs2B/VemE9qS9i0BFhErgMpxSS1ukeEljS9/JhvhKA8G6C2FAG
         /V+1POftoKfbPcvey0zUPjKVoonI83h6tv5Rt5UsTRwuciCqegxhyXKKWiRPD084aEzx
         13SFfF9xV5i/sEq9WgPeBMVR3GTYtkAzryejzs5AB7jIKZXenUdH9ztpR3YR1kiGeJBR
         lEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHje5bcIed9C3nFPVzRQDcSBRd925PV8JKVZw+6o2sgf79CUNcfKxId0JBBh5BSX/y+SE3p2XaJjcO1ZUkIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGf51OOuz6jDflq3PZ2RNSkm0Q6jBB72JwCaEW4luNJACkS0O7
	OEK39v3TaPUwAfWv9eodKlkQIAOYNfUtDWWwiWHMZRPjbkJyUVlO0QKJjTq0mC6A+w==
X-Gm-Gg: ATEYQzxnGWf3tXAIA7nLJDCX5ivVyW6CS/d9f3PSIF9QazunIoubEnI1KAPDKaFPqci
	N9qyRzwXzMLDDeuEgdb6k1XjrAxP7I6ggiiqygO/D0GazLMRTvTFH9RGqng6E2LylO9c/ZWBsa4
	BH51Zxkkm7lsTgaNJE4f5+eritIll8HRe62vL2MvxbIt0oGV4z+FHx5j4cBMg9wdBtkWZXiiirp
	iE1Yf8Rc+hwBhOuvcjsSAsTOcD5AyQaRyDQJyPtVuGJ7ynmqkPUsNunW86p7TRKF+JbYigxZoag
	uZNldTYNBb5QmicsJKmBsCtXBlOkD2OZMLC0Yy5vK8lKIKFjWSFYZmbxjvbFTsFDV7q1nUXCjvg
	l10P+Y/CaDLMLSrx6XBWLHcDI0aQs/9g9xDhvDgVi+DUbx/hJD7zmHDu8kelj+pByuxbGn6MEIk
	BedYMZg5whOjNcO/O1o1nCRPDuQP6zzwXSmuumaaCKVGgVOWKNPUsD16A=
X-Received: by 2002:a05:6a00:1ac7:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82c6dfb1e09mr6141757b3a.30.1774503803653;
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d5d89b5sm1411849b3a.41.2026.03.25.22.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 22:43:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 13:43:16 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: wens@kernel.org, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	linux-mediatek@lists.infradead.org, Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 9/9] arm64: dts: mt6392: add mt6392 PMIC dtsi
Message-ID: <20260326054316.GB910813@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-10-l.scorcia@gmail.com>
 <c1a425ba-a4ca-49ea-9660-5de74bede124@collabora.com>
 <CAGb2v64+oofwTiJTXDYCuzUEpk=zioi16i8a7iMimc_eZ1RPUQ@mail.gmail.com>
 <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28102417-4a2a-4e29-afbd-d0f2aa76074b@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_224324_639790_F9B5F89B 
X-CRM114-Status: GOOD (  27.45  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2026 at 06:22:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 18/03/26 14:54, Chen-Yu Tsai ha scritto:
> > On Wed, Mar 18, 2026 at 8:39 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > > 
> > > Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> > > > From: Val Packett <val@packett.cool>
> > > > 
> > > > Add the dts to be included by all boards using the MT6392 PMIC.
> > > > 
> > > > Signed-off-by: Val Packett <val@packett.cool>
> > > > Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> > > > ---
> > > >    arch/arm64/boot/dts/mediatek/mt6392.dtsi | 141 +++++++++++++++++++++++
> > > >    1 file changed, 141 insertions(+)
> > > >    create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > new file mode 100644
> > > > index 000000000000..fbf6f671524c
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
> > > > @@ -0,0 +1,141 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Copyright (c) 2019 MediaTek Inc.
> > > > + * Copyright (c) 2024 Val Packett <val@packett.cool>
> > > > + */
> > > > +
> > > > +#include <dt-bindings/input/input.h>
> > > > +
> > > > +&pwrap {
> > > > +     pmic: pmic {
> > > > +             compatible = "mediatek,mt6392", "mediatek,mt6323";
> > > > +             interrupt-controller;
> > > > +             #interrupt-cells = <2>;
> > > > +
> > > > +             keys {
> > > > +                     compatible = "mediatek,mt6392-keys";
> > > > +
> > > > +                     key-power {
> > > > +                             linux,keycodes = <KEY_POWER>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +
> > > > +                     key-home {
> > > > +                             linux,keycodes = <KEY_HOME>;
> > > > +                             wakeup-source;
> > > > +                     };
> > > > +             };
> > > > +
> > > > +             pio6392: pinctrl {
> > > > +                     compatible = "mediatek,mt6392-pinctrl";
> > > > +
> > > > +                     gpio-controller;
> > > > +                     #gpio-cells = <2>;
> > > > +             };
> > > > +
> > > > +             rtc {
> > > > +                     compatible = "mediatek,mt6392-rtc",
> > > > +                             "mediatek,mt6323-rtc";
> > > > +             };
> > > > +
> > > > +             regulators {
> > > > +                     compatible = "mediatek,mt6392-regulator";
> > > > +
> > > > +                     mt6392_vproc_reg: buck_vproc {
> > > 
> > > s/buck//g
> > > 
> > > Also, no min/max voltages?!
> > 
> > We really shouldn't set min/max voltages in the PMIC dtsi file.
> > 
> > The min/max voltages are supposed to be the intersection of the
> > consumers acceptable operating ranges. The min/max of the regulator
> > itself is already implied by the model / compatible.
> > 
> 
> Your point is fair, but it's also true that some of the regulators are not
> really meant to ever output anything different than what they are supposed
> to, though, with slight variations being possible... I guess the best option
> here is to leave declaring voltages to board DTs instead, which is sensible
> in the end.
> 
> Okay, agreed. Let's go with no voltages.
> 
> Reminder for myself: there's a bunch of PMIC devicetrees to cleanup in here...

And to be honest, even the default names are not needed. They are again
implied by the compatible, and even the regulator's own node name.

So either we could have a whole bunch of empty regulator nodes with
labels for easy reference, or just have the upper level "regulators"
wrapper node with a "mt63??_regulators" label for board dts files
to reference and add the _used_ regulators to.

If you agree, I can do the cleanup work.

ChenYu

