Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E8606A8BB
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 11:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=5Djxo5e/;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OevaAhq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gdJ+j079/tz92iQCRVcdVPV5S6mtELTh8SSjxTPVU+k=; b=5Djxo5e/l5M9Se6McOQPvOG4YW
	o6hcT+F77aCYzRt+oJaLOnW42rmMJEkgnTfdEyllcHcSzotPwPP/SD+OXfwuC3kgDuokVln622iCi
	tMSwJE0jX9v0dXcUs2UiNDISn8b4edu379RgzaytVy2HRGZFzPjG1G6PCOVdNswnHXwefrCc/KFUx
	EneQR4pntufS/f5ZcL4v4TSaA4ftnq2dNksbmRy0N0ydLkkY6PM2GjVIfz48BYKa7g57pR0hbcjC+
	RJnCswWXpRcvjP+z515DUG66j4Uao3VFLWM/7ESoqSIhdzEEq3O7YjtlCprf3/5w5TYqJ7DGo3nLn
	FWciuUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCN9-0000000FwS9-0ViY;
	Sat, 14 Nov 2026 11:56:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMj-0000000FvzW-3srH;
	Sat, 14 Nov 2026 11:56:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 777F545850;
	Sat, 14 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794657377;
	b=dcxpX3I8HDVcmCNwCPi8OM5kogKh+VqqdC0rX72ZJqgp4QPxNPVCVoSKkEBfrNdXmV35
	 lMkRE5qMePguwTZOdl5zkN9qXt5O8MW9R0cOwptZP94r6dzfJCkZoRgOfd89Qv6+XZKMG
	 hJMHQ8ZJgfU0Q1/OJE57nmAi8DYWllF6asI4bFhJ31ArMcfrJLPXUDTYivyC5TL6TGYvL
	 5LfikVwKB1QyQB6XBh0/ByQXjP8Unh87gPFWSmrP3Ml+pNKK6KUcnTPQjmLoDM8dq9WCL
	 vKQ4/hqyNdg8dGqwOeZxEftwKR2AkgauJ+aZCv3XciTUNX9PMBm9SAdaDS8YUAwnVfg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794657377;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gdJ+j079/tz92iQCRVcdVPV5S6mtELTh8SSjxTPVU+k=;
	b=lwMtL7dAcdOw/MigKHsXZZ6C9f8EG4VZoUw3mzHuPfkMsch4HvHpUUYdKvTtk6bOc88Z
	 0HlHvjBTKts4/1lD8lzX3lbKUUKMID98vYBl8Q1iJSislquhD/qclARWNbHN34bE65z9E
	 qSVN0udasirOI8J6nTcdAE0HQC3Vq3A2XVJ0uiHJvn3gN63+IJjnRo2fAu7is70DkGj6b
	 ZchvrtJBvUvXZQrmDzpalIOi6t5mn5wjoAeGnrzdfmH8S5QU9giWX8RaDmIo2C94Jibgo
	 is9+bIX9Y5MpmzD0UdBTaMvyU048vqgaHdVKtO1pFgdz5/Ur3bFyvIbsdZzV38AJkXA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D60381F000CA;
	Sat, 14 Nov 2026 11:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657377;
	bh=gdJ+j079/tz92iQCRVcdVPV5S6mtELTh8SSjxTPVU+k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OevaAhq0SbP/urN4dH7OYYCCFc7OE2RxMzeKBRfJJElrxU9P/Dsb0Kt39Qgo+aTXt
	 Te5NQtVFBFWJMcK/X3b+L/d/+nbKPRlOh8M4itk8/NWnOsAsxUHihrng8p8QbYqj3B
	 7nNsn8OGsNnEi+l42K4OgbFiYclV8E3lGOvd+GceEdEpVtXmAQg0BQuXFku7LJv71f
	 Tq3OjXv5ZhqukuTeiHVPNkNVnsFmiyyf6B3ehooNeSvhBFRdzXwDhndE6gTh0iEh2D
	 BXylfCc8UuMLB6Wh9/GxKkg+/Ksa0DFEDSmHw3UFceF1SFSMOXYTtcd/xpoJeABlPU
	 J7BGyEnNTJ/Kg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 654FA49D76;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
