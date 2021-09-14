Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7C3C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 08:09:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1948D61108
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 08:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1948D61108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5E+HD8TCHKIYc1rX4UOh+fkbpgjMjeX15/G+drOPiI=; b=LL/ja+BEngPgHOA5yqLPulzYaU
	5tPv/Pmjr/BAht7UNUYrN+wjBH/qxrISYx6qM7dh4g8lLz6xiBfN08v/mPZWNnmisU59z++TNsDnw
	+elgH1PAV0fLfhAoUoln5cAkJvJTZ1ewJowuAlZReG+QjPlPIQDlO/f7ObkkCbmwo7obSCxrce9lA
	5QxgquBK2xXlpaYsVY0H+IMECobSiV4nt9ZuI6O4v5E1rYuWfmY95U7BtxxbWZaRXYUad/7STwgza
	O0aDA+2bFP2DobxsWzaTCh/XEq1K5SCl5Em5hn/nZxP9ZxR1DBiVnBeJq/80SyMWfsBRVL7bTb1sV
	8xEmVObw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ3Um-004d7B-Cp; Tue, 14 Sep 2021 08:08:48 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ3UW-004d23-Iw; Tue, 14 Sep 2021 08:08:34 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631606907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPFtXk9zgPFdsFoa+TMu+4lql0yJlSvrdlqa2T6Fv+A=;
 b=rtSplDVVH0CTKQqMpgbAvWqYNnVgXqayf734MfeHIWty2B4/RysvD72nKh1Y9Odhfp0xsp
 5G66IA+5Ai9MfDuDRDH3CMHufBTd7OPUaz6fKIt2l7JQfebSManAaRc/W8JY4wLQSatzNG
 OlmqRnFOzvfS3ZpvLYW6SANEiwGNEnmRz8+RMRQv+CqifvIxB2k4JNITK0CgxbpGBOBfMc
 O7lqiAcEwyLMHOCCRyPjYQ0wk/2O6kb/5WWqGXBK9w/Q6ojABRBpONbhxRdMiCutwrBikG
 UAlxO6VPeYCao34K9iEIEzVkl8gUK5ebYBJgQMwrHIuB6PxgkSmaHfanjFmijQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631606907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VPFtXk9zgPFdsFoa+TMu+4lql0yJlSvrdlqa2T6Fv+A=;
 b=87SfjU90ZJ7Wv1Z2ho9VEWI+5ci+JnNsyFCisenIsJ3nU3urMes9yOo3eKDJSWI54wftGl
 WLYvOVTdpNMUzIBg==
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, Woojung Huh
 <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, Oleksij
 Rempel <linux@rempel-privat.de>, Michael Grzeschik
 <m.grzeschik@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Lino Sanfilippo <LinoSanfilippo@gmx.de>
Subject: Re: [RFC PATCH net 3/5] net: dsa: hellcreek: be compatible with
 masters which unregister on shutdown
In-Reply-To: <20210912120932.993440-4-vladimir.oltean@nxp.com>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-4-vladimir.oltean@nxp.com>
Date: Tue, 14 Sep 2021 10:08:26 +0200
Message-ID: <874kan1sw5.fsf@kurt>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_010832_842992_9824BDAE 
X-CRM114-Status: GOOD (  16.55  )
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
Content-Type: multipart/mixed; boundary="===============1708528958617637638=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============1708528958617637638==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

On Sun Sep 12 2021, Vladimir Oltean wrote:
> Since commit 2f1e8ea726e9 ("net: dsa: link interfaces with the DSA
> master to get rid of lockdep warnings"), DSA gained a requirement which
> it did not fulfill, which is to unlink itself from the DSA master at
> shutdown time.
>
> Since the hellcreek driver was introduced after the bad commit, it has
> never worked with DSA masters which decide to unregister their
> net_device on shutdown, effectively hanging the reboot process.
>
> Hellcreek is a platform device driver, so we probably cannot have the
> oddities of ->shutdown and ->remove getting both called for the exact
> same struct device. But to be in line with the pattern from the other
> device drivers which are on slow buses, implement the same "if this then
> not that" pattern of either running the ->shutdown or the ->remove hook.
> The driver's current ->remove implementation makes that very easy
> because it already zeroes out its device_drvdata on ->remove.
>
> Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek switches")
> Link: https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
> Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Acked-by: Kurt Kanzenbach <kurt@linutronix.de>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEooWgvezyxHPhdEojeSpbgcuY8KYFAmFAWHoTHGt1cnRAbGlu
dXRyb25peC5kZQAKCRB5KluBy5jwpsxRD/9ANtJRKndzoSp2shelf4V/aCarmfLF
GWf7nqLf5GsK0dl7bKUD8EM2OH647C7F1Qan0Ch4EVjw3OKxz7+J84x2QzZQ6u0C
lEGrHDrrkCXp4oCqV8aZoX5wLhXXjoto4LBJK/oobKzdAqPRBu171acXH357bd94
x7YjHTlnohSv6Q8RsjGQ4ba4qPjJ69cEhYKBKydsoTBSUnRzyzzgVtxz9GqpEKXa
lO8uyPzgqfB/ivLKWOJ8/Ugt8xaNBiH0+K1Me516e3Ui+3XBiKFr8uSYpdK2HSKl
sAugTY64Dd1mgYfVZ2FWhphcGU5YpbUmdYNpyny8swWkSjd9oUvW8ZDBva/TBRN8
KQzfrAqrCGGuYeYrNfFVoOkcQdNAWI2CuUhaLr+6tbnVo8KO8f5PhvoQWcIh2IqP
eeR3w/5m4sSYBsZlOG/VbEscT525R9y8oZvNjcVtbWeMf9J3jFZI9hgXcMvQXP93
NR9WihCzM8dHF8tSZTfUttZLXuYmzBBm0jxgvhUfu4gMp9bGUXtWZcS8vYTO7XED
CC7ipYT3aU2/qNyqodWYMfs1cZynJEeZl2QID2QAj5xtnRH527KhwMVQAkZVxDkb
PR7T4Iu4/XPkPztHLS2U59Dxa/uPikXpxdabfPo5ScshHyPDp5gTEiFGMIeIhb+O
GbkqtdvJEuFa2g==
=A1oq
-----END PGP SIGNATURE-----
--=-=-=--


--===============1708528958617637638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1708528958617637638==--

