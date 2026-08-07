Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057FCC2A09B
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 18:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGtkDqO7e+54jvf08NyJuzEW1eC5g/ECUadimlOEYqI=; b=zjH/gFnTifAl6mNgOCNlHPc/33
	KRoJKpV1rXq8odEc0Ct6z1/BHZb53UBHuGsgM0YEOxacCK830O1+XS7vUQC1mqTLsfjuhHV2vzoZB
	Sdvo3oHzND8jlmQ5mWQzviYft3Mab0HZB5xs/FChEjwsQ63aXIiR57cmpEzHaI+yngodCd1qP1CLU
	s09OswmvscmsKX5hJxYmwuVzDReuBO1wgh1B/hcYZgvIfmfZGd4fYYYyXvqDEWz4WK0mv37iN64Rz
	My7ZqH25jh/yAcwNo2TBSkrukzx/Yc6DOVkCFOjymWlDvyaXhH0wRtxab3AOOv/0Maoq3RGEDwJ3x
	ilaJOF8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPlu-00000008dXl-1yVu;
	Fri, 07 Aug 2026 18:58:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPls-00000008dXd-47tI
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 18:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E00F437BD
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 18:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DEAB1F00A3F
	for <linux-mediatek@lists.infradead.org>; Fri,  7 Aug 2026 18:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786129100;
	bh=aGtkDqO7e+54jvf08NyJuzEW1eC5g/ECUadimlOEYqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=K+rwtId/JJsp7Aw67BwNtSGYf8oTs1k/80tLy67f64WjE1mqJ8p1o4Wd3tmwUWnuJ
	 tnf/u4evB0eUq6ooOVQrjOPtN6jugH4GZ5D85jBSHJ6roCaZEODa6tMpbLm2K1Z8GN
	 JFHUKYWP96fsCpQSxhAEIqv9Hbn8SfkWo/PX2cHT2H4cyc0GTxfDus55p2j5ElsOsf
	 jmtgMZ2I67s0sufDbX+plFa8jKOJ+oMFIFV21qe5ZbAhqNQ2rkea9lZaRguYyAZWGH
	 pcW86LQlgrZ7BTvj515EypQKPRn4h7LtbS4I332NzX8GdB0F901/lS/f72L1H57kpn
	 8XgFLp8exC9/Q==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so23174661fa.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 11:58:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrc6jv+eI4v7YbF3JRZWlkBFnRsKYTFatetwJeJURiabVf199KjlyBBnyvjGfkYkqhHpTmEkVUPX8SNYKFhEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKXsCqPhUjAzJPXAARwDFQ+fVYTRcenwBS2Sog6mtGqE79L5Ot
	ywj5r4VCyAAWs/Th4nOs0NoI6tvkGdrC+t8drJkZzxdsTnewlP1YFX7dKR6B0dlT7n3FKTmF9l9
	zJ061DchO8YtPa94EVzVZQZxD28cY0TI=
X-Received: by 2002:a05:651c:a38d:10b0:39b:3adc:70f9 with SMTP id
 38308e7fff4ca-39fbb0668b1mr21822891fa.1.1786129099241; Fri, 07 Aug 2026
 11:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260805084143.3901-1-ansuelsmth@gmail.com>
In-Reply-To: <20260805084143.3901-1-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 20:58:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=LLyod-me-wXKznKLhjjGFTmp7x5uF1nCUL7fMTBpONg@mail.gmail.com>
X-Gm-Features: AUfX_myFt8OXaBF6dymdCU5o-coQ8gVrYgo4gR7tMibyT7NV-8nbLtvGnaWMtag
Message-ID: <CAD++jL=LLyod-me-wXKznKLhjjGFTmp7x5uF1nCUL7fMTBpONg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: fix wrong value for PCIe reset pin
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Christian,

On Wed, Aug 5, 2026 at 10:41=E2=80=AFAM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> The PCIe reset pin actually require the bit to be set as 0 to work as PCI=
e
> reset pin. When the bit is set as 1, then the PCIe reset pin act as a GPI=
O
> for GPIO44, GPIO45 and GPIO46.
>
> Cc: stable@vger.kernel.org
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Is this already fixed in the big Airoha patch set from Mikhail
that I just applied?

If this is *not* fixed in what is currently in my tree I need
a rebased version of this for mainline.

If it *is* fixed in what is currently in my tree, this can be
sent separately to the stable tree as a backport once
Torvalds has pulled my changes.

Yours,
Linus Walleij

