Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCA5C43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 13:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZyoE61TU6oOaDkCB796SpvFg4qPHeIhaVpyfOHlwng=; b=2pf3EBZLq8LYtRZnDjVIOshTa0
	xkz1rqrvu7xHFNXjU3Y31pZNDhidzwPkbhnj0vcBJQDaZPUfJB17Zhy7/0dupe+I5XX24slhAPcoR
	rThwVLheCf2DwxA95qT+QLw50FHjdyCxCFC2OA0D6ydC6YjaCX4w1b92El7NbOplmA3gk6eLqGsOH
	LQUtkIfu2/LrBQPyj+kbxqIrlxZ0ZF08hy4y9Ehd4UhCp/AJNKivVWnLh+RFh7OUYJwFDQJb3BIjR
	cSUbMbHNf9wS/kdS5jxHS+eW85HonkSKBhw1MFTYcr3FbzaY696NZA+xIU3DjksAzxls1X4FWYhJ4
	KiPaMoDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeHa-001qq7-27; Mon, 28 Nov 2022 13:34:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozeHI-001qXw-6b; Mon, 28 Nov 2022 13:34:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4ADD61018;
	Mon, 28 Nov 2022 13:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338E6C433C1;
	Mon, 28 Nov 2022 13:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669642467;
	bh=6ZyoE61TU6oOaDkCB796SpvFg4qPHeIhaVpyfOHlwng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnGFuAvrwQanpdHYFHp1Z8ly5ChADa7N19NtPaqRgL0JXq2wyj2idESDwAVskm7JZ
	 xO6M2XGDQtyeZQvJ6kfQ4+G35OpL8xjL0qbzoRaHHefC4aq3pmSixrGSNRfJGM78NE
	 h0xoGGry9xCZn3cmOYqcqPR4C4DKph5p63KbH66PyEJdS3xLa2jY0iFRYOAOxslqEN
	 I6IfBd5VRrQL55KcYV/ZbwncDmW2Zbe1qibzaObdHznFt3LPNEEKfq9J4tEnVeuxL3
	 tx75jYutMgYkkYJU9iqlwT9TpUnKACzMJmc1fy6S2T472PbQQ8kLOO7TTuwRUk0Hy+
	 by2DR0Y3BAqHQ==
Date: Mon, 28 Nov 2022 13:34:21 +0000
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
Message-ID: <Y4S43XjRyrdm4Tha@sirena.org.uk>
References: <20221128-mt8173-afe-v1-0-70728221628f@chromium.org>
 <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mXbGyhu5lsnY5RXX"
Content-Disposition: inline
In-Reply-To: <a214fe55-fb5e-04b8-348b-895902470b18@collabora.com>
X-Cookie: In the next world, you're on your own.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_053432_318745_A4F7700C 
X-CRM114-Status: GOOD (  12.66  )
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


--mXbGyhu5lsnY5RXX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 28, 2022 at 02:17:53PM +0100, AngeloGioacchino Del Regno wrote:

> This commit needs a Fixes tag, as this is indeed a fix.... kexec isn't anything
> new, so all kernel versions are affected by this bug.

Fixes tags are a nice to have, they're not 100% a requirement - they're
a lot more useful when they're fixing a bug that was introduced rather
than just something that never worked.

--mXbGyhu5lsnY5RXX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOEuN0ACgkQJNaLcl1U
h9BVzwf/W/HVqeLRVgVFl3uE+TfDAXzjIy9TDRW7DrWbkN7i2uH7bVGlYEoAecj8
VJD5KtVKChD32froEJ2N+lbaEjonWwUDQyB8tP9yNe/jXjqwUqROmAoUlLKYaGuL
vZZw8pKHpTo/UXf497QSCSARIrRu6fCZcCbFPrj9QUKsvXjJoLCgqgNcVlz/u0gG
uI14fz9Jw/YZUYuD6ESLnwFQqjgWQ0jBP0R/FeW0B0juWdoo6n83K98EC3Zv5FWW
u0RTdWzRWf/wnMuQE0pdt+Dc9qdygMXbmEO1oz8axtoxac0VlMXVSR85yzZ75Y60
cb2bOJZXHcYZZSz2WkiFVLOLZiCpdg==
=G3Pk
-----END PGP SIGNATURE-----

--mXbGyhu5lsnY5RXX--

