Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F319CC25B76
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jun 2024 08:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+RS4NoAYgU9AZL8LvXzHxrBJRVGTscCq1GO1sWMkik=; b=dhuPlZsWckmY3C
	FTjJFRlc7fSERpYpRBxPe3x3XNQP7YbCjl349/1C4fOUXbJQ82JlesaDQcY0/uQQf+XzKiiiH95SF
	lyupocqaWG1l4FNmWywOtI6qRr5CZyDCKmOkieYJ25v5bYVztHELp0jnruL7fio0Ko8i+kn88Vair
	Ax5LqMMKvjdXrIPXhMgxtBGPh0XGaqQip3aS58khjE2+1oqeRBrJM9K+8Onh5jQTPSh3qtPtncwGc
	smtXh/hAYOeb8CVHea0Fh7Npu5k0YkibUmp0MyIfhmh9YKNKw1tL1inR1UJFncHdTtejnecQQkHCF
	+LKukbT/3Ap5ncatCZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5P-0000000Guw2-2Mmt;
	Sat, 08 Jun 2024 08:06:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFr5F-0000000GusN-3p1a;
	Sat, 08 Jun 2024 08:05:56 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 3EA50100CFA;
	Sat,  8 Jun 2024 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1717833950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+RS4NoAYgU9AZL8LvXzHxrBJRVGTscCq1GO1sWMkik=;
	b=Q635MxdcWGufYFjzAiTMApiA9n/v23AiOcutpMuUtbjMxOeAHyqelknz2ATFLLY92TkaXP
	soHHWyvHteQG/zStV7GsQD+Whx0lZIf9PJZCyDDQETtP4zBX/pW9nYLmh897y8EzQoyT2M
	Vw5x942GKiNxD4wAo8l5pEtRjJLfnYQ=
Received: from frank-G5.. (fttx-pool-217.61.155.199.bambit.de [217.61.155.199])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 6BE118010F;
	Sat,  8 Jun 2024 08:05:49 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 1/2] arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
Date: Sat,  8 Jun 2024 10:05:29 +0200
Message-Id: <20240608080530.9436-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240608080530.9436-1-linux@fw-web.de>
References: <20240608080530.9436-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: eda811a8-5da4-4650-a7ce-a4d227bb3153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_010554_114703_E63DE290 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Build devicetree binaries for testing overlays and providing users
full dtb without using overlays.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com/
https://lore.kernel.org/all/CAL_JsqJSi=kJSix=f3787ULZnaCy_Y26Phdhy5y9fat_vkDuUw@mail.gmail.com/

v2:
make full dtbs multiline for better readability
---
 arch/arm64/boot/dts/mediatek/Makefile | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 37b4ca3a87c9..0ec5b904d35d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -15,6 +15,27 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
+mt7986a-bananapi-bpi-r3-emmc-nand-dtbs := \
+	mt7986a-bananapi-bpi-r3.dtb \
+	mt7986a-bananapi-bpi-r3-emmc.dtbo \
+	mt7986a-bananapi-bpi-r3-nand.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nand.dtb
+mt7986a-bananapi-bpi-r3-emmc-nor-dtbs := \
+	mt7986a-bananapi-bpi-r3.dtb \
+	mt7986a-bananapi-bpi-r3-emmc.dtbo \
+	mt7986a-bananapi-bpi-r3-nor.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nor.dtb
+mt7986a-bananapi-bpi-r3-sd-nand-dtbs := \
+	mt7986a-bananapi-bpi-r3.dtb \
+	mt7986a-bananapi-bpi-r3-sd.dtbo \
+	mt7986a-bananapi-bpi-r3-nand.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
+mt7986a-bananapi-bpi-r3-sd-nor-dtbs := \
+	mt7986a-bananapi-bpi-r3.dtb \
+	mt7986a-bananapi-bpi-r3-sd.dtbo \
+	mt7986a-bananapi-bpi-r3-nor.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nor.dtb
+
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7988a-bananapi-bpi-r4.dtb
-- 
2.34.1


