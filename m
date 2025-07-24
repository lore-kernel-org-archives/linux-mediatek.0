Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201A5C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rty2vqtoNh4cS11/7Xzcwguiafl4gshq93WpRPUJNYc=; b=wGb6mcsqtdqVta
	7Z/llBn7xrgXS3XjCZFHiNTqLtW21VF9aDE/FQ0rVVlQR87pbGGMwjLbQg98ahtwwUnl3Xg9bza8+
	S8Bp0VpgmpEvv+mRXIE96babCmvkikdbO05RlvaEwOXE/RUir7376MZs6QUhCLpQCmuAiYC7OG0Uk
	+jS14v5ZHefwUM95YY+9mBDlTWMC4M3va4UbXnnL6iDd5KeRUrjQ1pFumHJDkp2I8rbXGD4bKO4Cf
	xTGGNgtxy6ph4uS2fnAEWMyKTpwOeH4w+Jkhjib4Ni4tQoRvHJRHZi2COZauzMBk1czxXJsMISw0T
	wmuGy/FjsiCvzsKDjmrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesbo-000000077Xv-0Xug;
	Thu, 24 Jul 2025 09:51:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVY-00000006u8A-3IfN;
	Thu, 24 Jul 2025 08:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346455;
	bh=mFbuAM5ZhB+OJa9KME98odHO4UJ473ILd2p4q9JxTKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mohmbY1pYbDjkf6kEDQF/IH0XkbcczQ5frh6z1HJDMqThe6CYH0tysljApwDw1NuM
	 KkaStjTUtDm8fbHkG41N9PizXPGd08cbFyhyZavsJx0A5b0lQ1iqB8rjoFrCDZmahK
	 o/Mucxkd4DCNLO3vW+0xdEJwLypaaGUhizPfU8fHLCvwit6gnUspvdNsM2bnkdGjjM
	 zs6XpQMjngBqYBtc4ptxOqrLfFFFeYHB1zTipu2Jkj3rJbd7REqCzO3Cu9YR5DQvzP
	 kcp5BrHHf7YQ+RVKjcu83t2+Pzf7no+o9bqZHDaAhQuHaHNwB9kv67OyurqVdgFP1Z
	 /rqdiOPszak0A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BAF117E11EE;
	Thu, 24 Jul 2025 10:40:53 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 34/38] arm64: dts: mediatek: mt8195: Fix ranges for jpeg enc/decoder nodes
Date: Thu, 24 Jul 2025 10:39:10 +0200
Message-ID: <20250724083914.61351-35-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014056_985740_3304D153 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The jpeg decoder main node is under the soc bus but currently has
no ranges or reg specified, while the children do, and this is
wrong in multiple aspects.

The very same is also valid for the jpeg encoder node.

Rename the decoder and encoder nodes to "jpeg-decoder@1a040000"
and to "jpeg-encoder@1a030000" respectively, and change their
children to use the newly defined ranges.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 30 +++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index dd065b1bf94a..35b10082bb89 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -3014,7 +3014,7 @@ venc: video-codec@1a020000 {
 			#size-cells = <2>;
 		};
 
-		jpgdec-master {
+		jpeg-decoder@1a040000 {
 			compatible = "mediatek,mt8195-jpgdec";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
 			iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
@@ -3025,11 +3025,12 @@ jpgdec-master {
 				 <&iommu_vdo M4U_PORT_L19_JPGDEC_BUFF_OFFSET0>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
+			ranges = <0 0 0 0x1a040000 0 0x20000>,
+				 <1 0 0 0x1b040000 0 0x10000>;
 
-			jpgdec@1a040000 {
+			jpgdec@0,0 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1a040000 0 0x10000>;/* JPGDEC_C0 */
+				reg = <0 0 0 0x10000>;/* JPGDEC_C0 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -3042,9 +3043,9 @@ jpgdec@1a040000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC0>;
 			};
 
-			jpgdec@1a050000 {
+			jpgdec@0,10000 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1a050000 0 0x10000>;/* JPGDEC_C1 */
+				reg = <0 0 0x10000 0x10000>;/* JPGDEC_C1 */
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_BSDMA0>,
 					 <&iommu_vdo M4U_PORT_L19_JPGDEC_WDMA1>,
@@ -3057,9 +3058,9 @@ jpgdec@1a050000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VDEC1>;
 			};
 
-			jpgdec@1b040000 {
+			jpgdec@1,0 {
 				compatible = "mediatek,mt8195-jpgdec-hw";
-				reg = <0 0x1b040000 0 0x10000>;/* JPGDEC_C2 */
+				reg = <1 0 0 0x10000>;/* JPGDEC_C2 */
 				iommus = <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA0>,
 					 <&iommu_vpp M4U_PORT_L20_JPGDEC_BSDMA0>,
 					 <&iommu_vpp M4U_PORT_L20_JPGDEC_WDMA1>,
@@ -3088,7 +3089,7 @@ vdosys0: syscon@1c01a000 {
 		};
 
 
-		jpgenc-master {
+		jpeg-encoder@1a030000 {
 			compatible = "mediatek,mt8195-jpgenc";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VENC_CORE1>;
 			iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
@@ -3097,11 +3098,12 @@ jpgenc-master {
 					<&iommu_vpp M4U_PORT_L20_JPGENC_BSDMA>;
 			#address-cells = <2>;
 			#size-cells = <2>;
-			ranges;
+			ranges = <0 0 0 0x1a030000 0 0x10000>,
+				 <1 0 0 0x1b030000 0 0x10000>;
 
-			jpgenc@1a030000 {
+			jpgenc@0,0 {
 				compatible = "mediatek,mt8195-jpgenc-hw";
-				reg = <0 0x1a030000 0 0x10000>;
+				reg = <0 0 0 0x10000>;
 				iommus = <&iommu_vdo M4U_PORT_L19_JPGENC_Y_RDMA>,
 						<&iommu_vdo M4U_PORT_L19_JPGENC_C_RDMA>,
 						<&iommu_vdo M4U_PORT_L19_JPGENC_Q_TABLE>,
@@ -3112,9 +3114,9 @@ jpgenc@1a030000 {
 				power-domains = <&spm MT8195_POWER_DOMAIN_VENC>;
 			};
 
-			jpgenc@1b030000 {
+			jpgenc@1,0 {
 				compatible = "mediatek,mt8195-jpgenc-hw";
-				reg = <0 0x1b030000 0 0x10000>;
+				reg = <1 0 0 0x10000>;
 				iommus = <&iommu_vpp M4U_PORT_L20_JPGENC_Y_RDMA>,
 						<&iommu_vpp M4U_PORT_L20_JPGENC_C_RDMA>,
 						<&iommu_vpp M4U_PORT_L20_JPGENC_Q_TABLE>,
-- 
2.50.1


