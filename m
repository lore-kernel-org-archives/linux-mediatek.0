Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F7E4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 19:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFiF9O9nMK8GrdCfNShtw8oBQenyZQmibCsOZ29A9r4=; b=tdr1TitPGJO3lBF85LD1ZofqFE
	AB2y/CkpfEKn0icTjnLX4O5CIXZMKuZkJEeoSxZS1FuFuBtslFnvsMYCJw53vi7BYBHAkflM49K0K
	SvR2BM7aCL9vormnJ9usA8OLM57kO/9wijTTR+m88J0d/pGftRd0QwwwAKRc+eF4y1AF+3Nen+wFh
	vdfCoA6b1MXbLyz+7gemTME9/3XVVPafhBckfc8D3WDq3w38Douh0apMzvf5C5uuk7Zg8Qtzs7yCi
	mrlEQeNxkbBu1wpsWA7QPVujwBWaoOmiu9hnHHfT35Ew7oT7ci7NS/krq2/ARQenym/FDtIEiVeil
	833jrwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MNC-006bmv-CJ; Fri, 01 Jul 2022 19:32:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MJB-006a7n-DI; Fri, 01 Jul 2022 19:28:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E369F61DDD;
	Fri,  1 Jul 2022 19:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BD8C341C8;
	Fri,  1 Jul 2022 19:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703684;
	bh=XFiF9O9nMK8GrdCfNShtw8oBQenyZQmibCsOZ29A9r4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tkkXlGlONtnoseVjaFV48gdmxxETQ/kFmhvroW0xIWGyGNdq6KinGzwR7rPo/eFlt
	 n5WNQzZAXoy86TDSL/9svpokOVHlWCIBqwl2bkTr6JywulCjgGpRafA6Io/E5ZIGjo
	 crS/VpuaFloSOWpHgKgVAflAkCV7ZPe9HXUDxbiiUnmwxhSYmc19RdiwQYx1zmReHu
	 BAOJociFxItbUyLr5odQWvZDlQ/IPB0bIgb33/vNkc5518n7x+weSYdgZNgBT9q29j
	 vasGkL1IL9QpjkO8liZl2rEpZlVQzOlqNTkChx1yiFQnsgf8ZOF/gmi4SzkWdp1ncC
	 bBkKo4iFK6LVw==
Date: Fri, 1 Jul 2022 21:27:55 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 3/6] net: phylink: split out interface to
 caps translation
Message-ID: <20220701212755.156da4ff@thinkpad>
In-Reply-To: <E1o6XAL-004pVp-36@rmk-PC.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
	<E1o6XAL-004pVp-36@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122805_558538_9EAFE1CA 
X-CRM114-Status: GOOD (  11.91  )
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

On Wed, 29 Jun 2022 13:51:33 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> phylink_get_linkmodes() translates the interface mode into a set of
> speed and duplex capabilities which are masked with the MAC modes
> to then derive the link modes that are available.
>=20
> Split out the initial transformation into a new function
> phylink_interface_to_caps(), which will be useful when setting the
> maximum fixed link speed.
>=20
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>

