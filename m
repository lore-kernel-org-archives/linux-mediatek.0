Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C443EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 13:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA1961BE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 13:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EA1961BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wXMMOjUF6ujsp/jbiREYSaM0Z02P/sFCvbmyOBmIP4=; b=xxJCppFU16nU1ECMO/VWd6sHA6
	oMs71sf3kuBMySWblPxqhorzCZCLsQMymRUNAzLl1+NSd6wOWd7xlqzGUwi3+XLVnaLV0sTPvsMSj
	Uvt3Qr0Gmd7xVGGJKsUBVGA24hpei1xhfbW2k6G1oIP3yf4+vhs21/5dWLT8non4aXrtfhtA1Clyg
	fkH9q5uGAjRNuwyxjIJCGGA+4mj+HayZCwtNnRHOo0kjJ889VtEwIiYNb/JIeHjM/c4TWJLCvWaUM
	0crWe8OwbOTkusZ7A6f94Z4/n4uRCGbZKMe9VNNbMB0bfxNcx/gZGaaZl8G1eI7AW2d6GM1FvDI6d
	Qq2jneBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmc0F-00Feu5-3G; Mon, 15 Nov 2021 13:26:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmc0C-00Fetb-Oz
 for linux-mediatek@lists.infradead.org; Mon, 15 Nov 2021 13:26:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B546861BB6;
 Mon, 15 Nov 2021 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636982788;
 bh=VrvhXi38LVeGVj4zz/uSdMshhS6qkdQYs58zKEN+yCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hxo8bglnoiF02Ty2ZhPOlGBOV6Dh7ewtclRFrF6dmhdID076Q+dJnQLCSRKP+LIUf
 3lY6udJgn5nWkBP//3VuWjRkZIIC6TSSGNdbtWYVK3OlXoToTKZ4WM1P1nlnglMk7O
 2CJQz68SRGboLi2/X/trX0rYH8wa6mbN82tfmP4Go9hDigkkfcVGM+P/9/EperH8fR
 tlZGsPzcnfZeB6Ht7eyuR7pp7e2Wnjp+fkLJGvAmKs83pUzG31S4zE4ydztBuza40Q
 BO8EwZrOhPtQo3q39miOkGgsxt7FQaCfpt+QoZtOTLb93iCIY7X/fBY/ItohYEjxVV
 rgKlUC5V2z/2Q==
Date: Mon, 15 Nov 2021 13:26:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@oss.nxp.com>
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 ranjani.sridharan@linux.intel.com,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 linux-mediatek@lists.infradead.org, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 YC Hung <yc.hung@mediatek.com>, Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH 1/6] ASoC: SOF: mediatek: Add mt8195 hardware support
Message-ID: <YZJf/viWnHhaHOnM@sirena.org.uk>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
 <20211101080026.297360-2-daniel.baluta@oss.nxp.com>
MIME-Version: 1.0
In-Reply-To: <20211101080026.297360-2-daniel.baluta@oss.nxp.com>
X-Cookie: Another megabytes the dust.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_052628_855767_076D5FF4 
X-CRM114-Status: GOOD (  10.69  )
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
Content-Type: multipart/mixed; boundary="===============6706616544624802519=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6706616544624802519==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OowjvesRb/Z2qiBw"
Content-Disposition: inline


--OowjvesRb/Z2qiBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 10:00:21AM +0200, Daniel Baluta wrote:
> From: YC Hung <yc.hung@mediatek.com>
>=20
> This patch initialize to support SOF on Mediatek mt8195 platform.
> MT8195 has four Cortex A78 cores paired with four Cortex A55 cores.
> It also has Cadence HiFi-4 DSP single core. There are shared DRAM and
> mailbox interrupt between AP and DSP to use for IPC communication.

This doesn't apply against current code, please check and resend.

--OowjvesRb/Z2qiBw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGSX/4ACgkQJNaLcl1U
h9B/6Qf6AvsZ3R/I80XSt7mkb657/qrTS2Gg9zvLgVOrFxn50Z31Q0pbXVl1aAwO
uy71zZMN+mpd+UqASY8kZD1qA6wMKURIa4QF+FpcJdx5hxpogzN1EgNEm3zMs/6l
MK3cDUPCtdYcEs3EdFzlU43PWv6sG7c93xcoEsItlFUSuz8VsOVQ9ggNNj/oeCER
CJl+hRtteEzY60/X0vNjZ7iK5cMgNUOMqaig9B8c4R8mipRHX2SBuPobRlOoHftB
Qm7rlIKZougF1KZxKRxqudco5B86Vz2/fuoFv826JDWwLCZexTLBtMRW9GHRLx0/
O3hrm2FksF22m+2Um6IogCcJfGI7UA==
=KQpy
-----END PGP SIGNATURE-----

--OowjvesRb/Z2qiBw--


--===============6706616544624802519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6706616544624802519==--

