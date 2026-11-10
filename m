Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630E460A262A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l2m3vjKY;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=lOscPn5h
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FSFelfKBI5tEx0FyiHC8xy7LPF/tCXOOERQd7UO+AKw=; b=l2m3vjKY37kv1VGvm2XDCIkfN7
	LanWM/cDscPZAnn3WLxBXJglWlhCxJgFWKe5b6pWjvoRUp+YcF1XnbWwr6mLaRkrSbvNZT89ABZiY
	VsM9tfFmVSvlBBtDemJhNpZ30Xe9UwUims7u01c1e8VnUYE8SHL96Vx97xoAaK8bQZOppJGF0QDbL
	WAdD/lPe5afOpcty44O6Oda7sDPzkruQ9qFhekbf64yaalloNXoL4h7W+4t8WpTYjedUEFTNUjONA
	WRrzcTTSjEO+keReB8kMvgC/moNc9RNwIOpkF4j+OCeInxr43xrnixLmuhlsrdnPk5o/6WQnpTdh5
	YK1zhRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkML-00000003gf0-3xXC;
	Tue, 10 Nov 2026 11:49:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMH-00000003gaf-0lha;
	Tue, 10 Nov 2026 11:49:51 +0000
X-UUID: d274cd64dcfc11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=FSFelfKBI5tEx0FyiHC8xy7LPF/tCXOOERQd7UO+AKw=;
	b=lOscPn5hlljahIZb7u+MvJm2pT1iq18zHrlPjP4FdSppa6x+flXQkAkWIQhAnq2AsBrFPOuZg4BmEpna/3j1QbGDtjMjZ+USdsLHKOibzXKCejG9IAc47VL29D9QkGxysZkZCLz4Ag/cv6qxiGtFdwdvzmBR624zrPVGW622F30=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1d3e12f6-03ee-41cc-9542-ed0bd5da6cf2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:89428d8d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d274cd64dcfc11f1acbe4559397dec65-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1531309937; Tue, 10 Nov 2026 04:49:44 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:42 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:41 +0800
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
Subject: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c and internalize interrupt work
Date: Tue, 10 Nov 2026 19:48:50 +0800
Message-ID: <20261110114925.722014-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034949_242876_81CB8588 
X-CRM114-Status: GOOD (  20.83  )
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

In preparation for modularizing PCIe NHI and ICM support as a separate
driver, clean up internal helper functions so that they do not need to
be exported:

nhi_mailbox_cmd() and nhi_mailbox_mode() are only used by the Intel
firmware Connection Manager (icm.c) to exchange mailbox commands with
firmware running on Intel PCIe NHIs. The Thunderbolt core framework,
software connection manager, and non-PCIe platform controllers do
not use this mailbox interface. Move both functions into icm.c and
mark them static.

nhi_interrupt_work was previously initialized in pci.c within
nhi_pci_init_msi(), requiring it to be visible across files. Move
INIT_WORK(&nhi->interrupt_work, ...) into tb_nhi_probe() so that
the workqueue item is initialized by the NHI core and
nhi_interrupt_work() can be marked static in nhi.c.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
new patch
---
 drivers/thunderbolt/icm.c | 59 ++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi.c | 64 ++-------------------------------------
 drivers/thunderbolt/nhi.h |  3 --
 drivers/thunderbolt/pci.c |  2 --
 4 files changed, 62 insertions(+), 66 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index a295a5e6cc9c..736f551cd567 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -45,6 +45,7 @@
 #define ICM_RETRIES			3
 #define ICM_APPROVE_TIMEOUT		10000	/* ms */
 #define ICM_MAX_LINK			4
+#define ICM_MAILBOX_TIMEOUT		500 /* ms */
 
 static bool start_icm;
 module_param(start_icm, bool, 0444);
@@ -269,6 +270,64 @@ static int pcie2cio_write(struct icm *icm, enum tb_cfg_space cs,
 	return pci2cio_wait_completion(icm, 5000);
 }
 
