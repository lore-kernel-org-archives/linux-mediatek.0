Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF552C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvz9jF9cHWYjKN5ELO4E3SBWLGlzgvK9sGZ7ydgZBkw=; b=hgtuCYqijgMUZ24WPy3YB8gW1Y
	48x2nJ3FKGwKtqw4DX7kQsWNGOKWKKu2d2e3ijkwTq/lcaYW5IgY8kkMCsgb6WH4Dou/Qln4+tBIS
	ZB8QycFbaiXFlWUP9TMsom2s0t8xFBECcG7a2wbPPm9LT4Ha7ms9Ai8eFcTQkAgzkEjtSadXEB4SA
	mD39LN0dW9BZVs1gDLFqQ1wJfTmtETcQFW/97ch1WStykIlt8+AMljY1/OZuXDZ24JhUJtlpIWcKA
	NJBMGBz7R2ETgx2BDLZXx+bm3EE77nrBmdc8QnOmxaw/PXZ8Z2NhIxbsFaK3M9JegHhKxlBTIWIQy
	8vavQMYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxeL-00CoiD-0I; Tue, 28 Feb 2023 10:56:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWb-00Ck2a-0X; Tue, 28 Feb 2023 10:48:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 51F626602FD8;
	Tue, 28 Feb 2023 10:47:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581279;
	bh=zNRcNap0DKbKus9H9hYNrxN03fzRsqShpCKFraZ9Guk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QozOyhjvhaL80WmrxET48lIxFyT9zy9c+/kvpqlZVra9vyXmqBWX+4+Dst89a9M3K
	 93U5FDEWYAGoZ4MfEhQVWTVncU03ZqXlkfBYM4Xh2a+KYuM1HfsGGKVuoJgMee5D/7
	 hGlKkf8tTgyic0FrhNcopub0dp/bYqbZfh863RaTVPS1Q+cc1tmdVtcShU7AHZ1TiM
	 h3EEU8kAy1zPSD8AygJL8bJ/1LdR4VS6f5d2OFraMld1q6P9oK1g3Rpw0rbCr3UGem
	 lB1cLcUl3jMLIZupv4XmKB7F2Pg+lbZZPqmyn6JVbAZrnBKQ1uTMPrDWCd68zRYjjH
	 xO1+OPEONDDZA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v3 16/18] arm64: dts: mediatek: mt8186: Add GPU node
Date: Tue, 28 Feb 2023 11:47:39 +0100
Message-Id: <20230228104741.717819-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024801_224687_529832AB 
X-CRM114-Status: UNSURE (   8.61  )
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

Add a GPU node for MT8186 SoC but keep it disabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index a0d3e1f731bd..78ff8ba5718e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1075,6 +1075,23 @@ mfgsys: clock-controller@13000000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@13040000 {
+			compatible = "mediatek,mt8186-mali",
+				     "arm,mali-bifrost";
+			reg = <0 0x13040000 0 0x4000>;
+
+			clocks = <&mfgsys CLK_MFG_BG3D>;
+			interrupts = <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "job", "mmu", "gpu";
+			power-domains = <&spm MT8186_POWER_DOMAIN_MFG2>,
+					<&spm MT8186_POWER_DOMAIN_MFG3>;
+			power-domain-names = "core0", "core1";
+			#cooling-cells = <2>;
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8186-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
-- 
2.39.2


