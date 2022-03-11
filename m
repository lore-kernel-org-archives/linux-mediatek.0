Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Mar 2022 20:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9bSbKlzi/C5foHUK3v351HM2wBQGCXsR01JiZFYy+c=; b=FMwla0Y6pCfn2tgils35TkbVHH
	DNqTEoD65w6uVVOlPGmOMSWItDo8HGGuHqPCWpQ+eP1N24DOwBCipBiCcuJrOQzsWgHH430wMANEC
	lC0CXcOT7fCTmt9BMdAYYV5f3InIhRdCaYOmN/epuYUoh47Z7AtDMOut8gky8NeXqKz9ZH1+wr2rI
	yyWRWTWxVfdPM4R6efPXxkNbit0emiB/arWFv2xX4NBYkbm8+QrCONM0JrGFT1gW3qYJg//F1sOMd
	rqyKByAWfYskjcMqjnncxKP5g1vni3//pMEi0EUFl8NTmDJw8y8miCyUbjxDzip8/zmOABJ9Z+OoY
	GssAjZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSlzU-000Clg-UO; Fri, 11 Mar 2022 20:36:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSlzI-000Cji-N0; Fri, 11 Mar 2022 20:35:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F3D561E82;
 Fri, 11 Mar 2022 20:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CABC340E9;
 Fri, 11 Mar 2022 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647030947;
 bh=YP9SzrgQyjOQZskM7I0k1hU6CTv2m60VmTGJYg+FQNA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTmQn9kYhV2vDgtP9ZbrZTDgz3ww0WANjipJ9cNFF+MoGIsJ1leq1/4UrDwYkuREx
 qCZrxi4PVxz1rixel+Jjq7JGSbPQbsE8tHy15vcPUxtEz99jK9/dmEnIK/uFeajruM
 tAPiHKtePtmTOYdsglDRt5UQsiEbqsMYpgb3ABqvD0fZQHfvbKPG1BkSwp1sXsR8YY
 FM8eaQlREpHiH523xHHItfNaJRznXQSSdL9gRO/D1+rSCjnzQwWPixXHMQQCvOpgbe
 1pkQMrZv36CCVtGXE6SiSndrgnAP+G1s0dxMFTsPI/sTDNadAJ5zGOFZTegsuSOmXP
 mVz4RYoNDlH3Q==
Date: Fri, 11 Mar 2022 21:35:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
Subject: Re: [PATCH v2] i2c: busses: i2c-mt65xx: Simplify with clk-bulk
Message-ID: <Yiuyn4269G/hXunT@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 qii.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Qii Wang <wii.wang@mediatek.com>
References: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20220303091547.17522-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220311_123548_815437_9F4DB959 
X-CRM114-Status: GOOD (  10.53  )
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
Content-Type: multipart/mixed; boundary="===============4078846240836836601=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4078846240836836601==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iM51bsSenGYDG0Ia"
Content-Disposition: inline


--iM51bsSenGYDG0Ia
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2022 at 10:15:47AM +0100, AngeloGioacchino Del Regno wrote:
> Since depending on the SoC or specific bus functionality some clocks
> may be optional, we cannot get the benefit of using devm_clk_bulk_get()
> but, by migrating to clk-bulk, we are able to remove the custom functions
> mtk_i2c_clock_enable() and mtk_i2c_clock_disable(), increasing common
> APIs usage, hence (lightly) decreasing kernel footprint.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Reviewed-by: Qii Wang <wii.wang@mediatek.com>

Applied to for-next with the typo fixed, thanks!


--iM51bsSenGYDG0Ia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIrsp8ACgkQFA3kzBSg
KbYVhA/9Fdk1lLIyW+tXH7zNHFJt6bDQCScxVKi/bTuMFCDG4CXIDWa7vy2KZbkK
6jDhklB8Okkyd8O15z1Sm4Qi6xUNpS8tTDtctbYo34ydjl2TcCGZu88HZguCtI21
yXOvW4Yi0J4F0/+w/ENfwX2i8g7esPcP967YWsIpAhWv+VI7CYhigrIspCJ/DahW
IaI3m3l9XP1+QLoFHF2QFqpHhcUlrFty6cs1YTaK3iQgzqBhyxMlkwSvBlldpxsV
pHkK8BfIEPf3kshDbRma1N0nwZEdkaZwjX7XPzUGgvBrY1YaFIXLUzTwy+/kI2lJ
lcJs4ypUkJaQMXjt3s+hYWRHuTqpBDiVEvubpn2uxiEE1w6T2OHkpnvYLdIP5sxZ
1G09p348JoaC4zFlezEpORn6WV/O+E7qjebKyJ9sGX6/iDEjPH5941+sBp7sQ69A
deUJ0s/1l8nSscTw5YcsRmdhuPfbDE/GfkKCkqV32syiojZXHKtogdlOstpjc9My
D532FqE+L/hwOiUzmZ1C9AHoqluTU+SeVq97iHk2KZAftkr3NsarhQsZyiImrEOr
jFbS8SaTZNBbv+9paHK2TZQUqrKS4X4V5VNRFFOp+WmgRV/PoPXa655mTNWMNAUf
DtA1j/GIjSNBE1Vlo3t4Zaiu3YqFmGA+MISD5N+k9oyH65K24q8=
=+Dxs
-----END PGP SIGNATURE-----

--iM51bsSenGYDG0Ia--


--===============4078846240836836601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4078846240836836601==--

