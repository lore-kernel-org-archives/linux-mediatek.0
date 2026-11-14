Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EA0606A323
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0d9cNlXA;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hySb2yxM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lMB4U1Fc6lZ7bxz5XgmRjw9LJaNctrQheQ8n76hHvRI=; b=0d9cNlXAG82yK825fUt+JiZ/Bi
	gKqaTKU0S9T+cdQhMmb6CiDtF6BB9/dXckHqyKKbRDR53BGAMmujn7WZRbnJapIgDN2oJL8cJBVDG
	4GjXroIiQNyBC51q+NUmSn0ybpGMWRjGhdvO5MTlF7THJlNIFNNNTmucnhYW306RX0nwlYsJCkzqQ
	y6/DGQAySUA3SRHXlhM/69AEXeW5LPCNDVWlmo7b756gu2QRkcVPiKEY95SWzJ2dNkHYQKTY5aZV4
	0i1smQMp+6NJ3UpTUUPIMFhy98Bi9buksdiXSBnaEr6tm99LbFlqCPLpV6it184VYmHjqzeCtUKWJ
	fIh2OHsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCNU-0000000Fwu1-1SQH;
	Sat, 14 Nov 2026 11:57:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMj-0000000FvzX-3viz;
	Sat, 14 Nov 2026 11:56:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9678145AA5;
	Sat, 14 Nov 2026 11:56:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794657377;
	b=GXX0Ov8bGWQtK2DYru7jVTjkl63rANRCMv4grRbN4heZZhsdLOYxycn8runnhsIw/IEU
	 btBJjPHKq3pMUnGIpJsKKLu2Zejz/3iJPyd2RxJHM6l4PZXjZAvtabG1psavQZ1Ly+R3r
	 fJRAkV1JN03aLTRzK7HMkWyaDBn9yS16zcldHoivuCzJBkOkzWgfEt46oVF+OtbgTxLe7
	 rvUvZkmV7tvoBTAsUCPStb3pu/7n2DJ3y9GCSOxM3zpgMcU1TfYX0Y89ibVWrcLUa/r4R
	 RvHu2k3sZF/cjOjuFyCtEA9fduYU1AjKm3iizHaOpO87Uq890p7qZ+QZK1X6wRvRS2Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794657377;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=lMB4U1Fc6lZ7bxz5XgmRjw9LJaNctrQheQ8n76hHvRI=;
	b=TISMcg7lwC7Tha//zPw/tHPZXcwg8I1+YaR+ulQJVZQ1uRty6ZNrN4s0drH+ztQ0BL/Q
	 +xlMUEMhT1ke2oeohOGYKOXp6MWgDsrsuisVhJ1jXKcvlXG8IRyLwnWsEQ3du+AbuWGjK
	 fJQ6kAwwkmTFplaSKQHpmbQ5fB2XFFXnJ+WLpNEzmm5Ti4ZCq15mgC0JXelCnh8JmO+Aq
	 fplFLV2oFd0m+rfVn/9DI0kxgH5Y2oz5DrgEfb81NE7/J56AqkrVLSGyfJ5nIWBmlAwJq
	 peP/bICwfTTiMJwjVhJ76A8A29kwLPjARvXlC0KFJT2xiwcwiOZqpiYfmI0bBNvLWSQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE2291F000CF;
	Sat, 14 Nov 2026 11:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657377;
	bh=lMB4U1Fc6lZ7bxz5XgmRjw9LJaNctrQheQ8n76hHvRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hySb2yxMsIBlX6a+DlRFywRajbNBiR03N9EC6AhPD53BmaYiAqyMQcRWnzSSAxPSW
	 5qjnFQdaGfWcpztcZvwt6HL388ENZIrtzLE8bcFlu647CRRVtdImjBIA82D7YyKlu6
	 tFAQc9eU6pDVi61KHuRVAi+13hW2aoSbyV6+dQgBjd8jNhTlX8EJQCqjwcPljC3Hus
	 VJ2jrT02HUD9oXFIUFf3PB6k03j/wo6uZ/L0q7zLiO6Y+MYA/TpE0GMBOfma2P2Olw
	 8PKnBg0KIhcZyqrGF6dIDzrqvUW3+3NRQac5rHyQly5qWogXMRVNw8UNm5Ba6DypXb
	 0mwVryMZ7Mebg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF48249D85;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
