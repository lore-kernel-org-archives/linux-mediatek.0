Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F1FCD6E79
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 19:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLpibFS+5Lc7VxgiVaeI5cCGVed4eBL/hTebJNldyVA=; b=NecQ62I/1S+192buIzSFm/0DIF
	DVppOnpkbep80cxaTMklorgj7h3ENwO2QEmJu8BxHIi8Ck6MJmkySZI5m8HH4KD2B06eexBD/dY2E
	DFLdCOUMFKxzmQwQRAuy2Esa+s2a9bKxRWMDFz2Fi45ujNRexL70K9ml0llTLANHx3zMPlO/NMDUX
	N3ttc84R0CpcH9eUxdJQ3HgumXnYtwYOIqNes5QOErauIx+oiA7USQGJzHfqILoeX74jMl2mIQZuE
	GjUTS1XooKe/G8cmf/JlBt5jsCSyk8UiqGV/daLAm3r0YO24JC/XbNyxBDpIIsAGBFw1g0MighBJA
	hSTD0mnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfr4-00000004Jdl-11ff;
	Mon, 08 Jun 2026 19:41:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWfr2-00000004JdV-2H5E
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 19:41:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C91E9601E6
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F61B1F0089D
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780947707;
	bh=BLpibFS+5Lc7VxgiVaeI5cCGVed4eBL/hTebJNldyVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WdyC108xzDVINL+da/2skSYY6qEw3rEDX9F/iZr2KPIkJd0KacsRRPH5nm10cpPvj
	 Btt7ftSjxA6UqMh30hUB1MNfcHLikoRoaTONvnqpIVL/tY5xUMberx8kH36VZd506E
	 5htfp2IumiZ5eU3KSvFB08JmHM8mu+U3AG7bWAKQ1iv9P7mSte4+8sQX26vThCy0dX
	 Y/Q1QaRe/H27Vg4XSJj4oSEs9Y23TjBpwll+DgTBOQ+yGIOgUQmsu9u8/AxZVcAdmY
	 mP1R6KQ/IgfZSVY7laWxuOcfHwbzszuNc0lr6NyXpi72YgmnW/ne9kK0Asu5GHMpn1
	 yTQd6Jhz0ckCQ==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3967620ceabso45492911fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 12:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9qMMYol4A6QLs0XqCCnqTzJC8K5snuLPMpM+bksjFMFs9AW5k1lbSU58dDaVxPeWLoDgpN+mFCeDMLiamKkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9YUU8xhHAsJXY+t91F3IorLks301Eu5ouLXKUJp/AJm9Z6hbu
	OgKboAjJUTfdMvf1isL9V3WjWt4OVZFhEHXt7N7nHzWV1238qQeG4qiNxlrn7Zs2kBskSylGYY+
	M0e8dme1S7531kX/pdafMgScG94lfOiI=
X-Received: by 2002:a05:651c:890:b0:38e:58c7:cca with SMTP id
 38308e7fff4ca-396d094cf1bmr44352071fa.13.1780947706287; Mon, 08 Jun 2026
 12:41:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com>
In-Reply-To: <20260530145800.1029920-7-y.oudjana@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:41:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
X-Gm-Features: AVVi8CcfWWYi2fGJNDF5xiud1cjk40ojeeoy7Quaf-aXtvu2im0R8N1WQpdd9og
Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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

Hi Yassine,

thanks for your patch!

On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Sashiko has good comments on this driver, look into them!

> +config PINCTRL_MT6735
> +       bool "MediaTek MT6735(M) pin control"
> +       depends on OF
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_PARIS

There are in-flight patches to make MTK drivers tristate for
the Android GKI. Do you want to use tristate for this driver too?

Yours,
Linus Walleij

