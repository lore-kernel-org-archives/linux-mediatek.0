Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4423C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 10:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maxXR5exe6cvGeozeJZyZ13BVHNNVhrwFXh8uZRxZDc=; b=AqvtVaE7eDqiqhevIm3B6XtYld
	YclNHH1yHImXIbvUyHd1656v2K95sSn73zn5c5RAX8mEDRlBgahM/84/Qed7UfuvkyNsguprLlmQZ
	buyoKHRfTMIljLMt0lRVnlf1VpGwGiHuYmxe2RpdFStD3U4ONYsoEQKOnFCbCWepycbVQDKK/uR95
	Nuh+FeMYc3ZEjMKwv7p+PXxdmUkODuQGcggJjN0ITzSUU1QLmqBG8GeZCuYF9kQwy0wgox+tDvbQd
	kpCHqnzfrlIiPdmphkEFHmGIr51WNf1Mj1ezEY99s0JGmlp24EbDiiYk55kbOyVSnWDhl1oKVBE42
	+kzhqamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqBs-000Quo-5t; Mon, 10 Oct 2022 10:39:20 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohqBq-000Qth-5D
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 10:39:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C4FB8B80E70;
	Mon, 10 Oct 2022 10:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA9C433D6;
	Mon, 10 Oct 2022 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665398355;
	bh=sQ1OkvIlPwu55py2RfIDT2mp+pYKyD2jg0n/Gy6KF6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ct9Sv168uYz7ucQ8FGO5QcEAhH6uf6jRcYXkq7u70CqHC+ZcSOSKA8V6bAVN6swlP
	 /35COFmZ3y0YADDE/hAmq4qSlmj9r9ceIqHWlK85egxbZHw14sszfQqZClSgj4kj0O
	 I7NdXZPvLTYUiOefVhZcNG1mtPmE/tT/e7hXOr1UzX4zoKcYS15cxZS1sMFaufS3ZH
	 LPE2Cpbex3czfx/qJSSAPmE1eGxgbmF7EywxaCo+mThGu8/6h8UNcfoQN6kvzPyPaN
	 iogbFid1GUpKMoIHXEGxpmvxNmZyTvY1d9oobOxCIh0Fie4cqc/jpYn03/m+wcWKZi
	 sM5jaGmYJVvEA==
Date: Mon, 10 Oct 2022 11:39:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, ckeepax@opensource.wolfsonmicro.com,
	jeff_chang@richtek.com, alsa-devel@alsa-project.org,
	linux-mediatek@lists.infradead.org, patches@opensource.cirrus.com
Subject: Re: [PATCH -next 0/3] Revert old "Fix PM disable depth imbalance in
 wmxxxx_probe"
Message-ID: <Y0P2TEQOADj8XsrK@sirena.org.uk>
References: <20221008134358.131712-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="10X8khYOYumKfxxV"
Content-Disposition: inline
In-Reply-To: <20221008134358.131712-1-zhangqilong3@huawei.com>
X-Cookie: This sentence no verb.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_033918_361244_E2752DC9 
X-CRM114-Status: GOOD (  11.90  )
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


--10X8khYOYumKfxxV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 09:43:55PM +0800, Zhang Qilong wrote:
> Both the old and new patch have been applied, it will resulted in
> redundant calling of pm_runtime_disable when error returns. We Just
> revert the old three patches to fix it.
>=20
> Zhang Qilong (3):
>   Revert "ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe"
>   Revert "ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe"
>   Revert "ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe"

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.

--10X8khYOYumKfxxV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmND9kwACgkQJNaLcl1U
h9BJYQf9GrY0PICzOGqLRaatIWi/YUjWoERus+DL21I7mOFuh63TBLZbpA/I+tlC
rnOjbk3uU4HLFhe3UXMKdu1yyDA+wndhRPRFHbczIOcP5WajkAD3Sd3nl1K0OlEU
9lZUHCOcRWNmMHrQ2R3NwUdXJVY3gLvfVTgzbCPQi+Hf9NNE3x1qlEjkiMMlZJos
VTr/k/87TwZxmktcR4Xm4nrCtGTCGb+xQR5aqwGyt2ZDwK2WevgMGP4Xs3Mu6zcK
bKct17xpNiwbh9r+ur+w4axgVmTImuppxyL/7mxGR8TUTJIFQoLNe7oTnYvfBiPb
cX4tXcK/KPCuvJfadG0yWe98ujTYog==
=+o2G
-----END PGP SIGNATURE-----

--10X8khYOYumKfxxV--

