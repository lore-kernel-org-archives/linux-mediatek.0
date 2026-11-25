Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B9606A32D
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 06:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a0znkIUq;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=nDygAOY+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hfzSep+Bp57rLhrpZ8JdPJiz3cGo+2quuNNhwX6iGT4=; b=a0znkIUqQKsM1LgHgR7p3BIM2p
	4owMc2khoOIwT9wUeSCLT3xvU01LpU7hD0SnjtBjO8xUVf5ZE9PDeHnNiE+2hEXlxI73pkg0NoxRC
	3n32vwHqzp/n3QQJWn48WbXTQQoF9lggDLB1RS8s6oa8jV5GVkwOjyAZ2FFHnaBwMg1oHZdmPApZm
	hsg3/xQq6iE5yDuDhlav+/RI3OUUdRVcwHrKdpJwExTbcBKBLVMb4BXpMl9I8eqZSU8Ickx5wnqp0
	uHw0WC2ue8H4tN66ks3Zc97MvoRWK7dyax6jW4TOacQhFbgxPfQj6kZdKEhaT2GED8eYG1uhqajXS
	SJsculNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW64e-00000008Vd4-0FHe;
	Wed, 25 Nov 2026 06:01:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW643-00000008VOV-40cZ;
	Wed, 25 Nov 2026 06:01:09 +0000
X-UUID: 97905070e89511f1afed4741b24580c9-20261124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From; bh=hfzSep+Bp57rLhrpZ8JdPJiz3cGo+2quuNNhwX6iGT4=;
	b=nDygAOY+rw8l5psxQBOqIwiP4xrt/jhoflfYN7822Ug2jOs0ubhrgmEOc5hS1LN3BZiWRwRx/uVLR2P8xRowPbPpwB3heWmT0oEbIT35S7I6GVuBIHy15LTfCBe7Nm9lNPunVLJ8Pbn7Dre/ZlW6mZ3RzVdMnI4uJkHmAq/+L5Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ace02d40-49f7-4c0e-b0ce-3d96d66bd105,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:b5ef5031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|136|836|865|888|898,TC:-5,Content:0|
	15|50|99,EDM:2|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97905070e89511f1afed4741b24580c9-20261124
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <echo.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1655757891; Tue, 24 Nov 2026 23:01:01 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 25 Nov 2026 14:00:59 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.56 via Frontend Transport; Wed, 25 Nov 2026 14:00:58 +0800
From: Echo Zhang <echo.zhang@mediatek.com>
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, MMDVFS Team
	<linux-mediatek@lists.infradead.org>, <kyrie.wu@mediatek.com>,
	<ming-fan.chen@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <llvm@lists.linux.dev>
Subject: [PATCH 5/7] soc: mediatek: mmdvfs: add MT8196 support
Date: Wed, 25 Nov 2026 14:00:10 +0800
Message-ID: <20261125060037.649659-6-echo.zhang@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125060037.649659-1-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_220108_017723_3B2FF65C 
X-CRM114-Status: GOOD (  27.15  )
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

Describe the MT8196 resource controllers, seven multimedia muxes and
their users. Read mux performance levels from device tree OPP tables
and program HWCCF votes for aggregated user clock requests.

Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
---
 drivers/soc/mediatek/mmdvfs/Makefile        |   1 +
 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c | 637 ++++++++++++++++++++
 2 files changed, 638 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c

diff --git a/drivers/soc/mediatek/mmdvfs/Makefile b/drivers/soc/mediatek/mmdvfs/Makefile
index 16ecee30bff6..d02ebd63e6ae 100644
--- a/drivers/soc/mediatek/mmdvfs/Makefile
+++ b/drivers/soc/mediatek/mmdvfs/Makefile
@@ -6,3 +6,4 @@ mtk-mmdvfs-y += mmdvfs-core.o
 mtk-mmdvfs-y += mmdvfs-clk.o
 mtk-mmdvfs-y += mmdvfs-up.o
 mtk-mmdvfs-y += mmdvfs-vcp.o
