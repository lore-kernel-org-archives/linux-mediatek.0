Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA4BCD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mLitB+G3ry3qi6zqijFGVU16sv3tyWcGHHBAFAJJ/Zk=; b=TJ6wmNI1IEK6oHPSzWTzNaJJ2A
	61sPPeLNwkkTNCVtmtJFgTBFkZwW96gL/115i7DWYZymxF9QohgLYHDgOnejkoMo2tf16N+bfcm50
	8Hc2LoBGXH60uQ9UPQKfnx3W11t+DTgicZp6704j9+MgFHVNFhH/wwGmW1V3G47DIOXXMAu5QQMCe
	nud4FzytvDu6/y+4P1PFtv2RRo7eG4NYeefU0cHZ0OeAKN0guv6J5ZBCFqNYtvfEJY1+MM+5VBaY/
	h+iItKDBjVCXeOH74em/3cxh6PLjgzNU9PxZr0kXeEPIMspxBALmvcGSL7i5Fslfxvg4tcdnB5az9
	AJSG8Y1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTYz-00000005w9A-3npl;
	Wed, 10 Apr 2024 08:44:13 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTYv-00000005w7F-3p3v;
	Wed, 10 Apr 2024 08:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712738648;
	bh=MClo/LdCJCeuzDJxjlhI62aOolIJ3BFr09Hb39twgwo=;
	h=From:To:Cc:Subject:Date:From;
	b=y9g4G46mTs/zGx3EyUZZPgX3TZYtvYZBaPbDIQgb1F0KlHb9tZwXImJtUIsYErAXx
	 Emg42bXD24FrR/Ks2iX200XzRHNB7jIh+2oPEcyhJRWIyL5jGhebt+VE6BheblvUbJ
	 AU3X6Q9NCZYhxrQKJnypJwILngVyp+Cm2sps+rph0EDRXC75qVpVVM28oiDLpN740J
	 tz7Ij5R1GFd73NwJ/8L+WAdt5zWsr6+TUYcvgjVqoCIawe/3mkb74mSbsYHxWB36y8
	 TpNnix/RCO8YI9ZROCOT/yn8M8CD3+5rblsMATaioa2/yLQVmNotM4mJy4jRf/o/56
	 OmJIX6j42eepA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D8B973781453;
	Wed, 10 Apr 2024 08:44:07 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sre@kernel.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mazziesaccount@gmail.com,
	gene_chen@richtek.com,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] power: supply: mt6360_charger: Fix of_match for usb-otg-vbus regulator
Date: Wed, 10 Apr 2024 10:44:05 +0200
Message-ID: <20240410084405.1389378-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_014410_106667_B9B14048 
X-CRM114-Status: GOOD (  12.52  )
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

The of_match shall correspond to the name of the regulator subnode,
or the deprecated `regulator-compatible` property must be used:
failing to do so, the regulator won't probe (and the driver will
as well not probe).

Since the devicetree binding for this driver is actually correct
and wants DTs to use the "usb-otg-vbus-regulator" subnode name,
fix this driver by aligning the `of_match` string to what the DT
binding wants.

Fixes: 0402e8ebb8b8 ("power: supply: mt6360_charger: add MT6360 charger support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/power/supply/mt6360_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/mt6360_charger.c b/drivers/power/supply/mt6360_charger.c
index 1305cba61edd..aca123783efc 100644
--- a/drivers/power/supply/mt6360_charger.c
+++ b/drivers/power/supply/mt6360_charger.c
@@ -588,7 +588,7 @@ static const struct regulator_ops mt6360_chg_otg_ops = {
 };
 
 static const struct regulator_desc mt6360_otg_rdesc = {
-	.of_match = "usb-otg-vbus",
+	.of_match = "usb-otg-vbus-regulator",
 	.name = "usb-otg-vbus",
 	.ops = &mt6360_chg_otg_ops,
 	.owner = THIS_MODULE,
-- 
2.44.0


