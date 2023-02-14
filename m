Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F3CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 14:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GO15VsJlzlmyLxcQ5TSQgPGhma+5RsavILp781J0eJM=; b=ISC426xaSxreI6Um2JwVS1XNqa
	rnoqx58xSOev3fua5WGQh0TtUpzcKmrvfrHQW8qRGp4RXG67/M3PfTibQJf6gj+nguhlpdDRuBm1d
	pcwoFg+ZAI7hssVSbXy0NR83JzAnenTYXT8PKaTJBWAqOGlzkWH6Ysog4iMqVfr5PWkiKcJI8oDAK
	KJP290QVUu+XcfcX4UtTWEgZGWbdPAA/SciJpFRLnUydN4EsxCQRhiBgUhSSBufNuZdTCqSV5zjf3
	3uy+o5YHNbeosczEuvae7g4XlTu5+I4PFYLo+MgFIRbDlhY9x1dLkH1vjQDWBxUThHoNyuwL/Y7v3
	R7y5yU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRw3d-0022vm-AL; Tue, 14 Feb 2023 14:13:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZs-001lzg-4E; Tue, 14 Feb 2023 13:42:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B2A1566021B0;
	Tue, 14 Feb 2023 13:42:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382154;
	bh=VKBrumrs2Sux84CcTsQzhD+nobtsdV7Rc1oS6rm0aLI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E77s1B2P6dTeYn3l4x7Ei5b97WIk4uxEqGk0kBFnMDRhVMtgKMm/Wq14fVKPDMnv9
	 dC37H9KfHl586tGtySkOhEKj+hQtRF4OKKDrUbyGKoNvj9LUH50Dm0GqVSH3tc+L6K
	 MOj90j2883IVfP+/pbAhOYG9VUwc9z2PX8ZAJwXQDHKY7e15dDGY5mBIZaskywHW5E
	 x0jfpekmv1yQgXfFig5CryvavfRWI+1mWkMtQkmE4NJY+JCpbky+Fi1hlOKDSiiEwz
	 wu+lA3Bx6oqGZF2UvJwOo+b0iUe7l04EGMaHUjW4qXgxRjQww3srwJR/0H9ouKWXtW
	 UqJ0Hcto3naMg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 40/47] clk: mediatek: Allow all MT8167 clocks to be built as modules
Date: Tue, 14 Feb 2023 14:41:20 +0100
Message-Id: <20230214134127.59273-41-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054236_337222_308538DC 
X-CRM114-Status: UNSURE (   8.02  )
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

Almost all MT8167 clocks have been converted to use the common probe
mechanism, moreover, now all of them are platform drivers: allow
building as modules.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index 55727889ebf5..54f59f4b2b1a 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -406,7 +406,7 @@ config COMMON_CLK_MT7981_ETHSYS
 	  required on MediaTek MT7981 SoC.
 
 config COMMON_CLK_MT7986
-	bool "Clock driver for MediaTek MT7986"
+	tristate "Clock driver for MediaTek MT7986"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -415,7 +415,7 @@ config COMMON_CLK_MT7986
 	  required for various peripherals found on MediaTek.
 
 config COMMON_CLK_MT7986_ETHSYS
-	bool "Clock driver for MediaTek MT7986 ETHSYS"
+	tristate "Clock driver for MediaTek MT7986 ETHSYS"
 	depends on COMMON_CLK_MT7986
 	default COMMON_CLK_MT7986
 	help
@@ -431,7 +431,7 @@ config COMMON_CLK_MT8135
 	  This driver supports MediaTek MT8135 clocks.
 
 config COMMON_CLK_MT8167
-	bool "Clock driver for MediaTek MT8167"
+	tristate "Clock driver for MediaTek MT8167"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -439,35 +439,35 @@ config COMMON_CLK_MT8167
 	  This driver supports MediaTek MT8167 basic clocks.
 
 config COMMON_CLK_MT8167_AUDSYS
-	bool "Clock driver for MediaTek MT8167 audsys"
+	tristate "Clock driver for MediaTek MT8167 audsys"
 	depends on COMMON_CLK_MT8167
 	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 audsys clocks.
 
 config COMMON_CLK_MT8167_IMGSYS
-	bool "Clock driver for MediaTek MT8167 imgsys"
+	tristate "Clock driver for MediaTek MT8167 imgsys"
 	depends on COMMON_CLK_MT8167
 	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 imgsys clocks.
 
 config COMMON_CLK_MT8167_MFGCFG
-	bool "Clock driver for MediaTek MT8167 mfgcfg"
+	tristate "Clock driver for MediaTek MT8167 mfgcfg"
 	depends on COMMON_CLK_MT8167
 	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 mfgcfg clocks.
 
 config COMMON_CLK_MT8167_MMSYS
-	bool "Clock driver for MediaTek MT8167 mmsys"
+	tristate "Clock driver for MediaTek MT8167 mmsys"
 	depends on COMMON_CLK_MT8167
 	default COMMON_CLK_MT8167
 	help
 	  This driver supports MediaTek MT8167 mmsys clocks.
 
 config COMMON_CLK_MT8167_VDECSYS
-	bool "Clock driver for MediaTek MT8167 vdecsys"
+	tristate "Clock driver for MediaTek MT8167 vdecsys"
 	depends on COMMON_CLK_MT8167
 	default COMMON_CLK_MT8167
 	help
-- 
2.39.1


