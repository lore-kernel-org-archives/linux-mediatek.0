Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47385CF11D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 12:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOKlcUDcVIYv8es7Svh5TEbxwRfsmyZvU+K9y1sAGl4=; b=Kfi1zTxAAzHDNLe0YublhbriTg
	uauR9N6nPBDMdaWgjipTCQ5QX7xR5ZRCMNxPOVeXHsHfZxyDbxvV15vG7RiCZOAh4EKOUpJXbPkaj
	xKrhGXXU+nY2Ylzf9sXTwgXeXIQ5iOCEaLodXVV/IPlUOQjHIdpdyjey4Nq2++v+4Z+sLcArVlmZw
	Ram4id5o62mItcIxxI/ioC5S8fHQHLlH32+dl5RPqcPGgQqaee+UebIM6Cfwx4hOhuB+mTtCY+qVZ
	yNX8htd2SFvYz+XXxWH+Ibi/+ayh2kRVtSz2pN+mymH3bCQDM7kvlvsDUQUWC1Dxogan4hTkp3xmD
	WvasewBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syrqw-0000000CdEy-3ba5;
	Thu, 10 Oct 2024 12:01:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sypnp-0000000CIb5-3piH;
	Thu, 10 Oct 2024 09:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B10425C5F4D;
	Thu, 10 Oct 2024 09:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 503A7C4CEC5;
	Thu, 10 Oct 2024 09:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728553788;
	bh=sOKlcUDcVIYv8es7Svh5TEbxwRfsmyZvU+K9y1sAGl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnoFtgwVFP8jz1lqnlXqpRQFN9k9Gva+GButJXcoVLTcJa80vNNGkb9YtN5UCSFpY
	 xuCbNx4zI7qvl6rHE/B7nZJCjjyNuCwwZ/2D8HUtGZkX39z18lrF6Tw5xWrRocr2lo
	 FV0LgQDhc5U1igE2/UBjkLizAompnTYylpbPbf2TxZzS6DAoLsxVll2k81AVEOCZP4
	 /8CqtbwhJZBH/gf6NeWOkoZEDrlhhTwZZYO8fTBosdytGk2S7IefQuEvpLs6g2QTvc
	 smkCJ9sAUigCuCJAod5CZ/yLQdq9uwXHH2g0fLpV5KwNjyYsVMibdjGqh1MiCgR9+t
	 MQs71v9bWMkjg==
Date: Thu, 10 Oct 2024 10:49:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Tang Bin <tangbin@cmss.chinamobile.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt8188: Remove unnecessary variable
 assignments
Message-ID: <ZwejOZQlSsWbAWBg@finisterre.sirena.org.uk>
References: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3nsdihw8mA/diZ8"
Content-Disposition: inline
In-Reply-To: <20241010073547.3720-1-tangbin@cmss.chinamobile.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_024950_016489_8A5C78B8 
X-CRM114-Status: GOOD (  10.14  )
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


--k3nsdihw8mA/diZ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 10, 2024 at 03:35:47PM +0800, Tang Bin wrote:
> In the function mtk_dai_hdmitx_dptx_hw_params, the variable
> 'ret' is redundant, thus remove it.

Please don't send patch serieses without cover letters, having a cover=20
letter makes it easier to tell why the series is a series and makes it
easier for tooling to work with the series.

--k3nsdihw8mA/diZ8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcHozgACgkQJNaLcl1U
h9BTrQf/dvyLMa5N8atLKqhwKgHzZbLbq3zfN9tjwPX11KsHTUv8NHPRtsBQWZCX
89eRdk8SEXRIS82p5CCQU509DCJFSgzborbduFb7MDaI73hhopdRV2WLPPDMu5G6
CNjjVHR9Lr3YgqDSR+D5vc5MvhRwnGd5rej2ymlPgvsGleSnseHtVqdzkD44tvJC
CcZS8Rs2kaDF0hyqckQq6deQSivyJBTEaDNewRB89palzjMlmvFU/Q6FPv2aAY2O
pZ1bXNci5zOYdSrALGKzCCzzpUA3REoyBwZjhoFqF6ujeCnYia4eUtsm0ZAOSzHs
uGG0teM2LEb459x/lteK+r/WiCnrLg==
=A4F3
-----END PGP SIGNATURE-----

--k3nsdihw8mA/diZ8--