From: Larisa Grigore via B4 Relay <devnull+larisa.grigore.oss.nxp.com@kernel.org>
Date: Sat, 14 Nov 2026 12:55:37 +0100
Subject: [PATCH v11 05/14] ufs: core: Add common Hibern8 TX FSM polling
 helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-ufs-s32n7-v11-5-dc36e11919d5@oss.nxp.com>
References: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
In-Reply-To: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: devicetree@vger.kernel.org, Ajay Neeli <ajay.neeli@amd.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
 Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 NXP S32 Linux Team <s32@nxp.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, Stanley Jhu <stanleyjhu@google.com>, 
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
 linux-scsi@vger.kernel.org, Bean Huo <beanhuo@micron.com>, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Pedro Sousa <pedrom.sousa@synopsys.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, eballetb@redhat.com, 
 Peter Griffin <peter.griffin@linaro.org>, echanude@redhat.com, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, clizzi@redhat.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Can Guo <can.guo@oss.qualcomm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, aruizrui@redhat.com, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794657369; l=9301;
 i=larisa.grigore@oss.nxp.com; s=20261114; h=from:subject:message-id;
 bh=4qonTc/Um2UG9wkdhK2e+Hz460fp+LEpHAWSOS8XOD4=;
 b=6RA5Ig2W1R2Xt2fNnEQnGKMV4afJaVfCpLq/X42KY62ZN/pPdXAsdwSxoc/bJ3Ip0Anlumu1v
 I2gvjbGnA42BRoemA/Yi/F6o3JPRdjtB1Kzx0XvX1QxhzdOfN7a7i1W
X-Developer-Key: i=larisa.grigore@oss.nxp.com; a=ed25519;
 pk=Jpt52sb6ETKTtvWjUzhz5Sv5FjB9AEg9QKCcbpWFx3w=
X-Endpoint-Received: by B4 Relay for larisa.grigore@oss.nxp.com/20261114
 with auth_id=1522
X-Original-From: Larisa Grigore <larisa.grigore@oss.nxp.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: larisa.grigore@oss.nxp.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Larisa Grigore <larisa.grigore@oss.nxp.com>

Factor out the common logic used to poll TX_FSM_STATE until the TX lanes
enter Hibern8 into ufshcd_dme_check_tx_hibern8().

The HiSilicon and Qualcomm drivers currently implement similar checks
using the M-PHY TX_FSM_STATE attribute after PHY bring-up. Move this logic
to a common helper in ufshcd so it can be shared across host controller
drivers.

Switch the HiSilicon and Qualcomm drivers to use the new helper and drop
their local implementations. While at it, normalize the "TX lane failed to
reach Hibern8" error path to return -ETIMEDOUT instead of the raw
TX_FSM_STATE value (qcom) or -1 (hisi), so all callers get a proper errno.
A failed TX_FSM_STATE read that completes with a positive UIC result code
is reported as -EIO. This is an intentional, harmless change of the
returned error value; the pass/fail behaviour at the call sites is
unchanged.

This also prepares for reusing the same M-PHY specific Hibern8 check in
a subsequent commit.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/core/ufshcd.c   | 97 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-hisi.c | 48 +---------------------
 drivers/ufs/host/ufs-qcom.c | 42 +-------------------
 include/ufs/ufshcd.h        |  2 +
 4 files changed, 101 insertions(+), 88 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index a6817e4bd1f8..9b893e4ada19 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4494,6 +4494,103 @@ int ufshcd_dme_get_attr(struct ufs_hba *hba, u32 attr_sel,
 }
 EXPORT_SYMBOL_GPL(ufshcd_dme_get_attr);
 
