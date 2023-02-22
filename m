Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC36C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7nHZQhp4Pgs0o+1hBEFlAG7jwRM9RBzpZBHYuY/sVhE=; b=fnqlxxJ1vmHILzYX5xl4zRuUB6
	g9IzQ3+NTNUsR+D7EYPvWTkuIaj8UdtKvOead73l0J17kGUuEh++S0ndRQOkGBI+dC4ehQA66Tsgg
	21tYvQWymhyXeCZDYibnRxtjR7ROOPZs5WM3sfdCvZxLHJPQBGGXMtvf5zNpPWUN0lxH4jyzrpI2R
	YOK8GuHqxaa2IvME+fZtvA6XYIsTmCuAOMS0UMne9upQ9jgzr8MQWdposK4kyYIDIPiDVCTRcLh1j
	cI5I+fTBF5gB2MjQBDyl30Pmi7Z56ms1XhI8tBPNNtS4RlAooEF05m+yruC85SF5jctX0CgtK/vA3
	dOznw/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlvU-00BhdB-Lc; Wed, 22 Feb 2023 10:00:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOk-00BQEx-Iq; Wed, 22 Feb 2023 09:26:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C33766021CF;
	Wed, 22 Feb 2023 09:26:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058009;
	bh=7FZEolUr6KyAj858oufGeSrFd4pByYVT6eDczeQoNE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ml3XO7nJLiU8lrpCFQf705GC7ysGHqUcNl07v2IFrNUFS+MD2C5tFTmjcf8aqZ+K3
	 q8myA0pQ9OIyUMhiktUB4HoCvCqcuWCa+NGLiur7vgTr0CLanc+98uYRjl7R0o+EA3
	 KVA0Vc7W+2QZEYgrYYJmPMnAKMRN0YXHLqBxOI3XNeK62vW2Uw+gXVnwahOb6IgwY5
	 PpGdi2SWi+tYPFO25pCjMRzNxKp9NPNZPG0BIDq/PqxDegLjNp4T583nD70nuqplhb
	 k1FahVauwIYkF3ab4gjq/hF0hAG9BDSCRUTRW22cdi/ANTYiqjiKjE0EWK29BOLdzL
	 7iR+feDHuAEmQ==
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
Subject: [PATCH v5 41/54] clk: mediatek: Allow MT7622 clocks to be built as modules
Date: Wed, 22 Feb 2023 10:25:30 +0100
Message-Id: <20230222092543.19187-42-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012650_834173_FBE47880 
X-CRM114-Status: GOOD (  10.39  )
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

Now that all drivers are using the simple probe mechanism change the
MT7622 clock drivers to tristate in Kconfig to allow module build.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index fc073e5be4eb..d089806789ee 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
 	  This driver supports MediaTek MT6797 vencsys clocks.
 
 config COMMON_CLK_MT7622
-	bool "Clock driver for MediaTek MT7622"
+	tristate "Clock driver for MediaTek MT7622"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK
@@ -345,21 +345,21 @@ config COMMON_CLK_MT7622
 	  required for various periperals found on MediaTek.
 
 config COMMON_CLK_MT7622_ETHSYS
-	bool "Clock driver for MediaTek MT7622 ETHSYS"
+	tristate "Clock driver for MediaTek MT7622 ETHSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver add support for clocks for Ethernet and SGMII
 	  required on MediaTek MT7622 SoC.
 
 config COMMON_CLK_MT7622_HIFSYS
-	bool "Clock driver for MediaTek MT7622 HIFSYS"
+	tristate "Clock driver for MediaTek MT7622 HIFSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 HIFSYS clocks providing
 	  to PCI-E and USB.
 
 config COMMON_CLK_MT7622_AUDSYS
-	bool "Clock driver for MediaTek MT7622 AUDSYS"
+	tristate "Clock driver for MediaTek MT7622 AUDSYS"
 	depends on COMMON_CLK_MT7622
 	help
 	  This driver supports MediaTek MT7622 AUDSYS clocks providing
-- 
2.39.2


