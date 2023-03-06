Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C68C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 20:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G3N5PVmkon6vfUF7PxpALoL8dBrGQ2f+oMsV2VCin0=; b=qXKJMM9c4DOAPH4e7yfnOVAeB8
	CEDCzMNg8T6iYNiHXO5v+J6Asxh1UFezsHsoFD0SR2RyxS6UMFM/V2AKEiYJzCIq8a9t4IfB/1X7V
	TL1IBFeg7t4ETdYWtoHwkfW/IRcCmlzPNxV3+9Us8ntlOGly6LMGlbF8R7yjdL+Nv4q32jNRu9RAa
	l/cGubiYvDJHmcnTCiF1yX6nabuNHOXrf/1erEJyJo9ra/pv0l75HNoKG6z+jJg+agzAXEUI7qLpW
	Ryub8IvYazhzhvVfIA7ZX8aLRX4pjrdRvQpZKN7T8i+txX7VoSrATmzs/Gj4/Acd+2ofMg4AQT1g1
	gLtpez2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHYH-00Exjl-US; Mon, 06 Mar 2023 20:35:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZHY6-00Exfg-SS; Mon, 06 Mar 2023 20:35:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9DC466114D;
	Mon,  6 Mar 2023 20:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006BBC433EF;
	Mon,  6 Mar 2023 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678134906;
	bh=1G3N5PVmkon6vfUF7PxpALoL8dBrGQ2f+oMsV2VCin0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=pzoFEX3TnEDvOID9sxcxyBWmQb/GMaRmWOwVkdA9429maq9xj87XoGIeYpbSuJi9N
	 ceT8VEVQA+f3gb6AWv7I4M5eq/d5QKnO9jRiV/LMvMs8CXoKIC1IAPT6tzwNjz4Pg6
	 Ad2dcoo0q1PUpXo9C7Xb0kKz2y0EYNNbTNMWuj1lASoxRjougCPKQ8lDVXDQHDT2F9
	 ncrn0i7nkeAx56qFbO1o9U39dwORW9SmvDGw5RvmR9lDfsMLqa836s23O/pNfj2rTd
	 KA4fkljCU7PUwh8y5nk60PY3j/QY+eHckG9x4W48ckPGGQiA5pZPU4M2ncJ8+Vd7Br
	 FQZheSm/YqCJg==
Message-ID: <b772f0075322b7bec01881e478c8dc4e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v6 00/54] MediaTek clocks: full module build and cleanups
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com, chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Mon, 06 Mar 2023 12:35:02 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_123511_021251_BB5BD0CF 
X-CRM114-Status: GOOD (  18.43  )
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
> NOTE: Applies on top of [1] and [2].
>=20
>=20
> Full blurb:
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
> [1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=3D7=
19067
> [2]: https://patchwork.kernel.org/project/linux-mediatek/patch/2023020701=
4800.7619-2-moudy.ho@mediatek.com/
>=20

Please use lore links (https://lore.kernel.org/r/<message-id>). [2] has
been applied in an alternative form. [1] doesn't have any review besides
DT review. Please get it reviewed.

