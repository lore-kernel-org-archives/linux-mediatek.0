Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C005AC47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a0jpj54f52pmgKpAc4UCB5t8plZIfHuwCxRhApb+MaU=; b=gtxWpMXjj1LQJSjkX8ZDODAPds
	WECclfTeNX8Hfa8trNNkkhwKTgVWWiTY5t2lPxFFUA6S2kmS+Z5LXqoH0dMySlANfC0Gv2BV4VT0P
	s57l7dnLsG1llGzP3EGmyuWkkovMg+u8dlCzvZD4RHfRQ2r3sCXY3J1B6Eo468AurG7jGNbSQfXnO
	SAtqvpH8NfcazHDZ8inSHOY2wDzHXYXVqROt1mpIl+1OJYOW47lz7ADMio+U26Du7hXu6vaeyPquc
	tszwoKcDYWSAGWxJBljC+oLjiBYvKpdfxMpCN4E2vaxKf0Y/stZ9bNo5FTRVUwqjoDaxQDbXqX4b2
	pojo+iHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcA2-007cLC-2z;
	Tue, 02 Jan 2024 10:38:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKc9z-007cJX-1f;
	Tue, 02 Jan 2024 10:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704191887;
	bh=cm7tGZegvFx11DaYuyNUHAKQJUZbqThwfuueF4e2NcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZTKcvSZSPhwE9At3kqI+V7j+jbxAhit57MypSrzuU18aebz35/DRLJSDNsZihDq8o
	 xMwPz52VEjaPjvZP+8wyoQK0TAKilLm0LRRuz/heeCRpyburW0hWXtsqVeFpJczkeq
	 QuPPi5wj8Bqyva+XW675cXItJ5/N/UpUC/if8gjgD4L86bFaoGjEaFWtM94iLVZ0oI
	 GIqCTQqJO5F4p1f1nNyKoNBd0eeyb8J77tKtrE1V3nLFpTa4XA0lCB8lHgpndhaGhW
	 RfWe7Exr0Zqae57XiMOiWFjGXzkBQ26nOlplwlDuVlQd6fzDAUxPMzkNEPDBC7al42
	 hII9I30piTpSw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B25BE3780FC7;
	Tue,  2 Jan 2024 10:38:06 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	kernel@collabora.com,
	eugen.hristev@collabora.com,
	matthias.bgg@gmail.com,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Max Staudt <mstaudt@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Date: Tue,  2 Jan 2024 12:38:01 +0200
Message-Id: <20240102103801.268647-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102103801.268647-1-eugen.hristev@collabora.com>
References: <20240102103801.268647-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_023811_700326_B466D670 
X-CRM114-Status: UNSURE (   9.44  )
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

From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Add JPEG encoder node.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Max Staudt <mstaudt@chromium.org>
Tested-by: Max Staudt <mstaudt@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- renamed node
- reordered props

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e451b6c8cd9e..8e57a7be67ad 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -2054,6 +2054,19 @@ venc: video-encoder@17020000 {
 			mediatek,scp = <&scp>;
 		};
 
+		jpgenc: jpeg-encoder@17030000 {
+			compatible = "mediatek,mt8186-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x10000>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vencsys CLK_VENC_CKE2_JPGENC>;
+			clock-names = "jpgenc";
+			iommus = <&iommu_mm IOMMU_PORT_L7_JPGENC_Y_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_C_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_Q_TABLE>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_BSDMA>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


