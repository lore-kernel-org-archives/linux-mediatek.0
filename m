Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CB460A2600
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UpUlz8q8;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=nLBzMlSx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NktuKJ+HdZZmK3ij5cZrSbeOH6QdZRjDKwfZol2aA0I=; b=UpUlz8q8fXW6kdjbn7as7V7AN8
	tP8f/XG9NEr2J8tDGQt+aJqkDDMjR94T2fG9VEU7CsS/CZau8JL8pEwSMRcng7D9eVn1DUB5xQF40
	fkKZ96bJhYhC1sA8q9MOfZ/8vWAxbuOH5hcUJAHORh+9JGAnELhF2r4Fh2jQe56vY2ij3grMfZ38r
	Rkxpjn0a20h2K4IoVF8DL1+dnAlQ6GsqA6hcF8j4SIwCpizVYXx/Env3gAS6jyr6reUAXS7B2dlY6
	8GFhFBygw6hwFa79Wp3dqmMNTagwoX9ALiwbfY80FjwaKh6y33VmEscJD6SCM96dw4Sab2jH8T6mx
	8eUZXeHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMO-00000003ggs-1Tpd;
	Tue, 10 Nov 2026 11:49:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMI-00000003gbR-0k3e;
	Tue, 10 Nov 2026 11:49:52 +0000
X-UUID: d1ed729cdcfc11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NktuKJ+HdZZmK3ij5cZrSbeOH6QdZRjDKwfZol2aA0I=;
	b=nLBzMlSx/j8y8TzH+fGW/DePFjhN2bCfb++YrLPIFToImnQUbYqr44jsWFMxh06qwOyHFRakvKfdSCZARPjuw7mmGiDkeE+OE0xpTkLJqQu6PdPkAaNQKkLfNz/EvPsZspzwYR/nJUhfirA75IJYB3Xx1KASuxUV4LBNzmZUVms=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:5ff55efb-480c-4eba-8d9b-44d4ba115c76,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:8fb91457-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d1ed729cdcfc11f1acbe4559397dec65-20261110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1832912157; Tue, 10 Nov 2026 04:49:43 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:41 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:40 +0800
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
Subject: [PATCH v2 1/7] thunderbolt: Prefix NHI core functions with tb_ and tb_ring_
Date: Tue, 10 Nov 2026 19:48:49 +0800
Message-ID: <20261110114925.722014-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034950_234859_B6F4EBA7 
X-CRM114-Status: GOOD (  19.12  )
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

In preparation for modularizing PCIe NHI support and allowing PCIe
and platform NHI drivers to be built as separate modules atop the
Thunderbolt core framework, several NHI functions and structures will
need to be exported.

Currently, several of these functions lack standard subsystem prefixes,
risking namespace pollution or collisions across the flat kernel symbol
namespace:

- ring_msix() lacks any subsystem prefix and diverges from all other
  exported ring functions in the driver, which use the "tb_ring_" prefix.
- nhi_probe(), nhi_shutdown(), and nhi_pm_ops lack the standard "tb_"
  prefix used across the Thunderbolt public interface (such as struct
  tb_nhi and struct tb_nhi_ops).
- nhi_msi() is named after PCI MSI, even though the ISR simply schedules
  the interrupt work and can serve as a generic ISR for non-PCIe platform
  controllers as well.

Rename these functions and symbols to conform to Thunderbolt subsystem
naming conventions before exporting them:

- ring_msix       -> tb_ring_msix
- nhi_msi         -> tb_nhi_isr
- nhi_probe       -> tb_nhi_probe
- nhi_shutdown    -> tb_nhi_shutdown
- nhi_pm_ops      -> tb_nhi_pm_ops

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
new patch
---
 drivers/thunderbolt/nhi.c | 14 +++++++-------
 drivers/thunderbolt/nhi.h | 10 +++++-----
 drivers/thunderbolt/pci.c | 10 +++++-----
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index e99a3fcc4a29..c574c336f25b 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -535,7 +535,7 @@ static void ring_clear_msix(const struct tb_ring *ring)
 			  4 * (ring->nhi->hop_count / 32));
 }
 
-irqreturn_t ring_msix(int irq, void *data)
+irqreturn_t tb_ring_msix(int irq, void *data)
 {
 	struct tb_ring *ring = data;
 
@@ -935,7 +935,7 @@ void tb_ring_free(struct tb_ring *ring)
 
 	/*
 	 * ring->work can no longer be scheduled (it is scheduled only
-	 * by nhi_interrupt_work, ring_stop and ring_msix). Wait for it
+	 * by nhi_interrupt_work, ring_stop and tb_ring_msix). Wait for it
 	 * to finish before freeing the ring.
 	 */
 	flush_work(&ring->work);
@@ -1072,7 +1072,7 @@ void nhi_interrupt_work(struct work_struct *work)
 	spin_unlock_irq(&nhi->lock);
 }
 
