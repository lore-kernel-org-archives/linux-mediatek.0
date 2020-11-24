Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EADC63777
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 17:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4B620857
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 17:31:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hu2Wn0jN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WLbw9I3K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVdQ/e0H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4B620857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0EoL3hB4x56vZR8XZNzgi/KHqBAF8CHVwA3BXelJNb4=; b=hu2Wn0jN1234GyBcDqTf/aem6
	A7GBb5PLaBL+P1wpV5MfwDwqq/uJv6uA6cVeWP1sIv7iieuMD0JRVWFb2852WQKFYZJaB9t7YnGnD
	Ey8AqlGwpQfAbUM0k0VYiMIQctgmh6WMc/xMhkIDoT/CF3XDgCtYqbis5kKUl8km57kZ3zo6hvq0l
	GQYFQt0uh2eVRjSJ6PeyMXFjvJfi30r9oyrEE3syQZwO9vxpHaYDUW7h6P7ZRdR+s8AzlNBDFhXUc
	wQ4Qi3YBqACtFp6EJRrpxfa8XT8ItHpQ9Wjmv1zdIBvU2qWb6EzmzOvgSngSFpoiKV8FdRDdit3Wi
	kNozu0KPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcAL-0002Ut-9R; Tue, 24 Nov 2020 17:31:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcAH-0002U2-Qo; Tue, 24 Nov 2020 17:31:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I1T60oQelZClqpmkGPjljiEbqk4mttfKboux6w+9deQ=; b=WLbw9I3KzDSclYtWNRdvGkpJ76
 pUnCkzCna37lWyveVXLHz1jfTF6kRuDzcQidY1/D4gsuu5xT69d1hzrsKtMuaGE9vtNhU5rC/PG5w
 H5/Zdtcv22MGn8v4caH+J0Xem0NDFKzjAo64K9EqGomL7nK5d1tk/fNRxFbZuR6kWKqJUi2fuQgUh
 ZQcqbbkaph/vjh+B/38sto7M0HU3s5a1/0qYfazII9IwXH2vecEbJVH4aYZ3j8sLh4EvC4vPC1eN3
 UGAt7muCdInRoNMc51sEWqdtZvdZZCr5xIO75+TAPG4XNGXi0ypiTXJo8lykHqC+zcAo0ArDDZXKR
 fd0hVyOw==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khbnL-0005Nw-Q4; Tue, 24 Nov 2020 17:08:03 +0000
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6D1B20857;
 Tue, 24 Nov 2020 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606237676;
 bh=W7tyEH2c9Wz8tVJ+CN2oLzJ70V6jezJ5X5Wdt4/mKXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EVdQ/e0HCKmfCDQgcY1naKkMjYNvREHAFrK4pPdCLL+d75grZpQhAJUdjLFvHKVQP
 5iIQa9VqR62jIlhS5vb3p7mn68JWdD5I/GLkCeHvMhkXx3qLZho/JrJptCtyc/od2W
 +un53fqhGt3bzUh+L6UA6MlPUhDONdTYiYfhKWag=
Date: Tue, 24 Nov 2020 17:07:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 5/8] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20201124170732.GI4933@sirena.org.uk>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-6-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1606103290-15034-6-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Cookie: Who was that masked man?
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_170800_597518_49842D3E 
X-CRM114-Status: GOOD (  14.56  )
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
Cc: devicetree@vger.kernel.org, Wen Su <wen.su@mediatek.com>,
 srv_heupstream@mediatek.com, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4700634184269487923=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4700634184269487923==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Content-Disposition: inline


--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 11:48:07AM +0800, Hsin-Hsiung Wang wrote:

> +static int mt6359_get_linear_voltage_sel(struct regulator_dev *rdev)
> +{
> +	struct mt6359_regulator_info *info = rdev_get_drvdata(rdev);
> +	int ret, regval;
> +
> +	ret = regmap_read(rdev->regmap, info->da_vsel_reg, &regval);
> +	if (ret != 0) {
> +		dev_err(&rdev->dev,
> +			"Failed to get mt6359 Buck %s vsel reg: %d\n",
> +			info->desc.name, ret);
> +		return ret;
> +	}
> +
> +	ret = (regval >> info->da_vsel_shift) & info->da_vsel_mask;
> +
> +	return ret;
> +}

This looks like it could just be regmap_get_voltage_sel_regmap()?
Otherwise the driver looks good.

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+9PdMACgkQJNaLcl1U
h9DDfQf8C8s9n/n3qdfuHW2Kn6XRiTrl88H+miBsBgQRQPKZzHNzh51rQMJiVwAh
jOY47elYyA07c5K+NtqWgpXJiVIwujB0I4jGvhOlDMv601QZ1SuJE0mWmxubHNuF
ZD9QIpzmh/xJRWogoFhoYZkpDOyqkD9lCc1Z22XVVtk5aVCHvk5hRa+u9mZuVF2T
S77qGSSN8yuIhu/1uSR7sYlwvIMwJFdeCyGuanGqkrAvQzh7IGPJ0SAJcTIK7c65
Voz40qO52JKt7Fvdaegh7q4UGKoaKptkGHFCtO7qnr5Gp18zCFqinPzQOaV97uee
8+aE/yewzw8ceYQH80HZTNDguih4UQ==
=eVLl
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--


--===============4700634184269487923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4700634184269487923==--

