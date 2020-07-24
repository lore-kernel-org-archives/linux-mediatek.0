Return-Path: <SRS0=BOys=BD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6FBC433E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:23:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D97820737
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2020 12:23:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0L/0eVy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHjV6PRM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D97820737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M8gBB8p/Gxeaa1WI6JjrPxgHImscg+eP9T5N3+VpJNE=; b=B0L/0eVyfnl06OkOTKesCtQNG
	z1Rahspowen6519Z4IumjzByVuol7Zx42Vj+FPe/0+xmqzxQIV35/pf5o2gMfUqziUHut0hyjW0CQ
	LJHH1AVut5JUKH3QkvILiO+pM2xzBW9IF1lQwtTGSZ9P5Z8NehzAUGbokmbvnCBKrW7trmIxJNfOB
	+vZPUKDuaSbWKCAs6S9IheNe6KI5Wn8BbZlQ/JG1PZaAOrdknWFFz9OGIPFAd1FvAFtE79WPSecfB
	wZ/Rz27WPvLKVzAaVxNggKn/Mnxz07Dd+9DnQHyf3SMygZ3eknUeLS3NASIZHqskGIPoXTsnx3BZz
	c6XDol2cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jywjX-0001lg-Ma; Fri, 24 Jul 2020 12:23:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jywjT-0001kJ-77; Fri, 24 Jul 2020 12:23:23 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0630820737;
 Fri, 24 Jul 2020 12:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595593402;
 bh=SCXFKjxEaCFEqThct34NH7LinKsaOpA7DKxBHAjFIsw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iHjV6PRMiPtvYQ78i14qyA8AMC0rOelizX1FFlG2owztY0tuTHP2CXjjzPKGE6stH
 nyove5LbJGrydA2rRaNIIpGskvbFZJeTFflHI1EsA+CZSb8YF+eKDyMts8D2XbEPol
 fEgHgsuHT1VV7P84PZFD0ve7K+G61NOc8CFE9fzg=
Date: Fri, 24 Jul 2020 13:23:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 7/8] regulator: mt6359: Add support for MT6359P regulator
Message-ID: <20200724122307.GF5664@sirena.org.uk>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-8-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1595509133-5358-8-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: You will wish you hadn't.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_082323_344770_EB636BF6 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0742090794697600480=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0742090794697600480==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jkO+KyKz7TfD21mV"
Content-Disposition: inline


--jkO+KyKz7TfD21mV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 23, 2020 at 08:58:52PM +0800, Hsin-Hsiung Wang wrote:
> The MT6359P is a eco version for MT6359 regulator.
> We add support based on MT6359 regulator driver.

Acked-by: Mark Brown <broonie@kernel.org>

--jkO+KyKz7TfD21mV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl8a0qoACgkQJNaLcl1U
h9CI9gf9HBScIw40EhXiHa2xEWUpuW7VdZE+GURbcWcwrbYa1DzxTpy8bnVgBHSZ
id1lz9wbu0docIpwklwTolu0/YTvsX/4HbvOdo72+r0g9Q+TEudUGpkbExZEk+VE
7xv+F60dCAdaORA7dCs9Lx0PYgOPzhCvngpNCu0toeAHQjL3xNiFhJVGux5KNMiY
1UuCfEzVa2w/ovCxltxsLJI7Z4Xv5wf1RygqvALUOmp1ziTx1DQiBvMGZHEK+CY9
GdeeA/NGGgDhjTEa0R+yvcBASktquLjlwuWaEB4kXolFZynJhjQSPuFlnLmUljuR
uM5Y076bN5Y/jPaAuQ+gxm0bB+n8ng==
=/gQD
-----END PGP SIGNATURE-----

--jkO+KyKz7TfD21mV--


--===============0742090794697600480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0742090794697600480==--

