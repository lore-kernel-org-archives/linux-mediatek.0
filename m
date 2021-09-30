Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6F1261211
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 13:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C6F1261211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyJkx0o2j3twVSdR4aGopUmq0HDMPDxQzXBQAMqUJsU=; b=e78b8nzmyh+HXJghUTC8d3/8qN
	nP7v/lLDO0vXhTP47aY36nJdBXuzGJtihA0IuumKLWkPRmJYTBAZ4yXlc5Dluco4R5FgQM3DE1WJd
	8BKOnSPMznxOabixnEDhYLmAplnuzfcC89O+R+WrZuwM78IN1gFGepmNp+BOHKB+H+qA7AgTEPonk
	enxDfvVRIiPWehNfagwz81S65GjQE+buODLZec3dzBAbTMcS8LS3QJH/iZipqscDHgj2D2Wdk2VUw
	lgQ60rldBc/KBOyTQS5u17ZkbROZ4QZcTEQBjXJUN47zbi9jb4TPOg4ltHCwSRVQoZrXFgpsnLVW9
	yG85ZpoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVwLM-00EYRF-Gd; Thu, 30 Sep 2021 13:43:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVwL9-00EYOw-E7; Thu, 30 Sep 2021 13:43:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DEA861211;
 Thu, 30 Sep 2021 13:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633009391;
 bh=Ipx8IDO4kCqX8IkrH3s5LY+e6LHzDltWwtgallL5o8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y6hGwT3q0LAQFScM7gMsY8r+D7IMvf/gmTOFHOqRpQOATFGKDDNFxUJP4vIvIzPu+
 pGrTzj2EayoM9brB3TAWb91OUlKulaJDesFYmoPI9lWq6Q+14LVWNjhxiGvtd9wycf
 JyJSB0NYj3cShK30KMYXOooUyw52+25WABrPsfxuJpLPiGD+MY3rqVy/7R7WcQE6Bw
 qzngf4bsALEGhofwWt7gGWlhAiV+9dzZyXiQ2p3rBajOavbwnujBjoQhnv9rQjPNup
 +J1w3dfDWOuJFD58iuFEJlcsHQukOCxU62WGKUJKo6ZLSd8CTPOEZG0HuHrclo9cuV
 JJx5IpVsHvsqw==
Date: Thu, 30 Sep 2021 14:42:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: kernel@collabora.com, linux-spi@vger.kernel.org,
 enric.balletbo@collabora.com, dafna3@gmail.com,
 Mason Zhang <Mason.Zhang@mediatek.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] Revert "spi: modify set_cs_timing parameter"
Message-ID: <20210930134220.GZ4199@sirena.org.uk>
References: <20210930120700.2564-1-dafna.hirschfeld@collabora.com>
 <20210930122513.GX4199@sirena.org.uk>
 <28f8af42-4535-ef9f-e521-712d37e2cb72@collabora.com>
 <20210930124630.GY4199@sirena.org.uk>
 <bce800ff-9b3e-500b-6a42-9a60d3a0c590@collabora.com>
MIME-Version: 1.0
In-Reply-To: <bce800ff-9b3e-500b-6a42-9a60d3a0c590@collabora.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_064311_531656_86629168 
X-CRM114-Status: GOOD (  31.96  )
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
Content-Type: multipart/mixed; boundary="===============4465915152958310295=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4465915152958310295==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vM12nk/63StVgfqY"
Content-Disposition: inline


--vM12nk/63StVgfqY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 30, 2021 at 03:06:52PM +0200, Dafna Hirschfeld wrote:
> On 30.09.21 14:46, Mark Brown wrote:
> > On Thu, Sep 30, 2021 at 02:36:01PM +0200, Dafna Hirschfeld wrote:

> > > Actually the original commit not only change that callback 'set_cs_timing' but it also
> > > calls 'mtk_spi_set_hw_cs_timing' directly from the function "mtk_spi_prepare_message".
> > > So this actually influences all devices bound to this driver (in upstream)
> > > I did some printing and it does change values that are written to registers.

> > OK, so that's something that should have been in the commit log,
> > preferrably in a more detailed form that identifies what the change is.
> > However changing the values written out is clearly not the intent of the
> > patch and it is a substantially better API so can we not just fix things
> > so that the old values are written out?  Why are we jumping straight to
> > a revert here?

> It could be that the values written to the register in the new version of "mtk_spi_set_hw_cs_timing" are the same
> as with the previous version. I didn't check that. The difference is that before that patch
> the function was not called so it was a dead code. Now it is called and causes erros.

> Without the datasheet it is hard to know how to fix it. I responded to that patch two days ago explaining
> that but Mason Zhang didn't respond yet.

The hardware supports register readback (it's doing a read/modify/write
to set the new values) so it should be possible to look at what the
default values that get written out are and work out what the default
parameters should be set to to give the same effect (instead of 1 which
is what's currently used).  I would say just skip the delays if they are
zero but that means that if only one device on a bus has a delay
configured there'd be problems.

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--vM12nk/63StVgfqY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFVvrsACgkQJNaLcl1U
h9Dvgwf8D/QgRgGL7+atgjRw9nrUP2dqOjbRukvgflD12pYe5ijMEvL6BFICSt4L
T1sOe/K5W6GTKGOKlEZXqHZOtyYSvZfeOkIj/NhvmQzxfwLoDO20UuK/5nILt7Xb
h5qP9YOjJHOfWUlZCg/r07K7V5r3CyIwjRbayLxAdC1kpaihkQH1Z5js5q2Is4w/
SAamMil0l6tzMEXEorBK4fT3KJfA4rtIMe1u/npdwXw+50dO/zPEWWtTFyHIGzuJ
O0oG+4pAEF9brMYzPTnq+c6AHGRQdCoD/nEoGrVHm8IBkqxnq7FM10/NjBH2RVPc
pwUyQs1Cn163hgBK2eh8xWk9oMJy9g==
=XIiO
-----END PGP SIGNATURE-----

--vM12nk/63StVgfqY--


--===============4465915152958310295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4465915152958310295==--

