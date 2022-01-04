Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96992C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gNZZ601fY+z8XfefyICBvtp6BqM7IL/PZZOeCcHLi90=; b=Lsptq44lHhC9Su
	m57EWlACxHMY7/I4KWIm/S7Q9G2CxU4TOP2UEifUdxFmPyy5B1Fa/bF9wdrAP6rvDS58sU4bEnJWP
	ee5gQ3HkiCJzYmLdAKu5l4vOOm02PY7UjBzTi9UUvqKlESpofuMSgtDCJ7XO/NDd1tbBOcMkEPxod
	pHrDb337zGtowNHkp9bI/DxQJ1rrBmnVdiqVTIV9uGheXpyENIgdHcCKjzw42Wxvd2NmOEE/wQPZ4
	I6+puj/dlVANr2ytNhXgVFGQHjSfBkLDQPq9Nae998tX8vlIT9qMimmKj1ir6EPq2AFLSgzlSdGJY
	RD7G1kYH5jq9U46cqWnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4i2W-00BHwF-D5; Tue, 04 Jan 2022 11:31:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4i2L-00BHsH-0X; Tue, 04 Jan 2022 11:31:30 +0000
X-UUID: c82733a793c14eebbfde8a512cbbda6c-20220104
X-UUID: c82733a793c14eebbfde8a512cbbda6c-20220104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1619298527; Tue, 04 Jan 2022 04:31:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 03:31:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 19:31:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 4 Jan 2022 19:31:18 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, allen-kh.cheng
 <allen-kh.cheng@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 2/2] remoteproc: mediatek: Support mt8186 scp
Date: Tue, 4 Jan 2022 19:31:04 +0800
Message-ID: <20220104113104.27136-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220104113104.27136-1-allen-kh.cheng@mediatek.com>
References: <20220104113104.27136-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_033129_083083_E56EDFA2 
X-CRM114-Status: GOOD (  14.26  )
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

Add SCP support for mt8186

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/remoteproc/mtk_common.h |  3 +++
 drivers/remoteproc/mtk_scp.c    | 35 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 5ff3867c72f3..71ce4977cb0b 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -32,6 +32,9 @@
 #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
 #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
 
+#define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
+#define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
+
 #define MT8192_L2TCM_SRAM_PD_0		0x10C0
 #define MT8192_L2TCM_SRAM_PD_1		0x10C4
 #define MT8192_L2TCM_SRAM_PD_2		0x10C8
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 36e48cf58ed6..ef355eafeb9c 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -383,6 +383,27 @@ static void mt8192_power_off_sram(void __iomem *addr)
 		writel(GENMASK(i, 0), addr);
 }
 
+static int mt8186_scp_before_load(struct mtk_scp *scp)
+{
+        /* Clear SCP to host interrupt */
+        writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
+
+        /* Reset clocks before loading FW */
+        writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
+        writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
+
+        /* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
+        mt8192_power_on_sram(scp->reg_base + MT8183_SCP_SRAM_PDN);
+
+        /* Initialize TCM before loading FW. */
+        writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
+        writel(0x0, scp->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
+        writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
+        writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
+
+        return 0;
+}
+
 static int mt8192_scp_before_load(struct mtk_scp *scp)
 {
 	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
@@ -887,6 +908,19 @@ static const struct mtk_scp_of_data mt8183_of_data = {
 	.ipi_buf_offset = 0x7bdb0,
 };
 
+static const struct mtk_scp_of_data mt8186_of_data = {
+	.scp_clk_get = mt8195_scp_clk_get,
+	.scp_before_load = mt8186_scp_before_load,
+	.scp_irq_handler = mt8183_scp_irq_handler,
+	.scp_reset_assert = mt8183_scp_reset_assert,
+	.scp_reset_deassert = mt8183_scp_reset_deassert,
+	.scp_stop = mt8183_scp_stop,
+	.scp_da_to_va = mt8183_scp_da_to_va,
+	.host_to_scp_reg = MT8183_HOST_TO_SCP,
+	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
+	.ipi_buf_offset = 0x7bdb0,
+};
+
 static const struct mtk_scp_of_data mt8192_of_data = {
 	.scp_clk_get = mt8192_scp_clk_get,
 	.scp_before_load = mt8192_scp_before_load,
@@ -913,6 +947,7 @@ static const struct mtk_scp_of_data mt8195_of_data = {
 
 static const struct of_device_id mtk_scp_of_match[] = {
 	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
+	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
 	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
 	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
 	{},
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
