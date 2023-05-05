Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464B3C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOrQr6QEU2G2ijP/jN+RGrACDFtVsb8Zfg2HjNsvpcg=; b=Mc5PZH0DIIuCU4ujpD4iXioy+C
	FOodQeAwUjEt4VIytUYK5RmqDsqoxJwO9g0E3iIIGilhV0RWFbl0uwqucRR02hzkH/C6NvZRQvQlg
	/2kuZuWHzPUhUGYBj42NUfHdsMM0YQTgzN9i9F2dYVvYs1TSGjFkiNp+ypySeLto/FFJSFPR1dmPg
	HjtCei18nHGWcfXNmIN7T7JgTSSbYI/FWEZNjImX+H7Nzz0NlIckBZ9ZT6rs2j1sDbbjKUK94yMEE
	VWaFZUSs91CVV4zVei+biYr3UOFO9q9xKRHDquqYzJhd4/GdwQpAsNyg6oFSSNu2274ANuRrsNxsk
	0mLCu+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puu8c-00Aok6-1U;
	Fri, 05 May 2023 12:02:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puu8W-00Aogk-1G;
	Fri, 05 May 2023 12:02:10 +0000
X-UUID: 9f27ce62eb3c11ed83ed1395ce914268-20230505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pOrQr6QEU2G2ijP/jN+RGrACDFtVsb8Zfg2HjNsvpcg=;
	b=i7a70rXal2xh7rK2iSdikGwZUblSLdQbYuQ+POW3lyhW/bh7Z0DYstjtDn987TpuUhc3Z4zqeUAyfdYILV2GO7rhgHO7hitr+F7TmneXNiTvCm/Y+Z9nM051pbMZkvp6CFVkaHhfbvsrIg7JvJSLqp4P2jQz4fxrYLsOPSZDrpU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:dcc21b46-4d68-4f53-a5fa-f2d356070248,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:697ab71,CLOUDID:f5a1eabf-e32c-4c97-918d-fbb3fc224d4e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 9f27ce62eb3c11ed83ed1395ce914268-20230505
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <runyang.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340519475; Fri, 05 May 2023 05:01:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 5 May 2023 20:01:15 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 5 May 2023 20:01:14 +0800
From: Runyang Chen <runyang.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp
 Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, Runyang Chen <runyang.chen@mediatek.com>,
	Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
Subject: [PATCH 1/2] dt-bindings: reset: mt8188: add thermal reset control bit
Date: Fri, 5 May 2023 20:01:07 +0800
Message-ID: <20230505120108.26603-2-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20230505120108.26603-1-runyang.chen@mediatek.com>
References: <20230505120108.26603-1-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_050208_617780_63E3906F 
X-CRM114-Status: UNSURE (   9.49  )
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

To support reset of infra_ao, add the index of infra_ao reset of thermal
for MT8188.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.corp-partner.google.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 377cdfda82a9..ba9a5e9b8899 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -33,4 +33,9 @@
 
 #define MT8188_TOPRGU_SW_RST_NUM               24
 
+/* INFRA resets */
+#define MT8188_INFRA_RST1_THERMAL_MCU_RST          0
+#define MT8188_INFRA_RST1_THERMAL_CTRL_RST         1
+#define MT8188_INFRA_RST3_PTP_CTRL_RST             2
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.18.0


