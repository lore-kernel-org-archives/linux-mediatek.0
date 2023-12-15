Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC587C46CC5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIdDAaKUkxqdu19pWDFh3PJFKl/yfMhwsN3WS1z18wY=; b=SQmo79UUJiig2Z3fAKrNwCZd2/
	uKOY62FoeuRkROe7DF/zU8fl6injijuR42FxaaUMO3ngjkMiHj01NE7znqdVX8lEq2v9kKKL2GOiw
	s6zaBvTBkmU0HajAEjNMVJsyPwsOrU0DQtsQZmgZCGK4EuQEzN2SCrRSCszaQHOXHYl4Gr/tiSqVM
	0bXgn14wtmjZoFuoJ8fZ04twcx8t/1LN/aqPzQkZSlaJTAKkW4DpEkwISQM8v5Dh6RtriwIQC3xlg
	eY3hpb4oSC+QxKhcKLvXTMj+VbZHDgtxmqmVmTXx3nrutiXSvJBX+EU4TVm2zYojCUdr7KiG2L1VC
	pQ5bMo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5i3-002om3-2k;
	Fri, 15 Dec 2023 10:46:23 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hr-002odw-38;
	Fri, 15 Dec 2023 10:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637170;
	bh=UNr7RTkECrw2TxwP67coHpk8jV76hI6PEfp00kugbrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtEIaGzILk5FFGMwWx9fvBPAp9iHXtyDK3mpOnzpcpO2uO5vXIaA2CnnSR2WZzpEw
	 SCqkcJl54LvKv4+duzvjeGYo5YkC63Tmao2CuC77YoOIUb6qEtLBr7v31ZYK+d+JDT
	 0Rp0aem4p3JExjssdjU9TE9ySkkITrkpL2Anti4Hm7dt/5G4RmXbeGMCyEycG4mhVT
	 H5Umqz2GAdodHVnArWDJWU5YbM17PlWNfhku56sQwfR0Kzz6ScQ1Xl/IGIOZRh8jaM
	 pJGin0TH9qyVJei87hjzUl0bnJZpdTzgaqH6Wnwqpa0kTeRfxHXL2Z1jK/7Yrd4/6T
	 46aNNJU4jwLdQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C10383781FDB;
	Fri, 15 Dec 2023 10:46:09 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Kyrie Wu <kyrie.wu@mediatek.com>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 7/7] arm64: dts: mediatek: mt8186: Add venc node
Date: Fri, 15 Dec 2023 12:45:51 +0200
Message-Id: <20231215104551.233679-7-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024612_160399_E9C4F5EE 
X-CRM114-Status: UNSURE (   9.16  )
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
Changes in v2:
- change node name
- change compatible to include 8186
- change props order
- change clock name to cope with binding


 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 66ead3f23336..ebd07bf3d9d2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -1993,6 +1993,30 @@ larb7: smi@17010000 {
 			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
 		};
 
+		venc: video-encoder@17020000 {
+			compatible = "mediatek,mt8186-vcodec-enc", "mediatek,mt8183-vcodec-enc";
+			reg = <0 0x17020000 0 0x2000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
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
+			dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;
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


