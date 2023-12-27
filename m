Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D45C47072
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 13:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TD0S7hvKR+xai/tSrPKvTXKXSx4uja0h0beaQknOOjs=; b=at7b0r1BVPpMgEeue2q41GOSM6
	3OLOYUP8wqMtvfXVA2HvhEVXsndpF7nHcw9IB99JIdKB6aAxuBXTMl+7iwlXcAa9glmqHGaSpGXx5
	AYpEPaWyGxuIimOxpnCHoa6wZ7sZ4b25y5D0ZGeQGeKhhou72VvHtPQ9xnOK1fSvazCfX78LS7rBj
	LaSY8DkosJbNXiN7aMPv/LRVWIB37RA7iZ4yWP8e3mKKAvt6Hh/i9EelpI97AEmGJOFV+tmqeo8dQ
	FlIubZLHakT7h2gWTUWrkVj+5h2rU9g+rLjTIwG0us0qkoAnijRwSrnHPoB4bSW3rnMiuf5u1Snh5
	+sjyqKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rITeB-00Eh4O-2N;
	Wed, 27 Dec 2023 13:08:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rITe7-00Eh3F-2D;
	Wed, 27 Dec 2023 13:08:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703682502;
	bh=HmyjXOD56zgdLDRREs3MjGe7P0nir2jbpaxQCaL5xWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F3gYODER8pnUeQQ4RhLeIl6uvFvnY5Kj4qdCHil+dk8eUti5rjTBXHPwGODNyeUXB
	 b3Q7x61UzMh1jmHWbY57TCn82zA9F9jO5qq2+ulGLMBvp+nkmebVfqR0/Eo03zsXdv
	 /rVoVxh36fVTjOj9AFzL3uDEDC6FQ7qNA76WyDHQXIKKqcbF6Sz6B7SeKkd3SJcwbB
	 Z7/eqpws2ldOOcJYhXTdpjZ+6OLl+V7/Hj7gqqkPRzqIqu0FXmH6EefEoK/TmrynHd
	 AI+91XTt2WlGifOOQBrXietyLWSQ5hOG+qWbeD4630xepTpxi8M3Z4ObrcTF4yLBL3
	 ygfT9/x4Ga2uA==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B7CC137802F2;
	Wed, 27 Dec 2023 13:08:21 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: bin.liu@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Max Staudt <mstaudt@chromium.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
Date: Wed, 27 Dec 2023 15:08:12 +0200
Message-Id: <20231227130812.148914-2-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231227130812.148914-1-eugen.hristev@collabora.com>
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_050827_873020_8552EC70 
X-CRM114-Status: UNSURE (   8.34  )
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
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index e451b6c8cd9e..ef1b269f9184 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -2054,6 +2054,19 @@ venc: video-encoder@17020000 {
 			mediatek,scp = <&scp>;
 		};
 
+		jpgenc: jpgenc@17030000 {
+			compatible = "mediatek,mt8186-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x10000>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vencsys CLK_VENC_CKE2_JPGENC>;
+			clock-names = "jpgenc";
+			power-domains = <&spm MT8186_POWER_DOMAIN_VENC>;
+			iommus = <&iommu_mm IOMMU_PORT_L7_JPGENC_Y_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_C_RDMA>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_Q_TABLE>,
+				 <&iommu_mm IOMMU_PORT_L7_JPGENC_BSDMA>;
+		};
+
 		camsys: clock-controller@1a000000 {
 			compatible = "mediatek,mt8186-camsys";
 			reg = <0 0x1a000000 0 0x1000>;
-- 
2.34.1


