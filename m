Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5ADC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W653f3pVQL5Ic+1C+7POVMvYSp9qVH87u7uaN4LFloI=; b=BU1R1Ugs1ZbK6QVK7bPsx5HuPF
	TzyRMMi0pzefq3W4EsSoOCZQiZe5nA7XHONiiOtEV0OR/GOYddXdN/VMX9sIMod8/+Wu94AK3Q3qx
	jGWT1QPPZOWGNRfTk4EJBMSAwEWPeQkTOXQuGzTVWujadeNF5+xjzW6CXotwrfpgRf7CAHKO7cA5J
	naO05egB0urInpvXGl9TJSbgP6JpkGV5pChUKQApR2CHQgZllrc8OzEGCDUE73xm7UZ2CPi4M6h4Y
	VdY34wEOS+q/f7oERtYp3U0SqQFngKPJzo3syPXuwAJ//+NUJivBGpAdHkhExi3ow5sGl7J/KNDI2
	huy+jWmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodx-00GgEt-2a;
	Thu, 28 Dec 2023 11:33:41 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodL-00Gfqg-1M;
	Thu, 28 Dec 2023 11:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763182;
	bh=37Z5+7S5t846U9B0A0dcCmQr8H0ZxSimQ6IOeUd6EuQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1z0cOoyTvc9pTmCrf9DWg7bgLlojEZ8Oh50GKVtLwZuJPKIPvGJnhCnFjkoBTPWJ/
	 sAaRJD+I20+ohk1nhbTuxSymui4d5QhB8R/Xv5BDlYdpAonk8aIjMvuPRPTksXC3Jr
	 yG57VuVD/NzJ5VfImR7Qd3lACDL6vcOWiUXO54E0j2wxbjRm17qgGeymzzo1mfmDdR
	 N86OtiqbS1YkOa8ZVvvbb1YFpQK/l5VT0/DnTnjCwXcl5XQkuV5kP5qYSXp+9FEb5z
	 3xqCTQQZm/61IZDE+kRmbnf5fNsRNwkdKaHK1Gbj51XyTRfDdry/MRAZUMS1bFBS9g
	 yp5c0wW841dmg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3556C3781419;
	Thu, 28 Dec 2023 11:33:01 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v3 6/6] arm64: dts: mediatek: mt8186: Add venc node
Date: Thu, 28 Dec 2023 13:32:45 +0200
Message-Id: <20231228113245.174706-7-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033303_665045_D048F3FB 
X-CRM114-Status: UNSURE (   9.02  )
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

From: Kyrie Wu <kyrie.wu@mediatek.com>

Add video encoder node.

Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
[eugen.hristev@collabora.com: minor cleanup]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v3:
- remove dma ranges and cells.
Changes in v2:
- change node name
- change compatible to include 8186
- change props order
- change clock name to cope with binding

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 66ead3f23336..bafb0845e986 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1993,6 +1993,27 @@ larb7: smi@17010000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
 		};
 
+		venc: video-encoder@17020000 {
+			compatible = "mediatek,mt8186-vcodec-enc", "mediatek,mt8183-vcodec-enc";
+			reg = <0 0x17020000 0 0x2000>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&iommu_mm IOMMU_PORT_L7_VENC_RCPU>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REC>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_BSDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_SV_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_RD_COMV>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_CUR_CHROMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_LUMA>,
+				 <&iommu_mm IOMMU_PORT_L7_VENC_REF_CHROMA>;
+			clocks = <&vencsys CLK_VENC_CKE1_VENC>;
+			clock-names = "venc_sel";
+			assigned-clocks = <&topckgen CLK_TOP_VENC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D3>;
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+			mediatek,scp = <&scp>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


