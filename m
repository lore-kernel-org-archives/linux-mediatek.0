Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E713EC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 22:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=; b=NOoroNkaRF+kiW8jHG6zCZMdrX
	gykR34JSDJUNpWGCCh0mvaqPdntd9d1nYJfpyxMzU7aY6oBv/JbwdQKdRV49lZa768iIC49n9Pc2x
	6lTB+WbW+tuIvg56QMX0rlIUL+fa25HIgxTNBIJAVUaTYR6JhvPDQYrsFEJUusQeS798VJXiTmpt0
	RPzFHOeT6SEoOZVK1mOy0eRE8Gw+25PRrY6JWYdmo0810/d9eHhnsuptq9XWZyzcqyoixhif07Drk
	ze0nvQGrYuHH7ubxYVLiNeyEVdv9GYpihYRRRVsVL+Pd9ps3hI41cLbA/7IBOydNSjnOSAVZkejKJ
	Rp3UIekg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cUQ-00000003PA0-0yq8;
	Fri, 04 Sep 2026 22:34:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cUP-00000003P9b-0eyV
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 22:34:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5542C60A75
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FD2E1F00ACF
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561268;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrkZP1fGcTwt6l1b3jkWGYaSn431/rUyRqcC4ebfPJsfQnm46G4qGy//kIvXB8KZJ
	 gBedRcYLMTmgbgXePKlvoiEVWtEiiDeNF4DWqq6vK5RzeSpOhN6+NaMqSvbGOcK9y6
	 qoE9OUtZ7jNUwAxIHnFS0tjuV9HNsqkogzH14vK8CZ2BVXZHDPkQxNvj1Nm33fbhA/
	 jH3nn+bKP9XR+0Tkuy2L2UWpF54VyalJe6HK+o9pyDHq0hgCZ+XIaZEX99D5aOwEUz
	 454iC9ZIwKAci5b4L5nVncyb2AkpUbivoT0cFeVHO7rVhU84cJOXvWAVcZVtFYQZdZ
	 sxWzrgSnb10qQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39ca300db70so13701841fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 15:34:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzkFt023cGPCsYCVqqQSbTQhd6t8VDceQa54hdHzxib0OcosVEMm5VhqLNPOrtzDHO3tZPWT+GnSonSwQASCg==@lists.infradead.org
X-Gm-Message-State: AFuF++lpb+iQ0fT1CvQB94etZ1RVWtNXOrJyvlgGUUHaZeALQdlZUOqZ
	8nzI++f5eW7IP/Y6uSSguxih8LBpJ2FV5NMvn4uOg3NG21Pn/kJ4PSOjnM3v0YqiLQ+YHn7TLX4
	ktI3cWvhnWo/GtNmCBv6E2sHW9yY+ctY=
X-Received: by 2002:a05:6512:1313:b0:5b0:22a6:6b13 with SMTP id
 2adb3069b0e04-5b616e717cfmr1606890e87.0.1788561266181; Fri, 04 Sep 2026
 15:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-21-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-21-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:34:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=V6eLEywiyKKFCQMZikQ79ULaq1uPYAQxu-rtYuSW7CA@mail.gmail.com>
X-Gm-Features: AcwNN1X2dJF1quKIRJ19ZE4zvP-mImnANUJmKgqRVeK17MZA2wOCllak4fdVdf4
Message-ID: <CAD++jL=V6eLEywiyKKFCQMZikQ79ULaq1uPYAQxu-rtYuSW7CA@mail.gmail.com>
Subject: Re: [PATCH net-next 20/33] net: dsa: realtek: rtl8365mb: Remove comma
 after sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	luizluca@gmail.com, alvin.sipraga@analog.com, clement.leger@bootlin.com, 
	justin.chen@broadcom.com, dlan@kernel.org, rogerq@kernel.org, 
	hkallweit1@gmail.com, linux@armlinux.org.uk, rjui@broadcom.com, 
	sbranden@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	opendmb@gmail.com, andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, 
	amadeus@jmu.edu.cn, kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, 
	horms@kernel.org, vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
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

On Fri, Sep 4, 2026 at 6:39=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@ti.=
com> wrote:

> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

