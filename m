Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2F8C83F3D
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Jul 2025 17:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZoV8pDRAyWULEp5ZRBitKk63UkguBuNR7jm0lOnkgcM=; b=oJb5D3k0R5AukxFFKCSB40RQ8R
	+YJ3Tn9gSLu/ekEQtAhgZIundc1ZebbxVJKsHyrc33A69drTGv/dr5+15RfDZ4nztFMTGJ7pTE9s7
	wD3Ml5FA20w3GjhERKE617wWHtfjNZGHBaI69fY3q2lFQU1I2RJnKUJtqZihuARFnKZD8hxcVqdAV
	DOxXJY3yua+LsUJ5L50vapNekFjxgvvFEQ0Q+o6xlIzXzqsCqFy5Hdn1AmKeuPK7NDbwjHMnzv5kA
	OIFBQ649iRJi0ng2lnGNgsbll4Re4YCMKIo5Hatyw7pQXNCQrYc9uEXNaohfibN+Jrhmjvv/8YQgT
	vTTF2FTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udYEp-0000000FZhQ-1ekR;
	Sun, 20 Jul 2025 17:54:15 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udY9v-0000000FZQx-3Qwx
	for linux-mediatek@lists.infradead.org;
	Sun, 20 Jul 2025 17:49:15 +0000
Received: (wp-smtpd smtp.wp.pl 39467 invoked from network); 20 Jul 2025 19:49:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1753033746; bh=ZoV8pDRAyWULEp5ZRBitKk63UkguBuNR7jm0lOnkgcM=;
          h=From:To:Cc:Subject;
          b=n7/Hit4kzTHWgHPbjsYJTjEH9Qxe0xVT4tOZE6b7w738YiHZ8vNvtQVgSx6K8DlAr
           Jx8p4aia2GHBhn+Xs9kefJjss58UlcEBvkYeaqzUnyLI6PgU6zAj3WviaCSE1H5HfP
           1OCxNR6hjQANdcbH8XE4DZEN+3rsEWJnE+0RYFV/GyCFLSlGX1edHsrwaXPVytKP9y
           EDb/IbCEMnqoDS7lPa3CV+N02bpgx1hF/gAVh9Spbu6Y/jkv5a7yuMfx/1MXs47P7x
           9kLLjZodNlQz5rrPZprJYfLInFMhzuhQb/Qsiwxdg+Tkoq4mmxVt/xQB3Cuuf5JFMA
           R4WXK7+RZ3Evw==
Received: from 83.24.129.157.ipv4.supernova.orange.pl (HELO localhost.localdomain) (olek2@wp.pl@[83.24.129.157])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <herbert@gondor.apana.org.au>; 20 Jul 2025 19:49:06 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	atenart@kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>,
	Sam Shih <sam.shih@mediatek.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: crypto: inside-secure,safexcel: make eip/mem IRQ optional
Date: Sun, 20 Jul 2025 19:49:02 +0200
Message-Id: <20250720174903.1321533-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-MailID: 1a3ebb6bead59a00b80590b1222a87ba
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000008 [ATvR]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_104912_340913_E6B6CADF 
X-CRM114-Status: UNSURE (   6.84  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Binding for this cryptographic engine defined 6 interrupts since its
beginning. It seems however only 4 rings IRQs are really required for
operating this hardware. Linux driver doesn't use "eip" or "mem" IRQs
and it isn't clear if they are always available (MT7986 devicetree
doesn't specify them).

The hardware reference manual [1] for the EIP-197 IP core only defines
ring interrupts and a global interrupt ("eip"). Ring interrupts can
optionaly be routed via the main interrupt. Role of the "mem" interrupt
is unknown.

This deals with:
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupts: [[0, 116, 4], [0, 117, 4], [0, 118, 4], [0, 119, 4]] is too short
        from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: crypto@10320000: interrupt-names: ['ring0', 'ring1', 'ring2', 'ring3'] is too short
        from schema $id: http://devicetree.org/schemas/crypto/inside-secure,safexcel.yaml#

[1] https://www.scribd.com/document/665924595/Security-IP-197-HW3-4-Hardware-Reference-Manual-RevA
Cc: Antoine Tenart <atenart@kernel.org>
Cc: Sam Shih <sam.shih@mediatek.com>
CC: Rafał Miłecki <rafal@milecki.pl>
Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../crypto/inside-secure,safexcel.yaml        | 21 ++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
index 343e2d04c797..97af96bfe5f6 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel.yaml
@@ -26,16 +26,23 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 4
     maxItems: 6
 
   interrupt-names:
-    items:
-      - const: ring0
-      - const: ring1
-      - const: ring2
-      - const: ring3
-      - const: eip
-      - const: mem
+    oneOf:
+      - items:
+          - const: ring0
+          - const: ring1
+          - const: ring2
+          - const: ring3
+          - const: eip
+          - const: mem
+      - items:
+          - const: ring0
+          - const: ring1
+          - const: ring2
+          - const: ring3
 
   clocks:
     minItems: 1
-- 
2.39.5


