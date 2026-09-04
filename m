Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9DCC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=; b=qDyssOclSdGX2jvkzLlbuz+nRj
	08PqXVWHY6ikRL/U2o8FYxwVwQuaodHf9ltPLPoKCbE00LdMlg0jJwB5nuJPRRHbgC5w6duupHaDB
	ksE6Bo1/tmi3ZVG9AyVDX8pGaS1UX5wqJXV9eijvm+qBc7o7CXbgYJE+JUGFeAFaubfwcwFvXDWBe
	TcGAEeGuV3Ys0jmQpFNG1jzA9n9HaQLka3MyDL99ihsbiIr8VZajQtMzZIR3c/Ue5C33uN6PV34Fs
	HOoB09NPPsOrd+KfpAT5t/IdBS4CJrEvYB5EMtz54aot3EaYDzDTbchLW0+m2WMQCgFNdxODOPfKa
	WS+VZWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWa-00000003PfI-3hB4;
	Fri, 04 Sep 2026 22:36:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWZ-00000003PeT-3sBF
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 22:36:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F92660A90
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23D11F01808
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561403;
	bh=dft8jIKZLyvDmq/LPRhVyMm6r8WW3Y1LCnA91drhmyY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lLtTYf4uxxXxajwhPucCVZnP4cLlC27gVTBtxi3KbE8tvJGytfaXJZPn4dzzuHTf0
	 /ybspuVH8kciv61euxbEMT3U5Y8HKNkTPtr5aX1NOxzzcWhkww0mRiJnPFGQBf4Zkr
	 IgFgLNF+Kw9fO41fwehzs1h9eLabrrUdIQCE2uafivdjRtO7MQtOemsGbsJfkItJ+P
	 m+pb1c/YtLihlXXwVH1xPtA9LH2xw+TDE71prvWTGoOMzEDWZuxc4FhGmdtIg1BfUO
	 FZ4UgWtT+IYJJcjIvGyEr0LUg1HbDpR94DWXCcxRCZQwIbRCmySpu+mGuRAw3FnVC1
	 6mpvHNFsbQ4gA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1a3bb6c5dso13514061fa.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 15:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx00YPd8bGxFzFTz4hH3H4ZgTGF94xVudW50a6Z7ZQI5AhMZv4QcSEH29TZ2hRIwMcJfHObrEggDW7qSIie9w==@lists.infradead.org
X-Gm-Message-State: AFuF++mMlC9odSNpXQqrUVuyQRQIZRo0UwOcTbA/e1NZQr1LKXAVyUIN
	zo3YisZA6DEPJxM3n++p8jCtUu55fZbmqf4ctvFpe3rYscEyOEJlGB/6W1gvYpxnMPuYgERjoCF
	UJiPDJzmOorP+rqTsoWeevbWuwW+Tiy4=
X-Received: by 2002:a05:6512:250e:b0:5b1:5a2d:55f9 with SMTP id
 2adb3069b0e04-5b616f3215dmr1620442e87.21.1788561401588; Fri, 04 Sep 2026
 15:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-22-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-22-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:36:29 +0200
X-Gmail-Original-Message-ID: <CAD++jL=c7Hbfwbngr2HQ_RTUizL=hwQbTa=C-oZNu2BAjLh0yQ@mail.gmail.com>
X-Gm-Features: AcwNN1U9I_dDB3NJSseFrC3_GFY1Eb30_yQ91aHRnm5hTr_W3IoNAFdaYoLTgAE
Message-ID: <CAD++jL=c7Hbfwbngr2HQ_RTUizL=hwQbTa=C-oZNu2BAjLh0yQ@mail.gmail.com>
Subject: Re: [PATCH net-next 21/33] net: dsa: realtek: rtl8366rb: Remove comma
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

