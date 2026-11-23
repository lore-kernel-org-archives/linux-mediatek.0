Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A8D60A2600
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HmUxY794;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Vqa/EUu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sF4vk+grR7V//Z0ZfPvmudwMDno5A4NYEety1KK7Z/4=; b=HmUxY794OXC6SIsh4d46AHsSt3
	+gN9CiVyarobVzXY9bk/B6U6Sq4yn7bqQ3Ic92c0ttEMOlwsa6QXOH/KoHEGhhOnybSdHTkxEPYZu
	g3RuBvcL/jBELc7h5EPaRsUYJG22+SSLu/jIai+zPNIFYQmpkEBh5dKXocb5SOJ2pEinFtczR/c0n
	Isk46zQTtn21jEVLR/YjmHTZjSUygJ/nOWFM2g93WJV1oCvrWmzjXr6FAv9p4PpYkEgEQvvaeRRyy
	Hxb13DqlQBiL4tYMVm8dGueQtDdpMbGolxUkUNJKD1gJrLh8hHZtYyCCbA5D7fayvylkPruaSvDAw
	+gFPkn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMk-00000003CZx-3aea;
	Mon, 23 Nov 2026 11:37:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMe-00000003CUl-2zri;
	Mon, 23 Nov 2026 11:37:42 +0000
X-UUID: 48a64be0e73211f1afed4741b24580c9-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=sF4vk+grR7V//Z0ZfPvmudwMDno5A4NYEety1KK7Z/4=;
	b=Vqa/EUu/W0WCMXlJyHBBTQh6vRyRh3jnKDFBZGnzr5bXQYcqNfm7aHD8PH74wTGHFfTWaxQo0kTqsN9geD1nlLHHKJ+xPh+RYATu+b/YFsQnGUv/5+ULwsV5zJYIuw/xhFSNgooCBbRXmCPDIHppSHibuMOs9guhsFLDK0O5zZE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ea2a5ba6-c2f7-4a61-80f7-826141aaaa90,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:f95a3c31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48a64be0e73211f1afed4741b24580c9-20261123
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1488470955; Mon, 23 Nov 2026 04:37:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:36 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:36 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v3 4/8] thunderbolt: Fix error handling and unwind paths in tb_nhi_probe()
Date: Mon, 23 Nov 2026 19:36:51 +0800
Message-ID: <20261123113705.2297329-5-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033740_794837_E4C981E8 
X-CRM114-Status: GOOD (  13.94  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently, tb_nhi_probe() has several issues in its error unwind
paths:

1. Incomplete cleanup on failure:
If an error occurs after interrupts are initialized, such as in
dma_set_mask_and_coherent(), tb_nhi_ops.init(), or nhi_select_cm(),
tb_nhi_probe() immediately returns without calling tb_nhi_shutdown().
This leaves resources uncleaned:
- Hardware interrupt registers remain unmasked.
- Any scheduled nhi->interrupt_work is not flushed before the driver
  core frees the tb_nhi structure, risking a use-after-free.
- For Ice Lake PCIe controllers, icl_nhi_ops.init powers on the
  controller, but icl_nhi_shutdown() is never called to turn
  force-power back off, leaking power.

2. Fragile initialization order:
dma_set_mask_and_coherent() and spin_lock_init(&nhi->lock) are called
after tb_nhi_ops.init_interrupts(). If a hardware interrupt fires
immediately upon registration, tb_nhi_isr() schedules interrupt_work,
which acquires &nhi->lock before it is initialized. Furthermore, if
DMA mask configuration fails, interrupts have already been allocated
and must be torn down.

Improve the probe sequence and error handling:
- Move dma_set_mask_and_coherent() and spin_lock_init() before
  tb_nhi_ops.init_interrupts(). If DMA mask setup fails, exit early
  without needing any interrupt teardown.
- Consolidate post-interrupt error paths by tb_nhi_shutdown(nhi).

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
new patch
---
 drivers/thunderbolt/nhi.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 69783e81dd3b..f687b37aac91 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -1256,6 +1256,10 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->ops->init_interrupts)
 		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
 
+	res = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
+	if (res)
+		return dev_err_probe(dev, res, "failed to set DMA mask\n");
+
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
@@ -1269,6 +1273,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
 		return -ENOMEM;
 
+	spin_lock_init(&nhi->lock);
+
 	INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
 
 	nhi_reset(nhi);
@@ -1280,24 +1286,22 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	if (res)
 		return dev_err_probe(dev, res, "cannot enable interrupts, aborting\n");
 
-	spin_lock_init(&nhi->lock);
-
-	res = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
-	if (res)
-		return dev_err_probe(dev, res, "failed to set DMA mask\n");
-
 	if (nhi->ops->init) {
 		res = nhi->ops->init(nhi);
-		if (res)
-			return dev_err_probe(dev, res, "NHI specific init failed\n");
+		if (res) {
+			dev_err_probe(dev, res, "NHI specific init failed\n");
+			goto err;
+		}
 	}
 
 	init_completion(&nhi->domain_released);
 
 	tb = nhi_select_cm(nhi);
-	if (!tb)
-		return dev_err_probe(dev, -ENODEV,
-			"failed to determine connection manager, aborting\n");
+	if (!tb) {
+		res = dev_err_probe(dev, -ENODEV,
+				    "failed to determine connection manager, aborting\n");
+		goto err;
+	}
 
 	dev_dbg(dev, "NHI initialized, starting thunderbolt\n");
 
@@ -1311,8 +1315,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 		 */
 		tb_domain_put(tb);
 		wait_for_completion(&nhi->domain_released);
-		tb_nhi_shutdown(nhi);
-		return dev_err_probe(dev, res, "failed to add domain\n");
+		dev_err_probe(dev, res, "failed to add domain\n");
+		goto err;
 	}
 	dev_set_drvdata(dev, tb);
 
@@ -1324,6 +1328,10 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
+
+err:
+	tb_nhi_shutdown(nhi);
+	return res;
 }
 EXPORT_SYMBOL_GPL(tb_nhi_probe);
 
-- 
2.45.2


