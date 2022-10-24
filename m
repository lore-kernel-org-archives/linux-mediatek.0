Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14E8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b0m+Ap3AgBXL/v7duwB458tmsFl0a9PquWvZTlwYLrU=; b=ooXbf99rKkVq3bGgeGoPzsm13m
	rFDVU7bbAlfzcj1xmWLEyunn3QS7S/4fSSum9t3WtC81BzxpqNxKK6sPOipR8yTdIaZdpt8FdRhl0
	T4QZ0t2QgShCBiizo+HODaHfXwXw6ujPzLznsCGd42+oGmf0wVG0DIZhXMocqOFa8xqRNXy64X80C
	ZbgQafwzveVa0VaT+3vGg57PNnVgv6Hoa/RsGi78eMw9u6dv/XjpuCMoYan6CmGbjz7ie91PqDswL
	c0ewZU3H4XNOPqcFyX8wuatpspw0xyR1Uoa0BbKXp/+exXzpxwFAvplyoZPZbNFlfmt3gyFhrGWiP
	Ce5Ozfug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucQ-000gvE-Ex; Mon, 24 Oct 2022 10:23:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucD-000gof-Kq; Mon, 24 Oct 2022 10:23:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AC50366026E6;
	Mon, 24 Oct 2022 11:23:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607005;
	bh=3oXoEhWg3+MHoIyDaeamIWAKLeunxv0N4TGhq6yceYE=;
	h=From:To:Cc:Subject:Date:From;
	b=igH0GyikvyoTw9qwOrQiZ9nd7thTOOXfuysbEppszIcfj8HDJCdfogCpK81ZIft7e
	 ahMDdRrvTh1kL/r7bdf12b9gcUhHzdbcn7hGZ9JHJjd4Dvahz4tZEB5gdq3XEYuB2j
	 QtrqVf0pwjZtx/a30mtdDcBfHeNMZWXM7rEOFLh6fL514nhaFtndYkI43Oy27PBmSS
	 CS955CVEz6BNahHAv3i9Za9YeM+yBTmV+sc9lwZPWsuaoCiOI/TfC9a6Daogx2gDKK
	 lIOdiD2FjATme8QP5GFfyxQbHxlQ78Ggjp3jnTn8t5YNGq4WQ0fYvrdAf8gJUcFjEy
	 1yNUzz1VnT2mw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/10] MTK: Undesired set_rate on main PLLs and GPU DVFS
Date: Mon, 24 Oct 2022 12:22:57 +0200
Message-Id: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032329_935456_0C2DD1D7 
X-CRM114-Status: GOOD (  16.21  )
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

There's no reason to declare CLK_SET_RATE_PARENT on main system PLL
dividers, as any rate change on those (mainpll, syspll, univpll) will
change clock rates on critical system peripherals and busses.

This change was performed only on SoCs that I could test... I'm sure
that the same can (and should) be done on more MTK clock drivers for
practically all MTK SoCs, but I don't feel confident in pushing things
that I couldn't test, so that's done only for MT8173/83/86/92/95 and
on MT6795.
While at it, I've also added the much needed clock notifier treatment
on MT8186 for GPU DVFS, like done on other clock drivers in the past.

A broader explanation about why this series is needed can be found in
the first commit that drops this flag from fixed dividers of main and
univ PLLs (on MT8186) but, for the ones reading mainly the cover letter,
here's a copy-paste of that commit description:

The mainpll and univpll clocks are used as clock sources for multiple
peripherals of different kind, some of which are critical (like AXIs);
a rate change on any of these two will produce a rate change on many
devices and that's likely to produce system instability if not done
correctly: this is the reason why we have "fixed factor" clocks, used
by MUX clocks to provide different rates based on PLL output dividers.
    
Though, there's one fundamental issue that must be resolved somehow:
    
When performing GPU DVFS, we get a rate request that will try to change
the frequency of MAINPLL due to the CLK_TOP_MFG mux having clk26m,
mfgpll (the GPU dedicated PLL), mainpll_d3, mainpll_d5 (fixed factor
dividers) as possible parents.
    
In order to solve that, there are two ways:
 1. Add new "fake" mainpll_d3_fixed, mainpll_d5_fixed clocks, clones
    of mainpll_d3, mainpll_d5 clocks, for the only purpose of not
    declaring CLK_SET_RATE_PARENT; or
 2. Simply drop said flag from the original dividers.
    
After some careful validation, I cannot see anything calling a rate
change request during runtime for MAINPLL, nor for UNIVPLL (which would,
again, mean that we're reclocking lots of peripherals at once!), so it
is safe *and sane* to simply remove the CLK_SET_RATE_PARENT flag to all
of the main/univpll fixed factor divider clocks.
    
Besides, if for any (doubtful) reason main/univpll rate change will be
required in the future, it's still possible to call that on the PLL main
clocks, so we're still covered anyway.

AngeloGioacchino Del Regno (10):
  clk: mediatek: clk-mtk: Allow specifying flags on mtk_fixed_factor
    clocks
  clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed
    factors
  clk: mediatek: mt8183: Compress top_divs array entries
  clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
  clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
  clk: mediatek: mt6795-topckgen: Drop flags for main/sys/univpll fixed
    factors
  clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
  clk: mediatek: mt8195-topckgen: Drop flags for main/univpll fixed
    factors
  clk: mediatek: mt8186-mfg: Propagate rate changes to parent
  clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier

 drivers/clk/mediatek/clk-mt6795-topckgen.c |  76 ++++----
 drivers/clk/mediatek/clk-mt8173.c          |  76 ++++----
 drivers/clk/mediatek/clk-mt8183.c          | 216 +++++++--------------
 drivers/clk/mediatek/clk-mt8186-mfg.c      |   5 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c |  89 ++++++---
 drivers/clk/mediatek/clk-mt8192.c          |  76 ++++----
 drivers/clk/mediatek/clk-mt8195-topckgen.c |  78 ++++----
 drivers/clk/mediatek/clk-mtk.c             |   2 +-
 drivers/clk/mediatek/clk-mtk.h             |   7 +-
 9 files changed, 293 insertions(+), 332 deletions(-)

-- 
2.37.2


