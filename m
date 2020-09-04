Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25185C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:36:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC4562074D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a93QHag5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="P+SmPm8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC4562074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uYUqYnP3egJK94n1w3zTP/tJ51j7AyiQslKJJQspeK4=; b=a93QHag5BPa0QdoWF8j7RyR2o
	hc6nmE6+BeSSUQm6Gs8+mwM0izEz9IzTJCzg7etI1GqjbQrxDzMPNGmi1jCr9q4zXp1L94P8p/M1F
	532LCtyQwH8tIjDMebkoGnVIhWcmkNZfw03VrgK5sCOMe/6PVOsj1h65RbfeHL87CeoZFh5icum7s
	wszp1pWCTWAw+mGvWtpO0Uko7rM38trYq6ugloM54YWk0BDRm6U3mmGd3FR4KLMj+So8XI/++WXlp
	mw33bFehZgbxtOp23tH7tOhMH+yFSXBIEz4TOQZyLlgcSxqJAcXxNqSMSKw2wx6T0E7l4Z5QAXmF6
	s+ftOTPGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5L8-0002GW-Ik; Fri, 04 Sep 2020 06:36:50 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5L6-0002FK-HP
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 06:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=lZU2PzJpWUHkpItFjVkZMpQcJ5AR
 YO8YhAJURqsh8sU=; b=P+SmPm8TPrtqh2I/Qa4bY96ZF1Uqweo4H3LTzL7XivC1
 iC7J/W8Hb7B7tGHRjJAe/KiwKrijQpaOBwD0OVzvPig125SW3w3UulKYc74LfzXK
 m1xiY0Bgj2MGZRuzQQxS4KVbF9poYLQK53Y4VjDPSTaJ9XrGc99znjqdliSL6e8=
Received: (qmail 3473752 invoked from network); 4 Sep 2020 08:36:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 4 Sep 2020 08:36:40 +0200
X-UD-Smtp-Session: l3s3148p1@AU1lF3euJKEgAwDPXwlxANIWpbLKE1Uh
Date: Fri, 4 Sep 2020 08:36:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/6] mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that
 existed in v4.4
Message-ID: <20200904063639.GC1506@ninjato>
References: <20200903232441.2694866-1-dianders@chromium.org>
 <20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid>
MIME-Version: 1.0
In-Reply-To: <20200903162412.1.Id501e96fa63224f77bb86b2135a5e8324ffb9c43@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_023648_780311_4E975B5D 
X-CRM114-Status: GOOD (  16.53  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Yangtao Li <tiny.windzz@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Michal Simek <michal.simek@xilinx.com>, Paul Cercueil <paul@crapouillou.net>,
 linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@axis.com, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Lee Jones <lee.jones@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Jaehoon Chung <jh80.chung@samsung.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Pierre Ossman <pierre@ossman.eu>, linux-omap@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, swboyd@chromium.org,
 Rui Miguel Silva <rmfrfs@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Lars Persson <lars.persson@axis.com>,
 Ben Dooks <ben-linux@fluff.org>, Manuel Lauss <manuel.lauss@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Barry Song <baohua@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vkoul@kernel.org>, Patrice Chotard <patrice.chotard@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Viresh Kumar <vireshk@kernel.org>, Eugen Hristev <eugen.hristev@microchip.com>,
 Ricky Wu <ricky_wu@realtek.com>
Content-Type: multipart/mixed; boundary="===============3764803728136854391=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3764803728136854391==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline


--da4uJneut+ArUgXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 03, 2020 at 04:24:36PM -0700, Douglas Anderson wrote:
> This is like commit 3d3451124f3d ("mmc: sdhci-msm: Prefer asynchronous
> probe") but applied to a whole pile of drivers.  This batch converts
> the drivers that appeared to be around in the v4.4 timeframe.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Positive comments from patch 3 apply here, too.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

>  drivers/mmc/host/sh_mmcif.c         | 1 +

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # SH_MMCIF


--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9R4HcACgkQFA3kzBSg
KbZrlw//TWVTp9k5RlC0Mns4aGwDg0MbUjUlcWLnzTtRkbYAIF7bAc7d/zLvRBf1
t9F1uklj8pgV8PsnrRhBQafPxthXZguaZKMs0S6FtPzpYsQt//8mYSwZ7BxwqGlz
AsxBs8Ea+c310xsV7LE2KxGwV62YYaUahDEiNshusaiJfmdOzYqZnt2UpNn0aFYE
NMmZRPBCII4WuY8hkJXo3Qp1BZFr/EsSLueuJnL+jTpxvsTe6e9Oc9H7Cpn6/W7p
lgK9wXvR+nIRh+ckJuBBictz1CS8+pR2GFJ1cmT1I/apt4thcjJQ8eZ1c2NCyM9h
geSknoJQFEmsDeEVt9VBxjKFb6JFkjEh22zWuScDPm0rpaOSKgQZegCh02taAPV0
vc24YXifKISeOmplBe8YfaIFIL91F90Lo6MForJuTcKV4zC22eVTVtHtB/abL2QE
jjmq+pcWcADWCKgzsKM9l6nkQ11wwVYEc8SnQENZPfl5Iq0V0BtQSD5lLMtHI3ET
vTciYUaopdLSWLAlWOHZNAw/AAB5s8QYlpn8la0JNAEv6t/cLVSbSiwG+2OBOjN2
UNvtPsRuHvMC49aNnA//RZRoUdds9xjo1vnEPJxB4oOoVAV4wSpw29C/X3JPLtLY
IoH/gyyB1DCSJCcoMKVN0SFJ8a+p4MeEwOoExWDgLGOTeaSLXHI=
=H4ww
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--


--===============3764803728136854391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3764803728136854391==--

