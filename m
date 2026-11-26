Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E42606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zUQI9o6O;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7KZeoc2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hisJ57D82qW2wfu5UBTynuOURDKnlkhMoLWt3orFoqA=; b=zUQI9o6Owba+IwEYU02qYWXI4S
	j55Pj3FvuR8UsXN+pFSc610fvwBEDdhaLA1QXxmYy8Z1ZCRd3OZ492j/9jul+4x7R9/sA5NB24mE1
	WR/LuXnU3jWM1IpcWVVEGOo4E33HlM3/ZM+Rzk6qx9p4vkz5+BTE5L6VYCe2Hq/OooV1qMoBa0BMJ
	IO+ETbss1x3nJ8romZFLk88uTZxsgGwRB0b/gCZIl1RLEv+uCVUhEfiX42ihkOEQGb92OCOp6gizO
	48sLdsJo7+oHYi4+WvHkBb+/h0H+95GSAvSETo78bZZeegJwCcw9UNcsnu0zeXTRHTXGtijqLjL9a
	UQ9rkZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1S-0000000Bcnb-0xzt;
	Thu, 26 Nov 2026 00:07:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1K-0000000Bcik-03fI;
	Thu, 26 Nov 2026 00:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E85B61EC6;
	Thu, 26 Nov 2026 00:07:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651643;
	b=BK9jIC4vEGgGqP4AsOWcBQEFeoH8k+EI808Z4b0tavxIMBiKE4vt6qwuZo3sHpnEHUql
	 VfsxGDeEFMXfelNtXjLarK56KZ6/6Ya8ur7r29Bd03/tWPjpjYtn5SE8LPYlo4h86Ji39
	 PdkQhbUBpK3qKRIufUZQv1dOziOOPkYTBNtX0t14ouu/kEqC3t2deaYxq/GIIUlZUiuem
	 LQioZlAAyBe3KniMLWpgua/cofS2hLu2KPDsG2gTZ0e6EWU65dspTCSZxAuhx/g/xi9D1
	 ah4SKaHED+jPA0UTSgwivLTMLAOuREXktWREl5mCRPGQKMSslN9chAOH7f7UJLguYQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651643;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hisJ57D82qW2wfu5UBTynuOURDKnlkhMoLWt3orFoqA=;
	b=0Cm8rN5qOa6/7JbqTklzvT41DFG7tvT6mA5br1QiZW4v5LxXWKrmGTpRpEqlN1vqO9f2
	 ft/XRgqajOnZb2leT2IU0+8RUslDatAnwbO1fffWJagEuLQsKW9L11SOTBTRO/UzW/q8t
	 7AHQXIBjv9MW80CCPxi/53LhFoQFk0E8lLmBec3tPFyovdvnuvPftZp5eJtsruiBlTZe1
	 i/t8X8Ja4j0GUsu1cn2+C9i6B10g1FJN2tvciRgbqg37cYyd6h1RLcgbq3F+IEB5/F/SI
	 hKJO34M6M6vQd+BCYOZQz0k9zbq7MK4zIE7sRDem5TTVYDzsouwxvs5X6yFM5QzyO7g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D22A11F000F0;
	Thu, 26 Nov 2026 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651643;
	bh=hisJ57D82qW2wfu5UBTynuOURDKnlkhMoLWt3orFoqA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=Y7KZeoc2GfeWD3tPk7uE9U0Ty4RN4B1TEbE2DRY/PgvxFS515NMnirkUAC4rlHvFZ
	 uICYpA5AWOmgItb4PK7c9QPvnS0X132G8O57awldVGmO0ncDS7U94i/kaWqgqf21m1
	 KObpu/m3ojeCeHhfhj4zktpS62qmIXmD3KqphTyLe6QMyGELScoidh6l/nAGAK7YD1
	 cMrGR5idzwNN6kwhDUb3tpZVtFeSuq/iMgJ4D5psbLZFqtonykRa3CUCdcsrzrhIWe
	 U1IwpKynDuhLAxjNYUeWNrl9+c2PbAPSyurYBPYD8F0fQKiyuAH8BUNnNR4nk/e6O9
	 cDqRlOYKIjByw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5F3934D0F2;
	Thu, 26 Nov 2026 00:07:12 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] soc: mediatek: mtk-pmic-pwrap: Add MT6789 support
Date: Thu, 26 Nov 2026 00:07:13 +0000
Message-Id: <20261126000711.16163-3-iasnezhkov@gmail.com>
In-Reply-To: <20261126000711.16163-1-iasnezhkov@gmail.com>
References: <20261126000711.16163-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651631; l=2846;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=IA1yemFDEOZNDoYKUosrewCxTfRZEAv/5k2Ga2MkOj8=;
 b=dJOot0y/qw2URUtWW9W4oQHtwzXKvNti4YmwQx9F6cY8yot7j0l1upOnW+59sUfb/nu+pLVHa
 REgt3SqIGdsDD4RrmAZuQm/XUcMQx7rLXiAQVlfTrDCaUgZEzPIG8Dy
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

Add PMIC-Wrapper support for the MediaTek MT6789 (Helio G99) SoC.

Register offsets (0x0, 0x3E4, 0x450, 0x880, 0x884, 0x894, 0x8A4, 0x8A8)
and wrapper parameters are verified on MT6789 hardware (iKKO MindOne,
MT6366 PMIC). Updated from v1 to mark mt6789_regs[] and pwrap_mt6789
const matching the surrounding SoC definitions.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 9067718..c74e916 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -640,6 +640,17 @@ static const int mt6779_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =		0xC28,
 };
 
+static const int mt6789_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x450,
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
@@ -1316,6 +1327,7 @@ enum pwrap_type {
 	PWRAP_MT2701,
 	PWRAP_MT6765,
 	PWRAP_MT6779,
+	PWRAP_MT6789,
 	PWRAP_MT6795,
 	PWRAP_MT6797,
 	PWRAP_MT6873,
@@ -1852,6 +1864,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6789:
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 	case PWRAP_MT8195:
@@ -2302,6 +2315,19 @@ static const struct pmic_wrapper_type pwrap_mt6779 = {
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
@@ -2448,6 +2474,7 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
 	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
 	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
+	{ .compatible = "mediatek,mt6789-pwrap", .data = &pwrap_mt6789 },
 	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
 	{ .compatible = "mediatek,mt6797-pwrap", .data = &pwrap_mt6797 },
 	{ .compatible = "mediatek,mt6873-pwrap", .data = &pwrap_mt6873 },
-- 
2.54.0 (Apple Git-157)




