Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 19:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIuPvQgJp40uJ3zqHjd8TJc4Z/BdVmZGIKX3iogSY+A=; b=ipFGN9Bz9NeTsjAUmTLxci8VF9
	vFpNTWobB9KQqvqKhV0jINtHtJm1JV+Tu2NAn48KCj/5nROT/3v+FmcpN75qnROMSZBeSTKmY4GJa
	Dzy4KxrnifErucepk/oaymc7wZxtXX+UICRT9wr7jFb+JpdrCvQs/YzLWROVjMQTDxCnnL1eH3u8g
	VVmGGoQ3iPgpJhf+NUFeUbWIzDI8N1+2nYXAHpFX7E18wf2yzd0m+Rw2jCuR0Bd3jTFRjraOdszp8
	nORi8/uS21zEJYxmfQaf2T4NCGJtthYRtXjeR9u/JugG1nXfjGguoNBQJS8d6peb8zUmd6/oF2tqx
	Hf3yGx9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvOuC-00HL7M-9d; Thu, 09 Dec 2021 19:16:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvOu9-00HL6Y-2G
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 19:16:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 745F7CE27F7;
 Thu,  9 Dec 2021 19:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C43FCC004DD;
 Thu,  9 Dec 2021 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639077388;
 bh=VqPjE74hUiM+wV9wag+bjqN/URzt4NeUOb8KYkowL5o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sjEvlS5+hQU4fB/H9lpg9Ts/lSab8T1RBLIEr589scWZqkl2Bkc/dPI+bzGs41I1O
 BUFfIjluzuUFhqYpPFUf0nc7HO5X2+z0sJkezTb4W1fNDBrAnLSdcZ1p86+5bNkA77
 N1Me/mr3L1zj2Oqq22/KDABOSN66s2/TffrX0dp4AQY7sMTgf/tfmUBtdhdfFTkyXb
 Pv88yhhaO1I4+7uHsMV4Srg/ENdeH4OoXslRUXnguMCWvz/mBK7ekTpI7lhYidVpWB
 iKRDjFboULkE8YiJBUnEV02p6l9yjJkg/tq/RRjzsL6Yofwc7BBSCkghSZZI5e6CBn
 Mb0i4gW2ffuDg==
Date: Thu, 9 Dec 2021 19:16:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 perex@perex.cz, linux-mediatek@lists.infradead.org,
 lgirdwood@gmail.com, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Paul Olaru <paul.olaru@oss.nxp.com>
Subject: Re: [PATCH] ASoC: SOF: Remove pm_runtime_put_autosuspend() for SOF
 OF device
Message-ID: <YbJWBpxHo4zN4zFJ@sirena.org.uk>
References: <20211209174657.141268-1-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20211209174657.141268-1-daniel.baluta@oss.nxp.com>
X-Cookie: One picture is worth 128K words.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_111633_309750_79742138 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: multipart/mixed; boundary="===============6824370935233780170=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6824370935233780170==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hEvhH7N569Hzdzpj"
Content-Disposition: inline


--hEvhH7N569Hzdzpj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 07:46:57PM +0200, Daniel Baluta wrote:
>=20
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---


You've not provided a Signed-off-by for this so I can't do anything with
it, please see Documentation/process/submitting-patches.rst for details
on what this is and why it's important.

--hEvhH7N569Hzdzpj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGyVgUACgkQJNaLcl1U
h9DXDAf/V9WKvYxWtyKZWaVx8aEh0kubvlvQRgFVA9NuUrK8ERYh83ykeUpVX6JC
3x8VgygJLVz00vpIZ7/+Xe6kmpHTezjzdhKayOtXEdBr8uGA4UaTErSb8DWpYJ5f
Es7u+0jIIOJa2QvHRgTmAq2EllPEEgQ4rt2aISxj/tUEhWHdF6ElY//3EzZXxf82
U0fQq8LHRPfPdjrywngBPVbyGOUgXzM3FAYCatVYdG2cclJejWWHPD6Zc44TRIc9
H2qDFnaEzZTvdQ6ZNvhkK9w4QLeh80YSWplXHoSLWuG/vqdivqNJkqgPqFDra4Iw
bPaNP6k50hPDeiFdIWPFIhUH989GSQ==
=BmDs
-----END PGP SIGNATURE-----

--hEvhH7N569Hzdzpj--


--===============6824370935233780170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6824370935233780170==--