-irqreturn_t nhi_msi(int irq, void *data)
+irqreturn_t tb_nhi_isr(int irq, void *data)
 {
 	struct tb_nhi *nhi = data;
 	schedule_work(&nhi->interrupt_work);
@@ -1216,7 +1216,7 @@ static int nhi_runtime_resume(struct device *dev)
 	return tb_domain_runtime_resume(tb);
 }
 
-void nhi_shutdown(struct tb_nhi *nhi)
+void tb_nhi_shutdown(struct tb_nhi *nhi)
 {
 	int i;
 
@@ -1306,7 +1306,7 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 	return tb;
 }
 
-int nhi_probe(struct tb_nhi *nhi)
+int tb_nhi_probe(struct tb_nhi *nhi)
 {
 	struct device *dev = nhi->dev;
 	struct tb *tb;
@@ -1371,7 +1371,7 @@ int nhi_probe(struct tb_nhi *nhi)
 		 */
 		tb_domain_put(tb);
 		wait_for_completion(&nhi->domain_released);
-		nhi_shutdown(nhi);
+		tb_nhi_shutdown(nhi);
 		return dev_err_probe(dev, res, "failed to add domain\n");
 	}
 	dev_set_drvdata(dev, tb);
@@ -1391,7 +1391,7 @@ int nhi_probe(struct tb_nhi *nhi)
  * the tunnels asap. A corresponding pci quirk blocks the downstream bridges
  * resume_noirq until we are done.
  */
-const struct dev_pm_ops nhi_pm_ops = {
+const struct dev_pm_ops tb_nhi_pm_ops = {
 	.suspend_noirq = nhi_suspend_noirq,
 	.resume_noirq = nhi_resume_noirq,
 	.freeze_noirq = nhi_freeze_noirq,  /*
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 88af9ab9fde7..a36c62c49a5c 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -32,11 +32,11 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
 void nhi_interrupt_work(struct work_struct *work);
-irqreturn_t nhi_msi(int irq, void *data);
-irqreturn_t ring_msix(int irq, void *data);
-int nhi_probe(struct tb_nhi *nhi);
-void nhi_shutdown(struct tb_nhi *nhi);
-extern const struct dev_pm_ops nhi_pm_ops;
+irqreturn_t tb_nhi_isr(int irq, void *data);
+irqreturn_t tb_ring_msix(int irq, void *data);
+int tb_nhi_probe(struct tb_nhi *nhi);
+void tb_nhi_shutdown(struct tb_nhi *nhi);
+extern const struct dev_pm_ops tb_nhi_pm_ops;
 
 /**
  * struct tb_nhi_ops - NHI specific optional operations
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 4408229d8ac7..2f0abf4d27a3 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -212,7 +212,7 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		if (irq < 0)
 			return irq;
 
-		res = devm_request_irq(&pdev->dev, irq, nhi_msi,
+		res = devm_request_irq(&pdev->dev, irq, tb_nhi_isr,
 				       IRQF_NO_SUSPEND, "thunderbolt", nhi);
 		if (res)
 			return res;
@@ -281,7 +281,7 @@ static int nhi_pci_ring_request_msix(struct tb_ring *ring, bool no_suspend)
 	ring->irq = ret;
 
 	irqflags = no_suspend ? IRQF_NO_SUSPEND : 0;
-	ret = request_irq(ring->irq, ring_msix, irqflags, "thunderbolt", ring);
+	ret = request_irq(ring->irq, tb_ring_msix, irqflags, "thunderbolt", ring);
 	if (ret)
 		goto err_ida_remove;
 
@@ -588,7 +588,7 @@ static int nhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_master(pdev);
 
-	return nhi_probe(&nhi_pci->nhi);
+	return tb_nhi_probe(&nhi_pci->nhi);
 }
 
 static void nhi_pci_do_remove(struct pci_dev *pdev, bool reset)
@@ -610,7 +610,7 @@ static void nhi_pci_do_remove(struct pci_dev *pdev, bool reset)
 
 	tb_domain_remove(tb);
 	wait_for_completion(&nhi->domain_released);
-	nhi_shutdown(nhi);
+	tb_nhi_shutdown(nhi);
 }
 
 static void nhi_pci_remove(struct pci_dev *pdev)
@@ -724,7 +724,7 @@ static struct pci_driver nhi_driver = {
 	.probe = nhi_pci_probe,
 	.remove = nhi_pci_remove,
 	.shutdown = nhi_pci_shutdown,
-	.driver.pm = &nhi_pm_ops,
+	.driver.pm = &tb_nhi_pm_ops,
 };
 
 static int __init nhi_init(void)
-- 
2.45.2


