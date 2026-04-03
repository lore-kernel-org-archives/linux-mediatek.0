Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D835E85367
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2026 14:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YdF9Rht42rff1BwCXkHi7eHJ/MK3j+E5Rl62M4AtKXk=; b=BD94mDYe+tmvXw0aj33PHy1aHo
	oc6EKb7+zI1Rj3BZhef4yX2G3LbmvVmcIuEmO9yGUZ759leEapIKNqwXf61HHrVP3K1zUx9jpqoTC
	zom+wsjl2oI6nLJfm69dnnTKIUuuTtgDfmUoO5oM5C0pauYzDpIUstl7doaVmos7/3hkQ+FuzGOb0
	AYwyC23XNbVaIcac+EMmcWW+TuflRjj6IksvTg9XS2mnebpyTBlEZVXF4N9TuUSzS/xT6tXNiVUop
	q5eO2WRtG9SXcna7pYJ7e6c65XoS+Fly5buQ4Bt/BXwK1env54QGidYCBZsT9FzigMWqiBTRabvP1
	3DSxMNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fBY-000000027Om-2BoQ;
	Fri, 03 Apr 2026 14:07:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fBW-000000027OH-0xzq;
	Fri, 03 Apr 2026 14:07:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3F8544318;
	Fri,  3 Apr 2026 14:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E292C4CEF7;
	Fri,  3 Apr 2026 14:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775225261;
	bh=a2TS+0Xfo8n1MstX8wwPTJdm1SUZfSXTS9UW49apjSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvb5DtywGd+oDPYR/6Gj4ugzAgY+fAdrliFvpCAX9F4uBTc9Q4ivzfS6n/HRMFr2d
	 VGK8z56/+t1o4IED7oCxN8kmucO8nSTAdtXleGFiH6dbGP9bfwxlnhtJRDk8KacfUW
	 iH82Kjdp/BZW/bTgcRuX36a2BaqMfcbZ27A0pSvAxxPphzwNBQLmRdoJfDiT3xyA59
	 EX4sdJ5xG9XVfmE2XHWrIIFj1z3alUlGX23XpPqiBbTX4Dww8ehQNonz2yCTB0lWDV
	 9tt6SlGmRyoPURY2NxPgcpwmYtffPcX2pUYNmGs6vkr/AKfHk7vrunWIfBW+qMz0Wa
	 pqcRBg6aJbB5Q==
Date: Fri, 3 Apr 2026 15:07:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Cyril Chao <Cyril.Chao@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Darren Ye <darren.ye@mediatek.com>
Subject: Re: [PATCH v8 08/10] ASoC: mediatek: mt8196: add platform driver
Message-ID: <892468cc-7eb4-411e-b91b-f14789d8da0c@sirena.org.uk>
References: <20260324015719.17543-1-Cyril.Chao@mediatek.com>
 <20260324015719.17543-9-Cyril.Chao@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/xr10pR1+37JRYr"
Content-Disposition: inline
In-Reply-To: <20260324015719.17543-9-Cyril.Chao@mediatek.com>
X-Cookie: The Korean War must have been fun.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_070742_292215_DDEA020D 
X-CRM114-Status: GOOD (  11.08  )
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


--z/xr10pR1+37JRYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 24, 2026 at 09:56:49AM +0800, Cyril Chao wrote:

> +static int mt8196_set_cm(struct mtk_base_afe *afe, int id,
> +			 bool update, bool swap, unsigned int ch)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	unsigned int rate = afe_priv->cm_rate[id];
> +	unsigned int rate_val = mt8196_rate_transform(afe->dev, rate);
> +	unsigned int update_val = update ? ((((26000000 / rate) - 10) / (ch / 2)) - 1) : 0x64;
> +	int reg = AFE_CM0_CON0 + 0x10 * id;

The driver looks like it supports mono so won't this trigger divide by
zero?

Also please write normal conditional statements, it's much more
leigible.

--z/xr10pR1+37JRYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPyacACgkQJNaLcl1U
h9B3tgf/eTqWV5PjbeaYZPgBsewKX76WoqNQZFyKYRA9EQvOScDPQp/1KWLV2E4l
MVxmqWYJVC5Ps+dqV+2BeEJjGicyucgzXGTTpuEPqDwMalGwC9ou9Jx5ehVzryYM
oV4xrTotyMS0QYVxR80JkLCMf5M2WJ0dCbHUtyTkYwwCfPMDKp9Su4WoRtvXQu8u
sRH/X5F2TkXMSNWU7HdgrAqt6CfzJsJU6i5LP3Da74l5coFNV/CcxIEjfTCDTxX9
g/tJo8ltV3Z2coWCOEwYKos4dZGsv+1zVtWz7m8970gyDyHQrRWE8Z/wzfPdnIya
MAkqBgCkDQBaG8cMW1KFb1v6Q+fnkQ==
=HwHw
-----END PGP SIGNATURE-----

--z/xr10pR1+37JRYr--

