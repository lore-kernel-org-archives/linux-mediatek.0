Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627D3C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4mpP4ou3/wmRGEHL3MGOsbtYmoDdBAzRPGuepaDasuc=; b=v0UuaILesFliTK
	8k18v9E/1sdiCoJZ6L9opFdsbDHmCWHqObHupRH51TfEezY09S6P8Hrk16UiiwWP4ZzFHDiypLpxX
	EGHkeVai/Ttq3EkPSmLCBqe9/PJV0Nd7L1StwBydSyuPNsu6T3CPlzCPHbIJD6385gVm0Gxw9yifI
	xwvhi0cqxmA6rABjmdMrU5Lwla3r5WZJxacL468i85yyyCbwGVxouXSmyiA3cDEGpXi+5fvixNB3X
	R8cijJiUpFfp8Ka77ZuQUURqg0tpht5UMRW67nntm1YLiFhuJXmtnFDyanhM2Qoz3sMexdApvF/il
	oIfpUXcK15Z4qt4xX10A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUr-0000000FOxR-40FU;
	Thu, 15 Feb 2024 08:53:33 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXUg-0000000FOp2-3arL;
	Thu, 15 Feb 2024 08:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707987201;
	bh=45Yk3VPr09uA53emzuvZAFq3Vek84k8DhS6fpL96DAA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JcN5CCA5pfgSEX9kZYnI0flFG/xh5oRoZe238O8rZXEW5oOupq86ob5vaB6a2yA7B
	 RFWxq5yq9oSFoAH87f3th0vq34pD96WxJYbR+y3Hb+G0JwIaGqzydodTjFvYbVCnEx
	 laj0OkGQ3Wt3iBxCusF8CdyZDTLLQx8U9W8YL+UCjwwQr7W/4BgmCXQsv/7Tt7UqDk
	 yAIIyYklwESTtqwA+LWzfGGiZVbRwsDet5/HWmlVlAod2mbkWrQxIJGBavzKd5U13d
	 ibxCmGHCQ/0EnShEUrAB/VpI7cC+/Gd7tVemAqlORloYZSJT0pDgI7HA8feRu3wCz0
	 5xjVqOPqNvP/g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1756137820AD;
	Thu, 15 Feb 2024 08:53:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Subject: [PATCH v6 1/9] drm/mediatek: dsi: Use GENMASK() for register mask definitions
Date: Thu, 15 Feb 2024 09:53:08 +0100
Message-ID: <20240215085316.56835-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
References: <20240215085316.56835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005323_047333_154DD04B 
X-CRM114-Status: UNSURE (   7.72  )
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
Cc: p.zabel@pengutronix.de, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>, linux-mediatek@lists.infradead.org, daniel@ffwll.ch, matthias.bgg@gmail.com, kernel@collabora.com, airlied@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Change magic numerical masks with usage of the GENMASK() macro
to improve readability.

This commit brings no functional changes.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 45 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index a2fdfc8ddb15..c66e18006070 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -58,18 +58,18 @@
 
 #define DSI_TXRX_CTRL		0x18
 #define VC_NUM				BIT(1)
-#define LANE_NUM			(0xf << 2)
+#define LANE_NUM			GENMASK(5, 2)
 #define DIS_EOT				BIT(6)
 #define NULL_EN				BIT(7)
 #define TE_FREERUN			BIT(8)
 #define EXT_TE_EN			BIT(9)
 #define EXT_TE_EDGE			BIT(10)
-#define MAX_RTN_SIZE			(0xf << 12)
+#define MAX_RTN_SIZE			GENMASK(15, 12)
 #define HSTX_CKLP_EN			BIT(16)
 
 #define DSI_PSCTRL		0x1c
-#define DSI_PS_WC			0x3fff
-#define DSI_PS_SEL			(3 << 16)
+#define DSI_PS_WC			GENMASK(13, 0)
+#define DSI_PS_SEL			GENMASK(17, 16)
 #define PACKED_PS_16BIT_RGB565		(0 << 16)
 #define LOOSELY_PS_18BIT_RGB666		(1 << 16)
 #define PACKED_PS_18BIT_RGB666		(2 << 16)
@@ -109,26 +109,26 @@
 #define LD0_WAKEUP_EN			BIT(2)
 
 #define DSI_PHY_TIMECON0	0x110
-#define LPX				(0xff << 0)
-#define HS_PREP				(0xff << 8)
-#define HS_ZERO				(0xff << 16)
-#define HS_TRAIL			(0xff << 24)
+#define LPX				GENMASK(7, 0)
+#define HS_PREP				GENMASK(15, 8)
+#define HS_ZERO				GENMASK(23, 16)
+#define HS_TRAIL			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON1	0x114
-#define TA_GO				(0xff << 0)
-#define TA_SURE				(0xff << 8)
-#define TA_GET				(0xff << 16)
-#define DA_HS_EXIT			(0xff << 24)
+#define TA_GO				GENMASK(7, 0)
+#define TA_SURE				GENMASK(15, 8)
+#define TA_GET				GENMASK(23, 16)
+#define DA_HS_EXIT			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON2	0x118
-#define CONT_DET			(0xff << 0)
-#define CLK_ZERO			(0xff << 16)
-#define CLK_TRAIL			(0xff << 24)
+#define CONT_DET			GENMASK(7, 0)
+#define CLK_ZERO			GENMASK(23, 16)
+#define CLK_TRAIL			GENMASK(31, 24)
 
 #define DSI_PHY_TIMECON3	0x11c
-#define CLK_HS_PREP			(0xff << 0)
-#define CLK_HS_POST			(0xff << 8)
-#define CLK_HS_EXIT			(0xff << 16)
+#define CLK_HS_PREP			GENMASK(7, 0)
+#define CLK_HS_POST			GENMASK(15, 8)
+#define CLK_HS_EXIT			GENMASK(23, 16)
 
 #define DSI_VM_CMD_CON		0x130
 #define VM_CMD_EN			BIT(0)
@@ -138,13 +138,14 @@
 #define FORCE_COMMIT			BIT(0)
 #define BYPASS_SHADOW			BIT(1)
 
-#define CONFIG				(0xff << 0)
+/* CMDQ related bits */
+#define CONFIG				GENMASK(7, 0)
 #define SHORT_PACKET			0
 #define LONG_PACKET			2
 #define BTA				BIT(2)
-#define DATA_ID				(0xff << 8)
-#define DATA_0				(0xff << 16)
-#define DATA_1				(0xff << 24)
+#define DATA_ID				GENMASK(15, 8)
+#define DATA_0				GENMASK(23, 16)
+#define DATA_1				GENMASK(31, 24)
 
 #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
 
-- 
2.43.0


