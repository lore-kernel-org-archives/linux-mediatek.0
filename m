Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0422CD6E79
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 19:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpEx0+La6xp+uh1Gw4xWDWNT+FHG8ZwUhMggbL059Ps=; b=DgY9arGZYN7g5wUN30CQk+8lI5
	ytI0rsbNql5bSoBNuusjwMPHQvSZcCzjKwp6OTzRZxTZYSjirvIhzPbsr3pY/uNoyOfE0RU/I4T7A
	aZd8Kplp6Vws8Ldg2U2n7hovHGBu6m8iYJReKK7TsGRMd6srN1jzm2bDiuDe6PzQQR7pJ5j1cXLsv
	v0odW3KEHUg097UrBQQXHr9ueHWvVXtD6vCKZvoxNcbS0hkOFCJaZNlX7DtLkZbzPmdPiX227zW1h
	NC9bmegJNg70GMLGBMIyHuhpnWGclC4P0L6SgCvmpDejuDOTQmPQgOOjdyH889hyfuiFeNSUWLvRA
	mGmYVkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWff4-00000004JKk-0CkS;
	Mon, 08 Jun 2026 19:29:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWff2-00000004JKM-0Wuk
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 19:29:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7CEA543CDA
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 19:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF531F0089C
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 19:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780946963;
	bh=rpEx0+La6xp+uh1Gw4xWDWNT+FHG8ZwUhMggbL059Ps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=SbK/KpmL0hK94CtJySNbWjwrOrBir/D8yRPZFlVo/glJnlPXNqrssNEVbb23xC21a
	 fneBsk209DjPKm1sZBz4AB+8iCgBglm1aIBnDODDZB2w07sP/kTlTGUkMw+qLEg9F6
	 LEbZu/kGIyGYSHR8fpESWqq3fYleGrg4QrylR1RgqkIBORetJdvm/nIrJG+qaXJbQD
	 6NBKuudAnuOFzgbJDToq1uE2jvjRQy5frO6fe+/wMlSIn+gJV0WpLMEcrqSwmQEKR/
	 bN3slQ0ILi1KzaLPLN7vRUz0nONTWfjytfVqT/qWnM3VLTl0gIVqE2weKdVf2lYKRw
	 nWzz5owJsBG+w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5aa7a70c0aaso4777709e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 12:29:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ97d7w8Ga9ewKISU/rLXYLbI8j68M3fexH/uCMqsxLFrpNlRSiV+lCNu5bLzsyU4Q1MeByEkpipata3POyWtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN9Wje/XWFlWJSh8P3j0JfjCkW5H2NLS8MXAO7KbFXoX51sFhf
	nfLbOP8oeGnWhNOPjeI2t4daeokTqPtCsbZQcMYs725qDFMl1AEC+kv0uwfvW/pcD+kut2aKJnv
	3x0FvgaDFKIXXZiIOGqKkPycg0QxobGs=
X-Received: by 2002:a05:6512:3c8c:b0:5a8:9909:50b4 with SMTP id
 2adb3069b0e04-5aa87be96a3mr4844941e87.21.1780946962145; Mon, 08 Jun 2026
 12:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260529100308.51271-1-justin.yeh@mediatek.com>
In-Reply-To: <20260529100308.51271-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:29:09 +0200
X-Gmail-Original-Message-ID: <CAD++jL=V59hoE=7Xv3=2kyO6Z9PbejiStUs5LXOo06fCpn=2xw@mail.gmail.com>
X-Gm-Features: AVVi8CeHjAMDyz1xo5GR6gfqE45MW1Df0V_jwU7JlxT5b5PN4nUKH4NEzlAIG3g
Message-ID: <CAD++jL=V59hoE=7Xv3=2kyO6Z9PbejiStUs5LXOo06fCpn=2xw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: mediatek: Enable MT8189 as loadable module
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, May 29, 2026 at 12:04=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.co=
m> wrote:

> This series enables PINCTRL_MT8189 to be built as a loadable kernel
> module, which is required for GKI (Generic Kernel Image) + vendor_dlkm
> deployments where vendor-specific drivers must be kept separate from
> the GKI vmlinux.

Maybe tell us that this is for Android?

> Patch 1 restores the tristate option that was recently changed to bool,

No the driver was merged with tristate.
See
commit a3fe1324c3c5c292ec79bd756497c1c44ff247d2 (tag: pinctrl-v6.17-1)
"pinctrl: mediatek: Add pinctrl driver for mt8189"

> preventing module builds. Patch 2 adds the missing MODULE_LICENSE macro
> that's required when building as a module.

So that should be squashed into one patch or it will not bisect.

> Together these changes allow MT8189 pinctrl to be properly packaged as
> a vendor kernel module while maintaining the existing built-in option.

So why do we change this only for MT8189 and not for all
Mediatek pinctrl drivers?

I would just add this tristate option and license to all of them while
you're at it or I will get like 20 identical patches and it's a waste
of time for me.

Yours,
Linus Walleij

