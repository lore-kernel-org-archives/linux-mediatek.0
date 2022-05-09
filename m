Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DC4C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 20:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYsMQ1N1tx06AAXTAG4TRRfVjtGVEhjTaUQkTSPAsl0=; b=wNLY0USQNCUXvKA2j5uLqs7Qv1
	Lr1WeCagxEo7YtyNbFVZbRAnYbeA+yha2Mv9+YiLFPb2NMqHZcOMIP+5DDzBfNyUe1tT1hfybw/tZ
	J9HduPS8sJl5Q5GOX572XCJe7zDRyeATOw82ztvm1ejYJIggvYa5uflQfGwcPELteNMKPqelR8G/p
	4EVKTlv6QV+n734UYRLK8OTVkXchptKOJ6m/a0ajXoQsN8Yd+t0BBCwE8R8x/zPwfWLLKCLOh2jss
	qGNTWc5QQxoOzBZiT550IKS+dCJThuwO9xGZ0mxK2/4e9ateIVsVFj4xDR6xSpPepv1xPhYItCx9e
	/CsZD9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no9qX-00G8QG-Cz; Mon, 09 May 2022 20:19:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no9qU-00G8Pt-Q9
 for linux-mediatek@lists.infradead.org; Mon, 09 May 2022 20:19:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 201A7616AB;
 Mon,  9 May 2022 20:19:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCCE6C385BA;
 Mon,  9 May 2022 20:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652127545;
 bh=5r+YQgeW1TpJjXQKOxfi7MiQ8NqqFPbPAU1vv/J7FQU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QPRDJ2bvabgYlX6LKEfpyrwMjv2jqsarmWLDw9dhI2OqL24XUdF61Nx9hDx+rXhQ7
 WkiCS3JMYYQ1qAUIT+FcQwHw66hvGbYYwtmb3eVQOL+Py3/qQsQ9QaS9KlQRV3dpnD
 45lw9GOYkgXr9tgJ2x7z2ooYSHURDsHH8Ce8cEDPawk76Y7IZc7PbeJAiPPbpzUMn9
 HKMq7xyqPRzT+J1hcbw8O32G+l2QhZ6gXR9Q0gP0JyfFMVOaPuh2WiFYVEf9MmYhmj
 Gywl/y2SfFiiF7PHMwiWoBWhA/OXP5H2BEDaJGxnUF3A2+IyYvWSQ4PeUobGyYmwnR
 KKOee1cwb824g==
Date: Mon, 9 May 2022 21:18:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, lgirdwood@gmail.com,
 codrin.ciubotariu@microchip.com, lars@metafoo.de,
 cychiang@chromium.org, tzungbi@google.com, bleung@chromium.org,
 matthias.bgg@gmail.com, oder_chiou@realtek.com,
 steven.eckhoff.opensource@gmail.com, srinivas.kandagatla@linaro.org,
 alexandre.belloni@bootlin.com, kuninori.morimoto.gx@renesas.com,
 jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
 patches@opensource.cirrus.com
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <Ynl3Mn6kBOOTyZaW@sirena.org.uk>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
 <Ynlryv8fgKiHYXUt@sirena.org.uk>
 <8db9f890-1513-d9ed-58e3-5b402468288e@birdec.com>
MIME-Version: 1.0
In-Reply-To: <8db9f890-1513-d9ed-58e3-5b402468288e@birdec.com>
X-Cookie: Boycott meat -- suck your thumb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_131906_965675_2C62FBD4 
X-CRM114-Status: GOOD (  21.49  )
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
Content-Type: multipart/mixed; boundary="===============3968143738972936713=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============3968143738972936713==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ynGECfZ4fyGoHAyV"
Content-Disposition: inline


--ynGECfZ4fyGoHAyV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 09, 2022 at 10:11:03PM +0200, Kirill Marinushkin wrote:

Please don't top post, reply in line with needed context.  This allows
readers to readily follow the flow of conversation and understand what
you are talking about and also helps ensure that everything in the
discussion is being addressed.

> Without such a deep understanding of ASoC, as you have, I see a risk in a
> bulk enable of `endianness = 1`, the way we do in this patch set.

> Here, we enable an extra feature. Worst case, if some codec doesn't support
> the feature, we will have a system, which thinks that it's supported, but in
> reality, it doesn't work. And we will not even have a error message, because
> the driver advertises the feature as supported.

> Maybe my carefulness is not applicable here. I see that i don't have enough
> expertise in `endianness = 1`, to participate in making the decision here.
> But at least i want to ensure, that we all understand the risk.

The risk here is that we expose a preexisting bug in some CPU side
driver to a wider set of users, but those drivers would still be buggy
no matter what and may already be causing problems on some systems even
if that's not been reported so if there is a problem it's always
possible that we end up helping some users who currently have issues by
helping someone realise what the problem is.  However most likely nobody
will notice anything either way and most systems will continue using
exactly the same formats they already were.

--ynGECfZ4fyGoHAyV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5dzEACgkQJNaLcl1U
h9C0fAf+OwC0Hyclmz9kzI3EP8ghe3HYRwAIswoc0yKCpX82o+C/6DhbMtY0/AYJ
qyMt5iL5/SZwAnLjIyw+NQoHH1zPiTzEAyCaq8oxQckhVSNdr13+HSO8py2aqb1p
FhtbV9i2Ca2KeoqoY8b2nlaeb/T7W/Qp/kotiDhWNs8e3vkmCDrEOnMM2YqDDKq7
oYAp/70UFzQYOTxeufAzBwLHJaoFaZr3lcjWqEqFEhwKNsUeH6tyRKrjcfk0uGBA
bOqFvErmGFp/zROiWzExGJjqcMfIPsvILaAEvdk+mVS1inVzm6HtmisCIUnilBIQ
+BxAMaDwZ6MRZ5nN/yRxMzzhvz7dnw==
=BAa2
-----END PGP SIGNATURE-----

--ynGECfZ4fyGoHAyV--


--===============3968143738972936713==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3968143738972936713==--

