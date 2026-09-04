Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F0DC79F82
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oXwqSl9Gxhd9ASYzU33CVNwSksmytljDqKt0iBuLvI=; b=c7j06tXgLqaeyv6pO+aOYU2XJn
	MGx5nX170sXGhwOWHluK2rXpP/9SXJdoKxb6a239KFm18INs+4/bUHHoXiDLde6gjiwCjvBZxNOYk
	uD6wMPeIaSGcrLZ9za5khRDXEbwum/JdfVf2hqM6qCg0TxbVznPEoZxc21cpPyNvuzSS3mTH+mJFj
	Dy4MAMd4lBlwiqQ7qrfoWqo55bKgZFjcGNCYVtVvt8rwJ2buMCdSLZ6jF45yh97WzfUJdIuBkP54/
	Q79BILvcy+S15KNtEBsQoN0t69mYuY1i+dCHZbLYTOvzYL0q2vzF6cyM+B6jG4AdxJTIqIGaPja9G
	Ekybr9Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cW4-00000003PUA-2hCQ;
	Fri, 04 Sep 2026 22:36:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2cW2-00000003PTL-2WVt
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 22:36:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9908860A8B
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF801F01575
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788561368;
	bh=/oXwqSl9Gxhd9ASYzU33CVNwSksmytljDqKt0iBuLvI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ml6ZPbdicpCTCGRsa4fruA8q/UpjUgIWf/z1j3+dK9X3uiutTe0Gl0W9Lye+gyHVj
	 8YmhHW8o3E5cvDD7BLuj2wEtwXOUvyv04hlKcGfZAbXiQJ/LOeLdCD+tUA+VGQVvFB
	 gmbCoxnTcLMl2erVHI1WMv20AhSU7ZLcp+yLOFH6iat052BEu/i84vxzZhJIUu0oy9
	 P7+8EJnGgIc7YQx9NQOdfRTN6gX0Q1EY7UbO+HN5y37jJceCICC6QEbK1be07F1FzD
	 DjwZ9SGW8JDK0WHPnhvmq1CH55jWjHQ0iSSlLt318rSpCiSaTGyvgyAYR5YRruMwQZ
	 BIo2SADVEtdig==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b5e1340faeso1358602e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Sep 2026 15:36:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByFe+vooN0dOjhLI1nlZ9/qKSPMeWbAxp1uXKoRF9WAwiXh/gtFYYxIQ/cdAcFcPx8GqxBe/VhP9uQgtnFs/g==@lists.infradead.org
X-Gm-Message-State: AFuF++mbgkUT5bvCoc9OAKuS2vCYnYPSiD1e679kMJpzB+Z2ogQrBMPf
	j7wLTmQ5V7D32CYu0zsIYj5UpeCygzpFqVyiMKpqlsb94Z6Vnk1gB+ZhCNqH1g4YEjaC81o+Zph
	cQ7WIL7qt0YWnvuZY+ksBMKCXidkyT4Q=
X-Received: by 2002:a05:6512:61b3:b0:5b4:583f:9f32 with SMTP id
 2adb3069b0e04-5b616f324a3mr1360069e87.20.1788561366767; Fri, 04 Sep 2026
 15:36:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-18-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-18-s-vadapalli@ti.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 00:35:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLkfg0tRxDc7B2-TJqRmqxFxUFkFPwHya-gvGZ1OeytoYA@mail.gmail.com>
X-Gm-Features: AcwNN1VqRxubfaJ8mQrA8mitm0PwyRWyXr5M0LUGIuqfl4J37AtzKVm3Hf5r70E
Message-ID: <CAD++jLkfg0tRxDc7B2-TJqRmqxFxUFkFPwHya-gvGZ1OeytoYA@mail.gmail.com>
Subject: Re: [PATCH net-next 17/33] net: dsa: mv88e6060: Remove comma after
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

