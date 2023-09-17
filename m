Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A9ACD37B3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b9jlP+QMwX9cNjlMgnqdJZg9rK01wAc9gTFIwnzsuzg=; b=m5Pmj1uhjuPHvlNsVNnhocLega
	zQ45TjzeheaL60sS4+6/y+SKX5sDACras1Ra+AoD4127JZL2kbfg0qJaLZRqqOGlU73UpFBtngkez
	lpJqRT7KLEu/VsgQWe1Pvgkh68uBKV5DRMB1jO4lKtTuGi5TsaQhKPZEA5hRckrgKmpKVChc/I3u5
	REuvcnnAhNg+KS36Pdd0ZpA8MUvRE0DDOrV6hZ5lcduYAmlN6Zhc/QIIqSWWZ3Kyy59Gg2YQQdwwI
	uTFS/hxn9SJ/nLHiGyZQ6CWL5hKYAugvnYTZx//0FROnNdJ2ahPjC2R8QLRwAJwHP6iGiI9i0w+Iw
	Gd01EoWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhpAS-00DYXc-2G;
	Sun, 17 Sep 2023 10:38:20 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhpAO-00DYSN-05;
	Sun, 17 Sep 2023 10:38:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DAAF60008;
	Sun, 17 Sep 2023 10:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694947091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b9jlP+QMwX9cNjlMgnqdJZg9rK01wAc9gTFIwnzsuzg=;
	b=nHTzyZ2EcVd9psF16qt1mZ8cCRB6QinrWTD+DAM75wicxUhCkBBMPSgTP/6EPNRnm3SmGS
	7BsoC8FlvsQ5yNFBmLQvLap/v9r+JSMR4PGgUTSHLuYugQeoUuVDrZw1DfnIWdEI1M1ama
	dkV5HQ3bKD/oJkyKI0bkMhic6GydiLVrh7b/ygrOtAUGyfOyCWQJKPZGo5O89Bo8/SoNDw
	BWhIQP8Yx2f124OEBk+LWTObUlMRCWfh4/y4EPx5HYnOy9521x/YwVEeAuFqOMHtMDH+oC
	DAkoGBZZyBPHhnPrvPbK0NTaEtsMVfxUqAjWt/xmISha1ASfUqlyTqmTjrWl5g==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mips: dts: ralink: mt7621: define each reset as an item
Date: Sun, 17 Sep 2023 13:37:53 +0300
Message-Id: <20230917103753.52644-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_033816_243062_9CA2FC12 
X-CRM114-Status: GOOD (  10.12  )
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

Each item of the resets property should define a reset. Split the item with
two resets on the ethernet node into two separate items.

Sort the items of the clocks property to the same line as a trivial change.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 7caed0d14f11..35a10258f235 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -300,14 +300,13 @@ ethernet: ethernet@1e100000 {
 		compatible = "mediatek,mt7621-eth";
 		reg = <0x1e100000 0x10000>;
 
-		clocks = <&sysc MT7621_CLK_FE>,
-			 <&sysc MT7621_CLK_ETH>;
+		clocks = <&sysc MT7621_CLK_FE>, <&sysc MT7621_CLK_ETH>;
 		clock-names = "fe", "ethif";
 
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		resets = <&sysc MT7621_RST_FE &sysc MT7621_RST_ETH>;
+		resets = <&sysc MT7621_RST_FE>, <&sysc MT7621_RST_ETH>;
 		reset-names = "fe", "eth";
 
 		interrupt-parent = <&gic>;
-- 
2.39.2


