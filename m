Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D982C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 17:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kZ9exZQ0XB530uYV3U/seLEV8Km4T11LMvCBDan7GA=; b=B0NlJG9B06sXq9gmZM4gx7ciJL
	KQf03LOk/W7aWMKjcW1oJQQS+vyb1BtEueWBzaoKkGffG78xyL1wCnDreTlMcXz7manukjD5mLlaZ
	PFaSd4yADA6xg1NDyR4cdcR/1niO4UtZtwR8iGPrwme1xTfPqGgf6LZKm8AG+EzRAEAKYiZqqplVY
	jdQX7AYTgGYb0eju0lXahZLHMs+sk9+bRb/h9cdBerKT3sTVpLVDjIMNnK/HLp/S6yEWFsZbCbA5V
	LXm8D+p2OsmZSh+YIig4ceeLtZSRvTvA1BpZqmEFhD9GRCgy272AZ+2hbPCl5tAH+kuxNfQzgg3pz
	a+59wgPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98mJ-00BiKt-KQ; Wed, 06 Jul 2022 17:25:31 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o98ji-00Bh5g-BP; Wed, 06 Jul 2022 17:22:51 +0000
From: Kurt Kanzenbach <kurt@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1657128164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kZ9exZQ0XB530uYV3U/seLEV8Km4T11LMvCBDan7GA=;
	b=Lvm+sjXgEIRRm28h23L50yG11bF2QkieGGDclalRX2UEi2FosdAeKVNGRf5+iOvuFV2zoK
	n9yQlSWKEAbqIiTmojOeUA3NpyUDuoK6scpFu/nnAiAOPhPbCmiO+hzoi+xkrkhcvLOHev
	5AwBK7RQSwGCzJ/HfdcTVHokf/H387kd5qg6aUyREQPk5SFkccOqvh/y6UqOOQbCPg916d
	WD9OCiayGBnak+XoxB4XOSDGDI1eCqsZwE2949KtLKHnq3yw1rF8W6rZzcVbYTFGLmmlMb
	8kQXqFJRGW+MbN5QpKieNV38th2CsLdOKkLQjjBGL1Ez5JZbLH+cpsk3G9D8jA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1657128164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+kZ9exZQ0XB530uYV3U/seLEV8Km4T11LMvCBDan7GA=;
	b=HDtlQ/T8dmQJvJLxMiCaaQA0NESh5ZITwLEvZXWeUnWXYbGeJfqpj4dwYXctmSf+CbhWcw
	ngwBkgY86BEVD+Cg==
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alvin
 =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Landen Chao
 <Landen.Chao@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next v2 0/5] net: dsa: always use phylink
In-Reply-To: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
References: <YsQIjC7UpcGWJovx@shell.armlinux.org.uk>
Date: Wed, 06 Jul 2022 19:22:41 +0200
Message-ID: <877d4q9mvy.fsf@kurt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_102250_581193_5D2FC7CF 
X-CRM114-Status: UNSURE (   9.69  )
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

--=-=-=
Content-Type: text/plain

Hi Russell,

On Tue Jul 05 2022, Russell King wrote:
> A new revision of the series which incorporates changes that Marek
> suggested. Specifically, the changes are:
>
> 1. Patch 2 - use the phylink_get_caps method in mv88e6xxx to get the
>    default interface rather than re-using port_max_speed_mode()
>
> 2. Patch 4 - if no default interface is provided, use the supported
>    interface mask to search for the first interface that gives the
>    fastest speed.
>
> 3. Patch 5 - now also removes the port_max_speed_mode() method

Tested with hellcreek driver and no problems observed.

Thanks,
Kurt

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJHBAEBCgAxFiEEvLm/ssjDfdPf21mSwZPR8qpGc4IFAmLFxOETHGt1cnRAbGlu
dXRyb25peC5kZQAKCRDBk9HyqkZzglisD/9Nj6vRxJ5jiige/G3eUJYpGYfPMd6X
bjqn9VZTm3Cvxmm6Tt4TJM0zZseBFNRnQyOhG+Z2hVG2Y9gtPxrUoI+VeffHCq+4
eRLG09nLOllfuST798RTA1CnDpl8FDc1okrcdO+Mmg6etBOltokx3DHbjpn0AgaP
+iuSMQ/dcajxkqXn28uaYwivNU7pK8RnJfi8KgW8gaOAbP0k8Sh5Kxaa2u6w/05a
jonfbZwaoLeqF5x5vBuKHS1xe/O81c6ThAOs/RB67ORNOeDClA49aLQ4/m7omYP0
3wG98FfcHXsAu+BLIzdiwSi9vSnh3u1+4fhxQWi/8F24N6dOmjb6R6KpnuTx7XR+
febMS5MxQ01V/K0JijNTBFVfXdnWE9xI2YSaDkaJ8d6lvTfaJe8BZGwlNqvUiUqK
OIDudA+Qifqjimmb+aEZLo5YpIyCiFqKdeYXN2R7QTMPvXMQ8N+4fCfTTbs4RDDS
bommmpaQr6pzqQTIwShwbez+DNAsAhoyeviXEZ79dI3F6M8nZLTUIM0TtRstVWl3
RQGrxW7kGhMvEVPRA9kmvispxbVC7BHHrr6szsEAofSvlJx+ILkb2c8qw+JDUPm2
MbRgCWG5oebfi12LY66UsG1tUj7DfkX7np1j5CjcbJPj7DjycF/j/mfpy/4eVxcr
PJAoL6Ngk/c+Fg==
=W6Vb
-----END PGP SIGNATURE-----
--=-=-=--

