Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05797ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 01:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bp9MG1Ufb7Tzj1XyXFNI9+qa4E+OkXzO9lRH/DnXEkM=; b=5AOY4cfDVvGuxo9m+S9OphHbiV
	GOPacYVjjAmTNHaxV61MgrkApraHa4NyUJf8/LLzb5AQd0g/wUnvFOgyzvUZ7L51TLRXSZhP2pl3I
	3exkX5v1cXAstapdDVv0xUxsCd+kFalcyGggAukaYoxkKF/HuypzCayIj8ACAnXDiUK6+/BNkodfw
	a+1kK/Jpjllsc1B/go56p9P4vywsOvjVFHj5u66Atop6HaM2Oftmx5PrYTp/tDqdxgiz7C5KK9gRI
	rRvDPcfwDhCQrI52N42LY7i9pWx8XJJ+fLTphDkEnqj0vswJ9SoYqN+RKuNZOUSEsZ6rswn05SIF3
	5tz55Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYoh-008sk4-Ph; Thu, 01 Sep 2022 01:16:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTYoX-008shv-Ue; Thu, 01 Sep 2022 01:16:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52A8461D0B;
	Thu,  1 Sep 2022 01:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4E4DC433C1;
	Thu,  1 Sep 2022 01:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661994972;
	bh=Bp9MG1Ufb7Tzj1XyXFNI9+qa4E+OkXzO9lRH/DnXEkM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Eww2IZWYJK0KQ89Rl0O4KNo0FuXOCDYQNFCTGaxaQiQ1wYDytuOBRMb51k/jbBOsI
	 +nNx8n9sO2bz6btRBxbQQA10qxOSDfv+olBWPVRtO8gK+wdH+rcM5AuyJvKnkNBgXY
	 n9FPXJxHgSdol014iSwZs1r9x83O0HNZlQ1dUsLV1fjyXrKUCbeuHSRON/tN2Kd7Py
	 NEhd6tpNL/YwCazqi66bl05FH4cgPZX4deDYNGVX5bBZx962dRwsgspsWMW13+S4B4
	 qZeFntY1S9N2qy3AMjVsBAFVp71qg+RGo39+WUXJzAUoC3H/DCcNzRPL4LAEvHwfGR
	 rFiT6Yt2gV2cg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220719093316.37253-1-angelogioacchino.delregno@collabora.com>
References: <20220719093316.37253-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: mt8195-infra_ao: Set pwrmcu clocks as critical
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, wenst@chromium.org, chun-jie.chen@mediatek.com, miles.chen@mediatek.com, rex-bc.chen@mediatek.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mturquette@baylibre.com
Date: Wed, 31 Aug 2022 18:16:10 -0700
User-Agent: alot/0.10
Message-Id: <20220901011612.C4E4DC433C1@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_181614_045372_5600211E 
X-CRM114-Status: GOOD (  10.51  )
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

Quoting AngeloGioacchino Del Regno (2022-07-19 02:33:16)
> The pwrmcu is responsible for power management and idle states in SSPM:
> on older SoCs this was managed in Linux drivers like sspm/mcupm/eemgpu
> but, at least on MT8195, this functionality was transferred to the ATF
> firmware.
> For this reason, turning off the pwrmcu related clocks from the kernel
> will lead to unability to resume the platform after suspend and other
> currently unknown PM related side-effects.
>=20
> Set the PWRMCU and PWRMCU_BUS_H clocks as critical to prevent the
> kernel from turning them off, fixing the aforementioned issue.
>=20
> Fixes: e2edf59dec0b ("clk: mediatek: Add MT8195 infrastructure clock supp=
ort")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

