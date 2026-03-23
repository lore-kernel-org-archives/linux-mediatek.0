Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537B4EC01A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=; b=JtAJHrhN43FuFG4k+/0RDWLCOd
	cc5C+50tDuGDwlOtljFpcY5eY5ikcuaojdmbMAxKD3BdWAm9W5mho/8oal3Pm2swnIqjCoV3nnsEm
	3ZjYRRcnBTcQnBENdATMQVt7M+QNflVP0NK23CkbigYB8Y78avcVeSkR8D/5azIFEF3R1KlQs/zCh
	9lx+Z9SfBfMpEeNzxldRu9iXcZNQd9Cocwd8MngkwziBW+/PEIb5JDK/Q3X2KJZ84R0rhMwYzsT/J
	XBkoYlChrduKasNLsW0hG45/EdDa1qFQSMQTko91NkbLxH4fQjDKfLLgrTDs5lg3g0O46Qp2NdPIG
	YW9hio3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ac9-0000000GHBc-3g6O;
	Mon, 23 Mar 2026 08:26:21 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4ac7-0000000GHAl-1xcF
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Mar 2026 08:26:20 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a27dddecb0so5433241e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 01:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774254377; cv=none;
        d=google.com; s=arc-20240605;
        b=c6+kKtytCFVeWzog1nvd4n4Q9+pZ8wzZtdLZ/Pi6ogFjwAJ50i/VxHMtc4pjqDAv/X
         zZjDQQiIChoi2PvGV/eDPpa0ERVnK0FSj2SaBlr2dURPOVhGwjG9ad0xWw7LjvOYnnb3
         snshk8wI9CdxvJxFYH/sOAnJK2y3HdR/WJ1FFGbCRZ+xwDw2IpP+cc3v4zpEQ+wryump
         rclYKNRbe+VctZpum7zfvmshy+VV8h2GO7tVQegM2lnRgSTacndxxuPn+TYiPyLY1qqH
         /DzLrveOXpUBIq9701TThDkIlYeCH7HHcVmNX5LII4aiF2D2BmaUULFa1Mc9zSrEKY43
         Ul4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        fh=v2K7DbrbW74ffT9Kp7RPsF1B/lLG/WHYeJAQdQ6bvAY=;
        b=FZ5GzHV0m2Qx7Rqb9jisH4T6Vfndy2cq9iymJdT/xaopgXx6UZVaEnLvQeBLUMezCn
         WUVU/vF/JCYI07Hz3oigDi31NE2Ks029HEUDHDvQtdgRH2YvHMD0LKYgCHH2BMtHCQsE
         XVvIIcbYrhKO4fMukYGEVQjAkSOWD6fdrRXGQC+EoKZLHW2Q2NxGbwLEw6PKpzmD6Dku
         a+1v4aByApW7u4QyU02yI0BtEwKYmUBxxtnVH281IqyEG+LZO1r9S54uJ5memeh+wPqG
         yGhoqpRBzXh8+UU4UJej9vSkDVexHIKpQhM3s1XEVZ0rsvbAe8GhRaWGSJt3wEL3pK5c
         EbhQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774254377; x=1774859177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=TWZ6tdvMpzDDv7N9+ikTbFUJDd9kWlga/ZJNN70EWwYsOXSBd9PaV7Ij0D3mHJq1Zh
         dejMC416dv3Ar6Kv80Q3prXIUwYeLXxMlolUFXxN4yD+IlGzTfQvusg/oCPqUDUoAWme
         OuiaXThBuxY+EzQMdAHNBJgCEOUtuUq1ZcgFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254377; x=1774859177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ewr7synVuzHzHm/axWuA/egZCARyhrqnQ6eWhyHoFrc=;
        b=i39IRr+QQrVOUwIZLGic8mkwUp/ailkQMQqGrB8V9791TYQT+Z6xrCZ46s/oCiNMfh
         PM4R+QJNP8TGVyCVvBXCd9bW33g4fh9txECY7Yi9V5Fff3iG4XxHtC3qALYrb3yAwERD
         Ch+nqsSLJzBfaFWP4DTHldAXF8iTeMlY1z9+BbVoBWUh2iUm0r9ie5CMm7OiMb1kexSZ
         pL+nqy1N3rSUUcR+RnrFqJNGix13ELdhlvtLmbcW6MesmaKA01PfA3U1mEZydSKAJzAn
         SUfubItuRL4UcY1+CdQEEJOc3xi+ReQwFrRvzie8T1LaXJSolX4eyjuNuT27fv/he2B6
         ywrg==
