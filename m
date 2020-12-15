Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC4FC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 11:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9B6222B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 11:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9B6222B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+mCoGlnLV0L5h9ePmtqPB0CtR236Oy3QMq8e2k1Bfys=; b=Us4KxR8lhCAXwEa3YBvPD9Mtj
	e+MgzsAN7EbTstmSEAxEFvNOynrc3p1I838F6gOjgZptKvZlDQH3qdQY5O0IzAnXRYFU+M5f9rvLs
	IQoSGMIuoUL/4M94T8euLQSIzrmC3dQbodaaHjU1E+19umzkF9IXLZN84mJRa3YdS7xSisx7kSNqM
	D5uxLq23uZ4scNt/E2MLIY9xj4q1K7qN/1jdSwlVqzcOMxzj6xMFBoWSIakO3b3sldWLPqz+qXWQs
	pZ/3+P6z1KpReWsa67yJrhZrjBdR0EBKn62OB1xydlItTWWyS+Jk8FdTREMAlIOSHUNukr3AdTrt8
	TOzX7N/kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp8wH-0000hz-2R; Tue, 15 Dec 2020 11:56:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp8wB-0000gP-ID; Tue, 15 Dec 2020 11:56:17 +0000
Date: Tue, 15 Dec 2020 11:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608033374;
 bh=/M1gPHhbjgtFjXVpzyyIzQbBvEuAExjx+HsjBRMWbRY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=c7rf8bArDp8KcpkW78LRNYjcres70AOcyfyBiAt1LyTHsMcbbEq3G6F9xjmvhtHGS
 MEz0xhYqxJ18LRM8eMTKA89SCqie8tLcUQOJowOcyPzWcx+/w54LjsuPQwda4XLnz+
 kgnQ2ExXZj/MyxQzVZJuwIJwbCrskmtubzDQ7jGDLvN8dycKW1AvoPXKcqYvvxgmlk
 vgUaz+/8jt3IB4GxW+a/U8H2fkUutXyKWooHFHHwMeIOiRsc0fC6EfIFKy7ORq1eDc
 1ab818dHRmdXgxHO1NsVp+spshTDJ0udtXJAqpW91YQ8lgu4hIZL6GStoGSBqvUTZl
 oCc+fgF5cNY3Q==
From: Mark Brown <broonie@kernel.org>
To: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH v3 5/8] regulator: mt6359: Add support for MT6359 regulator
Message-ID: <20201215115602.GA4738@sirena.org.uk>
References: <1606103290-15034-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1606103290-15034-6-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20201124170732.GI4933@sirena.org.uk>
 <1608024188.29527.2.camel@mtksdaap41>
MIME-Version: 1.0
In-Reply-To: <1608024188.29527.2.camel@mtksdaap41>
X-Cookie: In specially marked packages only.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_065615_683085_95005790 
X-CRM114-Status: GOOD (  13.56  )
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
Content-Type: multipart/mixed; boundary="===============2655022522297566005=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2655022522297566005==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 15, 2020 at 05:23:08PM +0800, Hsin-hsiung Wang wrote:
> On Tue, 2020-11-24 at 17:07 +0000, Mark Brown wrote:

> > This looks like it could just be regmap_get_voltage_sel_regmap()?
> > Otherwise the driver looks good.

> Thanks for the review.
> MT6359 regulator has sel_reg and status_reg, so we use
> mt6359_get_linear_voltage_sel for status_reg instead of
> regmap_get_voltage_sel_regmap() which uses sel_reg.

Is the selector register not readable?  In general the rule is that the
get should be reporting what was configured, the actual status should be
reported separately if it can be read separately.  We don't currently
have a mechanism for doing that with voltage but one could be added.

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/YpFIACgkQJNaLcl1U
h9CjjAf+IDONK3A5Udjly1RqCkRY5souPMpCZoh65EQM8+rD21ybKziHZCzWl7fh
c0Ix4/TdsLHsnruxfg0nBaLrN1xuN+lP0NEHUORKwhrBynNKzWxWBH7wbCsuhE9T
f18VvOA21BLCiEo/KbvcV7PXRo5XqTOMoNKt2cfdLAgVPViPSx5obkgQicMwXBH2
Ye5Rg1C1B13EVTnHmIWaALLEIjxtHkTeYGsBK76H09Rj0xGJqPZ7KJZeHst05eaC
2W4fobgNw046d+jG9SFYahZt8YQDeoa9ADGucwW/C4naZfvIdnwZidEJ4u5VaP+7
IRWhOc4UbbZxwOXJX4OGoAtVpe1NnA==
=HdPK
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--


--===============2655022522297566005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2655022522297566005==--

