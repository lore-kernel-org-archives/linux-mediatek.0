Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35222C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09C2C60F02
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 14:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09C2C60F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwuzkp47WHQ1RSgIERKmb9ARh31+JdNZFSaXNgkQbHk=; b=lC9Fabl3X4CKxLr7Jq7WlRaqIH
	sfYLqfEF+n6mXYmOX9La1ooe7j2jajAKCQ96bYE5WmMXWpPKOvqhQSh/SRFP5eSibmy+bK6CjeCeP
	A0Wt+qMhLBovTVpvVDkpY2mCF+ZKqmsXbKh5c/Sa2d8POISL68KBmcmDvUuhXoUuN+Eyx3I40knn3
	MXqODatvkXzuDlomb0+k0DSDS21PDdL2bmzU/Tqd8O8p2u96tGRGsq2f278jenpLmJ5N7/1AfHcw+
	etrI4JbhmBmSFGh4zLlm82pHMMigZHVIoO43dU52d7MHuh0HvGV79y9zt1cWzUObwc8Z0GuJ3eqVA
	v4m8VpJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAv8X-003Bb0-4G; Tue, 03 Aug 2021 14:11:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAv8F-003BW3-Ot; Tue, 03 Aug 2021 14:11:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E558460560;
 Tue,  3 Aug 2021 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627999859;
 bh=N0ZTtrHdIHPT96G9nBYkGdXTL8PsI1Gk6OP7BRI/XWU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g+8I7RyNPSsLNAcXZ0c7bkXcr6kChyBewrKHP4n4Yvbi+42JeojCborCIczYftJB/
 GKveQlwLIL9FhKlaZEotV+MhPEM8x5WUNZiHV+EgZx5fiwkxyBtFV0ntj5/4u8Nt1H
 tD2jdm2C9kaYGgBrczMmXVoLDXMgoIXSrE9gBkxpLnVNgY+xOm959iOvVLkRbN4DbW
 Z+aAU1iteh/iQzWVUtwGNZaSSsw3PQ3s+5T0YQjxyKyFnH3tgA/3mhA96byevPBy+9
 Fs4bQXWcPeDiByrKpB5ZY4c1OTxZ/TU6nTOvZD3x2Vrhx+4YdDB54GdrCsjqJQ3VbX
 +3n4ivjhRNj7g==
Date: Tue, 3 Aug 2021 15:10:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <Mason.Zhang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v2 4/4] spi: tegra114: Fix set_cs_timing param
Message-ID: <20210803141045.GN4668@sirena.org.uk>
References: <20210803102517.20944-1-Mason.Zhang@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20210803102517.20944-1-Mason.Zhang@mediatek.com>
X-Cookie: There's only one everything.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_071059_894238_327463D6 
X-CRM114-Status: GOOD (  13.93  )
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
Content-Type: multipart/mixed; boundary="===============5427290892008655802=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============5427290892008655802==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Rzq/nSLlHy1djmXS"
Content-Disposition: inline


--Rzq/nSLlHy1djmXS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 06:25:18PM +0800, Mason Zhang wrote:
> This patch fixed set_cs_timing param, because cs timing delay has
> been moved to spi_device.
>=20
> Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
> ---
>  drivers/spi/spi-tegra114.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Each individual patch in the series needs to be buildable by itself, if
an earlier commit in the series causes things to fail to build then that
commit needs to be improved so that this doesn't happen.  This supports
things like bisection.

Please also look into how you're sending serieses, these patches aren't
threaded together as normal and there's a weird "***" in the subject of
the first patch.

--Rzq/nSLlHy1djmXS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEJTmQACgkQJNaLcl1U
h9D67Qf9EAF3egsc5vOgwsyJ04565RzPgzYINu8phKCoAsP7U3wUTep3WbMcGLOx
lFEMzwwxeT8grDvDqx3wjXvh4hb2SnSlO/6hA2UOEUuqe7K3aB+UvmIxUIdoDdZb
mJSklejnK4Zfb0SDTf8NVYpEvvFDO92LcOvAeDVshuHGfKIbsFE3gCVXlsKmC4id
0ztnP4SFtrwQDKgRf1cUvjJwWpUoKwdctGdzlrwz00OvCJkU+U8VMSss/tZkJUpN
+bhfZp2R0aYi3579ReTPj9RfH0PLTNg1c2oVTVCUD7DRPtmrFvUMj0roggpKtlgp
pn72WZmvyXwLgG0g+n0SbtErGbDITw==
=M79B
-----END PGP SIGNATURE-----

--Rzq/nSLlHy1djmXS--


--===============5427290892008655802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5427290892008655802==--

