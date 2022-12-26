Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB63C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehDXbWE7c2/1x4Hvq0je5a3soIAyc70ylWW5qGoa4JM=; b=jKEGwBc26KI9AFToQSjtpA9MIj
	y6O0Pq+f2NhPqjCb/iUi0PFaWhPhcpCh2I7AIIYzcsZX+Pw92vnUS2DDwAHWKZxB0OqgjGmhavbM6
	xnT6ViXdY/071O8xpnWZVqN+3wMwpyFGi7zkSWZIgo0LbRoDuDWXS0UOu0erccnxCHGJmvDmYYN6G
	LMg35FeSb70WV/YX9lAu2VpuHjvSvLZjG6YdzDnzVsmo5EtCBLEuOnqmBRswUYkoUhIaDx6khgLtL
	sx7mTY8Pp+60BYmEmlBtSsCv/5EPGyVgYOSoNk0Z/4JBYhVQ2R9FOonoB1jNbwprV1MgHhGpzko4g
	Bpe0SrYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k10-002uEL-4n; Mon, 26 Dec 2022 09:43:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k0Y-002tze-Fb; Mon, 26 Dec 2022 09:43:03 +0000
X-UUID: 9dd78d62c5734b73b6cfb27e859cff08-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ehDXbWE7c2/1x4Hvq0je5a3soIAyc70ylWW5qGoa4JM=;
	b=uqgBqnjJhx/EplZXO0VOkT2mnlyC7a8/FhVhhy0tZcX4w1jS+xxWR+2Vb48+97cob8qegzs3gu+M/ZKaPUFZqunu7u8M4rD+tOIhZ8mD2GpbdQc1iDtRMK9JDfOwGqmfGuL/zYLHxO0O2s0x2Hxb7Km4v2N/+DHZ6Sf5woWA2b8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:dd01228c-0064-4b16-8a6e-04d945c93fc4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:fab7f8f3-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9dd78d62c5734b73b6cfb27e859cff08-20221226
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 320365704; Mon, 26 Dec 2022 02:42:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Dec 2022 17:42:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:49 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Ricardo Ribalda
	<ribalda@chromium.org>
Subject: [PATCH v1 01/13] soc: mediatek: mtk-svs: enable the IRQ later
Date: Mon, 26 Dec 2022 17:42:36 +0800
Message-ID: <20221226094248.4506-2-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014258_592117_493F1378 
X-CRM114-Status: GOOD (  12.97  )
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

From: Ricardo Ribalda <ribalda@chromium.org>

If the system does not come from reset (like when is booted via
kexec(), the peripheral might trigger an IRQ before the data structures
are initialized.

Fixes:

[    0.227710] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000f08
[    0.227913] Call trace:
[    0.227918]  svs_isr+0x8c/0x538

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..91e06f43969d 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2379,20 +2379,6 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_free_resource;
 	}
 
-	svsp_irq = platform_get_irq(pdev, 0);
-	if (svsp_irq < 0) {
-		ret = svsp_irq;
-		goto svs_probe_free_resource;
-	}
-
-	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
-					IRQF_ONESHOT, svsp->name, svsp);
-	if (ret) {
-		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
-			svsp_irq, ret);
-		goto svs_probe_free_resource;
-	}
-
 	svsp->main_clk = devm_clk_get(svsp->dev, "main");
 	if (IS_ERR(svsp->main_clk)) {
 		dev_err(svsp->dev, "failed to get clock: %ld\n",
@@ -2414,6 +2400,20 @@ static int svs_probe(struct platform_device *pdev)
 		goto svs_probe_clk_disable;
 	}
 
+	svsp_irq = platform_get_irq(pdev, 0);
+	if (svsp_irq < 0) {
+		ret = svsp_irq;
+		goto svs_probe_iounmap;
+	}
+
+	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
+					IRQF_ONESHOT, svsp->name, svsp);
+	if (ret) {
+		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
+			svsp_irq, ret);
+		goto svs_probe_iounmap;
+	}
+
 	ret = svs_start(svsp);
 	if (ret) {
 		dev_err(svsp->dev, "svs start fail: %d\n", ret);
-- 
2.18.0


