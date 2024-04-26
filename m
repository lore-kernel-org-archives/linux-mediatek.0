Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24010C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RaA10gzFMijmnLpX8g9P+ahaM9BYGZVleDM/58q/EhM=; b=rJjzx/ndsGmrFhJ7DrZNisW61Y
	h9Zw7ddh5JTkRIcM8G3SNxdQ5esKe2BRCVmHY7ID0XpuGtzR3NJPn6Tl3k1zfvwmygmI7Lg/pgFYp
	AZdR3lH+WtLiPSuzJ6UsfhZqE34BIw5Mmj/f1CrvveD5EUNhUUgcU4vDnq1TPdxfPXiDL1Rwi5Pmi
	vrmhxHAY4RiQaskwbxSXkSf1APe2CCoJmIxqkpW/1+bOCu71nY2q/QgKwAKCBB5BMaY8IcPz0J5Hh
	W3l4YIQUfCv9gJet82GsNnOcQxEw3oXCxKqqY8mJPyD6fBBT5wPgCEePvTmJtoGeuyL1rI2ByjYTX
	GiE0kuIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0B1S-0000000Aqv1-0SQf;
	Fri, 26 Apr 2024 02:09:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0B1O-0000000AquN-2JVd;
	Fri, 26 Apr 2024 02:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 74D6761EA8;
	Fri, 26 Apr 2024 02:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45104C113CC;
	Fri, 26 Apr 2024 02:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714097344;
	bh=RaA10gzFMijmnLpX8g9P+ahaM9BYGZVleDM/58q/EhM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVsdb2nPMfDxyvIzHLmteDnKiEF01zLtPHG60bPyJi14lcfrekjJIdv4rviopgziq
	 f0iwIqmT5LqyNbJr7wXsXe5Pbckki88bxtivP5UeNfxcq8UaNfO2nSlcw02lKvzHP9
	 0mNY2TW92W6SoVCwt6s3HFHJbiZkO/UUaXWr/CvMrIcqUGMGJ0OAxs2BJbMzXZObws
	 hPZPhtk7e+prjotitLx4w5GLRlPwFEkq3kbF5AE2sYfbeWK8ajRIPg+IEdt2HSGuZK
	 2v4dR1FonitOrteypMZxZAhOb1GqKkko5cWiN5dERTcZtUWz4eWA0obCk4rR1xm+ch
	 As3H90/Ve/qrg==
Date: Fri, 26 Apr 2024 11:09:00 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 01/14] ASoC: SOF: debug: Constify local snd_sof_dsp_ops
Message-ID: <ZisMvJORIdqttoeF@finisterre.sirena.org.uk>
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
 <20240414-n-const-ops-var-v1-1-8f53ee5d981c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QadR/dyrQjBKyfJ0"
Content-Disposition: inline
In-Reply-To: <20240414-n-const-ops-var-v1-1-8f53ee5d981c@kernel.org>
X-Cookie: Shut off engine before fueling.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_190906_657731_BA18DBE5 
X-CRM114-Status: UNSURE (   9.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--QadR/dyrQjBKyfJ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Apr 14, 2024 at 08:47:26PM +0200, Krzysztof Kozlowski wrote:
> Constify the pointer to 'struct snd_sof_dsp_ops' to annotate that
> functioon does not modify pointed data.

This doesn't apply against current code, please check and resend.

--QadR/dyrQjBKyfJ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYrDLwACgkQJNaLcl1U
h9DmCgf/Y5wt+LDn+WCUAubCYsG6igwZ0t9A9OH+G1bZL3YYMTw23O8FNhzXs+gU
/ZERo2f/xG6D33AKJpYZqvLJ1ZYyQWBpf3SG2nPN3d3skuItL/M7/A9+yltV2j0Q
bAZcHvx5LaPgSjS7vR8wmPmdymeDM+Yoixm4DNuHSItaKuFQtC/bIRuFmRQQoCIn
AXYvoVLdQqkiHrTPsk6jrl/E4A3xmzCBWeUJ4CIW34jFPswHN5GWczALQocSW3g1
vbAQQ+uMxtXhXs9AUXN9oRU+ftl6/3tsYvjSjIt9lD79cgfO6G4dB0U5vDbwyfK0
ZsyFufHPFrLV62IvV+3WKWvRtjOi3w==
=c2S5
-----END PGP SIGNATURE-----

--QadR/dyrQjBKyfJ0--

