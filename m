Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A3606D250
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 11:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=diOLvrRV;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aiSf3J1J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=i/qff6vV9GpqqckqMDaVakLKsz4Q1suNmsJ/DaXLKtw=; b=diOLvrRVof+EIJ3xBMdjTldCJs
	VR4+do1y3dkkjg6JE9EZweX49sMFz/EM39LqINaUlZyuJiKGjix3oZKgFmn/hiJgpoS/2VbIyQiVH
	WTDi7b/O5+3S2E4cByU9u3EfgueglIbh+8CWS0lfcFWmzXpqNBgfWKPtXxNPJrEj6KnnSn1XRP7VB
	A7vGUhXbzOm3FOLpNkGzRWafeVGUEeRC0JTwq7FnLjalUw/28TOus2AbQ2ahn5gbwUOKUFZiOk26S
	KJOM9qtqXeeHChnqHwc1gP2KD6soCW2zuZ3fs+dAX5gibVO1r1MZcXje15Nm+WiTXkhnU5KxKmcld
	OMDw6kIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMu-0000000Fw9x-2ey2;
	Sat, 14 Nov 2026 11:56:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMh-0000000Fvxq-3TT1;
	Sat, 14 Nov 2026 11:56:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 647E645A10;
	Sat, 14 Nov 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794657375;
	b=s7/1nKsjQFaZfxQnxas+0LDkE292A5MOP4IAYzta5Pa8xUsujvSScYoZBXYuUJBj1fzd
	 Kyolg6V9mLWE4YZg8jWxaNTaWhSSX/9onsswu7enNjQqxbS/rHXH7U/TM6a7V/ET/vVOV
	 rBKHM5P2R9KYsbmqBEu5VO4DF2bm9672Qkz+ePHbVWkZnuvarNUtD6a3pcnzHFVdT/oP/
	 IBxUG4o7ITtC8t4sHmtUUd+/59K3Qy7RxdlMfgOQ2MCGluZHsDZ83DXSA/UHa6eWWC3Zs
	 oqxoMc1qKOK1sCLL0V0EYekhSM34ksaJBOlfjr+gcFeUgAsDfmIAiC2cSvjsunx7fxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794657375;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=i/qff6vV9GpqqckqMDaVakLKsz4Q1suNmsJ/DaXLKtw=;
	b=m308EkOrJErWLZF4j17R0Nrv7FTIU1lDZ2CbrGonn88Nb0yLVyqyJIXyusaPLUujfhH0
	 M/mJGphoPa0fSmPbGUtZTLqIYDGDrpiDxZUvTRQbWHASd9hZ2tn0bgLsMCw0ZVJejYN6B
	 6nqi7medZwROOba2IgsY5WqrU71vD4VsRh5hYhua+ryvdGb/KJQ9uDdwe/jrXERPaHI3Y
	 NR/KC95R2GmPOjt91n8rc8+FEqkrRrN7XqjjPC1G4VuO0kUHv+pBOWHcsVKbbldJojOtG
	 QNQyCPoz8nfwAaZojC9kLzVDaQunWw2xNzGtuErwu6WR0yS1to+wjCeQvy2JwfKffyw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B41261F000C7;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657375;
	bh=i/qff6vV9GpqqckqMDaVakLKsz4Q1suNmsJ/DaXLKtw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aiSf3J1Ji+dYRGlzBmnX3u8wr4zpA20dGlqgq7VzJ+dIZoYG1QLBptK8x7Yvr+UUS
	 OMBzukvLIVfB+8wmZChbeMdrGBeCdR+/K65L8PxX320HvicKlM40Wa9N7ryrVM/XRZ
	 F+3aSI6C0TBgEG1i4XRZ6TobZpehrfCRYBHotCgJpp3DkZLrDte24otshmPJ9CCY5B
	 QbeAO5X9u2hDLD/BcasFHspDApC8Rl9bIO05ZZ0+2E5ramoyLbxNoWcp5Wa6xHhnJ4
	 XhGetlwdEK15iwRQfOCQ2IDNM9XryYr7saN2uchthNpAV5bF449NvbQ1gcAKyxlA0p
	 dS4OBduN+peHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 39D1649D6F;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
From: Larisa Grigore via B4 Relay <devnull+larisa.grigore.oss.nxp.com@kernel.org>
Date: Sat, 14 Nov 2026 12:55:35 +0100
Subject: [PATCH v11 03/14] ufs: unipro: Move Tx/Rx FSM state definitions to
 unipro.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-ufs-s32n7-v11-3-dc36e11919d5@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794657369; l=6648;
 i=larisa.grigore@oss.nxp.com; s=20261114; h=from:subject:message-id;
 bh=trkoKEdgDJvEOwdUNPcivOaHNBCVHWr9HRiB/HK5M28=;
 b=7xexXiN/+K95N4rP6JaB2Vjpy/SOGGA3L9L2eLybPOHkrxWTLlw3BnEHhkxLByvRpXhe2rnF5
 j4JlbwxZEaxDciA9YRwS80mh4JXoJUNIbBIMINQZP36DLEn4Lt6Dl4B
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

