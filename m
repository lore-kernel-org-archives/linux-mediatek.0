Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FDE5CA1007
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Sep 2025 04:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOpIoZ+QJ3yKu2lp11f+X+mDcgCMYdWaEANVtuakPuE=; b=OS6p+pO2rjHm8MLhb6M4EX7exw
	C5uxr9EzRsDfr9nAbe+CXR38ks8gpMlKk9eew4y/usqgPgGCi+CDrv4ioRphT9UIsVheLDObTReBB
	oG3IWRSIUMNmuTUScL/GC6Lcj227Wngvhr3J6RP+U7eqd3Ivn3fbd2E0MnfWJXwxH3UzUrE9Yu+oK
	JQab9LsnrvjzsqhmHGNkH/lRaMIZsuifQuBf0YMcQFh+s4ID+prN48weohv+AibNSU/HwYANYyOBk
	rPAzURGCSLwNNYbRmbtYYDXmT+sc0QbyrToQxoJvQ9IsD/5HoQq0cMbeM2Z/83P6QFcFzK4k4upnv
	x024H9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uteq2-00000003lvC-2TlL;
	Wed, 03 Sep 2025 04:11:14 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uteq0-00000003ltY-1G00
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Sep 2025 04:11:13 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-336d84b58edso29622541fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Sep 2025 21:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756872670; x=1757477470; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOpIoZ+QJ3yKu2lp11f+X+mDcgCMYdWaEANVtuakPuE=;
        b=EAdkD12S5XdSPu+Ombl8llgxrtWkIoC13ii0oUNcBm3I96SmHFK0OK69xv7Fo8esW9
         LGx6X+t0LBfnHnQjbXR3cCbEVtO+vSX4pTsToDjB63srAt86Jn7tcLZ4V6vVRfgRfr8T
         V4+pAuQGPv8w2UhRlWVmclsN/C4ntMJBOpWyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756872670; x=1757477470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOpIoZ+QJ3yKu2lp11f+X+mDcgCMYdWaEANVtuakPuE=;
        b=KDD+H2M9IedIlJ+tpnuEYYnYA01fAuuhplm8IQUPDZw5t5HdDMjGU7d3IoX+iAQwjF
         wM7DCoLadYNrn6/6bOzfg23p62P4V7cLUr+BlodAUpxq5YEhwZouiXOqVaGw2yvD10UH
         ++87CDqVIctJygvPvXr/NtdYuyWg+B+IhPKqnRUEegzSeaHexPXIV7Eu/V2bOyYFDpk3
         xIfnFaJGnk9VClf6s/dgqq5PFYngXop74eZyhwOKlb2vw3czL4jhw6Z4jpH483pCYOAK
         2gZxUBUG0ffkEX1F8xZzw60R8DilKUWNy8AafvoLNyfzvgMsAogwAfuJZ25jLzn9w4Qd
         d51A==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8xslw9IHdKNgtl7OpmI0fr1hqJ63HWoekPdpmlmouBZMjdFKlKeI/romWxspktkadYypN5prvS/OSR6Mhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzdhtUFIsL7EUgHO6xFOO9KVqLDZmzg3QaRZNgZAIl6cwqahpq
	iBox+a5Xwak1zweQTKk2LL5zqZ3JQUWbP+WF9jrbo98oPWjjJnA1nljA1IYH6tyRL6cUkL93LbR
	TTn2/JvzIITMXlho7VnDTjo3vg/RVGRdFSqyO5jmd
X-Gm-Gg: ASbGnctoxcfW9XyXxIyqDAfF9uZ9gTmYP2VX5cvmCnHklZTR40ZiI7gJz9vkZd/miIO
	Gr8ITu+xN+Co7XH3MnBldDzmUKBDBd2iyG0vow5njChudMrKF4U4XxbMnrmxJAfK8No9nBbSltG
	mMlxr0YzBeL35LsQCPoNBC2CTJDPLEXTjiNXLfsLq/OB/qwQ3/yH//+PkqzQlm09Oa20qErELwa
	4y6MTgLu5n9VrLizmaLDm2TxJoCb1xw+sUblQ==
X-Google-Smtp-Source: AGHT+IETiwoqu3jA0q9QRK+CqDCEcgW+ZXk2qygZizGlpal3JlGHcBuz5NWXPRG3Osy7OAGRM6Ng6di200B3S6sTE44=
X-Received: by 2002:a05:651c:3246:10b0:335:40e6:d051 with SMTP id
 38308e7fff4ca-336cb0dfa15mr33548211fa.44.1756872669828; Tue, 02 Sep 2025
 21:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250722171152.58923-2-robh@kernel.org> <5d7557f0-841b-45ea-901c-5b595ac8bde3@collabora.com>
 <CAL_JsqJaC47zFY7zvTVFum9oMiV87dgo49a9e3HW1T5_vQtAzA@mail.gmail.com>
In-Reply-To: <CAL_JsqJaC47zFY7zvTVFum9oMiV87dgo49a9e3HW1T5_vQtAzA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 3 Sep 2025 12:10:58 +0800
X-Gm-Features: Ac12FXwYb9oV3zYXJk8hHuf8yXRCNfDIMSMGlmD1yfi_WJphj9A2DKWKSeZdpBg
Message-ID: <CAGXv+5FWTUkjWCyFhnryq2nB9NN3wQjKeOYf-NReYjMDXmgiuw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Fix out of range pull values
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ben Ho <Ben.Ho@mediatek.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_211112_331228_8987AFB4 
X-CRM114-Status: GOOD (  24.72  )
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

On Wed, Sep 3, 2025 at 9:53=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jul 23, 2025 at 3:16=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Il 22/07/25 19:11, Rob Herring (Arm) ha scritto:
> > > A value of 10 is not valid for "mediatek,pull-down-adv" and
> > > "mediatek,pull-up-adv" properties which have defined values of 0-3. I=
t
> > > appears the "10" was written as a binary value. The driver only looks=
 at
> > > the lowest 2 bits, so the value "10" decimal works out the same as if
> > > "2" was used.
> > >
> > > Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> > > Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > > This is just a few of the warnings related to mt8183-pinctrl... Media=
tek
> > > is #1 for DT warnings on arm64. And by #1, I mean worst. :( It would =
be
> > > nice to see some progress on fixing them. Otherwise, seeing new Media=
tek
> > > bindings rather than fixing the existing stuff makes me grumpy.
> > >
> >
> > Thanks for this fix.
> >
> > You're absolutely right about this, let me check what I can do (and if =
I can get
> > some colleague(s) of mine to look at that while I'm away in August).
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
>
> Is this going to get applied and into linux-next sometime soon? Only
> been like 6 weeks...

AFAIK Angelo is on vacation but should be back shortly in September.