From: Larisa Grigore via B4 Relay <devnull+larisa.grigore.oss.nxp.com@kernel.org>
Date: Sat, 14 Nov 2026 12:55:41 +0100
Subject: [PATCH v11 09/14] ufs: dwc: Move shared M-PHY CR bitfield macros
 to ufshcd-dwc.h
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-ufs-s32n7-v11-9-dc36e11919d5@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794657370; l=1821;
 i=larisa.grigore@oss.nxp.com; s=20261114; h=from:subject:message-id;
 bh=JX2nsOabUy/TBGxhVK8w2TevyQp3cyFlyb2qe5sxI0A=;
 b=Fu0qGYjnE491KcaphLwzl6jBvpI8aINDS+ArWpneGGfhkK5KZuFvjmnMAB9ntT3OqYJIyWG7W
 tKG48vuTXGAADdc/rukgP8Jhq8bCxTikVSGDwCsvCJtMm3N+AHde+bm
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Larisa Grigore <larisa.grigore@oss.nxp.com>

The bitfields of the FAST_FLAGS, FW_CALIB_CCFG, RX_OVRD_IN_1 and
RX_PCS_OUT M-PHY registers are defined in the AMD Versal2 driver, while
the register offsets themselves are already in ufshcd-dwc.h.

Move the bitfield macros next to the register offsets so other DWC based
drivers can program these registers without using raw values.

No functional change.

Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
---
 drivers/ufs/host/ufs-amd-versal2.c |  7 -------
 drivers/ufs/host/ufshcd-dwc.h      | 13 +++++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-amd-versal2.c b/drivers/ufs/host/ufs-amd-versal2.c
index 4d6e08ac6ced..dcca6be5dad0 100644
--- a/drivers/ufs/host/ufs-amd-versal2.c
+++ b/drivers/ufs/host/ufs-amd-versal2.c
@@ -22,13 +22,6 @@
 /* PHY modes */
 #define UFSHCD_DWC_PHY_MODE_ROM         0
 
-#define MPHY_FAST_RX_AFE_CAL		BIT(2)
-#define MPHY_FW_CALIB_CFG_VAL		BIT(8)
-
-#define MPHY_RX_OVRD_EN			BIT(3)
-#define MPHY_RX_OVRD_VAL		BIT(2)
-#define MPHY_RX_ACK_MASK		BIT(0)
-
 #define TIMEOUT_MICROSEC	1000000
 
 struct ufs_versal2_host {
diff --git a/drivers/ufs/host/ufshcd-dwc.h b/drivers/ufs/host/ufshcd-dwc.h
index 1abf2b1deac4..a76009b42088 100644
--- a/drivers/ufs/host/ufshcd-dwc.h
+++ b/drivers/ufs/host/ufshcd-dwc.h
@@ -35,6 +35,19 @@
 #define RX_AFE_CTLE_IDAC(n)	(0x4001 + ((n) * 0x100))
 #define FW_CALIB_CCFG(n)	(0x404D + ((n) * 0x100))
 
+/* RX_OVRD_IN_1 */
+#define MPHY_RX_OVRD_EN			BIT(3)
+#define MPHY_RX_OVRD_VAL		BIT(2)
+
+/* RX_PCS_OUT */
+#define MPHY_RX_ACK_MASK		BIT(0)
+
+/* FAST_FLAGS */
+#define MPHY_FAST_RX_AFE_CAL		BIT(2)
+
+/* FW_CALIB_CCFG */
+#define MPHY_FW_CALIB_CFG_VAL		BIT(8)
+
 struct ufshcd_dme_attr_val {
 	u32 attr_sel;
 	u32 mib_val;

-- 
2.43.0



