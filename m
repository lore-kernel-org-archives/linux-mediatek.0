Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C60C6FA86
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MHX/P6v0U70z06V6wjzlsrZuc2ga7ud66fZRpdGGrkg=; b=qds3iAIyBt5v2+mzteU47oXdDT
	tJydmXVhg/X+6Zv+mjoz6/7OBpAF7JAMMqDyfPFe2L5Kd6Ny58km5deh1LNMtYvmMhWxskt6u3rYQ
	T7BZVAkuWxyfmhfNCWszgBHAvsor5khHNzdAgRvh+LhgsY+TppuNXtc8clSSMLTstx/cWM80Jxg15
	N77WOJuigPCz1WLXctidpK1zyrkr670x+7J3h+VdKxuYEgBIwQHNs/lEZGSq4pUJwqmc82vyo+yQX
	zvw2U3G9aeiVn2eRqXCppsQ//gvJlehjG275UCfvNyAANp++vaCljQQDOjfHbedeDQjR8bAkZ93C/
	sywG8sCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7ZJ-009lWF-P2; Tue, 27 Sep 2022 10:12:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7Yx-009lJd-7P; Tue, 27 Sep 2022 10:11:41 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 88253660205F;
	Tue, 27 Sep 2022 11:11:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664273493;
	bh=wLKQ8bajA+e/ikXm5x/+8XAGljaSNHIIE+LrYJVbQc0=;
	h=From:To:Cc:Subject:Date:From;
	b=EeFVMdR4WBe/VIn37ShwE0RyPEHETCwPy3691cH8Sh6TEvpLUP85UwlgT9lJQJus/
	 viowz+lpEtj1NBVRv0Lk17WENx3phYNALtsM4+cigz8925QNTYvmmXJEpa5vATATIG
	 wWJKceuN26tBkagsBUDYp7Vxdk15M3C9tCJSY/TGwTfl7qXsH2rcRvcmOUsKfPe2Ol
	 QPxaHF5njo1RrI5H9xw5Rt3CuzzVFTMXRCX1/uE0c/wu2TqxzE9aY2kDeZqUsNuyy5
	 4QtYg+8YudzHdC3QHaV0GTMbYklup86dr+2aih0NLzJk2bxIlus1NK+L1fQpBmCB/x
	 fHAM4JCqZEGXA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 00/10] MediaTek SoC safe clock muxing and GPU clocks
Date: Tue, 27 Sep 2022 12:11:18 +0200
Message-Id: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_031139_478091_EEF8AEB5 
X-CRM114-Status: UNSURE (   8.94  )
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

This series adds a clock notifier for MediaTek clock muxes, required
in order to achieve stability for GPU DVFS.

The GPU frequency scaling mechanism requires us to switch the GPU
mux clock to a safe parent which frequency is always less or equal
to the "current" GPU frequency before reprogramming its dedicated
"MFG" PLL.
This is needed because the PLL needs time to reconfigure for its
output to stabilize (so, for the PLL to lock again): failing to do
so will lead to instabilities such as glitches, GPU lockups and/or
full system lockups.

While at it, reparenting of some GPU clocks was also performed, as
the clock tree was slightly incorrect.

This series was tested, along with mtk-regulator-coupler [1], on
Chromebooks with different SoCs (MT8183, MT8192, MT8195*), resulting
in fully working GPU DVFS with the Panfrost driver.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220628120224.81180-1-angelogioacchino.delregno@collabora.com/

* MT8195 does not require mtk-regulator-coupler. This series, along
  with [1], are required to perform GPU DVFS also on non-Chromebook SoCs.

Changes in v3:
 - Clarified commit description in patch [05/10]

Changes in v2:
 - Added comment in clk-mt8195-topckgen to keep the mfg parents
   documented after removal, as suggested by Chen-Yu

AngeloGioacchino Del Regno (6):
  clk: mediatek: clk-mt8195-mfg: Reparent mfg_bg3d and propagate rate
    changes
  clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as
    generic mux
  clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
  clk: mediatek: clk-mt8195-topckgen: Drop univplls from mfg mux parents
  clk: mediatek: clk-mt8192-mfg: Propagate rate changes to parent
  clk: mediatek: clk-mt8192: Add clock mux notifier for mfg_pll_sel

Chen-Yu Tsai (4):
  arm64: dts: mt8183: Fix Mali GPU clock
  clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
  clk: mediatek: mux: add clk notifier functions
  clk: mediatek: mt8183: Add clk mux notifier for MFG mux

 arch/arm64/boot/dts/mediatek/mt8183.dtsi   |  2 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c   |  6 +--
 drivers/clk/mediatek/clk-mt8183.c          | 28 +++++++++++++
 drivers/clk/mediatek/clk-mt8192-mfg.c      |  6 ++-
 drivers/clk/mediatek/clk-mt8192.c          | 28 +++++++++++++
 drivers/clk/mediatek/clk-mt8195-mfg.c      |  6 ++-
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 46 +++++++++++++++-------
 drivers/clk/mediatek/clk-mux.c             | 38 ++++++++++++++++++
 drivers/clk/mediatek/clk-mux.h             | 15 +++++++
 9 files changed, 153 insertions(+), 22 deletions(-)

-- 
2.37.2