X-Forwarded-Encrypted: i=1; AJvYcCXnJcKDBKVbAc28xwLAZveRGewg1l3MIJkDihMBxjnZ0cVVAmyfHFBLH93qA4JAr7qBYh0xZb81Pe9paz8YGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHbjX/g0S865AZcKEFi0iRiYLb5W15oF9R5f0vZ3XxJRdRzDVm
	B0uhZ8+ebTZ4LpPUhJCilui3JlcYBQODenCPUM2yixnmh8TBHVrbQnBpxpajNiuo9SnW04tw4xC
	wYByDXXAsGd0zSZ4IZ8PQ1lk3Xlk6RhBwLUDoLA06
X-Gm-Gg: ATEYQzxICwh07fVeqqwLebAKvlPjS9pG0UmGJjDhR1qkAVzxCBFv1hr5KM78Ypx4MuF
	cyuDjpmCeK5U4vEoVh4i/uK5y8Uq6obrCQGaynK9QmRh6hz/Bkf1GODE/EsYJJgO3cupdIjksEW
	nb++qOHk8RKHpSvMZAijJoxTxjkGSIBO1/WK6fg+3B8JO+gr3Iq2fAEG0rVZrvuCWgDSTx+LE9t
	Sie4WhuWkHlvOWJ4KL71szjaZ4ZZDXlPVpvyg0YY3VcOE1A2CTRnZgWYkJpJH/RajjwFmYgYEQ3
	F3qfCDVzK+YarbaSBwkx65qHO3DUMKvUw90MGA==
X-Received: by 2002:a05:6512:2398:b0:5a2:7aeb:e7b3 with SMTP id
 2adb3069b0e04-5a285b5a313mr4975966e87.29.1774254376478; Mon, 23 Mar 2026
 01:26:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
In-Reply-To: <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 23 Mar 2026 16:26:04 +0800
X-Gm-Features: AQROBzDENi91NMB6TuyZQ44MdmtHHQSMpI0v-6B3nRxQpz8HCuyYhfE2FGI06HY
Message-ID: <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_012619_691420_72F7AB90 
X-CRM114-Status: GOOD (  18.41  )
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

On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> > vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> > two enable bits in the registers so that BT and WiFi drivers can toggle
> > them separately without any coordination. If either bit is set, then th=
e
> > regulator output is enabled.
> >
> > Unfortunately some of them are already referenced by in-tree device
> > trees. To keep backward compatibility with them, keep the vcn33_*_bt
>
> So you drop "_wifi" regulators breaking the ABI, no?

Indeed it is a breakage. I kept the *_bt part to cover all in-tree
device trees.

But the representation itself is broken, as explained in the commit
message.

I leave it to the platform maintainers to decide whether this "breakage"
to fix the broken representation is acceptable.

Note that there is a similar issue with the *_sshub and non _sshub
regulators: there is only one actual output for the two. I'm still
asking the vendor for hardware behavior specifics.

> > regulator. Also combine them for a shorten regular expression pattern.
>
> Instead the duplicates should be deprecated and driver should still
> support the "_wifi" variants.

But it doesn't really work in the driver. You cannot set different
constraints on the two, especially conflicting constraints, and expect
them to work. And if you set the voltage on one of them, the other
will change as well.

If we want the driver to support both with _sane_ behavior, we would
need to introduce some sort of alias lookup for both reading
constraints and resolving supplies. The driver registers _just_ one
regulator, and both DT nodes resolve to it.


ChenYu