+/**
+ * ufshcd_tx_lanes_in_hibern8 - Check TX_FSM_STATE of all TX lanes once
+ * @hba: host controller instance
+ * @num_lanes: number of TX lanes to check
+ *
+ * Read TX_FSM_STATE for every lane and verify it reached Hibern8.
+ *
+ * Return: 0 if all lanes are in Hibern8, -EAGAIN if at least one lane is
+ * not in Hibern8 yet, or a negative errno if reading TX_FSM_STATE failed.
+ */
+static int ufshcd_tx_lanes_in_hibern8(struct ufs_hba *hba,
+				      unsigned int num_lanes)
+{
+	u32 tx_fsm_val = 0;
+	unsigned int i;
+	int err;
+
+	for (i = 0; i < num_lanes; i++) {
+		err = ufshcd_dme_get(hba,
+				     UIC_ARG_MIB_SEL(TX_FSM_STATE,
+						     UIC_ARG_MPHY_TX_GEN_SEL_INDEX(i)),
+				     &tx_fsm_val);
+		if (err) {
+			dev_err(hba->dev,
+				"%s: unable to get TX_FSM_STATE for lane %u, err %d\n",
+				__func__, i, err);
+			/* A positive value is a UIC result code, not an errno. */
+			return err > 0 ? -EIO : err;
+		}
+
+		if (tx_fsm_val != UFS_TX_STATE_HIBERN8)
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
+/**
+ * ufshcd_dme_check_tx_hibern8 - Check if all TX lanes entered Hibern8 state
+ * @hba: host controller instance
+ * @num_lanes: number of TX lanes to check
+ * @timeout_ms: overall timeout in milliseconds shared by all lanes
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int ufshcd_dme_check_tx_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
+				unsigned int timeout_ms)
+{
+	unsigned int i;
+	int err, ret;
+	u32 state;
+
+	if (!num_lanes)
+		return -EINVAL;
+
+	/*
+	 * Poll every lane until ufshcd_tx_lanes_in_hibern8() stops returning
+	 * -EAGAIN, i.e. all lanes reached HIBERN8 (err == 0) or a real error
+	 * was hit. A read error has already been reported by the helper.
+	 */
+	ret = read_poll_timeout(ufshcd_tx_lanes_in_hibern8, err,
+				err != -EAGAIN, 200,
+				(u64)timeout_ms * USEC_PER_MSEC, false,
+				hba, num_lanes);
+	if (!ret)
+		return err;
+
+	/*
+	 * Timed out. The poll helper stops at the first lane that is not in
+	 * HIBERN8, so read every lane again to report each one that is stuck,
+	 * together with its TX_FSM_STATE.
+	 */
+	ret = 0;
+	for (i = 0; i < num_lanes; i++) {
+		err = ufshcd_dme_get(hba,
+				     UIC_ARG_MIB_SEL(TX_FSM_STATE,
+						     UIC_ARG_MPHY_TX_GEN_SEL_INDEX(i)),
+				     &state);
+		if (err) {
+			dev_err(hba->dev,
+				"%s: unable to get TX_FSM_STATE for lane %u, err %d\n",
+				__func__, i, err);
+			/* A positive value is a UIC result code, not an errno. */
+			return err > 0 ? -EIO : err;
+		}
+		if (state != UFS_TX_STATE_HIBERN8) {
+			dev_err(hba->dev,
+				"%s: TX lane %u stuck in TX_FSM_STATE %u\n",
+				__func__, i, state);
+			ret = -ETIMEDOUT;
+		}
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(ufshcd_dme_check_tx_hibern8);
+
 /**
  * ufshcd_dme_rmw - get modify set a DME attribute
  * @hba: per adapter instance
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 3e3d44ee0c14..5217e2e294f8 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -22,50 +22,6 @@
 #include <ufs/ufshci.h>
 #include <ufs/ufs_quirks.h>
 
-static int ufs_hisi_check_hibern8(struct ufs_hba *hba)
-{
-	int err = 0;
-	u32 tx_fsm_val_0 = 0;
-	u32 tx_fsm_val_1 = 0;
-	unsigned long timeout = jiffies + msecs_to_jiffies(HBRN8_POLL_TOUT_MS);
-
-	do {
-		err = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(TX_FSM_STATE, 0),
-				      &tx_fsm_val_0);
-		err |= ufshcd_dme_get(hba,
-		    UIC_ARG_MIB_SEL(TX_FSM_STATE, 1), &tx_fsm_val_1);
-		if (err || (tx_fsm_val_0 == UFS_TX_STATE_HIBERN8 &&
-			tx_fsm_val_1 == UFS_TX_STATE_HIBERN8))
-			break;
-
-		/* sleep for max. 200us */
-		usleep_range(100, 200);
-	} while (time_before(jiffies, timeout));
-
-	/*
-	 * we might have scheduled out for long during polling so
-	 * check the state again.
-	 */
-	if (time_after(jiffies, timeout)) {
-		err = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(TX_FSM_STATE, 0),
-				     &tx_fsm_val_0);
-		err |= ufshcd_dme_get(hba,
-		 UIC_ARG_MIB_SEL(TX_FSM_STATE, 1), &tx_fsm_val_1);
-	}
-
-	if (err) {
-		dev_err(hba->dev, "%s: unable to get TX_FSM_STATE, err %d\n",
-			__func__, err);
-	} else if (tx_fsm_val_0 != UFS_TX_STATE_HIBERN8 ||
-			 tx_fsm_val_1 != UFS_TX_STATE_HIBERN8) {
-		err = -1;
-		dev_err(hba->dev, "%s: invalid TX_FSM_STATE, lane0 = %d, lane1 = %d\n",
-			__func__, tx_fsm_val_0, tx_fsm_val_1);
-	}
-
-	return err;
-}
-
 static void ufs_hisi_clk_init(struct ufs_hba *hba)
 {
 	struct ufs_hisi_host *host = ufshcd_get_variant(hba);
@@ -224,9 +180,7 @@ static int ufs_hisi_link_startup_pre_change(struct ufs_hba *hba)
 
 	/* Unipro VS_mphy_disable */
 	ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(0xD0C1, 0x0), 0x0);
