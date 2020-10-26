Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA8DC4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 20:36:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6755207E8
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 20:36:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QYkOBR42";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyNgwzHM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6755207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hOdPUROTulP01yavPRRvMUes/0K+N2zz2nqcUSv21pY=; b=QYkOBR42J7isoTRHf1Aa/UhBi
	DJ5H9knD6+Ux0Q9yLY8ElfJiNWlia935Tk7xKpM96odDQZ1nWwDbttpDVOMRnENUXd13fqJPo9/5x
	ChI7LBs2AcM13hb4tGV/k+YloQLWtPy6LHRxoTw9d+S2+BEuh8234H0Jwf+2zXRTx+/C+4pUqGZJV
	tEPjAuy12fRekIdLThogwcKGsdePzFBY1fpobsXzFUtAsW639L++0C/S4f4Oc9JWW2F0Yh3pbie24
	N1C3YjZeXRB1ao+nfqcT/jlfyDEdDav26kL4PjXX25lC05F/Wwqfxd9FjjxA6iCCjwpG+Kn+Jj1iw
	jHMXccF9g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX9E5-0002Vy-RL; Mon, 26 Oct 2020 20:36:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX9Dy-0002Tn-4V; Mon, 26 Oct 2020 20:36:14 +0000
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9722207E8;
 Mon, 26 Oct 2020 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603744573;
 bh=O52isSyK67wz7u/WK6c8oDPAtmNSuqkBMdDiqRurhQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TyNgwzHMG3kipk9sEO1r3JgY4RC0iydlCvAz/zgXCSQluq1TXqAWBbaZfBH4HcV1u
 YIyh/VB5f3XoCUDAmciA5GwXT0MUE5LfAy7+nS5e1pYUw5wm3diqPBWLKKovncNyU7
 eoJN/DpPloMredPYPKTO+z24scAZ0scFA3/VggB0=
Date: Mon, 26 Oct 2020 20:36:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: regulator: add support for MT6392
Message-ID: <20201026203608.GJ7402@sirena.org.uk>
References: <20201024200304.1427864-1-fparent@baylibre.com>
 <20201026121316.GB7402@sirena.org.uk>
 <CAOwMV_w5N0_Qgg3MFph1147cbvFP1Y=mUtNjGbcr-Tca4ZJ3yA@mail.gmail.com>
 <20201026172431.GI7402@sirena.org.uk>
 <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOwMV_xt=OV6cKqQTZUUSAvYKxUUQZAUywAHtFFHL=E5xVu-Zg@mail.gmail.com>
X-Cookie: Safety Third.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_163614_260523_FB5547C2 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Type: multipart/mixed; boundary="===============2284377125395925914=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2284377125395925914==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j+MD90OnwjQyWNYt"
Content-Disposition: inline


--j+MD90OnwjQyWNYt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 07:38:14PM +0100, Fabien Parent wrote:
> On Mon, Oct 26, 2020 at 6:24 PM Mark Brown <broonie@kernel.org> wrote:

> > >         .name = "mt6392-regulator",
> > >         .of_compatible = "mediatek,mt6392-regulator"

> > This is still unneeded, it's just a reflection of Linux implementation
> > details and should be removed.   The MFD can just register the child
> > without supplying a compatible and things will continue to work just as
> > well.

> I'm not exactly sure how it is supposed to work. mfd_add_devices seems
> to register devices based on of_compatible or acpi_match from the
> mfd_cell. This platform does not have ACPI so I don't understand how

It should also support unconditionally registering devices, if it no
longer does so that's a regression in the framework which should be
fixed.  Looking at mfd_add_devices() I can't see an issue though, both
ACPI and DT information is optional - the entire DT section in
mfd_add_device() will be skipped if no of_compatible is specified in the
cell.  Are you *sure* that the regulator driver isn't running?

--j+MD90OnwjQyWNYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+XMzcACgkQJNaLcl1U
h9D8Fgf/aY41lzA2GffEUL92jRQgpryeIR0UjVjAKQ15Q+FNzHhDQDjS62uceDK7
wH/NxVxXJwmheYwxvKDRglhGW0BSlYd2T/ALNzTDrb1HlHaaYmkYftCf3Ijj4EDI
sX7lN0rcEG95Z8uSVgKxOw98sX4tvqItnM+sNrHbkq1aE6Vz8cX7jaxkn7DvC+G7
sayBo3bg1cUj+yWVFzkGhmlm9ihb38yX3UI3dTOKQlh+rjCxw0o+R34whmJPtZe8
BRhcrr+/Zw5slffrzVmjSeklyFaqem839diSUzj7UoG6CuFyP4n9XbCpiaNz01aJ
9jzOgf4SPNSSyceZfdZLoxQgGvAHqg==
=tD5M
-----END PGP SIGNATURE-----

--j+MD90OnwjQyWNYt--


--===============2284377125395925914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2284377125395925914==--

