Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255D5606A33B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UygBiT4L;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2QlICBy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DmxVWbQtDMQqiEeIqIgo0HwoyTz8oaoNt+L9yRWyVi0=; b=UygBiT4LjcfP6RfP/+eBRtSGOA
	eZAtWcLA+a1jelefiwblAKFpukWodI2fPrEjYfSWfJcfJ0I7bsBXTJDzRrm2uzJcUNSVOO+2iXINv
	a3n0BtTeq7uldJ2rQwlLMrcDhcUI/zwJG714epkgkzoinUwiwwwVU5H6Y1WCC04MW1+yRjOYH7IJJ
	BbJ1YBOOvPafraGcpGBJ7zmYic6+86YF65bH85Yb0nFIdiq/EW5OLFIKF6d5qkrb7ATpIaMmitYD1
	w704QjKDoH9k82WAAbmQV6sOZE9AO0Zcowdicc6WtPAc/AgELeP/j2VIgc9u2+bRcac5Zfl+t2l+N
	6lIO1jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1R-0000000BcmM-3Pfd;
	Thu, 26 Nov 2026 00:07:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1E-0000000Bcg8-3s0j;
	Thu, 26 Nov 2026 00:07:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5E82841F20;
	Thu, 26 Nov 2026 00:07:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651640;
	b=SP5Fo3NU8sOE0+9YgWCsYJ4AuAHLMB0GXHZi50ZJjUXx55/QI+0ZaaGkR9Cu3mV2adbr
	 X2qfRYETyS+WbuEE82Wb8jdO/XSsYU1xhsl105BIhIkTIJCLHZRiMIlHj9p+JbqjaTDs1
	 6wP7gj/qW+SbanSYkkk3WxMa1E14NYzeHVi8BVpLTp+euctL9ndR6rIbtHtKKgKHLkuxj
	 e0bGyITDpNxBuzU+PnKHZP2xurfXhQ9Rl9PiDteMe/8Y7mEE6D9Nl1hkdL6El4fhasQOs
	 ElxUaoDxlS3PcxZIHHczVUqfvNb9YD90jDcMt1dnwBwyX1P3TK13xJFaHN6dxnZ9wyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651640;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=DmxVWbQtDMQqiEeIqIgo0HwoyTz8oaoNt+L9yRWyVi0=;
	b=n7it3IMU267k17a8aao9OZGqt0NlmD9Rj1YhNZtY1fSHlFGu4KDtJJHtuPqscCjFeqwD
	 B3MjKgg62Op91qjcvf68ZdpldiQg6uZ2Dgzi8Pd4N3ML4EY9hNwjevzGdjjGZTMhbVDwj
	 4+I91MP7bDlLtyz5r+NDlSMHBgZtg9XyKwyRxXZ9dGNtCcnya0kJu6g11FkaWPAhcBs+v
	 7qHr7rwD6bGHOoDjqayd89EyPui7jFzNbHfCsm4MfyC7pOQyiF2Erv1vYzH951bHs3iYL
	 2smoj5UXlaCBdC17VUPjbXpEq8x6Tj/vtxfr6A5Dswlq34evgq3MR6Pbxfyg34mXPiQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02DEA1F000C0;
	Thu, 26 Nov 2026 00:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651640;
	bh=DmxVWbQtDMQqiEeIqIgo0HwoyTz8oaoNt+L9yRWyVi0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=Z2QlICBy/rfJfsn1uRKNM1sAXv0f44D+5QzwZyK4hRYU+cCHjPtdmhqIVqe5ccjuH
	 IiNH4ymRRgDTXzrAd8L/NY6UFW05RBLDwrZh9UvXpteHSATLjrfPgjyvHE4+enZ0Oq
	 S5vDsHb2bdCh03ENooNyJxmVTzITiFcG9D4Ge6eH1avGMbVqOr3rqZFU8IPTvH97I0
	 i0GdgFUge6TSkL+86VU5kbTBoMkHtCzdJziOxWmvJjfTiOWjHp53y6gpcX+af7oxhS
	 7c2aD7IQfGgcToHCAZeIVn5g+Rzmd8wHYG2rCZdaf0oxfkbZCBFhnjcXOBR/SsqVoi
	 fvn0K21JvGmag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 81F254D0D8;
	Thu, 26 Nov 2026 00:07:07 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: mtk-pmic-keys - fix MT6357 long-press reset
 bits
Date: Thu, 26 Nov 2026 00:07:08 +0000
Message-Id: <20261126000706.15649-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126000706.15649-1-iasnezhkov@gmail.com>
References: <20261126000706.15649-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651626; l=2249;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=yS1/exCajzsB+ZjgzM6lYxa7Xj5JiEYFeRxg/8WGWXY=;
 b=diOxS1vAsQ/Ar98FTN3N06GgLgjkeb67CkWLvI1iKnQ9PpMbiXhpSkE2OW6CSiMILCaaZTS97
 ZIXdX5QiDtRAX9VjAbu7HnH15VzFlgcCZcw6/HVMN5w//Zp8zXfLNPa
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
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
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

The home key entry of mt6357_regs passes MTK_PMIC_HOMEKEY_INDEX, the
array index 1, as its reset enable mask, so the driver writes BIT(0) of
TOP_RST_MISC for the home key. The other two bits come from the MT6397
layout: BIT(6) for the power key and GENMASK(9, 8) for the long-press
time.

MT6357 shares TOP_RST_MISC at 0x14c with MT6358, and MediaTek's
downstream mtk-pmic-keys driver programs it with the same layout as
MT6358: power key reset enable at bit 9, home key at bit 8 and a two-bit
long-press time at bits 13:12. On MT6358 and MT6366, bit 0 of this
register is RG_WDTRSTB_EN, the PMIC watchdog reset enable (coreboot
pmic_wdt_set()), so with the default mediatek,long-press-mode = <0>
the probe very likely disables the PMIC watchdog reset on MT6357 too.

Use the MT6358 layout for MT6357.

Found and drafted with an AI coding assistant while bringing up MT6789.

Fixes: 297770ec5c93 ("Input: mtk-pmic-keys: add MT6357 support")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---

Notes:
    Not tested on MT6357 hardware: the layout comes from MediaTek's
    downstream driver and from the MT6358/MT6366 sources cited in 1/2.
    Not compile-tested in this form; the change only swaps constants.

 drivers/input/keyboard/mtk-pmic-keys.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 422a1f4..39cdb50 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -101,13 +101,13 @@ static const struct mtk_pmic_regs mt6357_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
 				   0x2, MT6357_PSC_TOP_INT_CON0, 0x5,
-				   MTK_PMIC_PWRKEY_RST),
+				   MTK_PMIC_MT6358_PWRKEY_RST),
 	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6357_TOPSTATUS,
 				   0x8, MT6357_PSC_TOP_INT_CON0, 0xa,
-				   MTK_PMIC_HOMEKEY_INDEX),
+				   MTK_PMIC_MT6358_HOMEKEY_RST),
 	.pmic_rst_reg = MT6357_TOP_RST_MISC,
-	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.rst_lprst_mask = MTK_PMIC_MT6358_RST_DU_MASK,
 };
 
 static const struct mtk_pmic_regs mt6358_regs = {
-- 
2.54.0 (Apple Git-157)