+/**
+ * nhi_mailbox_cmd() - Send a command through NHI mailbox
+ * @nhi: Pointer to the NHI structure
+ * @cmd: Command to send
+ * @data: Data to be send with the command
+ *
+ * Sends mailbox command to the firmware running on NHI.
+ *
+ * Return: %0 on success, negative errno otherwise.
+ */
+static int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
+{
+	ktime_t timeout;
+	u32 val;
+
+	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
+
+	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
+	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
+	val |= REG_INMAIL_OP_REQUEST | cmd;
+	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
+
+	timeout = ktime_add_ms(ktime_get(), ICM_MAILBOX_TIMEOUT);
+	do {
+		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
+		if (!(val & REG_INMAIL_OP_REQUEST))
+			break;
+		usleep_range(10, 20);
+	} while (ktime_before(ktime_get(), timeout));
+
+	if (val & REG_INMAIL_OP_REQUEST)
+		return -ETIMEDOUT;
+	if (val & REG_INMAIL_ERROR)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * nhi_mailbox_mode() - Return current firmware operation mode
+ * @nhi: Pointer to the NHI structure
+ *
+ * The function reads current firmware operation mode using NHI mailbox
+ * registers and returns it to the caller.
+ *
+ * Return: &enum nhi_fw_mode.
+ */
+static enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
+{
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
+	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
+	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
+
+	return (enum nhi_fw_mode)val;
+}
+
 static bool icm_match(const struct tb_cfg_request *req,
 		      const struct ctl_pkg *pkg)
 {
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index c574c336f25b..1e3a58636d3d 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -35,8 +35,6 @@
  */
 #define RING_E2E_RESERVED_HOPID	RING_FIRST_USABLE_HOPID
 
-#define NHI_MAILBOX_TIMEOUT	500 /* ms */
-
 static bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
@@ -964,65 +962,7 @@ int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec)
 }
 EXPORT_SYMBOL_GPL(tb_ring_throttling);
 
-/**
- * nhi_mailbox_cmd() - Send a command through NHI mailbox
- * @nhi: Pointer to the NHI structure
- * @cmd: Command to send
- * @data: Data to be send with the command
- *
- * Sends mailbox command to the firmware running on NHI.
- *
- * Return: %0 on success, negative errno otherwise.
- */
-int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
-{
-	ktime_t timeout;
-	u32 val;
-
-	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
-
-	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
-	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
-	val |= REG_INMAIL_OP_REQUEST | cmd;
-	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
-
-	timeout = ktime_add_ms(ktime_get(), NHI_MAILBOX_TIMEOUT);
-	do {
-		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
-		if (!(val & REG_INMAIL_OP_REQUEST))
-			break;
-		usleep_range(10, 20);
-	} while (ktime_before(ktime_get(), timeout));
-
-	if (val & REG_INMAIL_OP_REQUEST)
-		return -ETIMEDOUT;
-	if (val & REG_INMAIL_ERROR)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * nhi_mailbox_mode() - Return current firmware operation mode
- * @nhi: Pointer to the NHI structure
- *
- * The function reads current firmware operation mode using NHI mailbox
- * registers and returns it to the caller.
- *
- * Return: &enum nhi_fw_mode.
- */
-enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
-{
-	u32 val;
-
-	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
-	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
-	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
-
-	return (enum nhi_fw_mode)val;
-}
-
-void nhi_interrupt_work(struct work_struct *work)
+static void nhi_interrupt_work(struct work_struct *work)
 {
 	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
 	int value = 0; /* Suppress uninitialized usage warning. */
@@ -1331,6 +1271,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
 		return -ENOMEM;
 
+    INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
+
 	nhi_reset(nhi);
 
 	/* In case someone left them on. */
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index a36c62c49a5c..3dd6ace6150d 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -27,11 +27,8 @@ enum nhi_mailbox_cmd {
 	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
 };
 
-int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
-enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
 void nhi_enable_int_throttling(struct tb_nhi *nhi);
 void nhi_disable_interrupts(struct tb_nhi *nhi);
-void nhi_interrupt_work(struct work_struct *work);
 irqreturn_t tb_nhi_isr(int irq, void *data);
 irqreturn_t tb_ring_msix(int irq, void *data);
 int tb_nhi_probe(struct tb_nhi *nhi);
diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
index 2f0abf4d27a3..275389903090 100644
--- a/drivers/thunderbolt/pci.c
+++ b/drivers/thunderbolt/pci.c
@@ -206,8 +206,6 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
 		if (nvec < 0)
 			return nvec;
 
-		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
-
 		irq = pci_irq_vector(pdev, 0);
 		if (irq < 0)
 			return irq;
-- 
2.45.2