-	err = ufs_hisi_check_hibern8(hba);
-	if (err)
-		dev_err(hba->dev, "ufs_hisi_check_hibern8 error\n");
+	err = ufshcd_dme_check_tx_hibern8(hba, 2, HBRN8_POLL_TOUT_MS);
 
 	if (!(host->caps & UFS_HISI_CAP_PHY10nm))
 		ufshcd_writel(hba, UFS_HCLKDIV_NORMAL_VALUE, UFS_REG_HCLKDIV);
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index a96ac35994de..979d223230a6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -413,46 +413,6 @@ static int ufs_qcom_init_lane_clks(struct ufs_qcom_host *host)
 	return 0;
 }
 
-static int ufs_qcom_check_hibern8(struct ufs_hba *hba)
-{
-	int err;
-	u32 tx_fsm_val;
-	unsigned long timeout = jiffies + msecs_to_jiffies(HBRN8_POLL_TOUT_MS);
-
-	do {
-		err = ufshcd_dme_get(hba,
-				UIC_ARG_MIB_SEL(TX_FSM_STATE,
-					UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)),
-				&tx_fsm_val);
-		if (err || tx_fsm_val == UFS_TX_STATE_HIBERN8)
-			break;
-
-		/* sleep for max. 200us */
-		usleep_range(100, 200);
-	} while (time_before(jiffies, timeout));
-
-	/*
-	 * we might have scheduled out for long during polling so
-	 * check the state again.
-	 */
-	if (time_after(jiffies, timeout))
-		err = ufshcd_dme_get(hba,
-				UIC_ARG_MIB_SEL(TX_FSM_STATE,
-					UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)),
-				&tx_fsm_val);
-
-	if (err) {
-		dev_err(hba->dev, "%s: unable to get TX_FSM_STATE, err %d\n",
-				__func__, err);
-	} else if (tx_fsm_val != UFS_TX_STATE_HIBERN8) {
-		err = tx_fsm_val;
-		dev_err(hba->dev, "%s: invalid TX_FSM_STATE = %d\n",
-				__func__, err);
-	}
-
-	return err;
-}
-
 static void ufs_qcom_select_unipro_mode(struct ufs_qcom_host *host)
 {
 	ufshcd_rmwl(host->hba, QUNIPRO_SEL, QUNIPRO_SEL, REG_UFS_CFG1);
@@ -638,7 +598,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		break;
 	case POST_CHANGE:
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
-		err = ufs_qcom_check_hibern8(hba);
+		err = ufshcd_dme_check_tx_hibern8(hba, 1, HBRN8_POLL_TOUT_MS);
 		ufs_qcom_enable_hw_clk_gating(hba);
 		ufs_qcom_ice_enable(host);
 		ufs_qcom_config_ice_allocator(host);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index be62165b785e..09ad11f7165f 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1505,6 +1505,8 @@ int ufshcd_make_hba_operational(struct ufs_hba *hba);
 void ufshcd_remove(struct ufs_hba *);
 int ufshcd_uic_hibern8_enter(struct ufs_hba *hba);
 int ufshcd_uic_hibern8_exit(struct ufs_hba *hba);
+int ufshcd_dme_check_tx_hibern8(struct ufs_hba *hba, unsigned int num_lanes,
+				unsigned int timeout_ms);
 void ufshcd_delay_us(unsigned long us, unsigned long tolerance);
 void ufshcd_parse_dev_ref_clk_freq(struct ufs_hba *hba, struct clk *refclk);
 void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);

-- 
2.43.0



