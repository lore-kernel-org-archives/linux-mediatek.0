Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF983C38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1cuO+mDXwgJcJinyJ+X0VtQ0L8BPvbHrb6giuMf4+Q=; b=ZZu99V/zs1SDa2Xgweu5wXNffc
	ChUCp3uOar6GnDlgLO+bbqXSqHC2u7la+C0oYP6J0b7W9TlQ8pNdj+1uYOxsW4c3oK0GSVuSf+l1K
	sFBv8UJIogcRmfcTFz371pTidtFZ8dUc1F7wjw4gMlcdjMnY2gcC1OzJzKWYzRDfbUXyHgFESNj6f
	6SecpQgPLDtNhmbEksKY+OMElvt9tpeLovJvUpYG4/bjMQMZ24GKGLDes277m+EnstT3wT+kyZsTt
	dXiFGciPJdb5dcmkfxTAXqFSvNwXVlb5D9s78s5O/yCtpJB2wfXEmwVSXlqitGJ+XeX6CuHGen/hO
	U6V+tc+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzcr-00Cghz-8g; Thu, 27 Oct 2022 09:56:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbg-00CgDQ-Qw; Thu, 27 Oct 2022 09:55:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J1cuO+mDXwgJcJinyJ+X0VtQ0L8BPvbHrb6giuMf4+Q=; b=WIbkAtr5KnbTQHbrwn0qLdDmDR
	DrRd0y6jes1QtVyhfBXw2JawyAvNDEWIcDGLSaRjFmFcQZXgXmO0FNQBQWfsX+wy1I1caSBu57lng
	OGCdweWEKIfpk4X7VRpD+0fX/mQWHQ9AKJfFWQTLn3uwjoirteE4CEewwA3Yq/+YZmEJ4sHRJWQN2
	a6t2eLmgM0zEyKBg+oxmVSsPyUKdtZrU6gzasU7RTNNOBXic4zckJCGm+FevFaYFqhHyGPY6LKHe5
	kNnrBXml9UqGy+j+U8e6lJX4GRuvtP/S8iTuSmcfSCpdwR4NxDjgxAt7zGbfcb4WmgqZ7x7TEL+YF
	UZ9n7z7Q==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbc-006pOn-NC; Thu, 27 Oct 2022 09:55:23 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 817CD66028D1;
	Thu, 27 Oct 2022 10:55:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864517;
	bh=WgoDvhQSuu9tCIfcj5g2O+S6s8LD3ydjrKtrkug1bN8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SnKNDqmZtNk88QMipJd9MBel8LetO0m14vAXi+1AN6ZMUBQcwyma2gpDrn4WqMyNP
	 w7bIFB2zyhQ5HHAuyg+YVo+VezBU9CFCJ0jSxp4CRr91z4hTW+CpLNWVPMoBJSZBc1
	 lLH37j84X32yTegGV2SPVOZlM4f2I5tV0VC9yWynRspbJXgRg7NdRQJ+y1FH7MEAYa
	 CEquSj+IFB8KgjiD7eFvVqzB8auWh4xsWthPf3lO7Je6aWS/W+ijqEL2HC2SgnAWIn
	 t3a76O4ei/O8+helnxhfCZuZJcsOoWH84HKBdKYrDynXMWXgKoKULhkuvvS4V4i6k6
	 6x+SYGwIECTQQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 4/6] arm64: dts: mediatek: mt6795: Add support for eMMC/SD/SDIO controllers
Date: Thu, 27 Oct 2022 11:55:02 +0200
Message-Id: <20221027095504.37432-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_105521_024332_55643900 
X-CRM114-Status: UNSURE (   9.54  )
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

Add the mmc nodes to support all of the four controllers, used for
eMMC, SD/MicroSD and SDIO storage.
All of these controller nodes are left disabled by default, as
usage is board dependent.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 39677eec388b..1564f2c127c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -382,5 +382,46 @@ uart3: serial@11005000 {
 			dma-names = "tx", "rx";
 			status = "disabled";
 		};
+
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt6795-mmc";
+			reg = <0 0x11230000 0 0x1000>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_MSDC30_0>,
+				 <&topckgen CLK_TOP_MSDC50_0_H_SEL>,
+				 <&topckgen CLK_TOP_MSDC50_0_SEL>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11240000 {
+			compatible = "mediatek,mt6795-mmc";
+			reg = <0 0x11240000 0 0x1000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_MSDC30_1>,
+				 <&topckgen CLK_TOP_AXI_SEL>;
+			clock-names = "source", "hclk";
+			status = "disabled";
+		};
+
+		mmc2: mmc@11250000 {
+			compatible = "mediatek,mt6795-mmc";
+			reg = <0 0x11250000 0 0x1000>;
+			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_MSDC30_2>,
+				 <&topckgen CLK_TOP_AXI_SEL>;
+			clock-names = "source", "hclk";
+			status = "disabled";
+		};
+
+		mmc3: mmc@11260000 {
+			compatible = "mediatek,mt6795-mmc";
+			reg = <0 0x11260000 0 0x1000>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&pericfg CLK_PERI_MSDC30_3>,
+				 <&topckgen CLK_TOP_AXI_SEL>;
+			clock-names = "source", "hclk";
+			status = "disabled";
+		};
 	};
 };
-- 
2.37.2


