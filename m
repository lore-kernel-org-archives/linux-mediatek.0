Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0CA606A330
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 08:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YNUE6/hC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sd0tTMMe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ripky/Wqpg8/U8JBxi11/FBXeAvlntaIy4sN3H2zMWE=; b=YNUE6/hCVCmbBUiuFghgC2AoHy
	PQu8xqAaWwsahk7k3rb7RJGlr7uUf8gAttJNjNJ3NehadZbDA40UMnXSETJbx2NgXzc7i6O6V2wiY
	CMSrrAhnsy6q23zQIHBmZW/HlfrdYXFxnLlE2GyKxI0r4Ig/6xt9hcIsw92IrtdEow0r+3N7m3T1c
	wR5dm0mY1/r++tAna0V2SaYkmpHEUz+Q+7XfDtpbQ614ISTQeMe3NFVdLw2Yt35MN0b7ysY5MnAN6
	sJddBHU7Z/x+hAKK/QfQBek3q49j5G2wcquQNEl2JFO2h7uWwUbosaobZxtNbmEkCQkz5SHkFehiN
	jNKbyw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrR4-0000000FGIo-2o91;
	Fri, 27 Nov 2026 08:36:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrQk-0000000FG7i-1Cu4;
	Fri, 27 Nov 2026 08:35:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1064C43BBA;
	Fri, 27 Nov 2026 08:35:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795768541;
	b=RHVn2fYscarpgP0cyPRMLK4q4322bzyBgSSARVf7pRCH+cLbnFuyf+sEnsoi0itQIGbu
	 JWGxXqI1m0BEmVJ2xa382NsLtHR6XVZXGIIPwZLn5RaeMFhyYAEakOGjkOts80DKzjU7O
	 8p1ik2PichutlAfMwp69TWHL1JBWsuhZKlEwvwGtG4PTUhsbNBVNGnMdfBRPLuuxvi03I
	 P5GAPu+tpgoWiqBrUw5vLC8fYVVZqdvx7vEQr4vo7I9NEV2l/oD3Adnfv5ohVtgFNR323
	 UoFqydhRNSa9jmBL45Bn0XtSnjSc5naJJGLufdVU2aNlYr5b3xxjHiW34OQ2rFZUxng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795768541;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ripky/Wqpg8/U8JBxi11/FBXeAvlntaIy4sN3H2zMWE=;
	b=2gFUS06U6KjIIXm3uuzmXG7MTw8SKxpz7NCv8AXFHQYb8U5oaVmc4car8fJS8xYnDzdA
	 /Yao3JdN7wXnydbXN8pflug2GV6jzTUG6Xw4QDTcRR7Zaiuokg+DtqzPL5SucGjKURGYS
	 9N+KJ5djixKUfIyUaX5XgHtrNvVNY4b8RXGlpAvEtrdKMKVTa1kDlysQkmlSOh88O77GA
	 ype82YXffvW0nmBq5tMjf3ulHOII9VuD3W6ZbnT3cKpXZ+JRwnQssptYcxPrvhN2gQBQk
	 E3o1r2N7x8+D7xUWqMzoI0jqDKYerlHi02Sb+d9Zjf+GWiNgezMJOiQzyYxfImA0qwQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53A751F0089A;
	Fri, 27 Nov 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795768541;
	bh=ripky/Wqpg8/U8JBxi11/FBXeAvlntaIy4sN3H2zMWE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Sd0tTMMelFOPgTA1JNVwp27fQqqmatQtu2VTAfCQqeZ3IqPONUJxiaAU389Mwj+Dn
	 y5+jzO4lcyHDnzH0e+JbEvch41zB2UnUJaiXUDBrcv20WRkAmSQY2sPilBT5taJzsQ
	 wbGc61dTDgjHt8v5MSt3ISs3jKEq3FN51ebXnitsMS+JMMGsvA0GqIKnQn/aVqNpa9
	 BJciWuUZpvKA1wMFLNkIRpk+5R6NOUlEZlmeUfuqhsN4HSuoBnwAxYTb7fd1Xh9pEt
	 1gn3F1ACA2y4/6TjIYdQWFNyfVUzkJ4PxC9ChV9cK9QoURRRXaZYL5wNq8KC8YfQst
	 WyUuOLELB7SoQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D2CC24B64A;
	Fri, 27 Nov 2026 08:35:28 +0000 (UTC)
