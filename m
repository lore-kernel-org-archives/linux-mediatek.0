Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC80AC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 16:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QR/ujXHYTRRH2qNLpWcexGPomq979F96800VzVd3Ds=; b=kTZ49MqjlzFhcg9EZUhfBYmT96
	b+dQ3aE3vWVfkYGzx86yd5Vv4o1XH/wy+inBkQhsyPpRHOAZENtgdHmG/Nz5IxYLib/39lAPRkEPl
	3oGajxr1X/k7IEs/81bXJqo0ZkQRnFLIXy6gyOUI9fI+gyG7EF+arVjuorPIBkkohR3KssEXD+jNw
	hfxWKo4uY8GoJgToPZVBdFaxwz5RGA152v5KN5SGUbm+IMeVkOCJUX6FBZFmfDMDZA99MKj9VLuX1
	fAmIreM3ByOrc/OlnWP0Tn9C8ut/IRr+1q91V165PrueGLyMhT9/sIzUqr+N+EdVnGXYwaNzXjgfM
	f+NHbvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4gu-0000000Aktp-2bVq;
	Fri, 31 May 2024 16:01:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD4go-0000000Akq8-2Hw1;
	Fri, 31 May 2024 16:01:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 51C1D62D1A;
	Fri, 31 May 2024 16:01:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBF83C4AF13;
	Fri, 31 May 2024 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717171261;
	bh=c+d4lcGPb/U+FefoCxW7HsKJKVrrlM9uztIB003s6WM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KmY/o7PBK6+b7v0yeKL94FXrqypcQdlFqjIk1YD3bprmcNrkiWA/lkrGGUg+Yckt6
	 F5YiQH+HN0fU7IdeAnPaHGUMed9j9D31MAVdOqtPa1PBWlzE7on6uStPhaAmmVsvni
	 DMiS2bMTL2rHJGWrMzTOOTff6SHXvYvQ47na80/m32re8sJrYQwvMlNv29rvYMk7Zy
	 uuyvKesDfCMpz2c48Py9Uw55FomuDS3tqkGi2ASFqUBhC8xYOE7Xo/wq53xk+eOuxA
	 NJcbcevLQDEzGI1uGgGm62hlEIjCipDY1hdpzchSVWJHT4O0eAUnxboW3jX49bL2kC
	 +aq/irrOp90uA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52ae38957e8so2587527e87.1;
        Fri, 31 May 2024 09:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGNZx8r/xtNbHnvpsEZlOd0gX2jV9YOlBtdzaE2BJv1dK95oNUNQFEZpDBOu9BUz0ui/1h3wyLNmGp605JIw52rFGkae69qS5DpoEOyPwnc74Jb6Rj2Hix15xnd+xoqADIHGJFkQblP2U0UUr1q5uNpziAvxnffMEQzTNxk0WxmtVQGKMAWZ5QjfSGh4zyw/N42LdYN0jM
X-Gm-Message-State: AOJu0Ywe8BcmiUmj+M23YwHacr+S7QIdJn3xoX7wW136lZC2TheWbhXw
	y5MlY36nQfe5tfVwgWQdDlqFy+Qk+tci8z+mlte41CWkylQjj1BX/iRFq9YbpaePG4J139KmFXb
	4geyhE5t3SmfkTeLArlBlXoeQ3A==
X-Google-Smtp-Source: AGHT+IH4oy5XfEeI6M9ivxBCoSxDCjBCAk+o5jUpEGutuJaJMQxDlvaDmEbQUTIillqvz9TNUGFpdA36DhO70v2pCRU=
X-Received: by 2002:a05:6512:3145:b0:51e:f68b:d266 with SMTP id
 2adb3069b0e04-52b896c49cemr1375881e87.50.1717171259738; Fri, 31 May 2024
 09:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240510123018.3902184-1-robh@kernel.org> <20240531134536.GK1005600@google.com>
In-Reply-To: <20240531134536.GK1005600@google.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 31 May 2024 11:00:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Message-ID: <CAL_Jsq+Cu9PSFwp-6cT5svqP+GZ8rp5hBgXA2=cgqQYYUDDKDA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: syscon: Add more simple compatibles
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, 
	Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_090110_782065_A93770BC 
X-CRM114-Status: GOOD (  13.94  )
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

On Fri, May 31, 2024 at 8:45=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 10 May 2024, Rob Herring (Arm) wrote:
>
> > Add another batch of various "simple" syscon compatibles which were
> > undocumented or still documented with old text bindings. Remove the old
> > text binding docs for the ones which were documented.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > This batch is mostly from arm32 platforms.
> > ---
> >  .../bindings/arm/amlogic/analog-top.txt       | 20 -------------
> >  .../bindings/arm/amlogic/assist.txt           | 17 -----------
> >  .../bindings/arm/amlogic/bootrom.txt          | 17 -----------
> >  .../devicetree/bindings/arm/amlogic/pmu.txt   | 18 ------------
> >  .../devicetree/bindings/arm/atmel-sysregs.txt | 29 -------------------
> >  .../devicetree/bindings/arm/axis.txt          | 16 ----------
> >  .../arm/cpu-enable-method/al,alpine-smp       | 10 -------
> >  .../arm/freescale/fsl,vf610-mscm-cpucfg.txt   | 14 ---------
> >  .../bindings/arm/marvell/marvell,dove.txt     | 15 ----------
> >  .../devicetree/bindings/arm/spear-misc.txt    |  9 ------
> >  .../bindings/clock/ti-keystone-pllctrl.txt    | 20 -------------
> >  .../devicetree/bindings/mfd/syscon.yaml       | 29 +++++++++++++++++++
> >  .../devicetree/bindings/mips/mscc.txt         | 17 -----------
> >  .../devicetree/bindings/mtd/atmel-nand.txt    |  9 ------
> >  .../bindings/net/hisilicon-hip04-net.txt      | 10 -------
> >  15 files changed, 29 insertions(+), 221 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/analo=
g-top.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/assis=
t.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/bootr=
om.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/amlogic/pmu.t=
xt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl=
,vf610-mscm-cpucfg.txt
> >  delete mode 100644 Documentation/devicetree/bindings/arm/spear-misc.tx=
t
> >  delete mode 100644 Documentation/devicetree/bindings/clock/ti-keystone=
-pllctrl.txt
>
> No longer applies.  Please rebase and I'll promptly hoover this up.

I can't find where it doesn't. Fine on next, v6.10-rc1, your current
branch. Maybe something you applied today and haven't pushed out?

Rob

