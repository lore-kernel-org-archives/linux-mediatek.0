Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC5BD0D17D
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jan 2026 00:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FNPYNYhR1kjj2zWJy9oyiLEOrXpx0LEturTm7uRBNdo=; b=MYpitHce+aEjFF
	GzdTiWvy0uRfk8WHgCFvnhXb9WCS/gSi7817OGc+jUrpFr0bmC6Fd8p9T+Nl5m+TzeP5Dnnutx3nu
	HGHVZx58TcWPzlxI4OIrTUGrh0nlalcFoxvYL2TCrfo7GVTyVkSHD0yAomLhgObacI2G24N4An1ph
	uqBa6qk3yzK/0q7QlhUPqdmXK707wsuu2Tl41jf9TQecHzb66bCWFRXAySXsULWoJJWwTwQ803WCD
	pJJslVTX6YpSailR6k7AYHherNAb3ugzjNJZ9l9G/X5/TyVrmw4jyIyEhXbFGgjF69+INkb5e5OTq
	pQwA5EDlTNuzh6Z05SDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddqR-0000000Fm7l-2C2y;
	Thu, 08 Jan 2026 00:25:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddqO-0000000Fm7D-1Yjv
	for linux-mediatek@lists.infradead.org;
	Thu, 08 Jan 2026 00:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7D9F442F8
	for <linux-mediatek@lists.infradead.org>; Thu,  8 Jan 2026 00:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85C6BC19421
	for <linux-mediatek@lists.infradead.org>; Thu,  8 Jan 2026 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767831937;
	bh=dKpvfWhR+ao6SRp4kUICqTTWzO7/JiKNMNbKfPilDpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o+iSKdWJNZubEaw2VairlWyVdJTSZcyFCq6bk1fo2xRjoOO5sT3i3hwWH2fmu6Rwk
	 zijOFlsg3xed3WBwr3J33ccpgA8EnkIauMCZRzYwA7p6ESY6j2v42uUylZN7kfnRcP
	 x7Pm0+Nq6PvglbBH2Rk4Vk5R9ssqaVpJn6x4NC9paLe6RdOoAecV6VgNO+xCrcXahN
	 2RvoKIDI9NhhrwaN4tR3/WqqttK7IOSkF8cZ3KBIhLkhV+KdyT8v4wEA9s7YPavSoJ
	 SNZGV4QUOgv6MINP1Ei3GgiAxpwpzZWIaBdxYW9ZdCRVSKiXvUJbWCULo8B8Ew0iW/
	 +Ghf20BgfpCDw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b7ce5d6627dso534188666b.2
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jan 2026 16:25:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX8IlVS4l29jSnquJnQWmpDV3n4O/Al0NlnPXf3Y4Hk7vGNLudWZgQYyizSphr1TyFngNLBIkyJq1jrVBJn0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoHqnkSPBVQM715blnahDzuYVgj8xoJo8daR9hQjjlMe1mbnYx
	gIN05osA8MQ1x/g0nm9EaBVXogjQve25HUCdMmEaVgh1tCNOpP9xMZekUhwbpe5xG5MyL0pwJa8
	EBrTbjMGwuO6or2k5lNPGX1HmHvtuKQ==
X-Google-Smtp-Source: AGHT+IHGbdOq9A7ht9GwHXUB0lkTxrQU8h32ytsd60tIWq2VQbXNaEf7DbGEZB5drNoTLCE118ndwLzIrKNWa4uD3U8=
X-Received: by 2002:a17:907:969e:b0:b76:4426:3a3a with SMTP id
 a640c23a62f3a-b8445218177mr472166366b.58.1767831936081; Wed, 07 Jan 2026
 16:25:36 -0800 (PST)
MIME-Version: 1.0
References: <20251119175124.48947-1-linux@fw-web.de> <176778436967.39195.1901837532049373497.b4-ty@collabora.com>
In-Reply-To: <176778436967.39195.1901837532049373497.b4-ty@collabora.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Jan 2026 18:25:24 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLdLaS+9q7_BgtjH-ezX6Bd0r9_GaOM59CyUctCm84kZg@mail.gmail.com>
X-Gm-Features: AQt7F2of3BOU5fJm5dFNBkUc0jh06Bp6eZBJGWiAa-ihxq2BG_e8zm-MeY4S07E
Message-ID: <CAL_JsqLdLaS+9q7_BgtjH-ezX6Bd0r9_GaOM59CyUctCm84kZg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] build full dtbs for BananaPi R3/R4(Pro)
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_162540_841497_633084A6 
X-CRM114-Status: GOOD (  11.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 7, 2026 at 5:12=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On Wed, 19 Nov 2025 18:51:21 +0100, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Build devicetree binaries for testing overlays and providing users
> > full dtb without using overlays for Bananapi R4 (pro) variants.
> >
> > It is not required to build all possible combinations, only for
> > common usecases and to test if all overlays can be applied.
> >
> > [...]
>
> Applied to v6.19-next/dts64, thanks!
>
> [1/2] arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bp=
i-r3
>       commit: 0516c548883bbe58a48d604e81e33b390986cdb6
> [2/2] arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bp=
i-r4 (pro)
>       commit: d977b61d38030f50bae9f634049110af0a364d0d

These are already in Linus' tree. I picked them up because there was
no movement and he was complaining about the warnings.

Rob

