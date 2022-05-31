Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7795C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ObApIowH7iIVLrLSfOSTQn3f1AKB7aXXkM3Sg/cYuk=; b=j2pnoCxXjuca2DMPy9pFLkm9tI
	sFVQ9VxitCw3UtDOqMNIBPy/TBF8Euv+PysUMwJceZdRBxtDl1BbQHAGnC1bVyWJ0uwhYRj6xiqqh
	Po6NEHouxBmuaXjTmb3WAUiZAvu2yT9pyK7U/3Gkgsh3N8G0k1S++vtssrtx9uivYEyCcN8O3NyDV
	klfFXHq1K7N6OCORM/XMI4hJhLqkf7ox4rOjYbxuwMh5ulqKNdS0Dz6k1GME7ybQxHKoqHSujTES0
	b1GebMWH1lJ1xUOmQvsTpaRZb8JuTnkdPvwXRhBKq32aBXMLf/4uBOd6jm123tCCis70tQGzOsuYa
	2t7pkaew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1aK-00AyH8-Aq; Tue, 31 May 2022 13:06:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1a3-00AyBN-77; Tue, 31 May 2022 13:06:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BD88BB80E5F;
	Tue, 31 May 2022 13:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E99C385A9;
	Tue, 31 May 2022 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654002396;
	bh=CUlX+9z8cfAhEXvA+cWNMHHopVVQF0wsmaL19jamKuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWC/CiPCADCJ6kefLyjARmREtOnWV+fbhBHIDASIWVmi8Bp27I0V1nbrW/xYBsDcw
	 99RsF9I4hOAsh3TXzFqRPSEncZ+8c0cJRb9/aEoGh1OKeT6v28TNSnWFa38di80MKx
	 IowrMNRrVQBr28ICDqepU7RuuO0ufWLJKByhwBkioBw3BgFK9lacmHLfQH3Ls30Yv0
	 ngAFa18bHmnaTCbLAcfu/bA/dVzKgvrwUzwKKT1hs1bPY+wZZbnxveRuWcNMVrvxDk
	 xSh7QKU5ToBWxP+OGHCAPAdnRPEVYjIThVnzpifUterxL5nL3VO4jYA8cyL2kG8HL4
	 H8oY6IWcQEd7Q==
Date: Tue, 31 May 2022 15:06:33 +0200
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/7] dt-bindings: regulator: Add binding schema for
 mt6357 regulators
Message-ID: <YpYS2e1uGmoJGWxr@sirena.org.uk>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-4-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20220531124959.202787-4-fparent@baylibre.com>
X-Cookie: May your camel be as swift as the wind.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_060639_469888_D1DAD381 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Type: multipart/mixed; boundary="===============7667424784367696026=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============7667424784367696026==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ES4vVuyUeavLpiLg"
Content-Disposition: inline


--ES4vVuyUeavLpiLg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 31, 2022 at 02:49:55PM +0200, Fabien Parent wrote:

> +    properties:
> +      regulator-name:
> +        pattern: "^v(core|modem|pa|proc|s1)$"

This is a standard property which you shouldn't need to describe
and should not be imposing any constraints on, the property is
there to provide a system relevant name to the supply provided by
the regulator to aid diagnostics and association with schematics.

--ES4vVuyUeavLpiLg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWEtgACgkQJNaLcl1U
h9BPxAf+OS9V2/7UbTz61u9a3et3gJurNEsT8gJJVwGGyIHKaLsHpArDO6nNUgzZ
jWMDBk5KAhW8aeF4+eV1A1kyAfVNakRnkKose6A7sXZT5UPCFImND6jnXfvXmWla
x6NO+B2a+aBrP9BJ6DW8OFf1CRpf+o7HQAw8Cai4Qad+1icFQ9A3y9k/JjjQewSX
y0g4EhuK5DiakAE4f2Wbk3qX30mFY/xaz/k9GOmLLqqjjDDD0N6f6Cj8j7eKDz/G
A/VUC1NivcsWuHCvioNMGY7soxNBWanVtm4z9q4Y7I9rv5A5lez0rawWkFIMRpug
t0eGypEI+DYyO4/pTt4vzBOZNgkqrQ==
=joEQ
-----END PGP SIGNATURE-----

--ES4vVuyUeavLpiLg--


--===============7667424784367696026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============7667424784367696026==--

