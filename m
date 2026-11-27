Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66135606A321
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Eb7qsSCx;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=CzHt5EYP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KKULeLxavJBYsocKT53X4/LBPYPr/sl6f03XLyey0to=; b=Eb7qsSCx71sQP7
	UfIJ09fpk/0/1y77oF3Sd/iNTgm49KuiApUu67duPXUVPtnzE90VipF081oHz5/T5d4kltPdGFETO
	CAnfPsNfM3425PL8JGE8LDH1GrD+aaFtwJfN+wQu/6Mj1nbJZKxHoAn28RjIiMh4X+IfgPb89t4/X
	tp86aJxleV80SRMm8QTqhHW6hCJEni6N6SzFfxAKuwJNsNKQL/xOu+sbGAHas7PFxc7AJlFLhOdcC
	3ZN+F8oTGqfqjQc+fPPPt0pkrzPOo49jt70ZOmL6LEuxo/tmgqkYhb3KPZnfIgCiWCPNcP1U98UPM
	b6M6Hm6qZpb48kBxhXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyQf-0000000GzFx-0EFe;
	Fri, 27 Nov 2026 16:04:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNW-0000000GxEI-1e87;
	Fri, 27 Nov 2026 16:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795248;
	bh=WdBTanqeQn+XYFTs/ntFEl5+d9ggiaImIi34dcmCbgg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CzHt5EYPVK3ZpHzRVWmGh6P7sDCEdWH1PhodIXiH4RNiTSy3d1RnhO1UaN0TTEgqC
	 QJEqIqOcoQms1A+JaufEJ330adyHXDffoc2eDOFwR2PgQ8F0FsNoITqpOj+NNFdwkU
	 nDIPPvZSk2oRS8hbW1q9kPT2i66hzKjDrykDMt6QjGuowk8k7pJIOC7Clh+uBmNREx
	 wfq0/M0rLUxCD3+zKjkoVFEyQnYxNwYClopzAG43KBn5MYRPEgMebqJjd+chXfXLfa
	 EtSbjwHeJVpFDSsSMVwLAktfTOojM3RMDk5UKi7fY71bhXydKTB6w2Ux6WSCwkuvmU
	 DonLbVvUdi7PQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E441A17E0E2B;
	Fri, 27 Nov 2026 17:00:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:21 +0100
Subject: [PATCH v16 18/23] scsi: ufs: mediatek: Rework
 ufs_mtk_wait_idle_state
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-18-6f2568f7c119@collabora.com>
References: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
In-Reply-To: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=4343;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=jhMyGY6GOonU10ZjF7cJa8sQcSDjhtufUtXa/RX6eUc=;
 b=jS98gc2NQCacIUfhnSNMuYOyHVDF7vw8eVW2HHexj1Jpq6RtNjh33fOVlwbzttCtN5ZrpiDkj
 8LdIBo4ch0nCWUfYSJBKccwTd+99Y792tejSaq14qImkXt/ik3TFcDb
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080050_667123_BDE1E1E9 
X-CRM114-Status: GOOD (  18.53  )
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

While ufs_mtk_wait_idle state has some code smells for me (the
VS_HCE_BASE early exit seems racey at best), it can still benefit from
some general cleanup to make the code flow less convoluted.

Use the iopoll helpers, for one, and specifically the one that sleeps
and does not busy delay, as it's being done for up to 5ms.

The register read is split out to a helper function that branches
between new and old style flow.

Every called uses the same 5ms timeout value, so there is no point in
making this a parameter. Just assume a 5ms timeout in the function.

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/ufs/host/ufs-mediatek.c | 71 +++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 41 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 1c9b5d0db969..dffb6b7ce444 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -384,51 +385,39 @@ static void ufs_mtk_dbg_sel(struct ufs_hba *hba)
 	}
 }
 
-static int ufs_mtk_wait_idle_state(struct ufs_hba *hba,
-			    unsigned long retry_ms)
+static u32 ufs_mtk_read_state(struct ufs_hba *hba, bool old_style)
 {
-	u64 timeout, time_checked;
-	u32 val, sm;
-	bool wait_idle;
-	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
-
-	/* cannot use plain ktime_get() in suspend */
-	timeout = ktime_get_mono_fast_ns() + retry_ms * 1000000UL;
-
-	/* wait a specific time after check base */
-	udelay(10);
-	wait_idle = false;
+	u32 val;
 
-	do {
-		time_checked = ktime_get_mono_fast_ns();
-		if (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899) {
-			ufs_mtk_dbg_sel(hba);
-			val = ufshcd_readl(hba, REG_UFS_PROBE);
-		} else {
-			val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL);
-			val = val >> 16;
-		}
+	if (old_style) {
+		ufs_mtk_dbg_sel(hba);
+		val = ufshcd_readl(hba, REG_UFS_PROBE);
+	} else {
+		val = ufshcd_readl(hba, REG_UFS_UFS_MMIO_OTSD_CTRL) >> 16;
+	}
 
-		sm = val & 0x1f;
+	return FIELD_GET(0x1f, val);
+}
 
-		/*
-		 * if state is in H8 enter and H8 enter confirm
-		 * wait until return to idle state.
-		 */
-		if ((sm >= VS_HIB_ENTER) && (sm <= VS_HIB_EXIT)) {
-			wait_idle = true;
-			udelay(50);
-			continue;
-		} else if (!wait_idle)
-			break;
+static int ufs_mtk_wait_idle_state(struct ufs_hba *hba)
+{
+	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
+	bool old_style = (host->legacy_ip_ver || host->ip_ver < IP_VER_MT6899);
+	u32 val;
+	int ret;
 
-		if (wait_idle && (sm == VS_HCE_BASE))
-			break;
-	} while (time_checked < timeout);
+	/* If the device isn't in a hibernate state after 10us, don't wait. */
+	udelay(10);
+	val = ufs_mtk_read_state(hba, old_style);
+	if (val < VS_HIB_ENTER || val > VS_HIB_EXIT)
+		return 0;
 
-	if (wait_idle && sm != VS_HCE_BASE) {
-		dev_info(hba->dev, "wait idle tmo: 0x%x\n", val);
-		return -ETIMEDOUT;
+	/* Poll to wait for idle */
+	ret = read_poll_timeout(ufs_mtk_read_state, val, (val == VS_HCE_BASE),
+				50, 5 * USEC_PER_MSEC, false, hba, old_style);
+	if (ret) {
+		dev_err(hba->dev, "Timed out waiting for idle state, val = 0x%x\n", val);
+		return ret;
 	}
 
 	return 0;
@@ -1470,7 +1459,7 @@ static int ufs_mtk_auto_hibern8_disable(struct ufs_hba *hba)
 	ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
 
 	/* wait host return to idle state when auto-hibern8 off */
-	ret = ufs_mtk_wait_idle_state(hba, 5);
+	ret = ufs_mtk_wait_idle_state(hba);
 	if (ret)
 		goto out;
 
@@ -1680,7 +1669,7 @@ static int ufs_mtk_link_set_hpm(struct ufs_hba *hba)
 		return err;
 
 	/* Check link state to make sure exit h8 success */
-	err = ufs_mtk_wait_idle_state(hba, 5);
+	err = ufs_mtk_wait_idle_state(hba);
 	if (err) {
 		dev_err(hba->dev, "Failed to wait for idle: %pe\n", ERR_PTR(err));
 		return err;

-- 
2.56.1


