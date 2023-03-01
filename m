Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E064C7EE32
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AsOCNtpClHoBtLy37FJG2kAeNT+O/S3Ki7X6wTCiZLE=; b=y4zyJTyrbaqSh9hO9AH0FuuiMP
	dasI27cvQLRiPlluH7KjRjavsCZ4zyotBBw8/l9VQS2/F530jHMDi4GoVg03wqywwmtMA0Nc9EsCD
	vves8jQPOYDDLGvVlelMRtmj8A53A8VNYIbDUzIXWuhUrNhFTpUuUXdaN9kNvDC8UpLpFpizvSGSf
	597+HzshRloSHg0WK0MdeszAh5eAwPyeBd5cT6BHoQolBOMkvO4ociyKIs7EPp5ZRdl+Kmuv2KeGv
	Hz+mKF8teY8laBsupak08Q4B6Qvzum7MVZ8erA4M5nZiyy1spNiWrDd7PeWRHNdwjyKvPcL86BFNG
	GICMrsrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBf-00FdWH-Oa; Wed, 01 Mar 2023 09:55:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBL-00FdK1-KP; Wed, 01 Mar 2023 09:55:32 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E5B6F660211B;
	Wed,  1 Mar 2023 09:55:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664530;
	bh=k3mmKlq0xAU4ScRTgH//jypGEajEo18Py+VrtVaBBbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xf4GrQUd18VtRsYjNDhI6iPGwpLLUBmOHp/idd/SAF4TenUvPKPuoNjQK0Fz5zZlB
	 U1vMbfBLlstWasR/g8cupFzaRiy6HWAB0I0coRTMjyXD2Q4ZPsqechcdm3LzdvnKwv
	 jQIyFVdO/8uZC/WgW7nq45PCBAP8I6y5AZHHclDVx4nxDx/Jzw1DlKLVbCv/HqpEZ5
	 NHXM/4J/es2w8GrIrvnCZpDOrG5CefOR2HuRV8jjoMEFVwTfQ6771wUIpRuR4Z2bvJ
	 WLQpjKZFKvDr8XRt8lJZJDrZxxhvyN4RXNmdEhjA+YTerirCmgYmftsEFJbExnjwWg
	 mWWZ5gAPvJieA==
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
Subject: [PATCH v4 02/19] arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints
Date: Wed,  1 Mar 2023 10:55:06 +0100
Message-Id: <20230301095523.428461-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015531_814788_E1F48968 
X-CRM114-Status: UNSURE (   8.56  )
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

Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
with the platform specific vmin/vmax for the highest possible SoC
binning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index de9778c85b94..63952c1251df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -401,6 +401,9 @@ &mt6358codec {
 };
 
 &mt6358_vgpu_reg {
+	regulator-min-microvolt = <625000>;
+	regulator-max-microvolt = <900000>;
+
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
@@ -416,6 +419,9 @@ &mt6358_vsim2_reg {
 };
 
 &mt6358_vsram_gpu_reg {
+	regulator-min-microvolt = <850000>;
+	regulator-max-microvolt = <1000000>;
+
 	regulator-coupled-with = <&mt6358_vgpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
-- 
2.39.2


