Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B003C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 06:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TaUWnU7qU9NE/hsYZejWO3THB2LYoy9TwFWETvZXtfw=; b=NoGp8+F2cD1kshhF9UjM5xSdtk
	gIpdWtmhbd8Rwrw382F13M6KAPnVP6zC6Dzl8GyNDAoBaOiyqV8XvyMiZwZutjHh8oCCz3gaaokQb
	eNbbLhpCuV/NBUEBkvbjnhz2poVCS2bLO1uSLr/lIapdJip49aZedoaVIrUGdmeRebXFPrZCdNvik
	48l8tSknxEZUMz5nqPur3ohydB9C3hl4R1diMS+4nrGGAF5kU3b8o2cu/2thDIWnPHlzz/HM5nG0Z
	9qQxrq2rWCjXbWC0Q9X2fuMO0hlbysbzVx+X23Ma6/Da68QhpSAmUyixuoTZcz3LXp7ASqPAu1dvC
	rjIJbtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRQY-00GJ3d-0o;
	Mon, 14 Aug 2023 06:51:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVRQU-00GJ2O-1y;
	Mon, 14 Aug 2023 06:51:44 +0000
Received: from eugen-station.. (unknown [82.77.136.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 25C0966071A3;
	Mon, 14 Aug 2023 07:51:38 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691995899;
	bh=j5dCUsPhwQm5avXf8GVQYODYQ/5vtbr99tHxZztcIS4=;
	h=From:To:Cc:Subject:Date:From;
	b=L3+K6NnQ+6HRAByZ2lHuMeZ6JQTaGESKUnuT7rEBt1v72+KbYuaZY8czicjhwcDH9
	 WUcIvA/JjVX6BQDnrx8+BVPIywtay45IuAB5CmajowuNO+Lqa04E3NqjDuBguO/BRK
	 wIS1YNyIdz40t0eYj+mz8lHzlKBJPZN4jBXIj/lBUeN0gC6i8XlN9VLH1eeff75ILF
	 9p/lgEF3MFNVuCRL/FIih2dhaWmAvlPLfwJ//DqlkCJbNED3IJbqKjhF/Fxmocw9k2
	 H6DrGVi0Zy9D0qZOURrJsKyR06XiNWr95Nqw4FOjWaCjbm+AB8m/QL1LovFO0f8Phd
	 p/equ3Syuo0Eg==
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt7622: fix memory node warning check
Date: Mon, 14 Aug 2023 09:50:42 +0300
Message-Id: <20230814065042.4973-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_235142_869125_CE88E55D 
X-CRM114-Status: GOOD (  10.02  )
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

dtbs_check throws a warning at the memory node:
Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

fix by adding the address into the node name.

Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 2 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index e4605d23fdc8..8220a4fd6319 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -73,7 +73,7 @@ led-1 {
 		};
 	};
 
-	memory {
+	memory@40000000 {
 		reg = <0 0x40000000 0 0x40000000>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index dad8e683aac5..c435984ca767 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -55,7 +55,7 @@ key-wps {
 		};
 	};
 
-	memory {
+	memory@40000000 {
 		reg = <0 0x40000000 0 0x20000000>;
 	};
 
-- 
2.34.1


