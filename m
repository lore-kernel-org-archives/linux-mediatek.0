Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC08606A32F
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 04:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lzLbFZaS;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/7d7/nH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=; b=lzLbFZaSLgfXr301fH3jNIrV6l
	zabUrijHb+gBGgKMR5/A3+nr6kU9oOxFwuCbnF6djFs0v0pjyDxOfY+t6cVSjZ4ZDWJQ3resFcK+5
	3IvS34aArG6DPd3sTvXipJMsbqGZPhM+gkMj6B4P1CNwGWKDSk1+kuNoLurzDv74Ad8i8PRyWu+Y5
	093j8obxGSoZtZTYDh+pVFAsclxZIjF+MnBWomnapCgbHUSfJNgCexVV3JHzm3gWqrtWsFjEkd0wl
	QyrvGB3cHPO5JpFFFArKXXZQydzu4S6Aty5BfRRN/YX7Lonuiq+3U0Cx1ifNWyskIrcCLTFxiyif0
	JOO/HAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAB9-00000000NPo-1pbM;
	Sat, 28 Nov 2026 04:36:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAB0-00000000NMN-09ws;
	Sat, 28 Nov 2026 04:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F27060210;
	Sat, 28 Nov 2026 04:36:41 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840600;
	b=OJLFQfjNNCanGx5MS4LtMK9nIjme0/0Zfp5kJH5FOrsyGdQ/fJRxKEGlp6wm7GiPzYq4
	 82IuGp6mfMkkoa5s5ffpbkJPnsoXRdZneREzBil1hyHaByMJ1lmT3cxbdxy7csE3pcI+O
	 ncgHwk8zqpT0SR1fT4z5QUDWhC9dLtoFNNac9HNA6R1D6DGcL+STMo1i2UiebKghTVNN/
	 avunHRxRMWh+rKuoMO0s2pzPWI5tkhZeVxqxatJS17r+VbI8sa49fO6bRL5W5o/E/csfj
	 0AF1uzfaAipmwQYcd2hOsAsb5nitJSRY8RXCKcAcHNqN//M/ZcFWXDonCP1wpYpMDeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840600;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=;
	b=FHmrF1NIAfil1mJfgRmozFAQE8NktLgO9kwrM4n30fr8ATYBi4tTDcyvWfRvvrUw78an
	 9ekRK0hMXECvItOrsATfi0EfmtKheZFgw8RApPkgPK9JsCC1YVTkz03RP2+JAuW0NZl0s
	 6ypBJRlX0RgNI5x7Bk/fFgicBvBSrtkl12dvq4J2bT8R06LNfu4oLOb5wZ+TEVsDrJmzV
	 fJ6LrY93ZNwXOX6u4DYp7xLOsqOPThw4HDZn/4mBLvQBZNdpgZRhTE0v6N8jzNcvD+Jeo
	 6TmzTR2WxD5Y5p/uLUTxnuH5mGGFcWpL37MT3S3ezEv9/mHbRkcZQja0X0BOAAM7bbg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8138A1F00899;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840600;
	bh=QlLGI59kompAbULemrC71uahTx31+jraBc5C5XqlBho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=h/7d7/nHps/SidZTBkG6kVWL3e4Gq6IK3Z298t+xf/GgzoJ8KGhQJKjPpkxFYuEDH
	 sKd47o2q15UIGTJhAXfdT+G/fZVxUpF5zosGIOjPDyKONpvFBEVu9m5iBNDhxy1UQa
	 zV35WW8j66FRPv5RwLmDmkb0KJVHs3ghLtznFTcR8H3vArnXZc2KQO0fX4qskOWPGQ
	 qHUrrFyfNcqJoYht1env1vJXdXg9tz3bVRvRX84466DJgAOlOgrOKHatzJ/O82ohSz
	 6NOOHAIaoPNswjX/sfTUD3neFaMom+QkONRwsjJPLROZix0neuxqCbLYblO29vHR+5
	 a0Y3ESORtFJhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0E9ED4DFAF;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Date: Sat, 28 Nov 2026 04:36:32 +0000
Message-Id: <20261128043629.67417-4-iasnezhkov@gmail.com>
In-Reply-To: <20261128043629.67417-1-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=3515;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=+pYLSMXwJ9NiQvGwwMRsrRZ23/yXroYxHZhGWwEq/04=;
 b=L0FHebRo+C8oWpE+WDfSYmZh0ikTiJjDWomJelSI/jNBRMdKsuJf28cARtdkOpMhy3ItV0aex
 C4Vrre4bCgxCXWwOjGzWrNUVlQF2+MAMUP0XlcJNRbkFpPZY8BWDCDg
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
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

From: Arseniy Velikanov <me@adomerle.pw>

Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99/G99+/G100/
G200 and tablet/IoT variant MT8781) SoC.

MT6789 uses the PMIF-SPI arbiter interface with the same register layout
as MT8195/MT6833: bank 3 interrupt registers (INT_EN at 0x450, INT_FLG
at 0x458, INT_CLR at 0x45C, mask 0x180000, matching PMIF_IRQ_*_3 in
drivers/spmi/spmi-mtk-pmif.c) and WACS2 software interface at
0x880..0x8A8. Register offsets and wrapper parameters are verified on
live MT6789 hardware (iKKO MindOne, MT6366 PMIC).

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v4:
- Rebased onto linux-next (after mt6572 additions).
- Clarified PMIF bank 3 INT_FLG (0x458) / INT_CLR (0x45C) provenance
  and MT6789 SoC variants in the commit message.

Changes since v2:
- Added PWRAP_INT_FLG (0x458) and PWRAP_INT_CLR (0x45C) matching bank 3
  PWRAP_INT_EN (0x450).
- Depends on patch 2/3 so probing does not write wdt_src to offset 0x0.
- Updated with an AI coding assistant.

 drivers/soc/mediatek/mtk-pmic-wrap.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index bdc0f90..a395b96 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -640,6 +640,19 @@ static const int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
+static const int mt6789_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x450,
+	[PWRAP_INT_FLG] =		0x458,
+	[PWRAP_INT_CLR] =		0x45C,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8A4,
+	[PWRAP_WACS2_RDATA] =		0x8A8,
+};
+
 static const int mt6795_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1317,6 +1330,7 @@ enum pwrap_type {
 	PWRAP_MT6572,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
+	PWRAP_MT6789,
 	PWRAP_MT6795,
 	PWRAP_MT6797,
 	PWRAP_MT6873,
@@ -1859,6 +1873,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6789:
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 	case PWRAP_MT8195:
@@ -2327,6 +2342,19 @@ static const struct pmic_wrapper_type pwrap_mt6779 = {
 	.init_soc_specific = NULL,
 };
 
+static const struct pmic_wrapper_type pwrap_mt6789 = {
+	.regs = mt6789_regs,
+	.type = PWRAP_MT6789,
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt6795 = {
 	.regs = mt6795_regs,
 	.type = PWRAP_MT6795,
@@ -2474,6 +2502,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6789-pwrap", .data = &pwrap_mt6789 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
 	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
-- 
2.54.0 (Apple Git-157)




