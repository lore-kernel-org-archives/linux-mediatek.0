Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33417C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 13:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XC4vbtLQkOMCOOWb0SyNTn2Jbgf4H2tuWpAYv4ogsGI=; b=S/SHxw+DW9EK9edG8N0FlPyH0s
	C2/BigQOMC4eT2i7XLdXNkOoAN55ri4mUhkeeMD1PnoawVrXupveDfNydjRLJHNSGYWgbb97nYXbR
	EelEJmc7OEG5XZ6cpqC2ARkReEQDO/1FUprSuHPzCQkmjNV7nGp+lcMB5WLjoSNGTOwQm0LDFMMoD
	ofM0RG8iOC4w6x6M75Gh5X1lMdbaWAyFRPp7OklgyK0EHfHoyNTRRwPqXm6EP6TETR/BKksSiHYev
	N2myhbC2pT1ucAd2PF6LGdrPWrdaW6yfhB+K+/fPEfwp9ogoXHWuWDqCdO3UqGYA8darBT/dHbivK
	bqVira7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noPVu-0025su-DU; Tue, 10 May 2022 13:02:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noPQD-0023T6-82; Tue, 10 May 2022 12:57:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE2596140D;
 Tue, 10 May 2022 12:57:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8CEC385A6;
 Tue, 10 May 2022 12:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652187420;
 bh=tvwLfOxXKndhTvGa084ydZQFrDEYjgjF9bSCciYJaJU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9evE9ev47KHYn/HoEss5mWYpgA/f/Cj5sEt7Ex3l3ynlfTMHncK6GHH0NydIERkD
 bedBj+SaB+1/4BcVBkGWhL+HsxRG/eUAwz+U+ceYXtRhXU8hQGT+aq/wevqGqhWq5O
 zephFMntRvuaGMR0xoTzGtIHT02yvKwpqytDVdpAu0jykb7nJZTECsQYK3fiygxafO
 F4JB7xnHHTm1W/GNy7YgZV7IS1RPKoaLbfDWYRcHNZuXn2J5MqPVSeZ14OlMY92s5L
 MzF8Wvktd6GNnzu3pT0ZNPoppVfnhuBxJCjUWs4BJbM1LrMHUimUUDFDGcPciqCDVB
 BJGFHWsEcFXsQ==
Date: Tue, 10 May 2022 13:56:54 +0100
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, jirislaby@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Message-ID: <YnphFjs4E4EYafT4@sirena.org.uk>
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
MIME-Version: 1.0
In-Reply-To: <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
X-Cookie: I've read SEVEN MILLION books!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_055701_364702_F66A36BD 
X-CRM114-Status: GOOD (  10.25  )
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
Content-Type: multipart/mixed; boundary="===============2140931597982499496=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============2140931597982499496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DWrGk7+uHbpfpcFM"
Content-Disposition: inline


--DWrGk7+uHbpfpcFM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:

> Sorry for missing this tag, and also I'm sorry for the noise.

Hey, if nobody broke anything all this testing stuff wouldn't be worth
it!

--DWrGk7+uHbpfpcFM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ6YRUACgkQJNaLcl1U
h9ChPAgAgjpz5OhurZbZHuhdBiMyrE29fnjE3J1/HD4uJY691mclFsX5//4n0HIb
jASN6LgjuO5TJczCcQCXSDSx3QmKdbwDX18iU9uetLryBPQVFzJvoJsSCzR0PSba
5e7AV9wpNsi/R26eIjjlJqDaPJKAdJu/Wb/gHh9/1VbkvD4LdczwLJ1lpNGmf7Ao
hxRfoJ5zun+rnnwcXCeyOgcH4ihu3w4RdzrB6bp6cSRO6Pvt/lvp4X6RFHlLU/R1
kzGHfS2je52R7tFENOvF+l4YVh/jKl7XdID1Vm4Pq2VtVA2va2zbO0FMZVno++Ig
7wQ4RpeO8ILo9rxR3Ra+LzAMDoNgZQ==
=VL44
-----END PGP SIGNATURE-----

--DWrGk7+uHbpfpcFM--


--===============2140931597982499496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============2140931597982499496==--