Move the Tx/Rx FSM state definitions from ufshcd-dwc.h to
include/ufs/unipro.h.

These state values are UniPro/M-PHY related and are not specific to
the DesignWare UFS host controller implementation, so unipro.h is a
more appropriate location for sharing them.

As part of this move, drop the driver-private TX_FSM_HIBERN8 define in
ufs-hisi and ufs-qcom and repoint their Hibern8 checks at the shared
UFS_TX_STATE_HIBERN8 enum constant. This is a no-op change.

Since the definitions become visible to every user of the shared
header, prefix the enum constants with UFS_ (e.g. RX_STATE_HIBERN8
becomes UFS_RX_STATE_HIBERN8) to avoid polluting the global namespace,
and update the existing AMD Versal2 users accordingly.

This also prepares for using these definitions in a subsequent commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/host/ufs-amd-versal2.c |  8 ++++----
 drivers/ufs/host/ufs-hisi.c        |  8 ++++----
 drivers/ufs/host/ufs-hisi.h        |  1 -
 drivers/ufs/host/ufs-qcom.c        |  4 ++--
 drivers/ufs/host/ufs-qcom.h        |  1 -
 drivers/ufs/host/ufshcd-dwc.h      | 19 -------------------
 include/ufs/unipro.h               | 20 ++++++++++++++++++++
 7 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/drivers/ufs/host/ufs-amd-versal2.c b/drivers/ufs/host/ufs-amd-versal2.c
index 65cb0b5028b9..3469e49df133 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -118,8 +118,8 @@ static int ufs_versal2_enable_phy(struct ufs_hba *hba)
 			if (ret)
 				return ret;
 
-			if (reg == TX_STATE_HIBERN8 || reg == TX_STATE_SLEEP ||
-			    reg == TX_STATE_LSBURST)
+			if (reg == UFS_TX_STATE_HIBERN8 || reg == UFS_TX_STATE_SLEEP ||
+			    reg == UFS_TX_STATE_LSBURST)
 				break;
 
 			time_left--;
@@ -138,8 +138,8 @@ static int ufs_versal2_enable_phy(struct ufs_hba *hba)
 			if (ret)
 				return ret;
 
-			if (reg == RX_STATE_HIBERN8 || reg == RX_STATE_SLEEP ||
-			    reg == RX_STATE_LSBURST)
+			if (reg == UFS_RX_STATE_HIBERN8 || reg == UFS_RX_STATE_SLEEP ||
+			    reg == UFS_RX_STATE_LSBURST)
 				break;
 
 			time_left--;
diff --git a/drivers/ufs/host/ufs-hisi.c b/drivers/ufs/host/ufs-hisi.c
index 73eef0e0d278..d3fd340f2dd1 100644
--- a/drivers/ufs/host/ufs-hisi.c
+++ b/drivers/ufs/host/ufs-hisi.c
@@ -34,8 +34,8 @@ static int ufs_hisi_check_hibern8(struct ufs_hba *hba)
 				      &tx_fsm_val_0);
 		err |= ufshcd_dme_get(hba,
 		    UIC_ARG_MIB_SEL(MPHY_TX_FSM_STATE, 1), &tx_fsm_val_1);
-		if (err || (tx_fsm_val_0 == TX_FSM_HIBERN8 &&
-			tx_fsm_val_1 == TX_FSM_HIBERN8))
+		if (err || (tx_fsm_val_0 == UFS_TX_STATE_HIBERN8 &&
+			tx_fsm_val_1 == UFS_TX_STATE_HIBERN8))
 			break;
 
 		/* sleep for max. 200us */
