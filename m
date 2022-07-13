Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF8DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiCGtM0WRA+1HmoM7RCgdlbEQVWM+21G8RM3hI+jodo=; b=OzdqQV7mTrDwqKp7Mk1e4nMrBC
	zBU7wxYzoI0R29vw9OqGpgv/FXHBQlyvgCT3yM/uom1LsxLqBmsjk3XAaNUoCZAeFa48maX6uRyuJ
	7CQ41b5b4NJMNPgP5SCU9WhLW1n5LJy0OPwJp44ZJFFeQXuzmYHsWJPoZs6CYJmDui2mlGTBtRCP6
	avicCa63U7Cq/RfPU7zJSDPSFTPtWDfS7BsPHSl7anRGTQATAOeTQhaYOh2jLP3PqbzCtd3Y5uRHh
	LuKjRRjM+WwNc+eHSKJSpfTvE6Cz84kV14ftLpUfyEOlc80Rhp+SoOH9qim/cajbCxhfyL5Hhkw7q
	bh01hH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdfo-004iJt-3e; Wed, 13 Jul 2022 14:49:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdfc-004iAK-BP; Wed, 13 Jul 2022 14:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD8C7B82011;
	Wed, 13 Jul 2022 14:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1BD0C3411E;
	Wed, 13 Jul 2022 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657723733;
	bh=uiCGtM0WRA+1HmoM7RCgdlbEQVWM+21G8RM3hI+jodo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n14om2g/olH34oG/VNNsfwN9mWzb60zP3Ir7cXiyGRsPMlL9ON7F4ZH0lKP0rs/vx
	 EGFILkFvsULfLaMCOMEhCk3tCylKzTVGUAAvu4fhd5vAreV0IqLrGQK992o53oQDKn
	 47gn5Gflda7kQX6CIX1W/0dQZjSooPf/LGM3V/iCE6wS1iY9Lz/xiLUKwY0cylBU86
	 hHplQAqHOnaNftEevZdcH/BDmCVKVl1bv+jn7Wr4u5sg5Xyknnocuhk+S47sGgHYwG
	 KZ+0Y/iTs1yEgDW3qdphfFTvbXIx6z4pSbwbkgZha2p0k+6xKezcrQtqG6EqJOai9/
	 B4cIsLXvk6Ndw==
Date: Wed, 13 Jul 2022 16:48:43 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Daniel Scally <djrscally@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Hauke Mehrtens <hauke@hauke-m.de>, Heikki
 Krogerus <heikki.krogerus@linux.intel.com>, Jakub Kicinski
 <kuba@kernel.org>, Kurt Kanzenbach <kurt@linutronix.de>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next v2 5/6] net: dsa: create swnode fixed-link
 if using default params
Message-ID: <20220713164843.5dcb7235@thinkpad>
In-Reply-To: <E1oBd23-006UD8-1d@rmk-PC.armlinux.org.uk>
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
	<E1oBd23-006UD8-1d@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_074856_569516_C99C6DA1 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

On Wed, 13 Jul 2022 15:08:03 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Create and use a swnode fixed-link specification for phylink if no
> parameters are given in DT for a fixed-link. This allows phylink to
> be used for "default" cases for DSA and CPU ports.
>=20
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

