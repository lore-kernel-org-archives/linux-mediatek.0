Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B7AC0032E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ZcR70W2aaviUYh6DeqIY7yeaQVzt5WB1qm/b2mX/Og=; b=pyLaXxKMGlLqby
	5oYEK3HWb69Ur0ov8fRIS+mCCquypw+S7U4szmxpmx/90IlznwANMZwyEHwtlB1ZDlReT/NtWfqfD
	ZJCcfOClELMD9XMBr8UWtbK9MtStD45YUmEADJKNn9DP3Ol6zVasRFDqLjfYgfTz8oUDvw34z0DEe
	2eIyz6aDKf9rvsiGp/Ox35MiZDTkc/yoFj39LGc5udqHx+g22r806rl+Pc0/ur/jVYcKM6EtsTVYa
	B/k9yDVOd9MvdjEFPHgkYh7nxYBY+vo/Gs0qCtc8IFC4PV6qgCXlAuYBJXqGwnALsxlPq8JzdO/m5
	4M8h4t9S2i318RY1NlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNY-00Cl1r-0X;
	Wed, 25 Oct 2023 17:09:12 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNE-00Ckqj-10;
	Wed, 25 Oct 2023 17:08:54 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 7A26362673;
	Wed, 25 Oct 2023 17:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1698253725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZcR70W2aaviUYh6DeqIY7yeaQVzt5WB1qm/b2mX/Og=;
	b=ABCXw35oowNiQDqR+e1jhWA3UGJmLRmFRVrljB5wCfYAyjykl375M+OQv+/DcBAeTyviCU
	QoaCWiTIbBoJnxnfHf+mNaoOhbA3kWagcQpqZYh3tfpg4Ra/K//er97q4mpa8q4Au/9orh
	PPeZix8FitLSng9njIXRNsCM/OlUbn8=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id CE3F73607E4;
	Wed, 25 Oct 2023 17:08:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/5] arm64: dts: mt7986: add dtbs with applied overlays for bpi-r3
Date: Wed, 25 Oct 2023 19:08:31 +0200
Message-Id: <20231025170832.78727-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025170832.78727-1-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: cc576bb0-6b33-412d-8270-f0ec18aa8843
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_100852_503181_E34CB1BB 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
 arch/arm64/boot/dts/mediatek/Makefile | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index c99c3372a4b5..24eeba0703ce 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,11 +8,33 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-bananapi-bpi-r3-emmc.dtbo
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
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
-- 
2.34.1