+mtk-mmdvfs-$(CONFIG_MTK_MMDVFS_MT8196) += mmdvfs-mt8196.o
diff --git a/drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c b/drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c
new file mode 100644
index 000000000000..1075884791e4
--- /dev/null
+++ b/drivers/soc/mediatek/mmdvfs/mmdvfs-mt8196.c
@@ -0,0 +1,637 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 MediaTek Inc.
+ *
+ * MediaTek MMDVFS MT8196 Platform Driver
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include "mmdvfs-internal.h"
+
+/* HWCCF timing constants */
+#define MTK_WAIT_HWV_PREPARE_CNT	200
+#define MTK_WAIT_HWV_PREPARE_US		1
+#define MTK_WAIT_HWV_DONE_CNT		5000000
+#define MTK_WAIT_HWV_DONE_US		1
+#define MT8196_HWV_LEVELS		7
+
+/* HWCCF DVFS Voter control bits */
+#define HWCCF_VOTER_ENABLE		BIT(0)
+#define HWCCF_VOTER_REQ_VALID		BIT(1)
+#define HWCCF_VOTER_ACK_VALID		BIT(2)
+
+struct mt8196_mmdvfs_data {
+	struct regmap *hwv_regmap;
+};
+
+/* Resource controllers (uses HWCCF, no direct RC base address) */
+static struct mmdvfs_rc mt8196_rc[MMDVFS_PWR_NUM] = {
+	[MMDVFS_PWR_VCORE] = {   /* [0] PWR_MMDVFS_VCORE */
+		.id = MMDVFS_PWR_VCORE,
+		.pa = 0x0,
+		.level_num = MT8196_HWV_LEVELS,
+	},
+	[MMDVFS_PWR_VMM] = {     /* [1] PWR_MMDVFS_VMM */
+		.id = MMDVFS_PWR_VMM,
+		.pa = 0x0,
+		.level_num = MT8196_HWV_LEVELS,
+	},
+	[MMDVFS_PWR_VDISP] = {   /* [2] PWR_MMDVFS_VDISP */
+		.id = MMDVFS_PWR_VDISP,
+		.pa = 0x0,
+		.level_num = MT8196_HWV_LEVELS,
+	},
+};
+
+/*
+ * mt8196_hwccf_vote - perform HWCCF DVFS voter operation
+ * @mmdvfs: MMDVFS device structure
+ * @user: user structure
+ * @level: target performance level (higher value = higher performance)
+ *
+ * Implement HWCCF DVFS voter logic using the standard voting sequence:
+ *
+ * 1. WRITE: issue vote to SET/CLEAR register based on OPP delta
+ * 2. PREPARE: poll hwv_set_ofs until HW accepts (200us timeout)
+ * 3. DONE: poll hwv_sta_ofs until operation completes (5s timeout)
+ *
+ * OPP encoding uses cumulative bitmasks where index = level_num - 1 - level.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int mt8196_hwccf_vote(struct mmdvfs_device *mmdvfs,
+			     struct mmdvfs_user *user, u8 level)
+{
+	struct mt8196_mmdvfs_data *mt8196_data = mmdvfs->data->platform_data;
+	struct mmdvfs_data *data = mmdvfs->data;
+	struct mmdvfs_mux *mux;
+	struct mmdvfs_rc *rc;
+	u32 mask, opp_mask;
+	u32 val = 0, orig = 0, renew = 0;
+	u8 index;
+	int i = 0, ret = 0;
+
+	if (!mt8196_data || !mt8196_data->hwv_regmap) {
+		dev_err(mmdvfs->dev, "MT8196 HWCCF regmap not initialized\n");
+		return -ENODEV;
+	}
+
+	if (user->mux >= data->mux_num) {
+		dev_err(mmdvfs->dev, "Invalid mux_id: %u\n", user->mux);
+		return -EINVAL;
+	}
+
+	mux = &data->mux[user->mux];
+	if (mux->rc >= data->rc_num) {
+		dev_err(mmdvfs->dev, "Invalid rc_id: %u\n", mux->rc);
+		return -EINVAL;
+	}
+
+	rc = &data->rc[mux->rc];
+
+	if (level >= rc->level_num) {
+		dev_err(mmdvfs->dev, "Invalid level: user=%s level=%u max=%u\n",
+			user->name, level, rc->level_num - 1);
+		return -EINVAL;
+	}
+
+	/*
+	 * Prepare HWCCF voting masks
+	 * Level is the freq[] array index. level=0 is the lowest frequency,
+	 * and level=N-1 is the highest frequency.
+	 * Hardware index = level (no conversion needed, same as CLK framework)
+	 *
+	 * mask: Hardware register bit field width (fixed by hardware design)
+	 *       GENMASK(6, 0) = 7 bits, supporting up to 7 OPP levels (level 0-6)
+	 *       This is determined by hardware register layout, NOT by OPP table.
+	 *       Bit shift + 7 is the HWV gate bit for the 8-bit slot.
+	 *
+	 * opp_mask: Cumulative bitmask for current level
+	 *       level=0 -> GENMASK(0,0) = 0x01
+	 *       level=6 -> GENMASK(6,0) = 0x7F
+	 *       Must not exceed mask range (level must be < 7)
+	 */
+	index = level;
+	mask = GENMASK(6, 0) << mux->shift;
+	opp_mask = GENMASK(index, 0) << mux->shift;
+
+	/* Phase 1: Read current setting and calculate delta */
+	ret = regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, &orig);
+	if (ret) {
+		dev_err(mmdvfs->dev, "Failed to read HWV set register: %d\n", ret);
+		goto hwv_fail;
+	}
+
+	val = orig & mask;
+	val ^= opp_mask;
+
+	/* Write to SET or CLEAR register based on delta direction */
+	if (val > opp_mask)
+		ret = regmap_write(mt8196_data->hwv_regmap, mux->hwccf.hwv_clr_ofs, val);
+	else
+		ret = regmap_write(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, val);
+
+	if (ret) {
+		dev_err(mmdvfs->dev, "Failed to write HWV register (ofs=0x%x): %d\n",
+			val > opp_mask ? mux->hwccf.hwv_clr_ofs : mux->hwccf.hwv_set_ofs, ret);
+		goto hwv_fail;
+	}
+
+	/* Write UPDATE register to trigger hardware processing. */
+	if (mux->hwccf.hwv_upd_id != 0xFF) {
+		ret = regmap_write(mt8196_data->hwv_regmap,
+				   mux->hwccf.hwv_upd_ofs,
+				   BIT(mux->hwccf.hwv_upd_id));
+		if (ret) {
+			dev_err(mmdvfs->dev, "Failed to write HWV update register (ofs=0x%x bit=%u): %d\n",
+				mux->hwccf.hwv_upd_ofs, mux->hwccf.hwv_upd_id, ret);
+			goto hwv_fail;
+		}
+	}
+
+	/* Phase 2: Poll until hardware accepts the vote (200us timeout) */
+	i = 0;
+	while (1) {
+		ret = regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_set_ofs, &renew);
+		if (ret) {
+			dev_err(mmdvfs->dev, "Failed to read HWV set status: %d\n", ret);
+			goto hwv_fail;
+		}
+
+		if ((renew & opp_mask) == opp_mask)
+			break;
+
+		if (i < MTK_WAIT_HWV_PREPARE_CNT) {
+			udelay(MTK_WAIT_HWV_PREPARE_US);
+			i++;
+		} else {
+			dev_err(mmdvfs->dev,
+				"HWV prepare timeout(%d loops, %dus): renew=0x%x opp_mask=0x%x mask=0x%x\n",
+				i, i * MTK_WAIT_HWV_PREPARE_US, renew, opp_mask, mask);
+			dev_err(mmdvfs->dev,
+				"  mux_id=%u shift=%u hwv_set_ofs=0x%x renew&mask=0x%x\n",
+				user->mux, mux->shift, mux->hwccf.hwv_set_ofs, renew & mask);
+			ret = -ETIMEDOUT;
+			goto hwv_fail;
+		}
+	}
+
+	/* Phase 3: Poll until operation completes (5s timeout) */
+	i = 0;
+	while (1) {
+		ret = regmap_read(mt8196_data->hwv_regmap, mux->hwccf.hwv_sta_ofs, &renew);
+		if (ret) {
+			dev_err(mmdvfs->dev, "Failed to read HWV status: %d\n", ret);
+			goto hwv_fail;
+		}
+
+		if ((renew & val) == val)
+			break;
+
+		if (i < MTK_WAIT_HWV_DONE_CNT) {
+			udelay(MTK_WAIT_HWV_DONE_US);
+			i++;
+		} else {
+			dev_err(mmdvfs->dev,
+				"HWV done timeout(%d loops, %dms): renew=0x%x val=0x%x\n",
+				i, i * MTK_WAIT_HWV_DONE_US / 1000, renew, val);
+			ret = -ETIMEDOUT;
+			goto hwv_fail;
+		}
+	}
+
+hwv_fail:
+	if (ret && ret != -ETIMEDOUT)
+		dev_err(mmdvfs->dev, "HWCCF vote failed with ret=%d\n", ret);
+
+	return ret;
+}
+
+/*
+ * Mux-to-users mapping table for vote aggregation (7 MUXes)
+ * MUX order: dis, mdp/mml, smi, ven, vde, img, cam
+ */
+static const struct {
+	const u8 users[16];
+	u8 count;
+} mt8196_mux_user_map[] = {
+	/*
+	 * mux 0: dis
+	 * (user-disp, dummy-dis, mmdvfs-ap-dis, mmdvfs-vcp-dis)
+	 */
+	{ .users = {0, 14, 29, 39}, .count = 4 },
+	/*
+	 * mux 1: mdp/mml
+	 * (user-mdp, user-mml, user-vdisp, dummy-mdp, dummy-mml,
+	 *  mmdvfs-ap-mdp, mmdvfs-ap-mml, mmdvfs-vcp-mdp, mmdvfs-vcp-mml)
+	 */
+	{ .users = {1, 2, 12, 15, 16, 30, 33, 40, 43}, .count = 9 },
+	/*
+	 * mux 2: smi
+	 * (user-smi, dummy-smi, user-img-smi, user-vcp-smi,
+	 *  mmdvfs-ap-smi, mmdvfs-vcp-smi)
+	 */
+	{ .users = {3, 17, 22, 23, 31, 41}, .count = 6 },
+	/*
+	 * mux 3: ven
+	 * (user-jpegdec, user-jpegenc, user-venc, user-vcore,
+	 *  dummy-ven, mmdvfs-ap-ven, mmdvfs-vcp-ven)
+	 */
+	{ .users = {4, 5, 6, 10, 18, 32, 42}, .count = 7 },
+	/* mux 4: vde (user-vfmt, user-vdec, dummy-vde, mmdvfs-ap-vde, mmdvfs-vcp-vde) */
+	{ .users = {7, 13, 19, 26, 36}, .count = 5 },
+	/* mux 5: img (user-img, dummy-img, mmdvfs-ap-img, mmdvfs-vcp-img) */
+	{ .users = {8, 20, 27, 28, 37, 38}, .count = 6 },
+	/* mux 6: cam (user-cam, user-vmm, dummy-cam, mmdvfs-ap-cam, mmdvfs-vcp-cam) */
+	{ .users = {9, 11, 21, 24, 25, 34, 35}, .count = 7 },
+};
+
+/*
+ * mt8196_get_mux_aggregated_level - aggregate user votes for a mux
+ * @mmdvfs: MMDVFS device context
+ * @mux_id: mux identifier
+ * @pending_user_id: user whose new level is being voted
+ * @pending_level: pending level for @pending_user_id
+ *
+ * Aggregate votes from multiple users targeting the same mux. Uses static
+ * mux-to-users mapping for O(users_per_mux) complexity instead of O(total_users).
+ *
+ * Return: aggregated level to write to hardware voter
+ */
+static u8 mt8196_get_mux_aggregated_level(struct mmdvfs_device *mmdvfs, u8 mux_id,
+					  u8 pending_user_id, u8 pending_level)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	u8 max_level = 0;
+	int i;
+
+	if (mux_id >= ARRAY_SIZE(mt8196_mux_user_map))
+		return 0;
+
+	for (i = 0; i < mt8196_mux_user_map[mux_id].count; i++) {
+		u8 user_id = mt8196_mux_user_map[mux_id].users[i];
+		struct mmdvfs_user *user;
+
+		if (user_id >= data->user_num)
+			continue;
+
+		user = &data->user[user_id];
+		if (user_id == pending_user_id) {
+			if (pending_level > max_level)
+				max_level = pending_level;
+		} else if (user->level > max_level) {
+			max_level = user->level;
+		}
+	}
+
+	return max_level;
+}
+
+/*
+ * mt8196_hw_vote - submit hardware vote
+ * @mmdvfs: MMDVFS device context
+ * @user_id: user identifier
+ * @level: target performance level
+ *
+ * Submit vote via HWCCF DVFS voter. Multiple users may map to the same mux,
+ * so votes are aggregated (taking maximum level) before writing to hardware.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+static int mt8196_hw_vote(struct mmdvfs_device *mmdvfs, const u8 user_id, const u8 level)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	struct mmdvfs_user *user;
+	u8 mux_id, aggregated_level;
+	int ret;
+
+	if (!data || user_id >= data->user_num) {
+		dev_err(mmdvfs->dev, "Invalid user_id: %u (max=%u)\n",
+			user_id, data ? data->user_num : 0);
+		return -EINVAL;
+	}
+
+	user = &data->user[user_id];
+	if (!user || user->id != user_id) {
+		dev_err(mmdvfs->dev, "User table mismatch: array[%u].id=%u (expected %u)\n",
+			user_id, user ? user->id : 999, user_id);
+		return -ENODEV;
+	}
+
+	mux_id = user->mux;
+
+	aggregated_level = mt8196_get_mux_aggregated_level(mmdvfs, mux_id, user_id, level);
+
+	/* Submit aggregated vote to hardware */
+	ret = mt8196_hwccf_vote(mmdvfs, user, aggregated_level);
+	if (ret) {
+		mmdvfs_err(mmdvfs->dev,
+			   "HWCCF vote failed: user=%u(%s) mux=%u user_level=%u aggregated_level=%u ret=%d\n",
+			   user_id, user->name, mux_id, level,
+			   aggregated_level, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+/*
+ * mt8196_init_hw - Initialize hardware
+ */
+static int mt8196_init_hw(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	struct mt8196_mmdvfs_data *mt8196_data;
+	struct device_node *node = mmdvfs->dev->of_node;
+
+	/* Allocate platform data */
+	mt8196_data = devm_kzalloc(mmdvfs->dev, sizeof(*mt8196_data), GFP_KERNEL);
+	if (!mt8196_data)
+		return -ENOMEM;
+
+	/* Get HWCCF regmap */
+	mt8196_data->hwv_regmap = syscon_regmap_lookup_by_phandle(node, "mediatek,hwccf");
+	if (IS_ERR(mt8196_data->hwv_regmap)) {
+		dev_err(mmdvfs->dev, "Failed to get HWCCF regmap: %ld\n",
+			PTR_ERR(mt8196_data->hwv_regmap));
+		return PTR_ERR(mt8196_data->hwv_regmap);
+	}
+
+	/* Store platform data */
+	data->platform_data = mt8196_data;
+
+	dev_info(mmdvfs->dev, "MT8196 HWCCF DVFS Voter initialized\n");
+
+	return 0;
+}
+
+/*
+ * mt8196_deinit_hw - Deinitialize hardware
+ */
+static void mt8196_deinit_hw(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+
+	if (data->platform_data) {
+		devm_kfree(mmdvfs->dev, data->platform_data);
+		data->platform_data = NULL;
+	}
+
+	dev_info(mmdvfs->dev, "MT8196 HWCCF DVFS Voter deinitialized\n");
+}
+
+/*
+ * mt8196_populate_opp_freq - Populate MUX frequency from OPP table
+ * @mmdvfs: MMDVFS device
+ * @mux: MUX to populate
+ * @rc: Associated RC
+ *
+ * Read frequencies from the OPP table referenced by this mux's DT phandle.
+ * The OPP level determines its hardware voter index.
+ */
+static int mt8196_populate_opp_freq(struct mmdvfs_device *mmdvfs,
+				    struct mmdvfs_mux *mux,
+				    struct mmdvfs_rc *rc)
+{
+	struct device_node *opp_table, *opp = NULL;
+	unsigned long seen = 0;
+	u32 opp_level;
+	u64 freq;
+	int level = 0, ret;
+
+	opp_table = of_parse_phandle(mmdvfs->dev->of_node,
+				     "mediatek,mux-opp-tables", mux->id);
+	if (!opp_table) {
+		mmdvfs_err(mmdvfs->dev, "MUX %u (%s): missing OPP table phandle\n",
+			   mux->id, mux->name);
+		return -EINVAL;
+	}
+
+	/* Parse all available OPP entries */
+	do {
+		opp = of_get_next_available_child(opp_table, opp);
+		if (opp) {
+			ret = of_property_read_u32(opp, "opp-level", &opp_level);
+			if (ret) {
+				mmdvfs_err(mmdvfs->dev,
+					   "MUX %u (%s): missing opp-level in %pOF: %d\n",
+					   mux->id, mux->name, opp, ret);
+				of_node_put(opp);
+				of_node_put(opp_table);
+				return ret;
+			}
+
+			if (opp_level >= MMDVFS_MAX_LEVELS ||
+			    opp_level >= rc->level_num || seen & BIT(opp_level)) {
+				mmdvfs_err(mmdvfs->dev,
+					   "MUX %u (%s): invalid or duplicate OPP level %u\n",
+					   mux->id, mux->name, opp_level);
+				of_node_put(opp);
+				of_node_put(opp_table);
+				return -EINVAL;
+			}
+
+			ret = of_property_read_u64(opp, "opp-hz", &freq);
+			if (ret) {
+				mmdvfs_err(mmdvfs->dev,
+					   "MUX %u (%s): missing opp-hz in %pOF: %d\n",
+					   mux->id, mux->name, opp, ret);
+				of_node_put(opp);
+				of_node_put(opp_table);
+				return ret;
+			}
+
+			mux->freq[opp_level] = freq;
+			seen |= BIT(opp_level);
+			level++;
+		}
+	} while (opp);
+
+	if (!level || seen != GENMASK(level - 1, 0)) {
+		mmdvfs_err(mmdvfs->dev,
+			   "MUX %u (%s): OPP levels in %pOF are not contiguous\n",
+			   mux->id, mux->name, opp_table);
+		of_node_put(opp_table);
+		return -EINVAL;
+	}
+
+	of_node_put(opp_table);
+	mux->freq_num = level;
+	mmdvfs_info(mmdvfs->dev, "MUX %u (%s): parsed %u OPP frequencies\n",
+		    mux->id, mux->name, mux->freq_num);
+	return 0;
+}
+
+/* IC-specific probe function */
+static int mt8196_probe(struct mmdvfs_device *mmdvfs)
+{
+	struct mmdvfs_data *data = mmdvfs->data;
+	int i, ret;
+
+	mmdvfs_info(mmdvfs->dev, "MT8196 IC-specific probe start\n");
+
+	/* Populate frequency tables from OPP tables */
+	for (i = 0; i < data->mux_num; i++) {
+		struct mmdvfs_mux *mux = &data->mux[i];
+		struct mmdvfs_rc *rc = &data->rc[mux->rc];
+
+		ret = mt8196_populate_opp_freq(mmdvfs, mux, rc);
+		if (ret)
+			return ret;
+	}
+
+	mmdvfs_info(mmdvfs->dev, "MT8196 IC-specific probe completed\n");
+	return 0;
+}
+
+/* Platform operations */
+const struct mmdvfs_ops mmdvfs_mt8196_ops = {
+	.probe = mt8196_probe,
+	.hw_vote = mt8196_hw_vote,
+	.init_hw = mt8196_init_hw,
+	.deinit_hw = mt8196_deinit_hw,
+};
+
+/* Per-SoC topology data */
+
+/*
+ * MUX Table (7 MUXes)
+ * MUX order matches DTS clock-names: dis, mdp, mml, smi, ven, vde, img, cam
+ * Note: mux-mdp serves both MDP and MML users (ck2_mdp_sel is shared)
+ * hwv_upd_ofs: 0x0240 (MM_HW_CCF_HW_CCF_MUX_UPDATE_31_0)
+ */
+static const struct mmdvfs_mux mt8196_mux_table[] = {
+	{	/* mux-dis: HW_CCF_34, shift=24, upd_id=19 */
+		.id = 0, .rc = MMDVFS_PWR_VDISP, .pos = 0, .shift = 24,
+		.hwccf.hwv_set_ofs = 0x0110,
+		.hwccf.hwv_clr_ofs = 0x0114,
+		.hwccf.hwv_sta_ofs = 0x2c88,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 19,
+		.name = "ck2_disp_sel"
+	},
+	{	/* mux-mdp: HW_CCF_35, shift=0, upd_id=20 (serves both MDP and MML users) */
+		.id = 1, .rc = MMDVFS_PWR_VDISP, .pos = 1, .shift = 0,
+		.hwccf.hwv_set_ofs = 0x0118,
+		.hwccf.hwv_clr_ofs = 0x011c,
+		.hwccf.hwv_sta_ofs = 0x2c8c,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 20,
+		.name = "ck2_mdp_sel"
+	},
+	{	/* mux-smi: HW_CCF_35, shift=8, upd_id=21 */
+		.id = 2, .rc = MMDVFS_PWR_VCORE, .pos = 0, .shift = 8,
+		.hwccf.hwv_set_ofs = 0x0118,
+		.hwccf.hwv_clr_ofs = 0x011c,
+		.hwccf.hwv_sta_ofs = 0x2c8c,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 21,
+		.name = "ck2_mminfra_sel"
+	},
+	{	/* mux-ven: HW_CCF_33, shift=16, upd_id=14 */
+		.id = 3, .rc = MMDVFS_PWR_VCORE, .pos = 1, .shift = 16,
+		.hwccf.hwv_set_ofs = 0x0108,
+		.hwccf.hwv_clr_ofs = 0x010c,
+		.hwccf.hwv_sta_ofs = 0x2c84,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 14,
+		.name = "ck2_venc_sel"
+	},
+	{	/* mux-vde: HW_CCF_32, shift=24, upd_id=11 */
+		.id = 4, .rc = MMDVFS_PWR_VMM, .pos = 0, .shift = 24,
+		.hwccf.hwv_set_ofs = 0x0100,
+		.hwccf.hwv_clr_ofs = 0x0104,
+		.hwccf.hwv_sta_ofs = 0x2c80,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 11,
+		.name = "ck2_vdec_sel"
+	},
+	{	/* mux-img: HW_CCF_31, shift=16, upd_id=6 */
+		.id = 5, .rc = MMDVFS_PWR_VMM, .pos = 1, .shift = 16,
+		.hwccf.hwv_set_ofs = 0x00f8,
+		.hwccf.hwv_clr_ofs = 0x00fc,
+		.hwccf.hwv_sta_ofs = 0x2c7c,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 6,
+		.name = "ck2_img1_sel"
+	},
+	{	/* mux-cam: HW_CCF_32, shift=0, upd_id=8 */
+		.id = 6, .rc = MMDVFS_PWR_VMM, .pos = 2, .shift = 0,
+		.hwccf.hwv_set_ofs = 0x0100,
+		.hwccf.hwv_clr_ofs = 0x0104,
+		.hwccf.hwv_sta_ofs = 0x2c80,
+		.hwccf.hwv_upd_ofs = 0x0240, .hwccf.hwv_upd_id = 8,
+		.name = "ck2_cam_sel"
+	},
+};
+
+/*
+ * Users - Static configuration (topology defined in code, not DTS)
+ * MUX mapping (7 MUXes): 0=dis 1=mdp/mml 2=smi 3=ven 4=vde 5=img 6=cam
+ * Note: MML users share mux[1] with MDP users (ck2_mdp_sel)
+ */
+static const struct mmdvfs_user mt8196_user_table[] = {
+	/* Core users (0-23) */
+	[0]  = {.id = 0,  .name = "user-disp",     .mux = 0, .level = 0},  /* MMDVFS_USER_DISP */
+	[1]  = {.id = 1,  .name = "user-mdp",      .mux = 1, .level = 0},  /* MMDVFS_USER_MDP */
+	[2]  = {.id = 2,  .name = "user-mml",      .mux = 1, .level = 0},  /* MMDVFS_USER_MML */
+	[3]  = {.id = 3,  .name = "user-smi",      .mux = 2, .level = 0},  /* MMDVFS_USER_SMI */
+	[4]  = {.id = 4,  .name = "user-jpegdec",  .mux = 3, .level = 0},  /* MMDVFS_USER_JPEGDEC */
+	[5]  = {.id = 5,  .name = "user-jpegenc",  .mux = 3, .level = 0},  /* MMDVFS_USER_JPEGENC */
+	[6]  = {.id = 6,  .name = "user-venc",     .mux = 3, .level = 0},  /* MMDVFS_USER_VENC */
+	[7]  = {.id = 7,  .name = "user-vfmt",     .mux = 4, .level = 0},  /* MMDVFS_USER_VFMT */
+	[8]  = {.id = 8,  .name = "user-img",      .mux = 5, .level = 0},  /* MMDVFS_USER_IMG */
+	[9]  = {.id = 9,  .name = "user-cam",      .mux = 6, .level = 0},  /* MMDVFS_USER_CAM */
+	[10] = {.id = 10, .name = "user-vcore",    .mux = 3, .level = 0},  /* MMDVFS_USER_VCORE */
+	[11] = {.id = 11, .name = "user-vmm",      .mux = 6, .level = 0},  /* MMDVFS_USER_VMM */
+	[12] = {.id = 12, .name = "user-vdisp",    .mux = 1, .level = 0},  /* MMDVFS_USER_VDISP */
+	[13] = {.id = 13, .name = "user-vdec",     .mux = 4, .level = 0},  /* MMDVFS_USER_VDEC */
+	[14] = {.id = 14, .name = "dummy-dis",     .mux = 0, .level = 0},  /* DUMMY_USER_DIS */
+	[15] = {.id = 15, .name = "dummy-mdp",     .mux = 1, .level = 0},  /* DUMMY_USER_MDP */
+	[16] = {.id = 16, .name = "dummy-mml",     .mux = 1, .level = 0},  /* DUMMY_USER_MML */
+	[17] = {.id = 17, .name = "dummy-smi",     .mux = 2, .level = 0},  /* DUMMY_USER_SMI */
+	[18] = {.id = 18, .name = "dummy-ven",     .mux = 3, .level = 0},  /* DUMMY_USER_VEN */
+	[19] = {.id = 19, .name = "dummy-vde",     .mux = 4, .level = 0},  /* DUMMY_USER_VDE */
+	[20] = {.id = 20, .name = "dummy-img",     .mux = 5, .level = 0},  /* DUMMY_USER_IMG */
+	[21] = {.id = 21, .name = "dummy-cam",     .mux = 6, .level = 0},  /* DUMMY_USER_CAM */
+	[22] = {.id = 22, .name = "user-cam-smi",  .mux = 2, .level = 0},  /* MMDVFS_USER_CAM_SMI */
+	[23] = {.id = 23, .name = "user-vcp-smi",  .mux = 2, .level = 0},  /* MMDVFS_USER_VCP_SMI */
+
+	/* AP voters (24-33) */
+	[24] = {.id = 24, .name = "mmdvfs-ap-cam",   .mux = 6, .level = 0},
+	[25] = {.id = 25, .name = "mmdvfs-ap-camtm", .mux = 6, .level = 0},
+	[26] = {.id = 26, .name = "mmdvfs-ap-vde",   .mux = 4, .level = 0},
+	[27] = {.id = 27, .name = "mmdvfs-ap-img",   .mux = 5, .level = 0},
+	[28] = {.id = 28, .name = "mmdvfs-ap-ipe",   .mux = 5, .level = 0},
+	[29] = {.id = 29, .name = "mmdvfs-ap-dis",   .mux = 0, .level = 0},
+	[30] = {.id = 30, .name = "mmdvfs-ap-mml",   .mux = 1, .level = 0},
+	[31] = {.id = 31, .name = "mmdvfs-ap-smi",   .mux = 2, .level = 0},
+	[32] = {.id = 32, .name = "mmdvfs-ap-ven",   .mux = 3, .level = 0},
+	[33] = {.id = 33, .name = "mmdvfs-ap-mdp",   .mux = 1, .level = 0},
+
+	/* VCP voters (34-43) */
+	[34] = {.id = 34, .name = "mmdvfs-vcp-cam",   .mux = 6, .level = 0},
+	[35] = {.id = 35, .name = "mmdvfs-vcp-camtm", .mux = 6, .level = 0},
+	[36] = {.id = 36, .name = "mmdvfs-vcp-vde",   .mux = 4, .level = 0},
+	[37] = {.id = 37, .name = "mmdvfs-vcp-img",   .mux = 5, .level = 0},
+	[38] = {.id = 38, .name = "mmdvfs-vcp-ipe",   .mux = 5, .level = 0},
+	[39] = {.id = 39, .name = "mmdvfs-vcp-dis",   .mux = 0, .level = 0},
+	[40] = {.id = 40, .name = "mmdvfs-vcp-mml",   .mux = 1, .level = 0},
+	[41] = {.id = 41, .name = "mmdvfs-vcp-smi",   .mux = 2, .level = 0},
+	[42] = {.id = 42, .name = "mmdvfs-vcp-ven",   .mux = 3, .level = 0},
+	[43] = {.id = 43, .name = "mmdvfs-vcp-mdp",   .mux = 1, .level = 0},
+};
+
+/*
+ * mmdvfs_mt8196_soc_data - SoC topology and configuration
+ * Uses HWCCF DVFS Voter
+ */
+const struct mmdvfs_soc_data mmdvfs_mt8196_soc_data = {
+	.rc_table = mt8196_rc,
+	.rc_num = ARRAY_SIZE(mt8196_rc),
+	.mux_table = mt8196_mux_table,
+	.mux_num = ARRAY_SIZE(mt8196_mux_table),
+	.user_table = mt8196_user_table,
+	.user_num = ARRAY_SIZE(mt8196_user_table),
+	.version = MMDVFS_VERSION_HWCCF_DVFS_VOTER,
+	.vote_requires_up_ready = true,
+};
-- 
2.45.2


