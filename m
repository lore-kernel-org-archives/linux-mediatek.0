Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460A6606A31C
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 10:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k+m3TxBN;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=K+sBPR5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KlHnILjUPTtjVoCWz6pQ3Lktg1m0yXJ/ItcCfbuWGyI=; b=k+m3TxBN0TC7uN
	al71rJMC/F5nZHq43NWdEQO5c9yK5+FMTQOn0FGXB/8XozM3DLrMKmXfqdphcDhcB16wxHBty0nyk
	P1sPBZBFoHVS1XyEuWTzPvxmDgO2HWpH2gHS3sdMiyZNbvJH2q1tiiAkd6HQeGkXh7zOt7FZhjYQe
	mvfwBg1LKfri1ra7634tsH187Vzfu12/2BLvd1eHRMVCSDo6SVg1vRsQpwu82fBtpvmtRXJVdFwpg
	6rgiQLfKN5mHrBrPYZXBsMYoI2MoMB3VfKltLYmxip5M5GGlQR/Ma4BzoNSdotk2rGItPX9CClNN0
	0/7KNLOWgkSKoLC4Dc9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXG31-00000000gyN-2509;
	Sat, 28 Nov 2026 10:52:51 +0000
Received: from mail-106120.protonmail.ch ([79.135.106.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXG2y-00000000gxY-3AAd
	for linux-mediatek@lists.infradead.org;
	Sat, 28 Nov 2026 10:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795863164; x=1796122364;
	bh=KlHnILjUPTtjVoCWz6pQ3Lktg1m0yXJ/ItcCfbuWGyI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=K+sBPR5yN1xgXKNq5BF1dgeLlntdcnzXXf1CSyHKGHRGQf4pL2dGx+O6LaF3HK764
	 LHCrheTsMPVFj6Z9qPBGp242dXeWVUFmRNxA7+GeskjqMfZxGbuHpOhYPwaU74DkyJ
	 BK7J22vq1+A/PTsainQjDu2uCZSGpfOY59iQMTW2N4gSqkHB7JZs8dE9pj0wJ+fa+x
	 wGQ4WZdlKNmnoUWFQIdbFPh/I71qZnRql+76GJvJztLkbJw6tTv8HzNps0NIwUFGzt
	 CN4MhzDnh1g1MVnsO6TK0M6nKihiaICHhrfByAcN/MZAQYgAvsIi22yvt224mhcy9t
	 xD/r+bm3tBxVg==
Date: Sat, 28 Nov 2026 10:52:39 +0000
To: iasnezhkov@gmail.com
From: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, amergnat@baylibre.com, me@adomerle.pw, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Message-ID: <ozzQ46TkxnIE8zoFks-r8Rm4I2MGBrq1Ys2tEBV8B5IjFow5fHkZyAR10oOavJAoWHNumRPWsxFjQB3AOPOsD-DHYmo9vMO7gc4zLhm07jA=@protonmail.com>
In-Reply-To: <20261128043629.67417-4-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com> <20261128043629.67417-4-iasnezhkov@gmail.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: ce35320c6ce7da8373b685fc8c31552bcf20b7b1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261128_025248_973015_3629BCF1 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Saturday, November 28th, 2026 at 6:36 AM, Ilia Snezhkov via B4 Relay <de=
vnull+iasnezhkov.gmail.com@kernel.org> wrote:

> From: Arseniy Velikanov <me@adomerle.pw>
>=20
> Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99/G99+/G100/
> G200 and tablet/IoT variant MT8781) SoC.
>=20
> MT6789 uses the PMIF-SPI arbiter interface with the same register layout
> as MT8195/MT6833:

mt6833 is not upstream, and mt8195 has different offsets for pwrap.
Please either say 'similar' or reword this part.

> bank 3 interrupt registers (INT_EN at 0x450, INT_FLG
> at 0x458, INT_CLR at 0x45C, mask 0x180000, matching PMIF_IRQ_*_3 in
> drivers/spmi/spmi-mtk-pmif.c) and WACS2 software interface at
> 0x880..0x8A8.
>
> Register offsets and wrapper parameters are verified on
> live MT6789 hardware (iKKO MindOne, MT6366 PMIC).
>=20
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
> ---

Aside from the commit message, this looks fine to me. Though please
wait around a week before sending a new revision. This series went
from v2 to v5 very quickly, and Angelo and others may still want time
to take a look at it.

Best regards,
Roman

