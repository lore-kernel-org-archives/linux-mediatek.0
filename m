Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF109C54EE9
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjAzQZHYb9/2QBdNqcub/obKgfY/0kE9VDXoCKANrKY=; b=o1+TkCo1L8G2NvJXTffdfzzh6u
	GxAtB+/5V9rm8gCZm7m3imWGQoR3nUZHkV6w6LKb1HOTssr1y0PKAJxSoWa0PBq6VAuAdsLbE0MjG
	H6Hsovy5FtECtJkst6zVzcePoUwrMhHDJZqlXPGvmHrp+JP+gZaoCoHl0lTiLNnHKKuS2fSzRfedw
	WmIzUgzEM23CA6TVwkyNgS/BHCFR94vEFRscswBa/RBD2ECn5Ij0d/T1MUcC/SP98jXb5CnAHfhgG
	t+CVOUSTz2tE6vpqvLjALky4X39Iqwx0ViQCxcjP+9duE5iV7DoiQoZekpA6HT9JMllU1f6b/Sywi
	o6Mo7w/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMI4-00FgJu-7l; Thu, 22 Sep 2022 13:30:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMHs-00FgGn-Ub; Thu, 22 Sep 2022 13:30:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 378E062B69;
	Thu, 22 Sep 2022 13:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36C57C433C1;
	Thu, 22 Sep 2022 13:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663853443;
	bh=wInR8uefJjXvT2SZqgMSw3Aeupzu3gpSe4DZ3KoW3tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OkSovZfJMK4g4EsJz614MUvw/hkrQWiiVQk+5TwUDSbpCcOEtOV06QcIzUkTwPj5t
	 TbgvWkU9yWEcMYNbeLPhT7WXNNsUFhDePSI4GKqAsA0MxsQ05qiKMRX7+ajfpyiR7S
	 HUxijEuj/aJa0B/Rvnasr8LDu/b0egqirjTslGPY2ztudcRIAw+/uYWaM+meuVU0JZ
	 N98OcZouXmZRU7fGYFPGRRVUHDAcHlweJ/puRpGQ3cssM/wOk2iIXn3oPQKvXwqiJm
	 b2Fl7XWcFA6JGbHQLUl4AXvqEjkBlQKHBWGghmh1xMD3KANa6xjgTz6G9ZCy+E7SmX
	 vx2okfCTzm1MA==
Date: Thu, 22 Sep 2022 14:30:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	tiwai@suse.com, lgirdwood@gmail.com,
	linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <YyxjZ9nCBdVovkVs@sirena.org.uk>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
 <YyxGXXSp2JD9a6ah@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aiBfMVsZx4xOWY8C"
Content-Disposition: inline
In-Reply-To: <YyxGXXSp2JD9a6ah@google.com>
X-Cookie: One FISHWICH coming up!!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_063045_046363_FAEDAF08 
X-CRM114-Status: GOOD (  12.51  )
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


--aiBfMVsZx4xOWY8C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 22, 2022 at 07:26:21PM +0800, Tzung-Bi Shih wrote:

> snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
> it would introduce any side effect or not.  Perhaps Trevor could
> provide some suggestions.

If it does it should be to fix isues rather than introduce new
problems - I suspect the other operations just don't work
currently.

--aiBfMVsZx4xOWY8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMsY2cACgkQJNaLcl1U
h9DpzQf+KMnb+RybmIF1Eut4fCQs9n6503YHXYF9TAwZ78CkI2/5PP9Gc1buqBVz
aPhF11fLUOU6OSXLW+r3Cid7wz+1+zerw13xELulJFJXUYYyFdgHjtvaphjtsVWA
jKON681p0xOVi9K0fScb7wOi21LiClD0c5hSqZuNzJb9Vvsk9+Dxo/o3neWoAJL/
8apxKqDgxkgKSzRowDasy3Ika9NFuPG+3oO20r/MX2D1yo4z410g+xPudcE4Zrzt
IzzY/IzjFkzmeEceJN1Eu63nTxXoxfUPqD3kuBVZUj88SOSK8VSxMHnWY4grR41P
b1DIq2VUpjWPB64v2Zsi+OyPQkT+aA==
=04KX
-----END PGP SIGNATURE-----

--aiBfMVsZx4xOWY8C--

