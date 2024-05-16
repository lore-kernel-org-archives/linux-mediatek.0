Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C634AC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 May 2024 20:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tR8y4TTXWd6kXPaYF35icLZ9jxpPFrPwkSYPwNH+R38=; b=DzNi+UtHvwnWhf
	iIWDd306pMDbPWUZlLx/uSjTenx7ULrYGI9qJ95K9c1djGwmvkufae+C0fjwRLN0EZCD79a3DcPx9
	7d19tMzYIuWq+Xno3PlOjuKFUuHm8npnPjSw/rLY19MCGv6bONg5ifnJhsVnCjiuPzttrfSCfdc5u
	6vmSNYHzrn3+WDdqZ1BaiE9MVwo3jVzTld9slByRCRjU6qKFFSRLzXOzK6i7EMfQuiAQw82mDWZ9u
	+Omb5cT9kYcakwGpV46pfV3Y72vhMHmmZ3Xo0dZwlz8+ciVTDM46alUbSXWU2iOuS5toY//M50gyr
	Y/LCUKPIdKKhVW3EF6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7i2D-000000066zM-3S4y;
	Thu, 16 May 2024 20:49:05 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7i28-000000066y9-34H7;
	Thu, 16 May 2024 20:49:03 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 1B73461658;
	Thu, 16 May 2024 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715892533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tR8y4TTXWd6kXPaYF35icLZ9jxpPFrPwkSYPwNH+R38=;
	b=NAoYzGbq3DCCUtMwezrvwC+hOXbGmm2xTa6+LzZD9Cr16erduYCqRoJow9RzvCAN9i8vAh
	tt4uMFWSkLb5GY++LbUw8a2tX/TuLSTTDBx23nt8F8nx6ZqgmOG4BEfUF1/NkNs1OB36+O
	BJKfzE6OOY5SxPZU5wys7V8Wf/2m+vY=
Received: from frank-G5.. (fttx-pool-80.245.75.58.bambit.de [80.245.75.58])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 290DD36005E;
	Thu, 16 May 2024 20:48:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mt7622: fix switch probe on bananapi-r64
Date: Thu, 16 May 2024 22:48:47 +0200
Message-Id: <20240516204847.171029-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 33360a91-7797-4ed3-a399-1e50c12d7bc1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_134900_952272_8D27E6FE 
X-CRM114-Status: GOOD (  10.30  )
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
Cc: devicetree@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

After commit 868ff5f4944a
("net: dsa: mt7530-mdio: read PHY address of switch from device tree")
the mt7531 switch on Bananapi-R64 was not detected.

mt7530-mdio mdio-bus:00: reset timeout
mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -110

Fix this by adding phy address in devicetree.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 224bb289660c..811b227d6f50 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -149,9 +149,9 @@ mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		switch@0 {
+		switch@1f {
 			compatible = "mediatek,mt7531";
-			reg = <0>;
+			reg = <0x1f>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			interrupts-extended = <&pio 53 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.34.1


