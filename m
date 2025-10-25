Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC92CCD1BF
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Oct 2025 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2SUQTTw8m+uHcfX3iFJhtkxzp1GZEeTCuCI8zWEntyY=; b=IqzyqjgIbXyz69B/kXhmd+emay
	K/lXJfzMjPYDDCbjGe+BbK977aHjFVlgEQQill/BYjBNRhprJIrwLNkRfqJ+y/4UBicRcHqixyncr
	rnLjEH09nDPB6z3R9vtYw0E2R+qZ6X+G4NjYn6gIOB0NpE3lX8lCvRMtvscySd6NCQnILV4j5gmBS
	nRV5a7dqGWh1dfTOdUGDYK5ZtdS5Bm9m3essAi9sgYlSUX/K9Jf1bQVej91X0RTROi+QKbbbRlTBv
	ndYZhSKzx34R1HvQYHEyKIzD4cYFh2mt+Tud8QSefRJzevy/VIw0S5t1B793dAFVMU4DcrFqR9mAq
	r4L8P6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgvT-0000000BRu1-2a4N;
	Sat, 25 Oct 2025 16:15:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCgvR-0000000BRtZ-2PrZ;
	Sat, 25 Oct 2025 16:15:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 030A56059C;
	Sat, 25 Oct 2025 16:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72B15C113D0;
	Sat, 25 Oct 2025 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408928;
	bh=mYtsRBf8jVQvcN8NSOYsYIIBlBDdPZN43e/VwT+I5Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6f1nCRT0LYJDyGAYXtKIcR0KVCB28hUGNS6IKVfLskViuX1qiOnWf4XKdp29dEnX
	 G8sh3BAGhIHy5U4ptLRi6W5dCL/u3G/w/ks/lKQePDMWUuEYVW/r1HIaVNHrVejcYE
	 kL6h94hNCaBoUAM578VCP+t8wB7HlEkOLCSP/gEWErObFD/x8OgnusTftbhbebyFvQ
	 NvssuZX7rJO9OklfXqT4ok3fUfRYVSsBdUx5RXA4sTezrdAHBLOgNcFrAaWVfTCkH6
	 VtlslLqlMNMPx7Qplc1GLQReQco/Ty90VRqhEWx0MpgM3WLwh9GvFxXLxFAW+3ltDf
	 VDzdn/KORmSmQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] scsi: ufs: host: mediatek: Change reset sequence for improved stability
Date: Sat, 25 Oct 2025 11:56:07 -0400
Message-ID: <20251025160905.3857885-136-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Peter Wang <peter.wang@mediatek.com>

[ Upstream commit 878ed88c50bfb14d972dd3b86a1c8188c58de4e5 ]

Modify the reset sequence to ensure that the device reset pin is set low
before the host is disabled. This change enhances the stability of the
reset process by ensuring the correct order of operations.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20250811131423.3444014-10-peter.wang@mediatek.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What changed: In `drivers/ufs/host/ufs-mediatek.c:1257`, the reset
  sequence in `ufs_mtk_device_reset()` currently disables the HBA before
  asserting the device reset pin low:
  - Calls `ufshcd_hba_stop(hba)` first (drivers/ufs/host/ufs-
    mediatek.c:1261–1262).
  - Then asserts reset low via `ufs_mtk_device_reset_ctrl(0, res)`
    (drivers/ufs/host/ufs-mediatek.c:1264).
  - Holds low for ≥10µs (drivers/ufs/host/ufs-mediatek.c:1273).
  - Deasserts reset high (drivers/ufs/host/ufs-mediatek.c:1275) and
    waits 10–15ms for device settle (drivers/ufs/host/ufs-
    mediatek.c:1277–1278).
  The new commit swaps the first two steps (assert reset low first, then
`ufshcd_hba_stop(hba)`), explicitly noting “disable hba in middle of
device reset”.

- Why it matters: This is a precise order-of-operations fix to a
  hardware reset sequence. Asserting the device’s reset (RST_n active
  low) before disabling the host controller avoids a race/ordering
  hazard during reset, which can manifest as sporadic reset instability.
  The risk window between asserting low and disabling the HBA is tiny
  (immediately followed by `ufshcd_hba_stop()` and a 10–15µs hold), and
  the device is already in reset during that window.

- Consistency within the driver: The driver already asserts reset
  independently of HBA disable in other flows, e.g., on suspend when the
  link is off it calls `ufs_mtk_device_reset_ctrl(0, res)` without a
  preceding `ufshcd_hba_stop()` (drivers/ufs/host/ufs-
  mediatek.c:1445–1449). The new ordering in `ufs_mtk_device_reset()`
  makes the device-reset behavior consistent within the driver.

- Scope and risk:
  - Change is small and contained to a single function
    (`ufs_mtk_device_reset()`), no API or structural changes.
  - No new features; it purely reorders two existing calls and updates a
    comment.
  - The function is invoked through the variant op hook
    `vops->device_reset` (drivers/ufs/host/ufs-mediatek.c:1792–1803), so
    the behavior change is localized to Mediatek platforms only.
  - `ufshcd_hba_stop()` (drivers/ufs/core/ufshcd.c:4842–4854) simply
    disables the controller and waits for it to quiesce; performing it
    after the device is already in reset is benign and avoids mid-reset
    interactions.

- User impact: Improves reset stability on Mediatek UFS hosts, which
  affects error recovery and some power management transitions (device
  reset is used by `ufshcd_device_reset()` in error handling;
  drivers/ufs/core/ufshcd.c:726–742). This is a real-world reliability
  fix rather than a feature.

- Stable criteria:
  - Fixes a practical bug (unstable/fragile reset behavior) that can
    affect users.
  - Minimal, self-contained change with low regression risk.
  - No architectural churn; confined to UFS Mediatek host driver.
  - Although the commit message lacks “Fixes:”/“Cc: stable”, the change
    meets stable rules as a targeted reliability fix in a vendor driver.

Given the above, this is a good candidate for backporting to stable
trees that ship the Mediatek UFS host driver.

 drivers/ufs/host/ufs-mediatek.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index ada21360aa270..82160da8ec71b 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1503,11 +1503,11 @@ static int ufs_mtk_device_reset(struct ufs_hba *hba)
 {
 	struct arm_smccc_res res;
 
-	/* disable hba before device reset */
-	ufshcd_hba_stop(hba);
-
 	ufs_mtk_device_reset_ctrl(0, res);
 
+	/* disable hba in middle of device reset */
+	ufshcd_hba_stop(hba);
+
 	/*
 	 * The reset signal is active low. UFS devices shall detect
 	 * more than or equal to 1us of positive or negative RST_n
-- 
2.51.0


