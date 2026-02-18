Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEB4E9A03E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Feb 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHmY3SL89+MvNJ+tjCeu3TsY/bMUQ4IvtUy5DB65lY0=; b=i4WAWaSTVYsU87rRQ0XygqA0KQ
	9sP9q2ZE3wb7Te7GMG/GyCRhu+rK5n+ksyIZNUo5gIVC6JoXcUuEWHhIKsbXs5n7jP0W9BmwcX6DF
	/uVRw0dfLwa98YfNzhuofJksKwshskWiETpyf5yB28PHhWAMjwex8Fi9GYzAOFYhuZLvACfZltC9A
	OqH6tRp6WCIcteCoELQV0KUqfnzmnOklFE7IJlroosD0/fjifz1v8VyjyWIPwNBUTO5rqyBShyIYW
	hk8JXdqlvknhns/GXUbDqsozkkprTNyxdYrhqidgXHOXRYFjq137RTOg2nZdndQTqA5+UrJWhaJlH
	cVDzi7Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmn-00000009XKv-2fKo;
	Wed, 18 Feb 2026 09:23:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsdmg-00000009XGc-0I6u;
	Wed, 18 Feb 2026 09:23:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771406627;
	bh=OtiUP6H58bH2B9BYy78Cc3KDhijHLwzAQd8zkOtzvMU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W134a5d1nCr3rz3gQ9cU1YPNqo9zbncRoff22hQKRC6YU2kwccf8t2bgy2BrV9LO7
	 34u9x2mHP8krnFGEVfKzWgHiRrflSrpNPh7GzCS5DRujKO/vXLcifXNXwKI/EyCPH8
	 NaWL2Ja1GhCy2tSm/Flnt7GYu0jiD+fd7Stl44bNOqnhq0XWWdymx/+6KgKFwHE/Dd
	 oRw6VO3BjEKXUK/uHjsPPXfdscbCIpDKBUlzFb5pG9PmQACciL4lmJO/qmY8giEOMK
	 gTkAopoI9cescVVQ9pKhY1w4BqbYJIDrUAyWkmqnFffRKOmIYqGLSMlG7u0U4JbaZA
	 KMgnYD8S8Mspg==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE69517E1523;
	Wed, 18 Feb 2026 10:23:46 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 18 Feb 2026 10:23:03 +0100
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-radxa-nio-12l: add mmc
 aliases
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-mtk-genio-mmc-aliases-v1-2-e218e9f771c5@collabora.com>
References: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
In-Reply-To: <20260218-mtk-genio-mmc-aliases-v1-0-e218e9f771c5@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771406625; l=1105;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=OtiUP6H58bH2B9BYy78Cc3KDhijHLwzAQd8zkOtzvMU=;
 b=jNPAyn/57bzsJ3JvieHVUaGkG5TcF3dpmdD02u83fU4/ccye/1j5aNS+YlStqYYL4PYP/K3nW
 qwl0SNoBO2qDylhRWsivy0pu9MXbsvVl2i08SwsQBqNxgRlCW1io/yS
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_012350_262623_90D82E7B 
X-CRM114-Status: GOOD (  10.41  )
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

Add aliases for mmc nodes, so that the eMMC and SDCard host controllers
get enumerated in a consistent order for the Radxa NIO-12L board.
Also, reorder ethernet0 so all aliases are sorted alphanumerically.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 1cd4b84e98615be6c5cb13d01b7baed0e017c3be..bf91305e8e4a5d49d438e43b7e6f2e6bbbff5bad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -21,12 +21,14 @@ / {
 	compatible = "radxa,nio-12l", "mediatek,mt8395", "mediatek,mt8195";
 
 	aliases {
+		ethernet0 = &eth;
 		i2c0 = &i2c2;
 		i2c1 = &i2c3;
 		i2c2 = &i2c4;
 		i2c3 = &i2c0;
 		i2c4 = &i2c1;
-		ethernet0 = &eth;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		spi0 = &spi1;

-- 
2.53.0


