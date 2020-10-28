Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04191C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 12:33:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6120B2472A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 12:33:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ahgv/MI9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TbLyeh/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6120B2472A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jSutfWOCVi0fOmORLtxuzxqSENaOfmOxMfyyipprjUA=; b=Ahgv/MI9pi1WdG3G2QVfFlSAm
	DYmi5+2LgspTZ/NmOQNW0K0VwGcXtIgrlC6gNxUrT0m55dUHDTjJpUwnBUyrqMAWPgmvFKTlJ72ls
	kcqvaOzFOIqlfMTUlm8kXNSmgHRGWYjmaw5q+HzX+v8E1BGDDutNHNrfCYXenMU08TurJIZhrX+7o
	uPNu2xOoWm6MWkVAAgBLYrGpATgewNb0MEmXJugC78I4ZI1kp0iGYJivzrPy5xkCV39V7O+txBQ+Q
	NmwjG296IFv5U6J5BLfAR00tsW7BGnMJDJo4PYvBH2OjuXU0Q/EdvxgrBxWHixKrRH4WY/BdV/Nl6
	6j/msYUuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXkdZ-0001G4-H7; Wed, 28 Oct 2020 12:33:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXkdV-0001FL-DP; Wed, 28 Oct 2020 12:33:06 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C49B24729;
 Wed, 28 Oct 2020 12:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603888384;
 bh=JjosDQUQWy+igGYJmi0WKgC37EooXcht+4cENWAQ6Ak=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TbLyeh/f2x+UbRkun//FS7B6sqSJ49mZj3OjgR6PH4K3KimUfhQFLFQ6BQPpDkCrd
 xi6fy+k5S0DCdxxqLMWbdRDThoe5KIcN/Br4V+NWhUhQd3f5FlHfQqGnMXr4lOYcJO
 tMDfNOqREnHBUA/He70ECmiVEDgoqoC5rZiPVyWs=
Date: Wed, 28 Oct 2020 12:32:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
Message-ID: <20201028123258.GA6302@sirena.org.uk>
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
 <20201026172431.GI7402@sirena.org.uk>
 <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
 <20201026203608.GJ7402@sirena.org.uk>
 <CAOwMV_xUWea81rKFE=zD4xWL3rZ5G8cpWm5xJHT_AX=_frLDRQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwMV_xUWea81rKFE=zD4xWL3rZ5G8cpWm5xJHT_AX=_frLDRQ@mail.gmail.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_083305_547612_0B1094EA 
X-CRM114-Status: GOOD (  15.67  )
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
Content-Type: multipart/mixed; boundary="===============0814406416291519865=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============0814406416291519865==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline


--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 27, 2020 at 10:16:22PM +0100, Fabien Parent wrote:

> You are correct, the regulator driver is running and probes
> successfully. From my investigation it seems the failure when removing
> the compatible string from the MFD and the DTS is because the
> regulator driver does not have a of_node matched since the compatible
> is gone. Because of that all the regulators registered by the driver
> are not linked to the regulator definitions in the device tree. And
> all the drivers that tries to acquire a regulator get -EPROBE_DEFER
> because of it.

You should be using the of_node from the parent device to find the
regulators set, look at how other drivers do this.

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+ZZPkACgkQJNaLcl1U
h9DLuwf8DzKutRHbnWwgtdxlm8DfM8hWMooeqasKequJUEAmXWGYbeSU5pTqxSXk
b0EkuVYWkUZn8gQI7baerDzLXYRr2pJ64DMrFazHGKBOKzcWza4s93rt7B7O2ORg
5Y4BqFFcD3qAH6ESQ+fGxT7bGLxtWX9CdZBUK8boENVDTn7Q/ZF833nj6jrgFaq6
w3ZzA7Vh4xp9HU16R3bpQEtAvVZgj1QR0yD4T7aXooPAWsYhkm1sRwUyntmoiPse
Qt0z6RRjCFjMuiVk06KlVFvSQ3irJ4YCDEw/o0jyr+97cIvXuAqB4DuRBN+kYScs
s97xCQiyWLaspaWtWP3UyF3CS1IO8w==
=epRM
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--


--===============0814406416291519865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0814406416291519865==--

