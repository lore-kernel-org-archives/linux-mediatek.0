Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15859C79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oXwqSl9Gxhd9ASYzU33CVNwSksmytljDqKt0iBuLvI=; b=xVdwEG/hEsY5caIl1LqSDxXrJv
	6JKiPLpuHh9ceRhVAubhxaeLcPaGA6RVKYUTyXQAe6aOZckxkXG47ZQYAvGxwxjlsd8RJPyQm9+rc
	vvhOP93+L9h1dMq6gT3eNKpkxvbBocSvTIYdAbTuLJg6yrgxuURig9OIgRnZ7+JehTPsTGISSDWSN
	3jRMvlWkzCNB7wakNS567tmoeg3EF7AVp0F1qUhfPCNNnOawzg2ubMK5AiKunDuqKRN+lU38FDwnm
	9KeyFZOyyNSXda76+qHhrbDferuFkkQyoyL83kTacUv4ZYPME/4NSryj3T5pJmChHmYHOw8UVsFVM
	9f6l8xpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWI-00000003PZ3-3E45;
	Fri, 04 Sep 2026 22:36:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cWH-00000003PYV-3iem
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 22:36:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A51B9444ED
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F151F01565
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561385;
	bh=/oXwqSl9Gxhd9ASYzU33CVNwSksmytljDqKt0iBuLvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=GlVbCwxddIH2dGDoJPIA/h2Tst/6qBA1KGZqh+6T+wL3wdW8xpNgyzaSqPTvBO3IW
	 dmWsdWcd/TE+zleN5SMZD9rLM8nV3rxKKRQIlCABrM8elVbNhL6ZG6n1LB+RpwiAMR
	 mWEEHJ2ijqefgTMOVlyCe6A4bK22tcocp1M1amhMsGRuSaSdQeiKrQjGl8ma2dSnqI
	 7iGskWVDBlHW02icgqAP7VeQOEbWbRAIUSZMRyRq8VivPjFPHzPGt2yYzma34ys9Tp
	 2OOnvpmEk8u59IFhysAtgxkO25ylitmXa46S7QuFOChTDJs0sRRb3d7WqqybV3DH0y
	 vPUw1DQqB7/xA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b01910b499so1428485e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 15:36:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByE2/SpfCOmlZEVB1/fVjbhMFno4/Tc8rVFa5RCLCvvx2rK9W8PcOaGpGM+HoqUQ370wPnyJ/BHpUg7egnjag==@lists.infradead.org
X-Gm-Message-State: AFuF++m93pYCCPysM6xaBbiQsnC981JGqyg/gBTEeZ0vwmb/u8Ymevst
	+aBZe/h3tsp8+Af46vZ302f6SeevhHALO34Q1GS6YGlaIc+VXO3MTNyjxVXUrfzat32PGVR6jpz
	4K3NVl6Jo2xSFs1EmMdphi6tZGkcE7ZY=
X-Received: by 2002:a05:6512:a86:b0:5ae:b7c7:5334 with SMTP id
 2adb3069b0e04-5b60e8f8b8dmr2291058e87.17.1788561384171; Fri, 04 Sep 2026
 15:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-19-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-19-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:36:12 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+fsxrH2YvJSnaYhHg2EQiUnjMX5BFE_MDAzvvJjY3Bw@mail.gmail.com>
X-Gm-Features: AcwNN1WIrbJQES4aWl5_UIygFkf4p6tsLt1aSuz1HDzaVFgsk_a2nVa_8mNAHm8
Message-ID: <CAD++jLn+fsxrH2YvJSnaYhHg2EQiUnjMX5BFE_MDAzvvJjY3Bw@mail.gmail.com>
Subject: Re: [PATCH net-next 18/33] net: dsa: mv88e6xxx: Remove comma after
 sentinel-entry in match-table
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

On Fri, Sep 4, 2026 at 6:38=E2=80=AFAM Siddharth Vadapalli <s-vadapalli@ti.=
com> wrote:

> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