@@ -56,8 +56,8 @@ static int ufs_hisi_check_hibern8(struct ufs_hba *hba)
 	if (err) {
 		dev_err(hba->dev, "%s: unable to get TX_FSM_STATE, err %d\n",
 			__func__, err);
-	} else if (tx_fsm_val_0 != TX_FSM_HIBERN8 ||
-			 tx_fsm_val_1 != TX_FSM_HIBERN8) {
+	} else if (tx_fsm_val_0 != UFS_TX_STATE_HIBERN8 ||
+			 tx_fsm_val_1 != UFS_TX_STATE_HIBERN8) {
 		err = -1;
 		dev_err(hba->dev, "%s: invalid TX_FSM_STATE, lane0 = %d, lane1 = %d\n",
 			__func__, tx_fsm_val_0, tx_fsm_val_1);
diff --git a/drivers/ufs/host/ufs-hisi.h b/drivers/ufs/host/ufs-hisi.h
index 5a90c0f4e90c..6af6a268458d 100644
--- a/drivers/ufs/host/ufs-hisi.h
+++ b/drivers/ufs/host/ufs-hisi.h
@@ -43,7 +43,6 @@
  * M-TX Configuration Attributes for Hixxxx
  */
 #define MPHY_TX_FSM_STATE	0x41
-#define TX_FSM_HIBERN8	0x1
 
 /*
  * Hixxxx UFS HC specific Registers
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 67c2a3b95e58..31ea7b294a42 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -424,7 +424,7 @@ static int ufs_qcom_check_hibern8(struct ufs_hba *hba)
 				UIC_ARG_MIB_SEL(MPHY_TX_FSM_STATE,
 					UIC_ARG_MPHY_TX_GEN_SEL_INDEX(0)),
 				&tx_fsm_val);
-		if (err || tx_fsm_val == TX_FSM_HIBERN8)
+		if (err || tx_fsm_val == UFS_TX_STATE_HIBERN8)
 			break;
 
 		/* sleep for max. 200us */
@@ -444,7 +444,7 @@ static int ufs_qcom_check_hibern8(struct ufs_hba *hba)
 	if (err) {
 		dev_err(hba->dev, "%s: unable to get TX_FSM_STATE, err %d\n",
 				__func__, err);
-	} else if (tx_fsm_val != TX_FSM_HIBERN8) {
+	} else if (tx_fsm_val != UFS_TX_STATE_HIBERN8) {
 		err = tx_fsm_val;
 		dev_err(hba->dev, "%s: invalid TX_FSM_STATE = %d\n",
 				__func__, err);
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 944b2e532a09..1bda960c1d87 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -11,7 +11,6 @@
 #include <ufs/ufshcd.h>
 
 #define MPHY_TX_FSM_STATE       0x41
-#define TX_FSM_HIBERN8          0x1
 #define HBRN8_POLL_TOUT_MS      100
 #define DEFAULT_CLK_RATE_HZ     1000000
 #define MAX_SUPP_MAC		64
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index c618bb914904..a5e40e7604a1 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -39,25 +39,6 @@
 #define RX_AFE_CTLE_IDAC(n)	(0x4001 + ((n) * 0x100))
 #define FW_CALIB_CCFG(n)	(0x404D + ((n) * 0x100))
 
-/* Tx/Rx FSM state */
-enum rx_fsm_state {
-	RX_STATE_DISABLED = 0,
-	RX_STATE_HIBERN8 = 1,
-	RX_STATE_SLEEP = 2,
-	RX_STATE_STALL = 3,
-	RX_STATE_LSBURST = 4,
-	RX_STATE_HSBURST = 5,
-};
-
-enum tx_fsm_state {
-	TX_STATE_DISABLED = 0,
-	TX_STATE_HIBERN8 = 1,
-	TX_STATE_SLEEP = 2,
-	TX_STATE_STALL = 3,
-	TX_STATE_LSBURST = 4,
-	TX_STATE_HSBURST = 5,
-};
-
 struct ufshcd_dme_attr_val {
 	u32 attr_sel;
 	u32 mib_val;
diff --git a/include/ufs/unipro.h b/include/ufs/unipro.h
index 9c168703b104..16b2051f7241 100644
--- a/include/ufs/unipro.h
+++ b/include/ufs/unipro.h
@@ -466,4 +466,24 @@ enum {
 	CPORT_CONNECTED,
 };
 
+/* RX_FSM_State encoding, MIPI M-PHY v6.0 Table 50 (M-RX Status Attributes) */
+enum ufs_rx_fsm_state {
+	UFS_RX_STATE_DISABLED = 0,
+	UFS_RX_STATE_HIBERN8 = 1,
+	UFS_RX_STATE_SLEEP = 2,
+	UFS_RX_STATE_STALL = 3,
+	UFS_RX_STATE_LSBURST = 4,
+	UFS_RX_STATE_HSBURST = 5,
+};
+
+/* TX_FSM_State encoding, MIPI M-PHY v6.0 Table 47 (M-TX Status Attributes) */
+enum ufs_tx_fsm_state {
+	UFS_TX_STATE_DISABLED = 0,
+	UFS_TX_STATE_HIBERN8 = 1,
+	UFS_TX_STATE_SLEEP = 2,
+	UFS_TX_STATE_STALL = 3,
+	UFS_TX_STATE_LSBURST = 4,
+	UFS_TX_STATE_HSBURST = 5,
+};
+
 #endif /* _UNIPRO_H_ */

-- 
2.43.0



