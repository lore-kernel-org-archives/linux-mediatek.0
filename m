Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E7BC61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 23:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2T3EnCeToIbB1oGc6Q3Dvzk4LxSn3pFP8jTx088sJs=; b=IOTCqmmA43zhNgH3uT1udW+ty9
	UjmrUgI0DmIJIL4Vsl50ooqRq4Pr+KNdU8rIc8SXiwdVQkfMMMCrOGwFrB5srWjYHMtNeWYwEO2hY
	f4r03VZYgsE52niRFI86i3K48cmL4xfakyInlonSYjFi+Ob7yegbxBYHtK5tXD/Xsf5l1B3CvWB7a
	CPFFbvR8d0/ZHF2pHhdHy3iPm+jvk6RYESWa+1MEvaTM9d7wppEB2phq01BIZTy6JV/ZPKDswFesD
	de1c/lZ1Cm5w6UzGYhDr9ehEv3xCkWULZBggvjCAYy6sxr9J1yQogQP7XVXdQEVm6IDeLRNvUnRE/
	b+JLB1Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrVU-008K0P-50; Mon, 13 Mar 2023 23:23:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbrVI-008JyU-J8; Mon, 13 Mar 2023 23:22:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DAB2561542;
	Mon, 13 Mar 2023 23:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD1CC433EF;
	Mon, 13 Mar 2023 23:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678749775;
	bh=e2T3EnCeToIbB1oGc6Q3Dvzk4LxSn3pFP8jTx088sJs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bR116asJKEglby1yrat+gFGDWWT5x1rh4z3Z2BeehrZWPc05TN4B/G8vaJXUllt+/
	 w9KCV3Z3HkzdK8nnYL+jFZpQL3haeCSge+8rhfEOLxUGdLX7Xap9NjmYdXdNQxvjii
	 zaXtb8vCenhjps1oGXxbtRMOqO+YnTXy6UlWOIKmCoW0u3K3fFB99/+TuzBik4cUtg
	 vXtj57ybwUGw5XaVjX7P2HoeVHR+NZ5LEvNRXcZseTSQHM7/Pk8/W3sSO+Cp7YuShA
	 UV+40FCJSQbqtet2ILUmUUq1dscMyxWwD8Afl5ovKK4fuMCaOhQBzxsFX+P1AP4ya5
	 podxAbjicU2QA==
Message-ID: <6c52bcda08b62593c541d52e269d3982.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 00/54] MediaTek clocks: full module build and cleanups
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Mon, 13 Mar 2023 16:22:52 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_162256_742666_5F0D08A6 
X-CRM114-Status: GOOD (  17.70  )
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

Quoting AngeloGioacchino Del Regno (2023-03-06 06:04:49)
>=20
> This huge series adds more cleanups on top, reducing size and adding more
> commonization for clock drivers probe/remove, which also includes a new
> common probe mechanism for multimedia clock drivers that are usually
> probed by mtk-mmsys instead of a dt clock node: thanks to this, it was
> finally possible to convert almost all clock drivers to the common probe
> mechanism, which *finally again* makes us able to build all these drivers
> as modules!
>=20
> Since this looked like being *the* way forward, I went on converting some
> more drivers away from OF_CLK_DECLARE_DRIVER to full platform_driver(s),
> allowing for more (actually, almost all!) drivers to be built as modules.
>=20
> While at it, I also added some more consistency in macros usage by
> removing all of the duplicated full macro declaration for MediaTek gate
> clocks and replacing all of those with using the GATE_MTK macro instead,
> producing a nice reduction in amount of lines per file but, more
> importantly, improving readability and eventual future batch changes.
>=20
> This amount of commonization will also, in my opinion, greatly improve
> the review process for new clock drivers, as they will be mostly just a
> list of clocks and won't contain much new code, as it's all going to be
> handled in the common places, which also reduces chances to see new clock
> driver related bugs emerging on one SoC or the other.
>=20
> Since I don't own devices with all of the supported MediaTek SoCs, I
> could not test some of the conversions on real hardware... but I am
> confident that this will work as the drivers are *very* similar on a
> per-generation basis.
>=20
> This series was build-tested for all (both module and built-in build)
> and was manually tested on MT6795, MT8173, MT8192, MT8195.
>=20

Applied the whole series to clk-next.

