Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BDD606A335
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yYXuxylk;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=Zdh3mf8Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kx8h+Ar+4Gc1qWaoobGzkg9ZynxpfsO5B9MeCPzrIdw=; b=yYXuxylkVE6smO
	CTKtsgZUpuCGgwwWBvJmuFLCxHL/CY1w3McNOBvVacIHQVuIVqpqiiLpAKSimjYeAiPohgbA3GYZ3
	oDcpTVtKAVslzvVFUQjjJ1Wr4L1+8YSo9U1FHGSkjF2kj8zjNkbv4r83FNBeaSpgkhInjhdzfeQyf
	/foBBZ+4JsMKdJFdBM9a/3Hafr0D8gHMiIbBN65t6NSHSS1eBn2wlTkowZwPxUVj/aBuA1AdkuX9m
	LQarujnzrE5UO5A0jdSqwKCuEQr71ELRSfbQJhPXGxv1N1lzesMJDvqpcml7SLcggc4Aqp+D9WGge
	bDnO9gxsn5FJAHA5V0fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUZd-0000000CM9q-3oZB;
	Thu, 26 Nov 2026 08:11:21 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWUZZ-0000000CM8J-2EkW
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795680673; x=1795939873;
	bh=kx8h+Ar+4Gc1qWaoobGzkg9ZynxpfsO5B9MeCPzrIdw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Zdh3mf8Ysd87iU3bY8C49poOuhDda4EevLwzGVf9g1ZyfEwOU/tAd1jpnLWIGqcYv
	 7VHZM+bpTx4hUBBYmlw82aoCdxIdEStqu6SbH1LE6hjlD3Ckdm8ILyCNZxI/u13EHL
	 Y2EZCWKrBn1ou6wtKYPr6rGxUbE1MjSNatlEN9uJamdJ++999OPHQ/OXq7mC/+PDjw
	 exd7/5Au2mTVTuHHqYeM+Sx0Sc9eeT4qZyFbj3KdcFdWG1Dt1WZVL8EVwDzUHMRYAL
	 hZesa1h+hDGUfar5TTU+la7ad9GpbLweV7sNw75+YV2d8KKb00d6ngJILCeCZjLxsE
	 d0XNoLJwl/HEw==
Date: Thu, 26 Nov 2026 08:11:07 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org, flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI support
Message-ID: <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
In-Reply-To: <20261126031001.27288-1-iasnezhkov@gmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: f5e5584ad9f8c9446847ecc24663ff6184cab23b
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_001117_731814_8FC7C6D5 
X-CRM114-Status: GOOD (  11.56  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thursday, November 26th, 2026 at 5:10 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> This series continues the stalled July 2025 MediaTek MT6789 (Helio G99)
> initial bring-up patches originally posted by Arseniy Velikanov (on CC):
> - pwrap v1: https://lore.kernel.org/linux-mediatek/20250715225746.1321-1-=
me@adomerle.pw/
> - spi v1:   https://lore.kernel.org/linux-mediatek/20250715231921.4527-1-=
me@adomerle.pw/
>
> Original authorship and Signed-off-by are preserved on patches 1, 3,
> and 4.

Why this series has both spi and pwrap? There's no dependency between
them.

>
> Changes since v2:
> - Patch 2 (new): guard PWRAP_WDT_SRC_EN, PWRAP_WDT_SRC_EN_1, and cold
>   pwrap_init() with !HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB) so
>   arbiter SoCs (MT6873, MT8195, MT6789) do not write wdt_src to offset
>   0x0 (PWRAP_INIT_DONE2) during probe.
> - Patch 3 (was 2/3): add [PWRAP_INT_FLG] =3D 0x458 and
>   [PWRAP_INT_CLR] =3D 0x45C to mt6789_regs[] matching PMIF-SPI bank 3
>   (INT_EN at 0x450, int_en_all =3D 0x180000) so pwrap_interrupt() does
>   not clobber offset 0x0 and leave a level-high IRQ asserted.
> - Patch 4 (was 3/3): renumbered to 4/4, unchanged.
>

All notes about addressing review in your patches should go below ---,
otherwise they will be included in the git history. Alternatively,
you can put them right here.

Best regards,
Roman

> The v3 rebase and fixes were prepared with an AI coding assistant.
>
> Base: torvalds/linux master 4dce97c6c265.
>
> Arseniy Velikanov (3):
>   dt-bindings: soc: mediatek: pwrap: Add compatible for MT6789
>   soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
>   dt-bindings: spi: mediatek,spi-mt65xx: Add compatible for MT6789
>
> Ilia Snezhkov (1):
>   soc: mediatek: mtk-pmic-pwrap: Skip WDT source and init on arbiter SoCs
>
>  .../bindings/soc/mediatek/mediatek,pwrap.yaml |  1 +
>  .../bindings/spi/mediatek,spi-mt65xx.yaml     |  4 +++
>  drivers/soc/mediatek/mtk-pmic-wrap.c          | 44 ++++++++++++++++---
>  3 files changed, 43 insertions(+), 6 deletions(-)
>
> --
> 2.54.0 (Apple Git-157)
>
>
>
>

