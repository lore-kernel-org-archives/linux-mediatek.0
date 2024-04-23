Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A922AC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 11:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYT6jJUSJy5wHOowMTeCZ3pp3Tmnao3IC/VvUAo2Hv0=; b=4dspltfxn4IIt34Fi0KwxWuyqN
	CO7GDSHf5tDEuyfNwBhTKhdhjRS6d4Mb2Q1AXzf4pccTAOUsAERF8yMWMS8fzkwRbNepTI0L4e+9q
	OxFnEVcoEF1CRZoO2AVogh7jJTWCHarjtpsdgZ9cV+kQQfJFPehybFWrdkOPl8g+ONKONkglSbWSF
	jtmPcmZLutPIuvUXOTmghQSPm2OgMAnjeUMyOqHjTXxrb/KXodL1bWX3jHK1WGHBBgh6A34Tby+oT
	LYFSAEDQ+OHj3+e9bB3exoQx0ZpTd2G2CZi6OJ3YQh7gLqY3u1dxKuymzN6bOGxQi88IM4WQeMtJA
	TyTGC9Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzEUd-0000000H8xz-0aYk;
	Tue, 23 Apr 2024 11:39:23 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzEUT-0000000H8wQ-0P7B;
	Tue, 23 Apr 2024 11:39:14 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id ED98A1C0080; Tue, 23 Apr 2024 13:39:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1713872343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xYT6jJUSJy5wHOowMTeCZ3pp3Tmnao3IC/VvUAo2Hv0=;
	b=OYBl3rA4LQLGaPvpDvGoyAou52frnZRv8qUTpt62HjtQitHp9LXNvWcUvP32zyzj39R6yv
	2nStxD7L9S+yKLQSfmLFfojU+wgpycekvcJgvVeSGPYffHv6Ukoh2hu44tXp9QzyO8Pt9o
	BVa+vkNKuBif4ftpoGlXsqPlR8ZYFgs=
Date: Tue, 23 Apr 2024 13:39:03 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Joerg Roedel <jroedel@suse.de>, yong.wu@mediatek.com,
	joro@8bytes.org, will@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 4.19 7/7] iommu: mtk: fix module autoloading
Message-ID: <Zied1/2cELhaQupG@duo.ucw.cz>
References: <20240422232040.1616527-1-sashal@kernel.org>
 <20240422232040.1616527-7-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+UxX/KApw3y0ssBB"
Content-Disposition: inline
In-Reply-To: <20240422232040.1616527-7-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_043913_606597_989EA3D6 
X-CRM114-Status: UNSURE (   7.78  )
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


--+UxX/KApw3y0ssBB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> [ Upstream commit 7537e31df80cb58c27f3b6fef702534ea87a5957 ]
>=20
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.

This patch is queued for 4.19 and 5.15, but not 5.10. I believe that's
wrong.

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--+UxX/KApw3y0ssBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZied1wAKCRAw5/Bqldv6
8t3gAKCGrYHwFMHP8GJXLn7d7BZRrWiYFACgnWZYqAPYYddh29p9HUpGKDbADuM=
=gPbY
-----END PGP SIGNATURE-----

--+UxX/KApw3y0ssBB--

