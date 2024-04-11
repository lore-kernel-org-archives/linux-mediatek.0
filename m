Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED56CD1292
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 03:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAjmsH+6aubS715XXBaGjCsB0/CEs6SSA/8Z/p2zCYw=; b=ikPI0Cbp+QAr+vWXzQDJzy9EMg
	Sm3GkVM2QiJp/mWjY2OicVewvAIIZgb8+QQtELkqTVh9Xl4c6Gp9D65IY6uro2XNV8EhyfcVzyY/0
	OTMX+nT/TtUJZLZlifwul6srvvudcYyt7cSc/WpPrM6eqwcjZ1256vDTeyHovF66UzG3mFqrHzxFM
	nfYV3gOIdZaMYc3wMLukBU7ny4v2bk5dr0g9Bwj/qbLYAqRJA+NQg4HJvtfIP5RMATqnJBLg+0ME3
	G5ne4Jy4gEkWA5yrlmBfrRYYCZ//EOjQMWP0E7OUnkeXqVXKgLyvs6dqXQvsuzJpsguWaADlq7ksK
	oriRi8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulQi-0000000ADPP-1YnR;
	Thu, 11 Apr 2024 03:48:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulQe-0000000ADON-3mJB;
	Thu, 11 Apr 2024 03:48:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B40BB61280;
	Thu, 11 Apr 2024 03:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48261C433F1;
	Thu, 11 Apr 2024 03:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712807327;
	bh=aBDw+HokdUlrHR8iGqI7UsQz0OKWOH0/+fH0gryYk1I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uOTLsMD/6bGWI/YDWW53/mkGXyoqEyZPUIZWJzgXI85IhfbANNCLeT0p0viTZKNmz
	 2lA+J+UyWa45KGRkMCUWvR81YMujOBDxRCl92Zbdicxl5nGHoKltAOQKhrB1VboLLL
	 AyL+Rthux0akdTmaKCVrhRdmATzALrOuNEwrOqJpW4oppbLQYdqClRhuaextB5RZpw
	 0cbuzEt6NK8bTEYP2CXFoz9JjBat0PnVPIXeGYtkAhkX0po97wQcmKA+oUdJDjIRpf
	 FU6R9DDls2jVrFaEFwx1bo/HWL5nMJfM7wQZZLD+5qpxfw4nPSvA86Pg3s5SgbsH03
	 bUwYLLQwbv0Qg==
Message-ID: <0e92e72d610bd97963b686366c5334d2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240312115249.3341654-1-treapking@chromium.org>
References: <20240312115249.3341654-1-treapking@chromium.org>
Subject: Re: [PATCH v4] clk: mediatek: Do a runtime PM get on controllers during probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Pin-yen Lin <treapking@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Bosi Zhang <u201911157@hust.edu.cn>, Nicolas Boichat <drinkcat@chromium.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Pin-yen Lin <treapking@chromium.org>
Date: Wed, 10 Apr 2024 20:48:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_204849_007872_A07C5E4D 
X-CRM114-Status: UNSURE (   9.63  )
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

Quoting Pin-yen Lin (2024-03-12 04:51:55)
> mt8183-mfgcfg has a mutual dependency with genpd during the probing
> stage, which leads to a deadlock in the following call stack:
>=20
> CPU0:  genpd_lock --> clk_prepare_lock
> genpd_power_off_work_fn()
>  genpd_lock()
>  generic_pm_domain::power_off()
>     clk_unprepare()
>       clk_prepare_lock()
>=20
> CPU1: clk_prepare_lock --> genpd_lock
> clk_register()
>   __clk_core_init()
>     clk_prepare_lock()
>     clk_pm_runtime_get()
>       genpd_lock()
>=20
> Do a runtime PM get at the probe function to make sure clk_register()
> won't acquire the genpd lock. Instead of only modifying mt8183-mfgcfg,
> do this on all mediatek clock controller probings because we don't
> believe this would cause any regression.
>=20
> Verified on MT8183 and MT8192 Chromebooks.
>=20
> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>=20
> ---

Applied to clk-fixes

