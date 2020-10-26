Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53354C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:24:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC92221D7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 17:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfLU/Eho";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zwf/0tJl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC92221D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TxqUQ1Gcj7topEHP3sGBeUMO/nN07j17ZS0jEuRbJIo=; b=rfLU/Eho9kXF9Gf6R5K9x+G5U
	laI7Cd4UKPwiHHHIkMCXGn8cK1iX+A6V0pgFKyaQuseTElm5FRpGF9qkzExXdv7sIFJ/Ck2hGDdFy
	3la1ZfKZ0/bODfwOnTMpcVeem3oQOe+Y6OeEGf5ajHKWsYsSTjM8mu844RKcXvxFvRU/wuK48JxFN
	xUNzlTQrRJ/NwLErcjdzH1orJb/54hIg1xcnYTLluChHRmi4V0gcY7O+79eN1EWNLaXuypfhRql50
	ME5DawT87XfYOcTdG3snw0/uq2uopV9axt3UDjVWRL3UiM9nf6NoiMU+bLOHM4v/ZoqYZKWi9qQoD
	2SguTcLPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6Ec-0002KS-K4; Mon, 26 Oct 2020 17:24:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6EX-0002It-K4; Mon, 26 Oct 2020 17:24:38 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1E99421D7B;
 Mon, 26 Oct 2020 17:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603733076;
 bh=r/Go5g+ydHtLSDBV/2d++cEZQyCVyOlKmRWTE3d43fs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zwf/0tJl1quToYepFt/MPzsgGsdO5FaYPLfzE+8gEOZfjiUfR9dZzBgh9BURNBWpu
 Slw6cxiIesxUFz9QC4IegdrLQMV4MVMAxR1d0vymwb2GBBvhcNjXZjcvQGekX/IXNK
 ySzjSlRToGvxUmo97SbK+l9nPBlHKhN7UN/Ac2hc=
Date: Mon, 26 Oct 2020 17:24:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
Message-ID: <20201026172431.GI7402@sirena.org.uk>
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_132437_774757_F1046E0E 
X-CRM114-Status: GOOD (  19.25  )
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
Cc: DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, lgirdwood@gmail.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1286937886246163295=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1286937886246163295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JIpyCmsTxyPLrmrM"
Content-Disposition: inline


--JIpyCmsTxyPLrmrM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 06:18:35PM +0100, Fabien Parent wrote:
> On Mon, Oct 26, 2020 at 1:13 PM Mark Brown <broonie@kernel.org> wrote:

> > On Sat, Oct 24, 2020 at 10:03:03PM +0200, Fabien Parent wrote:

> > > +Required properties:
> > > +- compatible: "mediatek,mt6392-regulator"

> > This is no longer used by the driver, should be unneeded and therefore
> > should be removed.

> It is not used by the driver but it will be used by the MFD driver [0]
> like this:
> static const struct mfd_cell mt6392_devs[] = {
>     {
>         [snip]
>     }, {
>         [snip]
>     }, {
>         .name = "mt6392-regulator",
>         .of_compatible = "mediatek,mt6392-regulator"

This is still unneeded, it's just a reflection of Linux implementation
details and should be removed.   The MFD can just register the child
without supplying a compatible and things will continue to work just as
well.

--JIpyCmsTxyPLrmrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+XBk4ACgkQJNaLcl1U
h9Dn3Af/Va1AtyHzsa7Z0W0FedjMRq9j7LCJX+Kg8oMfDfIwuzNAYDW21SnhicJR
JkaVl7kRqXWcx4LtXAIQp2hpiNBLr2SmVhvUxnHmsVqk/THfKWUXRAGMEfAIyl6x
tkwzYaqeYSPGV8kYpy9oNnA3R27BhsqReot+ImqdmTIcDvUAIkPSsTEl/W6Ixr91
M4LG0s8lzMiTN69LPhKokDUI5fKiulX+/WdXwRuuKBS7augVcN5YJJI0bdAOlelL
twQ4mb7hkrCLwg/ag2cZZagfuvPTGqol8WTuBs+6NmKkvzwBvrCiH97eu3bwO4i7
DawzoJr9YUM7MMdssy04Ui9GaICqgg==
=BCjn
-----END PGP SIGNATURE-----

--JIpyCmsTxyPLrmrM--


--===============1286937886246163295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1286937886246163295==--

