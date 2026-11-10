Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162ED606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FwBbXGzD;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fES0nSiI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3C43Ev76AMmaA8sq4FI8sR8T2PCL8YdDgE1uNKTlnL0=; b=FwBbXGzD+xvJtbvYQHYvXGF8QR
	XsDVEikjtzTWV8kS20izkgKRWH0TVz346AZbBOGJ2RmP6tSwfRR5IZZdpfmvWEq9mZbHyjo9n1KJ6
	020Qis4Cym6Yp4KZ6HyCXxM/P4Rtz0wOympn1wEs81rnZv7XKuTsobMzOKBLoz6rog6QX7ZpBNbms
	wIYcmK4X4vwP8jr/ddps/siObPztZl08mbCDmJz9GKJWHnkUpZ0up7WSgQz6S0/xHiGrZDjpNVLQh
	qbSLOMcx6FoZVJkPmOdFyYAYALkqBwT4ykYY3R9iRa4RQZvK1JjWnCfg2OUqgBwtR82PFOZvr+wZZ
	0l5AZAaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrQS-00000004tAH-2yuL;
	Tue, 10 Nov 2026 19:22:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrQQ-00000004t9d-1xpv;
	Tue, 10 Nov 2026 19:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4BFD4375C;
	Tue, 10 Nov 2026 19:22:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794338553;
	b=QOpWnjqMgX16fa/NTmW9Pk5PiaeE0yOge68Ix4uohUSx67TifC8ZLhZW6skAL55CFmC0
	 qXfrOofRcRu+Cyra+75XJ8/29zrcRaR+1U91e7EBXNW5FtgwLW9TFgmUM/5M7Em5CEqZd
	 rhI1b/KU0LuIGcJN4g7eH96VxFXE5lonvGYY5eMHfwb2Y73FK8QsaGV++qXx2Tl8QwtgU
	 IjuvXDWwBqxvnX6s/qkJc52RDhbMibpLs88j0KYeFoFj4jeNthE/VtHXYfMmCauZU/14V
	 wI/9yT0jgAcGJ6/jl/DyfT64KjLODbElxK4DUO73VY0o9LKGroVeL/J3vJxSZyUBlcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794338553;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3C43Ev76AMmaA8sq4FI8sR8T2PCL8YdDgE1uNKTlnL0=;
	b=Kxn+TvIWf8bIVDfBOkyQcYPU+NTjAPvt6DEBsw+gbrVI3mn6bp/g0xNPEOXmOyW19Dh8
	 DDLXXzibUCiG/oAoyx3INbLHco6IM9bhsd4F4+Ohl8XRTt/yzUnIT5OB8BQ+bVSg0oCea
	 fnlcAfI7vAL/pdSU3WMNZwDS5qsJ2Jh90ntskQcpHYErUOT2NfCSnYI6HHOb7oawV3GgJ
	 PHN15b0bHNOQFjpHlWTjFcc0Dx1cWpaZisDcwuKiQ70xJdUibOMHJ+FNuIuuVXV4Fndbh
	 P6tUoMb1UBXsiXhHjUElCCqDlaNAu+x4zW2/2HbtGT2obMzWW1jgdLuti1e0uTUXsBg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C5FA1F008A2;
	Tue, 10 Nov 2026 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338553;
	bh=3C43Ev76AMmaA8sq4FI8sR8T2PCL8YdDgE1uNKTlnL0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fES0nSiIoILLZng6E4WN50LrBVpZWE+9UYDiqds4n+4gqqrSNcq5cPn5N3oU5anw4
	 SnAFawQMZicQ0Xx26f8wducmKYEweHjBn2PjRYstN8WOjLUD9ww8osu1NfIGukZIvI
	 mMMBesSzA7w4AwH3usX1fin2M47mer8j1LKANm6F/X4HT6DAtfG4ivV2pC7iERY7VP
	 /h/l6xEYUhEbAOgSH+khlddK57JRKJLme44Gw6a7w6fKU4PZV+KHFDNNJtMQiXFjYB
	 gyoh/PahB2yjOun6gY5zNwUaDyqoMl26tJoehBRsz13T978RmT2OyKNsiDOSfRhv6J
	 9qBLy0NosF+Hw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BAE4448C5D;
	Tue, 10 Nov 2026 19:22:32 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 10 Nov 2026 21:22:22 +0200
Subject: [PATCH 2/3] watchdog: mediatek: add mt6797 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-6797-wdt-v1-2-7f07755b6074@protonmail.com>
References: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
In-Reply-To: <20261110-6797-wdt-v1-0-7f07755b6074@protonmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Ben Grisdale <bengris32@protonmail.ch>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794338551; l=2582;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XN0xD57bgx+IYBVgDg/di/5aMiE8ZsNZz0yTSSqhsM4=;
 b=lBURJBTCWv0BYmj39ZK6Y8b99JQuvBYmQK4wEfwEzme9aU/iWZ7+9/rFbvi86AsP6wINMqFu4
 kT1uTnxRQThAtGvmR+UpUWM0QtrJWgzP+8kSVRueHoojO2XjbcJiIFB
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

Add support for mt6797 SoC watchdog, which provides 17 software resets.
The mapping table uses bits from the datasheet [1].

Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/watchdog/mtk_wdt.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index a210fe1569e4..56341f746704 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -12,6 +12,7 @@
 #include <dt-bindings/reset/mt2712-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt6797-wdt.h>
 #include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
@@ -110,6 +111,31 @@ static const struct mtk_wdt_data mt6795_data = {
 	.toprgu_sw_rst_num = MT6795_TOPRGU_SW_RST_NUM,
 };
 
+static const u8 mt6797_toprgu_sw_rst_tb[] = {
+	[MT6797_TOPRGU_INFRA_RST] =		0,
+	[MT6797_TOPRGU_MM_RST] =		1,
+	[MT6797_TOPRGU_MFG_RST] =		2,
+	[MT6797_TOPRGU_VENC_RST] =		3,
+	[MT6797_TOPRGU_VDEC_RST] =		4,
+	[MT6797_TOPRGU_IMG_RST] =		5,
+	[MT6797_TOPRGU_DDRPHY_RST] =		6,
+	[MT6797_TOPRGU_MD_RST] =		7,
+	[MT6797_TOPRGU_INFRA_AO_RST] =		8,
+	[MT6797_TOPRGU_CONN_RST] =		9,
+	[MT6797_TOPRGU_APMIXED_RST] =		10,
+	[MT6797_TOPRGU_PWRAP_SPICTL_RST] =	11,
+	[MT6797_TOPRGU_CONN_MCU_RST] =		12,
+	[MT6797_TOPRGU_MJC_RST] =		13,
+	[MT6797_TOPRGU_AUDIO_RST] =		15,
+	[MT6797_TOPRGU_C2K_SYS_RST] =		16,
+	[MT6797_TOPRGU_C2K_WDT_RST] =		17,
+};
+
+static const struct mtk_wdt_data mt6797_data = {
+	.toprgu_sw_rst_tb = mt6797_toprgu_sw_rst_tb,
+	.toprgu_sw_rst_num = ARRAY_SIZE(mt6797_toprgu_sw_rst_tb),
+};
+
 static const struct mtk_wdt_data mt7629_data = {
 	.toprgu_sw_rst_num = MT7629_TOPRGU_SW_RST_NUM,
 };
@@ -607,6 +633,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6797-wdt", .data = &mt6797_data },
 	{ .compatible = "mediatek,mt7629-wdt", .data = &mt7629_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },

-- 
2.56.0