From: Murad Dadashev via B4 Relay <devnull+llamapersonaltv.gmail.com@kernel.org>
Date: Fri, 27 Nov 2026 11:35:15 +0300
Subject: [PATCH 04/10] wifi: mt76: mt7603: only enable TSSI with valid
 calibration data
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-mt7603u-v1-4-369bee9846f8@gmail.com>
References: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
In-Reply-To: <20261127-mt7603u-v1-0-369bee9846f8@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Murad Dadashev <llamapersonaltv@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795768526; l=2004;
 i=llamapersonaltv@gmail.com; s=20261127; h=from:subject:message-id;
 bh=4IaYHcBwvZmnHbxpYxkpmJhCguuy/P3jyF640wHXuhU=;
 b=TD/sl2l8Yn93BERqGpE3rvqWAWN5TlvzE1SQ69ag8aaE9rypjhi15EaN1QD9nxXYaM2geuQz7
 8Mw2sFFkCFYDVuP/p7cX30XWsTLUzqUSWX/vEVWzIwAiXzeRQJLCFV4
X-Developer-Key: i=llamapersonaltv@gmail.com; a=ed25519;
 pk=CeMIX207ioWRbMAA6A2GYgT+DpeVlKHVn7I0KjfHeCg=
X-Endpoint-Received: by B4 Relay for llamapersonaltv@gmail.com/20261127
 with auth_id=1664
X-Original-From: Murad Dadashev <llamapersonaltv@gmail.com>
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
Reply-To: llamapersonaltv@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Murad Dadashev <llamapersonaltv@gmail.com>

The TSSI enable flag in NIC_CONF_1 is passed to the firmware as is in
the TX power control command. Some devices set the flag without any
TSSI calibration in the eFuse; one MT7603U dongle has NIC_CONF_1 set to
0x2000 with a TSSI slope of 0.

With TSSI enabled on such a device the firmware stops transmitting
shortly after the first frames are sent in AP mode, and the device has
to be power cycled.

Only keep TSSI enabled when a TSSI slope is programmed.

Signed-off-by: Murad Dadashev <llamapersonaltv@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h | 2 ++
 drivers/net/wireless/mediatek/mt76/mt7603/mcu.c    | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h
index b6b746d1e56f9442aa12ab48bb211085798d89e8..6003d9233c12aa0e3e0517a380cb9d89cc596d59 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/eeprom.h
@@ -88,4 +88,6 @@ enum mt7603_eeprom_source {
 #define MT_EE_NIC_CONF_0_RX_PATH		GENMASK(3, 0)
 #define MT_EE_NIC_CONF_0_TX_PATH		GENMASK(7, 4)
 
+#define MT_EE_NIC_CONF_1_TSSI_EN		BIT(5)
+
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
index bbc8402fc98e3c99a9073cc70c3c492e21b761cd..eb633f5d7171e99a0339a2f44fa0ab39379642f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7603/mcu.c
@@ -384,6 +384,10 @@ static int mt7603_mcu_set_tx_power(struct mt7603_dev *dev)
 	memcpy(req.temp_comp_power, eep + MT_EE_STEP_NUM_NEG_6_7,
 	       sizeof(req.temp_comp_power));
 
+	if (!eep[MT_EE_TX_POWER_0_GRP4_TSSI_SLOPE] ||
+	    eep[MT_EE_TX_POWER_0_GRP4_TSSI_SLOPE] == 0xff)
+		req.tssi &= ~MT_EE_NIC_CONF_1_TSSI_EN;
+
 	return mt76_mcu_send_msg(&dev->mt76, MCU_EXT_CMD_SET_TX_POWER_CTRL,
 				 &req, sizeof(req), true);
 }

-- 
2.47.3



