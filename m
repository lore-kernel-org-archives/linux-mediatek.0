Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89438CD37B7
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ic0G510ZkrT/w9xgsy/Q4oN6GJTYtCSGMrmgyEarLCE=; b=p0OeSAEjLb83nI
	8I8cFmEHpjnyz9CiKeAeUbzZbeGj5DDd2xJMVuKh0rSpyeyRjIvu2MGRTJfq2N4oVKmEGUMm+DXbF
	odHeyhTIsx2W3P2o7TxXaSCXYXCteCwHb92ddz6dukvru0R4YkpfQalZreGgLHWXbdkxVNZDzdMkV
	SK54aAql40hC/AbPZrgtq439rk85HkZgDDqtsT2P1GRbT3yjY6R+Cx4AsjsPxLL9/HM2miApjE8LF
	eY2ftTfyahd1Dbqs5FhsIo8nqysIcFQFc8djo3qM3aqtFFlj93gStDNfFDXfRYCkfN+eWre41+VxK
	0v1mjpBueRhCoub9arMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQj4-00CCM8-1k;
	Sat, 16 Sep 2023 08:32:26 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQj0-00CCLL-2W;
	Sat, 16 Sep 2023 08:32:24 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 451E75FC74;
	Sat, 16 Sep 2023 08:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1694853139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ic0G510ZkrT/w9xgsy/Q4oN6GJTYtCSGMrmgyEarLCE=;
	b=vQZ1GmUJ5av0r9PP1cpwiGMhSeA35dVYE6Sk3QBRvsMzURa7FFsUe4bAw0t/7F1g0rYRPx
	SkPxg6iZyfsDFqDzIfKM3f6O4rECv4K04bVOx+k2y531SjOb74WFuPXpRdbsboGFa4a+Ta
	MXAOB0NGsXsrH6DstXD3ZCS5BP7tXPk=
Received: from frank-G5.. (fttx-pool-217.61.145.236.bambit.de [217.61.145.236])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 90DC6100906;
	Sat, 16 Sep 2023 08:32:18 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1] arm64: dts: mediatek: add dtbs with applied overlays for bpi-r3
Date: Sat, 16 Sep 2023 10:32:14 +0200
Message-Id: <20230916083214.7059-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5c8dae74-ce6d-4c6a-8ecf-5a7e050675ff
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_013222_966856_046E1961 
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
Cc: Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Build devicetree binaries for testing overlays and providing users
full dtb without using overlays.

Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
based on discussion here:
https://lore.kernel.org/all/CAL_JsqK_3xxD0DFwipXO85P=q=EYjUdjE1_8g1MKtvw3vVzx5A@mail.gmail.com/
https://lore.kernel.org/all/CAL_JsqJSi=kJSix=f3787ULZnaCy_Y26Phdhy5y9fat_vkDuUw@mail.gmail.com/
---
 arch/arm64/boot/dts/mediatek/Makefile | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c99c3372a4b5..18be027bf6b4 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,14 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nand.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-nor.dtbo
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd.dtbo
+mt7986a-bananapi-bpi-r3-emmc-nand-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nand.dtb
+mt7986a-bananapi-bpi-r3-emmc-nor-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-emmc.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc-nor.dtb
+mt7986a-bananapi-bpi-r3-sd-nand-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nand.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nand.dtb
+mt7986a-bananapi-bpi-r3-sd-nor-dtbs := mt7986a-bananapi-bpi-r3.dtb mt7986a-bananapi-bpi-r3-sd.dtbo mt7986a-bananapi-bpi-r3-nor.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-sd-nor.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
-- 
2.34.1


