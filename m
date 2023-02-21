Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E72F2C64EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 12:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOqZh91dzhZ5eiSoqgW3TxLbAWxwer6D9c7c2w0s8Qw=; b=A7rFtJY2hQAdGeSEmuu6wSuPFm
	/KpovThlGMawc/GIWbA7zgqlZD4VYm8X/ahCOYaDrrQqy4ihSjECR9LhX1O59i+rmXWI25Uaum8Za
	wlRDeoQCavqmu+ZEJvI1NfYCOcOSQ7AzdyJ2a5Pubv8+jGbFyAw69PwgS8e5WP0RCj/zHHFY0YCKP
	+jPJN8jWnodZ3Q1jjhWe0mgmaLXCSkGFZ7HUgpLFEKcbOAAr8yC1IawMn40NbvLBaWkpjy2799x46
	navRkH5bEPaoRSzw5FeZKLhfqttNcyklWVN124NkkDV0m9hp3VuSd0lrvzAp677xs8rDupjbnw5Qc
	UbvTgIbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURkv-00800z-8O; Tue, 21 Feb 2023 12:28:25 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURGO-007k34-2O; Tue, 21 Feb 2023 11:56:55 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 86EA366021D1;
	Tue, 21 Feb 2023 11:56:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676980610;
	bh=0i5i38gD2RAIMo8EuAyRh4KkstFXZ0Qog17NmX0YKGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=okwWEKdRCrCN+ocQMi38lY4B/L1QmhDlKOH6gL+UiPY/+G9WSz4TtFCaii1DEv0N4
	 y0pAVHYKbLXKX5JhIiVdML4fQBGRA2ZSoasg4ouTZIP8/jJBTlT+ya8uuEmepI+I3X
	 iZ9z1eEGJ1K+0F0JyvVypr4TtPfQqaFYg8KrTxAFwkgF83l17f52GTn+1TFrxlmNtl
	 lrZXXlEogyk1tTZuY/2JoJW7HOAtH5uc7gwpIF7ihFTq3+4t1pwgelrNWPCkvhedOC
	 icxol8FhEmHvqdePN/5oniYU9werZDk9Tho4nlJasvj5RA5sPJxPP51KIC4MfrEvt6
	 1UxOPL/eHMYYQ==
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 42/54] clk: mediatek: Allow all MT8167 clocks to be built as modules
Date: Tue, 21 Feb 2023 12:55:37 +0100
Message-Id: <20230221115549.360132-43-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
References: <20230221115549.360132-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_035652_302028_5F8C044B 
X-CRM114-Status: UNSURE (   8.56  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index d089806789ee..9f81ffc0876a 100644
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


