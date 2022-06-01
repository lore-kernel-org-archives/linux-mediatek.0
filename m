Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52608C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zaVXN4hy2PjakNDFURWx2UogKU/l72cddlhHzHOKxOE=; b=CcYEutECAVPO6F
	wvBX7wptbYRGU2750UKsMo6ktfuq7Lc1SxADG40A3T0VXeQmkYkvMg4Gm9sD7+unPNBk+j+D5OzII
	lMvGj9j175wSGDL+f/JXwsrqC/v5P7oDx+KzEJHOMosL4NCFf0F+6LJaqK6mh3HGgo0lP+lIabNdU
	YQ/g/DzJQET4hYTv78uw2ntK/eIs8NE/8uSwopvWK+E4SjxJQZn9bV7V16j25v8g75qeQp538UWs/
	bYZc1msOJuzSS4fHJo96uTL5lWu/LIgSbTXBsiKAfP4VnYql+V7PRgXV3j1Y4RjtzOIwhvgb4AcJj
	DObQpE2ifhSD//v37oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMah-00FdNJ-LF; Wed, 01 Jun 2022 11:32:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaD-00FdCS-HO; Wed, 01 Jun 2022 11:32:15 +0000
X-UUID: 0f13f2113551422fa5aa1822f25fe364-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:7423b860-d1ba-41fb-bd24-293973935159,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:3ed9268a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 0f13f2113551422fa5aa1822f25fe364-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 110150701; Wed, 01 Jun 2022 04:32:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 06/15] remoteproc: mediatek: Add SCP core 1 rproc operations
Date: Wed, 1 Jun 2022 19:21:52 +0800
Message-ID: <20220601112201.15510-7-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043213_610780_20E9A614 
X-CRM114-Status: GOOD (  16.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The firmware load and boot flow of SCP core 1 is almost the same as the
SCP core 0 except the accessed registers. Reuse the core 0 rproc operations
to load and boot SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h   |  5 +++++
 drivers/remoteproc/mtk_scp.c      | 15 ++++++++++-----
 drivers/remoteproc/mtk_scp_dual.c |  8 +++++++-
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 2eadb0e696a1..2e46be605687 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -163,4 +163,9 @@ void scp_memcpy_aligned(void __iomem *dst, const void *src, unsigned int len);
 void scp_ipi_lock(struct mtk_scp *scp, u32 id);
 void scp_ipi_unlock(struct mtk_scp *scp, u32 id);
 
+int scp_start(struct rproc *rproc);
+int scp_stop(struct rproc *rproc);
+int scp_load(struct rproc *rproc, const struct firmware *fw);
+void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+int scp_parse_fw(struct rproc *rproc, const struct firmware *fw);
 #endif
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 3510c6d0bbc8..7b9d12ec2d4f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -470,7 +470,7 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
 	return 0;
 }
 
-static int scp_load(struct rproc *rproc, const struct firmware *fw)
+int scp_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct mtk_scp *scp = rproc->priv;
 	struct device *dev = scp->dev;
@@ -495,8 +495,9 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(scp_load);
 
-static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
+int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
 	struct mtk_scp *scp = rproc->priv;
 	struct device *dev = scp->dev;
@@ -512,8 +513,9 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
 	clk_disable_unprepare(scp->clk);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(scp_parse_fw);
 
-static int scp_start(struct rproc *rproc)
+int scp_start(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	struct device *dev = scp->dev;
@@ -555,6 +557,7 @@ static int scp_start(struct rproc *rproc)
 	clk_disable_unprepare(scp->clk);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(scp_start);
 
 static void *mt8183_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 {
@@ -602,12 +605,13 @@ static void *mt8192_scp_da_to_va(struct mtk_scp *scp, u64 da, size_t len)
 	return NULL;
 }
 
-static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
+void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 
 	return scp->data->scp_da_to_va(scp, da, len);
 }
+EXPORT_SYMBOL_GPL(scp_da_to_va);
 
 static void mt8183_scp_stop(struct mtk_scp *scp)
 {
@@ -642,7 +646,7 @@ static void mt8195_scp_stop(struct mtk_scp *scp)
 	writel(0, scp->reg_base + MT8192_CORE0_WDT_CFG);
 }
 
-static int scp_stop(struct rproc *rproc)
+int scp_stop(struct rproc *rproc)
 {
 	struct mtk_scp *scp = (struct mtk_scp *)rproc->priv;
 	int ret;
@@ -659,6 +663,7 @@ static int scp_stop(struct rproc *rproc)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(scp_stop);
 
 static const struct rproc_ops scp_ops = {
 	.start		= scp_start,
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index 7bc08d26f208..e4ada5696bd7 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -12,7 +12,13 @@
 #include "mtk_common.h"
 #include "remoteproc_internal.h"
 
-static const struct rproc_ops scp_ops;
+static const struct rproc_ops scp_ops = {
+	.start		= scp_start,
+	.stop		= scp_stop,
+	.load		= scp_load,
+	.da_to_va	= scp_da_to_va,
+	.parse_fw	= scp_parse_fw,
+};
 
 static int scp_dual_probe(struct platform_device *pdev)
 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
