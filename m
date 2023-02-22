Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00239C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hiOGbRLd6awfODUe5B29cRrwHs/i+noW1PKu3C/lIU=; b=dWRoiJe9hBTLThR5OM9YaRVxh2
	BQDXjVOC3mkAfDdx6emQnZTr/tNNy3DcUdjpfQAveT+nuLL5z7+cYrEqBhyw8Ky1luYJdOP7vX4W1
	SJLS52WfSIdmMsMmY8I65hhcrjPJvUkFAi63gF4hpjA2gKRakjXpWtfPz2SWYQHzZ2/1C2K8vbK0v
	zadbkj8sIYsq37U2LwP2ma7V9abqIsYUeahpurIRoxmdutzNHBN+VgY7ufxkZGevhwJclwvWO50aC
	T8V2NDb6lfTrxblvNigm5olaH2+aqgBacJdp8A7UXZOUVrSvUXYSdGiqAPLzVc9/sbDGzJ/HgwxXk
	PZM0rM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlvN-00BhZm-Vi; Wed, 22 Feb 2023 10:00:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOg-00BQCl-TB; Wed, 22 Feb 2023 09:26:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 769B866021E0;
	Wed, 22 Feb 2023 09:26:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677058005;
	bh=okgDVcS5AIh9ARPx4LN/uPCOjdyJGHaFGT+16hg9eRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxYMuUTYH0xxTzMx9nBq+RarZedMQYdq80OjJtMJZIk0M8XPbSq4rH82ygV0XQrJR
	 VPA8qFLrsvm85WzfMrD+W8idZtLbqt8ezn8qo2Rr7nDIoOy8X3R7NspzJW0Jpi0hIY
	 u7pPWVlS1na5dwzDNcCistbhP5c5lJEI8Fx1+H0fB7QC6DF14aVYre6WQOphZffE8E
	 rK5KPpDZXs2BG8/MSd3uJxmd4QKn8bpy0ot6xuLwx3oeMTiD3ZQlBDF3gWyu6TAZWU
	 Efzi/b/WlbkHfb/9Wu3l8mspEkq2Zy3foMpIOpkvRqlSi+6WdHXq+wzFWs/Zal0TeL
	 HQpPuQX/pjRUA==
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
Subject: [PATCH v5 38/54] clk: mediatek: mt2712: Change Kconfig options to allow module build
Date: Wed, 22 Feb 2023 10:25:27 +0100
Message-Id: <20230222092543.19187-39-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012647_135884_A3D9BE47 
X-CRM114-Status: UNSURE (   9.45  )
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

All of the mt2712 drivers have been converted to platform drivers!
Change the Kconfig options for all MT2712 clocks to tristate to allow
building all clock drivers as modules.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
index b9c0a9e21cf1..45b7aea7648d 100644
--- a/drivers/clk/mediatek/Kconfig
+++ b/drivers/clk/mediatek/Kconfig
@@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
 	  This driver supports MediaTek MT2701 g3dsys clocks.
 
 config COMMON_CLK_MT2712
-	bool "Clock driver for MediaTek MT2712"
+	tristate "Clock driver for MediaTek MT2712"
 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST
 	select COMMON_CLK_MEDIATEK
 	default ARCH_MEDIATEK && ARM64
@@ -83,43 +83,43 @@ config COMMON_CLK_MT2712
 	  This driver supports MediaTek MT2712 basic clocks.
 
 config COMMON_CLK_MT2712_BDPSYS
-	bool "Clock driver for MediaTek MT2712 bdpsys"
+	tristate "Clock driver for MediaTek MT2712 bdpsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 bdpsys clocks.
 
 config COMMON_CLK_MT2712_IMGSYS
-	bool "Clock driver for MediaTek MT2712 imgsys"
+	tristate "Clock driver for MediaTek MT2712 imgsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 imgsys clocks.
 
 config COMMON_CLK_MT2712_JPGDECSYS
-	bool "Clock driver for MediaTek MT2712 jpgdecsys"
+	tristate "Clock driver for MediaTek MT2712 jpgdecsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 jpgdecsys clocks.
 
 config COMMON_CLK_MT2712_MFGCFG
-	bool "Clock driver for MediaTek MT2712 mfgcfg"
+	tristate "Clock driver for MediaTek MT2712 mfgcfg"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 mfgcfg clocks.
 
 config COMMON_CLK_MT2712_MMSYS
-	bool "Clock driver for MediaTek MT2712 mmsys"
+	tristate "Clock driver for MediaTek MT2712 mmsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 mmsys clocks.
 
 config COMMON_CLK_MT2712_VDECSYS
-	bool "Clock driver for MediaTek MT2712 vdecsys"
+	tristate "Clock driver for MediaTek MT2712 vdecsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 vdecsys clocks.
 
 config COMMON_CLK_MT2712_VENCSYS
-	bool "Clock driver for MediaTek MT2712 vencsys"
+	tristate "Clock driver for MediaTek MT2712 vencsys"
 	depends on COMMON_CLK_MT2712
 	help
 	  This driver supports MediaTek MT2712 vencsys clocks.
-- 
2.39.2


