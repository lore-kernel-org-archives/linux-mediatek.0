Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBCB7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 17:18:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E33265220
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 17:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E33265220
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AWsZc+vYap8dTwZKbi6Yn/37oF7Dzi2UgDUOotR0QoM=; b=M+F89dNhqQETh62y0RrxpK5ke
	06BfAb2sz7nR6iFiYtRgPBUI5MR0VCw5NXYFVuX9rwa7d87t2aMnbVUWVo4AZOS77fiw/v0rXGFTQ
	FYqd9t6G75OYGsvE2o8d8Dw3AJuvdRnDwG/8lch+a75x57GaP5buolEJGGXgZjqY+nwp9WalCHFRE
	/j4T8L/09/8ADZOOUPcLRyScyrgzFgdrHwXLkOd9z+OY/FvB3xKSEFfSNkP+glzIL4P0ui2buhgE6
	Pg9IV+7XO/svE7svuS09jHLYDxIlOthz3/5ylygOVQHfbChQjAvhOll41jHbOYX2y/hkALTLONoT1
	nAXwc18nQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJJWG-001JRE-SG; Mon, 08 Mar 2021 17:18:12 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJJW1-001JLx-K9; Mon, 08 Mar 2021 17:17:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 540B5650E5;
 Mon,  8 Mar 2021 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615223875;
 bh=Fu/JGQBOiy86rBvW7ExIkK3fJm6AQtgCbYoK8Wp/T5Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W58Q16HEqezuZm4pRNseTZXtJurVK4AuXQNxhvNLEXaYXTDY+FbesGFvspu+sbZyh
 1QKQZZ80woTEYZS21WQWhOgtpW/V+4oo91z398FqSkZ3GXiD4JD7x7hKiQIj3zOLAu
 LfgtUigscTWrnHO3AM0fGK6phRYYzZzOI9mKlaCPF+8ReM3itkSrzHmEgKFYGEylf0
 8ggp3HN0RaET4G4lYgwSHEFE7iMUb/SeKjPH3YWeJ3y8CW59lONIlFVJ5n3Oa0Qd9U
 nI157hZsvKka1mUgw19OiTpqrFJ3Dm+D86qIC2ww0/6D/82pbxsF4yz14y9jOcGNLs
 p+aPvW/ZXX3AA==
Date: Mon, 8 Mar 2021 17:16:44 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v16 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20210308171644.GE4656@sirena.org.uk>
References: <20210308043607.957156-1-hsinyi@chromium.org>
 <20210308043607.957156-3-hsinyi@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210308043607.957156-3-hsinyi@chromium.org>
X-Cookie: Am I SHOPLIFTING?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_171758_039257_44A230FD 
X-CRM114-Status: GOOD (  14.33  )
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
Content-Type: multipart/mixed; boundary="===============5184859634433456061=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5184859634433456061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sfyO1m2EN8ZOtJL6"
Content-Disposition: inline


--sfyO1m2EN8ZOtJL6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 08, 2021 at 12:36:07PM +0800, Hsin-Yi Wang wrote:

> +	adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +	if (IS_ERR(adap->bus_regulator)) {
> +		res = PTR_ERR(adap->bus_regulator);
> +		goto out_reg;
> +	}

Idiomatically supplies should be named as they are by the chip datasheet
rather than just a generic name like this, and I'm guessing that systems
that have supplies like this will often already have something
requesting the supply (eg, it's quite common for consumer drivers to do
this) under that name.  I can see this being a useful thing to factor
out into the core but it seems like it'd be better to have it enabled by
having the controllers (or devices) pass a supply name (or possibly
requested regulator) to the core rather than by just hard coding a name
in the core so bindings look as expected.

I do also wonder if it's better to put the feature on the clients rather
than the controller, I don't think it makes much difference though.

--sfyO1m2EN8ZOtJL6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBGW/sACgkQJNaLcl1U
h9DCqQf5AWoY9ts6hYYjbt4Rs4LUqzM+fet/NEq8b74WOnZgN0CV/Z14n1897bb6
NfPqKzN5/+39WvYaZN5Bm3DUG7DDbwtvzJY7Xhi33xDkvbE+EFNQH0CbGlE3CdbV
N5uGr7oYe7fhTzbj28R6Edv1Lc3ZRLR8iMlDGeA04KVgbXg3qP8lowfPkr+GqxjQ
f5ja8ZTnbG8DvmGAa4x8XT+B7WQ3EIFoeO9O2PiAjAHn0EY6h5EFPxaLJQ+1F6Rf
Fbtl11qFb/NaefGgEAYN17x2bn+8p1cDv4k6ljOUt07h2alTleDouzbQLQfNzQjH
oVohYzF4E6HpXzMqJkv7S3p46VrJwQ==
=VKuM
-----END PGP SIGNATURE-----

--sfyO1m2EN8ZOtJL6--


--===============5184859634433456061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5184859634433456061==--

