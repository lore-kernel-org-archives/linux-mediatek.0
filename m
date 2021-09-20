Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:36:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F4660F48
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 76F4660F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fF4j3EVhi8q/PMya/PijylxnOACZOTbdfk3Tbxr7q/M=; b=OrNfWS7/qTO0BY/AdmjP/iAXl2
	o6No3O7DVlCiKn499x3RntTTblvNuSfRw5lfdW4AJ3CRzUJfuwTHZhYlMJQsqRbndMazvNTu3j5vF
	UAsH9n69+DZXmenumtMuBD14kje6OtQ5KeUatvVGhUG+b8RvjaPpOi5RUYFQxpKkcnRkjjRxzET07
	fV3a/Iqa1W94MXp2q68haxM2Vmn8S0d5emmEmTScLIpByb0ITINqddlBI4D6xZIbjdXsex1Dn2Imw
	YApEmZ1hCNggfxKf+Tjb3Pnjre7xTNhvuDMhMsuS5KVS7JCq4n5AJjaEYH/Ga0xuNMIp9MzBKY6I2
	rN3b5PYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIXL-001b9t-26; Mon, 20 Sep 2021 12:36:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIX4-001b47-DJ; Mon, 20 Sep 2021 12:36:28 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DAD260F4B;
 Mon, 20 Sep 2021 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632141386;
 bh=ywph2O72bB55A0SZOZeKnv7szm1alhRoV5amvQ+xdmk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eTCnsEGVHfxv7QPlvq9V/ADyNY1gD58w0YYnz6K82QCLN3WSrOpG6nJiegqCZCQ63
 Ztix/126YwnBRKjAaPv5qDC5WV1fH7gqbKJhOozE1nXIDCP1p4I0aypn/CjBUHO+c5
 5HNI1booHeRADuJ7eLDAQVVU8ydqH3vKbUeea4VxcPe+RL5DG4TqWgdfWoYV6nlMeN
 XzrCEJ4Yrs0XA21xUyqjIlExj2T201bpD00DfJbostrihBT7SyZFTymelI6smm9v4h
 YW6utw6HSFtrd7IDzQVvsqCbDzpbJOqC8gpvwOZdRfVOBB0epBek1gDQjcnCKdOiTj
 N8RXyfCGtY0Vw==
Date: Mon, 20 Sep 2021 13:35:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Arnd Bergmann <arnd@arndb.de>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
Message-ID: <20210920123542.GA14852@sirena.org.uk>
References: <20210920100206.1418649-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210920100206.1418649-1-arnd@kernel.org>
X-Cookie: The only perfect science is hind-sight.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_053626_506282_6AC1AF9C 
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
Content-Type: multipart/mixed; boundary="===============5657356994435465192=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5657356994435465192==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tThc/1wpZn/ma/RB"
Content-Disposition: inline


--tThc/1wpZn/ma/RB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 20, 2021 at 12:01:58PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Without CONFIG_COMMON_CLK, this driver fails to link:
>=20
> ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-=
mt8195-afe.ko] undefined!
> ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt=
8195-afe.ko] undefined!

This doesn't apply against current code, please check and resend.

--tThc/1wpZn/ma/RB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFIgB0ACgkQJNaLcl1U
h9CgTwf+MjdtdtiCsDwjnRIAJ8Zkv9hB5KXV0gHoCPjSyFF5tGeALEPdRb0NkkV/
SJJtvwBCG7RiNaaERXhF6hsxIXjivKxoz4gk8RmNLCgWrXxCEVJdSCO9ck/7dBtU
v4qjpA6YwPs6vNNmdRCqco+ftpWaCsfI+/WUvkYuyWX3nVFctr1/36ZX1bNpyIKh
yGkM1sSaM0hFA76VEsbTuL5DWZmwhcU4JmAf1xJXV/PwnCtk6qI37uptD8jI2Boe
g3ocEvaCCN0VUfaCW63TTAKvNmnsuQYItaBFEtmkoJlZqAi2toQmPtRGvp4Hzl07
AfnIDu5F+SVROur48PzSi2k9eeNkCA==
=FMjp
-----END PGP SIGNATURE-----

--tThc/1wpZn/ma/RB--


--===============5657356994435465192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5657356994435465192==--

