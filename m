Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E9FE88D7A
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 03:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4N63e/PlWX37AwLeUFPXlesB0FFlS8Vt1dWRmsCoFI=; b=BuBQpcMB6A3CLmuqQ11n5XLk6D
	aqoOdv/y3g9UmtycxvaIYry4Mgv+bMrvfu7xACvAk7cpOCmrbjszMB/Gt5pS3T6NMwn03K2Xz0/dm
	R3AurUTqEgeLzuc3pu0MdcxNIICl4p2ZyzuKOS7JFl6EH2XpOCMfen3iXcrO5egMDdE6pLHVDrwVq
	ZZTqMQfF38eeAvU1b1IB0P5BszXiFJ3RVDSIR4JAmfobn1HR4htz0OT0BAXsKmw/fHCTnQ+q/gU6+
	PEIY7LUW27zqyCnYmSN3ymsm/YQheFFhabXIilcZm5lYe2E1mhYVRrO+bJO1jYUYqG1ONWmS4Cxeh
	eH2h+xGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rx4-000000035fW-0gZR;
	Sat, 04 Apr 2026 03:45:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rx3-000000035fD-0B50
	for linux-mediatek@bombadil.infradead.org;
	Sat, 04 Apr 2026 03:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=O4N63e/PlWX37AwLeUFPXlesB0FFlS8Vt1dWRmsCoFI=; b=f4i+M57anYuFNYYqCCYgLzZSHs
	FRHfxLnkkCnQXw7bqJ+0mM6BBp1E27gP4NUTHOqz36QwaDx5XQCSk9ABASz607Qx+4G/WFSURPK6l
	+SZ0soBQ4LP4TyYNvAe5md5c/hx8lq6BxxtT0zCoONJ6l/k6C51UGd6DfR/zJnTlZs16greLX77Yk
	f4b8xW2H6VvSbk3QEJoeyvq2CA+HQz8WE/tocTsC9sgzzYlnk3gZBi9y9366XoKORbWwOglbIvJpi
	ujOv8uBupVXjgjbFhB6MvxUUP+BGJaCqYU1ydGbDi8SY3vipIxjlE76BWjAo/o5meQ7dht/pDCa0J
	JmYKmpGQ==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rwz-0000000FQuE-0FDH
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 03:45:35 +0000
X-UUID: ab33409a2fd811f1aa26b74ffac11d73-20260404
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:e74d3271-af13-49b7-b58a-3aa148f31397,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3bd7b7895dbc23d3ca19204f907c1050,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab33409a2fd811f1aa26b74ffac11d73-20260404
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 537749328; Sat, 04 Apr 2026 11:45:05 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	gch981213@gmail.com,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 1/4] spi: mtk-snfi: unregister ECC engine on probe failure and remove() callback
Date: Sat,  4 Apr 2026 11:44:58 +0800
Message-Id: <09ac1024a0f1626efaa47ceefc5cfb8ee5dd9418.1775273351.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1775273351.git.xiaopei01@kylinos.cn>
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_044533_695440_B9320DC4 
X-CRM114-Status: UNSURE (   7.86  )
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

mtk_snand_probe() registers the on-host NAND ECC engine, but teardown was
missing from both probe unwind and remove-time cleanup. Add a devm cleanup
action after successful registration so
nand_ecc_unregister_on_host_hw_engine() runs automatically on probe
failures and during device removal.

Fixes: 764f1b748164 ("spi: add driver for MTK SPI NAND Flash Interface")
Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-mtk-snfi.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 437edbd658aa..3973b5f9a9ca 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1303,6 +1303,13 @@ static const struct spi_controller_mem_caps mtk_snand_mem_caps = {
 	.ecc = true,
 };
 
+static void mtk_unregister_ecc_engine(void *data)
+{
+	struct nand_ecc_engine *eng = data;
+
+	nand_ecc_unregister_on_host_hw_engine(eng);
+}
+
 static irqreturn_t mtk_snand_irq(int irq, void *id)
 {
 	struct mtk_snand *snf = id;
@@ -1443,6 +1450,13 @@ static int mtk_snand_probe(struct platform_device *pdev)
 		goto release_ecc;
 	}
 
+	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
+				       &ms->ecc_eng);
+	if (ret) {
+		dev_err(&pdev->dev, ret, "failed to add ECC unregister action\n");
+		goto release_ecc;
+	}
+
 	ctlr->num_chipselect = 1;
 	ctlr->mem_ops = &mtk_snand_mem_ops;
 	ctlr->mem_caps = &mtk_snand_mem_caps;
-- 
2.25.1


