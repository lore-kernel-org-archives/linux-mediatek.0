Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A8060A2617
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 19:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dg/psaIg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANuP8qVG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tYBRSyEfnv5cMd7rhyV1pLhfI+yoANtLDE25nt17o90=; b=dg/psaIgN9RGkmfPTiye9zWsvC
	qsv2uBoPwQLmnZnbmeklP/BZZ/z+xv63yLUgSXAf3mzEAyd4s12ZrxyG5cj9+7csfYQvJwH0hzawg
	aXznVav1Jfcm1gqg17MXTGW8Nx7AwpI52wdrenVMYsT9Voy8mj8P3kV+/XZEDM84If/2RnlZCZC24
	udV7y6rvh9xX4aAicN0yEn0q2CsrSC8jkfSki6/wV9LZ+Mp/wGfR875lvZpCiNhNmWL/ivQsp6iKQ
	DG2SK/dXOZfJyLIOFu0ammCcrTKFpjlGHdokjeRebYrlO6eXWX2wRUQljUbPwHbTpNJSQrCsdjfoY
	YyXsH+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrQY-00000004tEq-2EhY;
	Tue, 10 Nov 2026 19:22:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQrQR-00000004t9p-3gem;
	Tue, 10 Nov 2026 19:22:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 52D1861299;
	Tue, 10 Nov 2026 19:22:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794338555;
	b=Y4csWWUXiqt3PQGnP9X8ogVTSgdatNVQFYGZkNT2mlqHuGFnTZ1DVrXrrCMH7H96Ssgn
	 F4Xz5GMDqQ1qG01vMEyeFOolHKMz31qGJBUYiyz8JZzugmt8Sv1AapcaJzBEQsrkqPx8h
	 W1GiHoRBJ6ap2qSofpX2pwOY3M74iktqXPIVTClkpwX3Qw1PYPPIbUAS1VLQjkUeeGOk/
	 Cgyw5k7psJvdncwb3lwtBQU9RvmEtItDnjc0VPmIgM86C1qrCbODNOzliDQLP3Nhk673y
	 axkc9zYOeOlDyboUQeLMmH9S8jcg7+nA68onCnsLVLUih4WWFDtyivsVUKLtQhyHHxA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794338555;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tYBRSyEfnv5cMd7rhyV1pLhfI+yoANtLDE25nt17o90=;
	b=P8l8ZzWhZ6fAwmKS7hQonWm5r92PIRPHAvBLe/4125BTRPtX492Pp+nmKfOEz0Kyep7V
	 qb8TZUnBPpBWWM5XMoRlXxpd8XWLq5P2xHbDbSvBtZMRfI4oplMCiRvtRK+ViWg37vNGt
	 SaKoMo93wpH+Z8TB0inH1o44izTj4E9VoxpG4OEfKV/6YmBGO0oewXK94rAbRiD1BXAoB
	 4fOYxOWCpAA/CUoIsuV3lW/Rk/UNBsXjUHQrJmzAx1s39I8XpENRQMt1O7rAFx8wM+VjD
	 OBBaSb938wtODXTw0/KUEennWTNJfuCFnNqFix60sjroZbLvi29oyri26BhRdB949Yg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EB451F008A3;
	Tue, 10 Nov 2026 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794338555;
	bh=tYBRSyEfnv5cMd7rhyV1pLhfI+yoANtLDE25nt17o90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ANuP8qVGWvHs6OayUW3YYmxqzzYKQwVW4FyaajrRc8lu8VVEJNFIas6f/dKKYAynX
	 12RGvdVv+DBPqCCrf3wEBzHb6oZgynYoD208FsFWtzIXotvs2I9NgWQGs3QZQoLkUi
	 zxaJj/AvE0pQR4kgdaiJfPCSdlJGRiuJVbAuQbVAR9Z5UH/GPmQ0ryS9emfsAnkDWb
	 rQ1LR36joOb2jn49ccizuY11s7cR5D3qKWa8FCFWQjjD47JdGUcGJ+3VbPbAj3nXVe
	 Y7iSWf+PlDhktaZYT3LG83uwgx1ZNAjbRorG7eMH9vHRLcWHKJbrtDCNDZ1RqxXIPb
	 AbF3+tcNAGmMA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CCC8A48C61;
	Tue, 10 Nov 2026 19:22:32 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 10 Nov 2026 21:22:23 +0200
Subject: [PATCH 3/3] arm64: dts: mediatek: mt6797: fix wdt compatible and
 add reset-cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261110-6797-wdt-v1-3-7f07755b6074@protonmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794338551; l=1078;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=VuN0jtuD+HtYuy89pzuqnoMMbe8NyfZawjbjHy4rttU=;
 b=1dFuWL6ecSyhlJelauX7l708ej5nhN7koHbW5djy5P8rSYePuhYRr7HCqCh+s52bA/JpOHFCA
 tl2bQs0rJAWCiOmmz8br6jzFXPhadD5abjHTpCstLYM6xwkzO7Tr6+B
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

The TOPRGU reset bits on the mt6797 SoC do not match that of mt6589,
therefore they are not compatible [1].

Remove the deprecated mt6589 fallback for mt6797 and add reset-cells to
enable other peripherals to use the TOPRGU resets.

Link: https://www.96boards.org/documentation/consumer/mediatekx20/additional-docs/docs/MT6797_Register_Table_Part_1.pdf [1]
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index 8ac98a378fd6..c0f98ae132dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -218,8 +218,9 @@ scpsys: power-controller@10006000 {
 	};
 
 	watchdog: watchdog@10007000 {
-		compatible = "mediatek,mt6797-wdt", "mediatek,mt6589-wdt";
+		compatible = "mediatek,mt6797-wdt";
 		reg = <0 0x10007000 0 0x100>;
+		#reset-cells = <1>;
 	};
 
 	apmixedsys: apmixed@1000c000 {

-- 
2.56.0



