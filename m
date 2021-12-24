Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A240C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktZkQKbkf3TPjjq1wOSTOZrGyVj6apJWC6N4Hd0S7HA=; b=V9Cl9qL7w9LxuF4R26cU/uR8sh
	B/ef7jjubaT0mxhYDtcDFlMeeyptzTXBi3q3jBvQG4zAxsAoAi4f5VM7qPZMhPFnR68uK9E5UDzuV
	gUUNU+2dhXjZTkld6kIP7uBmRv5b4rzbEDmMPCVSsjXTZy9LkXc9t4/XQzUafcJZO8lB5v542kvnY
	ucYhKUS22XbeLlZyIWDECX5gYiyyYDPnkisX7ayOBfuUkLKoURNLaQFosF8RaBUSH+fCWV07OtjhU
	KGzUuERym+/aWa1jk314yYlTM+9Oh6DadO0Cyda4QtmamxCFjJtfp+1dpoUIia56LkDdNug492GKh
	xsfzJDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0lAd-00ECzx-V2; Fri, 24 Dec 2021 14:03:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0lAR-00ECyt-Qn; Fri, 24 Dec 2021 14:03:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C23CB81082;
 Fri, 24 Dec 2021 14:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC10C36AE5;
 Fri, 24 Dec 2021 14:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640354608;
 bh=hK8fa6cRDsrkwlVMrS+4FGDDSpxP5rBcfnLDIk/SbPw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tdcvfeu/Y8443O7Qo0NIPTGPDJ+a4youRSBm2Rt/vUafDTiLRt4mzanIMMHOe6xHQ
 GHx7+z2RaJ6fUn0kfem6sFdywW57uCgzbdXcdJkgus0N/gJK0lAT7YYZwYWgi7gM+1
 bXKt/j1hjrq95ZjIjXUGE7A7vA5uoCxLcw1ISrRgwviLwpkjQvPa9kh8NjTK7uoVUH
 YQOpXe9pFKkNgeSAxvCEuP5SVlEnSHMr8VcR8zSjB9vApMX6+29PgRVw2eD5u7k8FT
 bpC2OxHFN+ubra88C3YzDGQh+I3zoR5LY3wQFmqrShRcdFogmNuQF8roMO6+HTtWZZ
 IIC8dhL24vL9A==
Date: Fri, 24 Dec 2021 14:03:21 +0000
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com, chi.minghao@zte.com.cn,
 kuninori.morimoto.gx@renesas.com, srinivas.kandagatla@linaro.org,
 pierre-louis.bossart@linux.intel.com, pulehui@huawei.com,
 srivasam@codeaurora.org, lkp@intel.com, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cm>
Subject: Re: [PATCH] sound:soc:remove unneeded variable
Message-ID: <YcXTKTREgewfX9bJ@sirena.org.uk>
References: <20211209015707.409870-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
In-Reply-To: <20211209015707.409870-1-chi.minghao@zte.com.cn>
X-Cookie: Time and tide wait for no man.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_060332_035313_B5E502FC 
X-CRM114-Status: GOOD (  10.79  )
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
Content-Type: multipart/mixed; boundary="===============1749333607122819670=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============1749333607122819670==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dlC+KfgP4Eal8+6F"
Content-Disposition: inline


--dlC+KfgP4Eal8+6F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 01:57:07AM +0000, cgel.zte@gmail.com wrote:
> From: chiminghao <chi.minghao@zte.com.cn>
>=20
> return value form directly instead of
> taking this in another redundant variable.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--dlC+KfgP4Eal8+6F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHF0ygACgkQJNaLcl1U
h9CixAf/ZcaKYZRi/L5ncPwFD6FR1S3oma/laZ5y3FcRBOYoQz2SRTi9MncvcNeN
L5dzc8qwJU+Q8jYXKyAK6UAni4gaQnqDlnCGX8Nya6mR5gV9aFD4G6zjZjf46ZGy
JL7k1tlD9+B1eIa1EkyDU/SuD/I6tr0eRI3cTNIymZPu89Zl92gC4LJ6nlzh5mRy
PD9lqLR5vYA6OD+iWpKm2S/sCU8oG6wh6AdAleVY9pYrvRV9djrHa2jNqPYvNPpY
j+p4sQLaz02BPGQrZPO0Y7GvuWJeB5L21jxiQ3de29tLao2rB+XaLad47cQXtsSf
GE4aVlkQeVEn5N7G6vAQjTsYS5Mczw==
=41gK
-----END PGP SIGNATURE-----

--dlC+KfgP4Eal8+6F--


--===============1749333607122819670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1749333607122819670==--

