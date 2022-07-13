Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE21DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kdDocy7vnAF0pK2neZSn+zS4deAonqbhNcqvkHl//20=; b=OVVR8tm4yxlih/uJmZSBYd0EIL
	NL1dE2jbouqaUqTEaqzWocw5kSLqa0Il93MvsT6Vo0jIrr3l0sDIJYb4Er+m6AqumHdGxWn6NIuGW
	JPHfIBJ5ycZo3AsrX9W74Z0U8+GS/lkdOeH49FartDhRCNY6Cz52o3oyBk78kzsamyFbolem4vTDb
	XgjY3pvePEtFvPDPK5YV2dwz4uwlqicFo8c72016e1vZQ66rjMfoRzRI5G/Zn/xqZhOUNEmUFtoQN
	bEsf/PHIRrJkWX7j+Zo+UPVkjNKYRjPmj2Jt7oSTqfqwQKJ9HSAah5ukN3Wg+cGkzyce3+GonMAlV
	xgr6M3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdbG-004eKy-6l; Wed, 13 Jul 2022 14:44:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdb3-004e9i-2f; Wed, 13 Jul 2022 14:44:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD95EB81FE9;
	Wed, 13 Jul 2022 14:44:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29CCC34114;
	Wed, 13 Jul 2022 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657723450;
	bh=kdDocy7vnAF0pK2neZSn+zS4deAonqbhNcqvkHl//20=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rM39oAE/vEOQADYEyfPX1JKsL8IypB8czfwMeERi8h0ipUqLVvwJ7siZqNkTvteCG
	 dof+YPQeF8QRktlVF0OFNdkWnrySl4Bmau+5+wiDdYUJM3l9oqJgj1Mx7+hQhIoD9X
	 76JCGPB1YB16/f1/0GLlyZtRGdFhYlE7v1LV8FRrL07gLdHE2dW9YtI+q9iSjjiSVN
	 2kZuZLlNA9y/U+6newrgB/olYCHSaGJ+16b3YQaWr6jwylNEsSMKHzD519hh7anxVI
	 zBrz/U8qM9MLJ+zITSdfv2xp1cZBCa2ZFnrsVgvcI7sXFJs8LUqGNJe4DfphHuaBaz
	 e7hFMw/ScGSeA==
Date: Wed, 13 Jul 2022 16:44:00 +0200
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
Subject: Re: [PATCH RFC net-next v2 1/6] net: phylink: split out and export
 interface to caps translation
Message-ID: <20220713164400.11b777a2@thinkpad>
In-Reply-To: <E1oBd1i-006UCk-Eo@rmk-PC.armlinux.org.uk>
References: <Ys7RdzGgHbYiPyB1@shell.armlinux.org.uk>
	<E1oBd1i-006UCk-Eo@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_074413_288093_C436866C 
X-CRM114-Status: GOOD (  12.10  )
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

On Wed, 13 Jul 2022 15:07:42 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> phylink_get_linkmodes() translates the interface mode into a set of
> speed and duplex capabilities which are masked with the MAC modes to
> then derive the link modes that are available.
>=20
> Split out the initial transformation into a new function
> phylink_interface_to_caps(), and export it, which will be useful when
> setting the maximum fixed link speed in DSA code.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

