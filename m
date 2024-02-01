Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62AFAC47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 11:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SdV/LqCXVrShA2leL/+z2pR9+YblzcrOQIk6KHEyCZA=; b=Bxuaa3ZtalqcecUn+sGAhLGJ3K
	vvI2Jbwku+nl9JUcUzuDSVIUFrygVlJ2daHUll4iot7h7VHum3ShvxZHynnfMMSr2k4OpPFpLmHbq
	IaINHVZ3L0trS0YPsm1uTiiSS5SaEokKUVkl1w+qFL6B/kQHqeHAMLWZEtErpv/VkLWmx0C7rav1D
	pW4JBXNnG6G5geLQdXLYwnCbGiKwqoUGOwbFegYNklLRk4jdYJTQ5BpXYROGVbwBzboCjOjpdx8hH
	oCYdOUs26fqS26Dh/380gsQSAsH0Y+h6BwgMS0NdjCEu/viyvG+zmIBr8kvhtpAUiFrX7kr1z58Ua
	S9oLYpiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVCR-00000007Zgz-14eV;
	Thu, 01 Feb 2024 11:25:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVCN-00000007ZgG-46JJ;
	Thu, 01 Feb 2024 11:25:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1E826CE2298;
	Thu,  1 Feb 2024 11:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7EC9C433F1;
	Thu,  1 Feb 2024 11:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706786737;
	bh=8FsMzGJfsM0aOcmxMpvBjhVsj+8VYxKWtsJcxs8GM5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZz4QSq+RagaDlfjVVz5KtwyqN+z6+sFOtdgVwirtr8OUVEyjsqZmctO07hi8NI32
	 7CXregjsqNFCRgNzAQC6LkIWzv5+FlZ5wptO3v4wdXf9QnO1eGpacIgLM+ofZOdYxj
	 hAVJ2KjiNLCky+UQLUuEHvtkt1AjCPRNtR+Gf4R7opVdUrpjheRe1N1Z6Ile36juWk
	 LyEHXJ1jGYRdeA/3Qd/ypbl0w5N5Zld3EkS/FrAXVZWt29xWDcW/7+Tb1+hdFwMFor
	 epg+86jqzzvkzy+KV9xJKQ8Wb03jVceOWng1nGR8KT30YOw61WiY7hww8gsNtTPFGI
	 B1ljn8Z04DlNA==
Date: Thu, 1 Feb 2024 11:25:27 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: perex@perex.cz, tiwai@suse.com, matthias.bgg@gmail.com,
	ribalda@chromium.org, nicolas.ferre@microchip.com,
	u.kleine-koenig@pengutronix.de, kuninori.morimoto.gx@renesas.com,
	nfraprado@collabora.com, alsa-devel@alsa-project.org,
	trevor.wu@mediatek.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, lgirdwood@gmail.com
Subject: Re: [PATCH 0/7] ASoC: mediatek: AFE drivers cleanups
Message-ID: <6f7a34b6-6f65-42c3-a92d-6b064bf9dee1@sirena.org.uk>
References: <20240111105247.117766-1-angelogioacchino.delregno@collabora.com>
 <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PVPGHszu86wFrqHg"
Content-Disposition: inline
In-Reply-To: <cace3472-7ee3-459b-ab2c-51764db99bd7@collabora.com>
X-Cookie: You can't cheat the phone company.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_032540_219305_89C1A789 
X-CRM114-Status: GOOD (  14.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--PVPGHszu86wFrqHg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 01, 2024 at 11:08:41AM +0100, AngeloGioacchino Del Regno wrote:
> Il 11/01/24 11:52, AngeloGioacchino Del Regno ha scritto:
> > This series converts MediaTek AFE drivers' probe functions to use
> > dev_err_probe() and devm functions where possible and, in some
> > cases, dropping the .remove_new() callback, reducing the size.

> Gentle ping for this series, afraid that went out of the radar :-)

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--PVPGHszu86wFrqHg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmW7f6cACgkQJNaLcl1U
h9CaHgf8CtVCkC6J116wxuSCyfeBTiCzoyj46PgrA3xwNRTTduzax3JoO/1grpq3
5NlOg1xyh3YtqEDvxa2wBDCc6fM3zw9mAQPKiXCqHHI2A8WH8xMPSJzvlhfrC14S
SDY7qm/mG8CiXyEI84YBRHdgoxBnBqECwRehV975FL3ZvrDYSQTFO4EbYI0I1oNI
arokA5pQoEzgBMazkodUtmgDueOoBVtbT7HQMsMTjtn+iQ7dMAhf2wGc8uhMC3K1
8jB9piZTC2sZHVRli3Rbzrs4TMYz8Ji5ey/zUMcsfKBO1/awWWGrYqm8eEZJiME4
TtANCMujJdC2XSTWBBod6hXZGV07oQ==
=z6oI
-----END PGP SIGNATURE-----

--PVPGHszu86wFrqHg--

