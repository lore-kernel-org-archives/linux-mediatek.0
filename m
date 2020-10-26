Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C093CC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 12:14:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E45F222B9
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 12:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rxNHQOBi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrT63QoE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E45F222B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SfcNVZ2eBOFHhVyCzNUNf1lWdneGE33MwfpIMV2JYbM=; b=rxNHQOBiwl6JuPbx2Lm9aBFRr
	TmZCTASpw/YQV95svJ8ogl82+wAG9QPYoVu4IwSjZhsqRIQClwo5c6WT/rdimcZkVy6mlSmYX558C
	yb/udcio3heCGmjJ3TVqE0NIzWF8R0HkF/NwSWvNUxUbXy4UWP+UD00XBaWOb2xRZLegHPNO9T9b3
	lLx2yiMFU1Y6FMIEKdKCceq0gJSdgZD1SoehYYDcflKmG0Cq1XKQY9p0TB4pT5ApUDjOmaAuNEImE
	9e/FXHyEHnD0WAZCZWc+F4eDvbRJC/IEUWCwVIJEj/cG0kgXbtV3nHwx9sqjMJ1Lmp/e58FxeO1cv
	nW6dkWnOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX1Nw-0003yw-T6; Mon, 26 Oct 2020 12:14:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX1NJ-0003kR-NX; Mon, 26 Oct 2020 12:13:22 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4596320874;
 Mon, 26 Oct 2020 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603714400;
 bh=KbAfpS5AGRw5GfH3m/mCuY+N0Ih33X21Px2gXTmbOKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BrT63QoEtM/OdfjjrX6o5GPSeccdFPpsBnbBzIPFgAAREFTx7HUK8cSq8W9qXB8CM
 4cK90m4mOUJM/yXNseO/y+8zH+eieL0kRdBjvzXQXxnEIcZ667D1WedHxzJZrcYm4j
 iTrOTygDy3S0CaBJWIXoSA0r6W+aki5znY5h55ts=
Date: Mon, 26 Oct 2020 12:13:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
Message-ID: <20201026121316.GB7402@sirena.org.uk>
References: <20201024200304.1427864-1-fparent@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <20201024200304.1427864-1-fparent@baylibre.com>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_081321_909279_6549298E 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6459307856036769900=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6459307856036769900==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SkvwRMAIpAhPCcCJ"
Content-Disposition: inline


--SkvwRMAIpAhPCcCJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Oct 24, 2020 at 10:03:03PM +0200, Fabien Parent wrote:

> +Required properties:
> +- compatible: "mediatek,mt6392-regulator"

This is no longer used by the driver, should be unneeded and therefore
should be removed.

> +- mt6392regulator: List of regulators provided by this controller. It is named

This property doesn't seem to appear anywhere - there's regulators, the
collection of subnodes for each individual regulator which I think is
what is referenced here, but nothing called mt6392regulator.

--SkvwRMAIpAhPCcCJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+WvVsACgkQJNaLcl1U
h9COeAf9G6DwjRqvGX5pwncOY8E6kwgs2U7scP5J99ohq9wz9+kF8shwvsGPt2fj
SBfCd0U2GnI653lSXhxJntBFX5NeEyeLayYK/lUr3Xt35POLywsFM+kz08YvYDDL
WC+1pLt3CHQOSZF7FAOYATGzQi3Fah2VdJyNiA/FJxBbomJIomfpSo5PxVW15jlI
gFnUDzCWCtC4XjW8pA0el03F9PzKevC8lnYu51OxzaztC+qiPTYX/l1Kk5yA3ose
jHVRKfU9xIM0k3C/kr1O0Om7z6aRBVQTxpKwQxZURvDGcRoSQm1V43ksgKkfAVtJ
xdKXp5fIp3hAHFlXRxo3B+cARA9OWw==
=XYZl
-----END PGP SIGNATURE-----

--SkvwRMAIpAhPCcCJ--


--===============6459307856036769900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6459307856036769900==--

