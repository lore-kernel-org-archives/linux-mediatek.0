Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6FD606A32A
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hUOu/qJT;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OqyF5fVT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5NPBM8+agl99rn/OdiDWPsuEqclyPL16hP2K+AdlAUg=; b=hUOu/qJT1VngXtVUhIAolQ63zb
	YFAX0veUV8k36MMA53sQ8nb51Fi3MBVJnlGJzOowMtGMEg3RDULh9wdoGjct05YfroTjZ0P5IwC5I
	j92uh/EOeaOeos/EahC1PokjoCXW5YWbDrr836ZfwgIqNRg1CZCyLgYTlEK3KLeYjLlZMxE7McOiV
	ndGqriRtPjtXSYmuO/OEaXokExz4IN/Yu87Lx8zL/A4r1sKOVm9vjvPMD2Zc2VuKmWQwsdxR4tha6
	uCIW44tglDxesH3yVkKClBFcTiFJuN1+KlxOKxp8BwaBK1sNR9AIPlDvwxo9QXcZNRphwRO/hu99e
	Yi9LDJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnB-0000000DBLi-0VXT;
	Thu, 26 Nov 2026 12:41:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn5-0000000DBEg-441R;
	Thu, 26 Nov 2026 12:41:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5B2F412DA;
	Thu, 26 Nov 2026 12:41:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696891;
	b=F7wrCR1aX/khKgcJjKP6HAXjIQe77ZbRwPe0ws4jX5QYRfPDhsLjYCiInuyKs/R/Rudj
	 WrerfjOsKzgECKuGJcMMnVafj05OcjEv8AnEbZ03OzBFN2cFOAqk4iiiGT5TfIPOEI7qK
	 IqS4mD1HuCh5PKzBQfYr9JN2/rakYhhfN7Yc7kHba0uGbCOueS39Xa/k6gzU34SkU0Fy6
	 IUYki//ixIy1yzvjyyGGQ7OUOcMxjwvA6euen9gxrTegQbB3CHTR5EYGncQLdFx0E0LBs
	 i2WNy7AgeysLuajTCjuUlTcIvmmMrqASD9AmQC/lNa47sX86vr2GAYf6JSmFhKBYfTQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696891;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=5NPBM8+agl99rn/OdiDWPsuEqclyPL16hP2K+AdlAUg=;
	b=vwDEH40NOio+S5GxV0Qjla3wvSUT54XhswXdEwBCm5J1Cez89bduOKNcesnEo/urh+hC
	 dX81CfwzVZJ8ett2ypYCDZ5Aeiq7L4C1cIVLydk/20CFG9q+01m0qOw7x/E3LEBpioE/6
	 0Theun8ZOOvvVBFWXY1VhnNd/d81y6TZB7k+Ueu2dxZE/8G1TnlpM2Sqf2HlUvBI9AU2T
	 j1xX0kNa2wg5Z4FxCPJRbjQdXWcQpFHBxG4ZnDx4rwSzK9iXs4gLa+zL9ScImR2cmfO+i
	 /Plwv+Xu268J/wBz5tzt2KE409t6d9VRxNlpGUSNxBh7I/vJwl8z0NANZ69e9zyCYHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49B9B1F000C4;
	Thu, 26 Nov 2026 12:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696891;
	bh=5NPBM8+agl99rn/OdiDWPsuEqclyPL16hP2K+AdlAUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=OqyF5fVTmYVMnrrUrJHbo6jq59AB/toLRezRARTYvNkMdhOjsqrJ3YbkfFLTB4Kj4
	 HXBp9yYwuaBZzY3O204Jn3hbRNgkO/babKiKpKuKzZSgJL0Nr9DQOqsPFNoGcXiP3R
	 gFrEz96Jkc7JmJhQkawx8v8oMI8NKEmG8Qfcqb24Uiixvs4GWm/NySnBf9HzsWnBa9
	 sMg5zSQSW2P5RDA0XxEK/mSXL61Vhqdho1uUG0S6ARjLNeRbhdimiOGOpFe4GYYvwL
	 Y3UhrnbWguHEi1LT0mxKZ6cZntA5+0Bn+2hK5Og9rLgA36v/SmvIsXySZYMEba/fT1
	 rczVL04lXasog==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2A3094D4DC;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:59 +0200
Subject: [PATCH 6/8] watchdog: mediatek: add mt6768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-6-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=2135;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=jAPSajMnZh+hMZ6iDj37c2MT6NvYmDln5J/TW+J+zRs=;
 b=Yz4XRtVNQJXynvl4XLUm7InE7Brv5zcZOoVcd5MwlGAP/i81oe4cNulQo34Tz0uSKj0mqBVUi
 dT3sHhHT4SGAOYwJErNTU9b0mT7LifQfzM4ClSSGCe/AyruV2MQkL+E
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add support for mt6768 watchdog, which provides 12 software resets.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d180727986f2..45d56e8b5ef0 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -11,6 +11,7 @@
 
 #include <dt-bindings/reset/mt2712-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
+#include <dt-bindings/reset/mediatek,mt6768-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mediatek,mt6797-wdt.h>
 #include <dt-bindings/reset/mediatek,mt8167-wdt.h>
@@ -107,6 +108,26 @@ static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
 
+static const u8 mt6768_toprgu_sw_rst_tb[] = {
+	[MT6768_TOPRGU_MM_RST]		= 1,
+	[MT6768_TOPRGU_MFG_RST]		= 2,
+	[MT6768_TOPRGU_VENC_RST]	= 3,
+	[MT6768_TOPRGU_VDEC_RST]	= 4,
+	[MT6768_TOPRGU_IMG_RST]		= 5,
+	[MT6768_TOPRGU_MD_RST]		= 7,
+	[MT6768_TOPRGU_CONN_RST]	= 9,
+	[MT6768_TOPRGU_APMIXED_RST]	= 10,
+	[MT6768_TOPRGU_CONN_MCU_RST]	= 12,
+	[MT6768_TOPRGU_C2K_RST]		= 15,
+	[MT6768_TOPRGU_AUDIO_RST]	= 17,
+	[MT6768_TOPRGU_CAMSYS_RST]	= 18,
+};
+
+static const struct mtk_wdt_data mt6768_data = {
+	.toprgu_sw_rst_tb = mt6768_toprgu_sw_rst_tb,
+	.toprgu_sw_rst_num = ARRAY_SIZE(mt6768_toprgu_sw_rst_tb),
+};
+
 static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
@@ -632,6 +653,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
+	{ .compatible = "mediatek,mt6768-wdt", .data = &mt6768_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt6797-wdt", .data = &mt6797_data },
 	{ .compatible = "mediatek,mt6833-wdt" },

-- 
2.56.1



