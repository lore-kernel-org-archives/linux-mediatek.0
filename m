Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21C2BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 16:58:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F4E60FC1
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 16:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4F4E60FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NmppsleBEzZdmkTtBv52gq03p63lKMSttRMXEDPk8w8=; b=X8FRSgCcDvCtRWeV7ZnDpw3Fpg
	aMc5EloJ4XBiZJTY1/mIfWgavBGyloXDdO8QMuEm2ZfPxA/1KfPjFPBZACWEjDBU1J1hSNHnluPKw
	+3BNJU4+LXbpLsCrlR+7R4S1tU4cePXjDCUbeL6NCXt52QOKGZK4RTmBMF5gT/qAO83W9+ozT35U6
	cNzaJjGxpmtOCdpCpZHIpIp1nwygMAQi/m/YDe6K2lmf0DaX+maM4zdVn+L+fw9NFdxcA/ADcEkKk
	vTbpd7KLoXWTsXtJ2xrLFxjOT5snLTEvoQysQ3L0GL3z3ycM0mdkIUPLPQREibI5Mlt67peIE4MMl
	Oa868Nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgVCe-00BWV0-KK; Fri, 29 Oct 2021 16:58:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVCP-00BWQ0-Pl; Fri, 29 Oct 2021 16:57:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00B5060E8B;
 Fri, 29 Oct 2021 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635526669;
 bh=Su9vVSviobYVjYObOCBEe73TcGXWuppnwITxt73nSf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OiJMNRwTxy7TtwQvyW++op3MucoWFCDDO3IMRhqz/oqUlVRo7P7fGyId2IOHS6keC
 oeOR0pAalcKXLWbTReztyvIDld5jL4S8erPghdklD5p358ZtyjvbT5arJp7+k3f7G6
 x8nGhyNHUE/8ZOS6uTQyu1An1BDpdP4ihsAJsF/tC1UuocgdmgKKYNoJdfCzifqb4j
 u6Nmg8MTUQsoPBiGZFYRB9U/ONvqL8jNun2THPa2fUJpZqUfi9o/+6I3s04/yLWrtH
 CiGHV30HjvLkDxW+KuFvYBul76atwxcdJsrPISRFShGTBWeGkg+Wn7xV3J36A3GJRI
 E7JGhkWwq67yQ==
Date: Fri, 29 Oct 2021 17:57:43 +0100
From: Mark Brown <broonie@kernel.org>
To: YC Hung <yc.hung@mediatek.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, daniel.baluta@nxp.com,
 trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 1/2] ASoC: SOF: mediatek: Add mt8195 dsp clock support
Message-ID: <YXwoB7FtRw0AzgcD@sirena.org.uk>
References: <20211028135737.8625-1-yc.hung@mediatek.com>
 <20211028135737.8625-2-yc.hung@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <20211028135737.8625-2-yc.hung@mediatek.com>
X-Cookie: QED.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_095749_884541_8BC00627 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4217222344875524655=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============4217222344875524655==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="L+FynStKYfLi0cU9"
Content-Disposition: inline


--L+FynStKYfLi0cU9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 28, 2021 at 09:57:36PM +0800, YC Hung wrote:
> Add adsp clock on/off support on mt8195 platform.
>=20
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
=2Ecom>
> Signed-off-by: YC Hung <yc.hung@mediatek.com>
> ---
>  sound/soc/sof/mediatek/adsp_helper.h       |   2 +-

This doesn't apply against current code, there's no such file upstream.
Please check and resend.

--L+FynStKYfLi0cU9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmF8KAYACgkQJNaLcl1U
h9AoVAf+Lla83sRtVKTqKOk679LT17XuZlBpgOt3NtPFIbvAv9dQFo6vZbhSPUfv
FNFch9494hJbje4GQNsx+/P8YBAu8B8KT1L9mvI2xfE+R1ififzxOa8KFibsE4ee
kOaEBLq5sK5K4ujyPS9F6/fq5bih/0+C5YgBJtWYhW4/HwPL2eSp+U/cbLX7hUCV
Y6WZRE3jA3UDHCl/nTSz9EZAg2BExYI3zDrEINWf26Fs+8rwx/q6y88UQofl0WBK
kdelvP0X9dFsxgV8T3wug4bRTgfGezFAen3rkQG6I1tliMMb4XO2tvCUQlSyV3zS
h0KJSKLReUXZNM9ANMySrqQWAFF9wA==
=slFG
-----END PGP SIGNATURE-----

--L+FynStKYfLi0cU9--


--===============4217222344875524655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============4217222344875524655==--

