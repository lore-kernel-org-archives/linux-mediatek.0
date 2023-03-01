Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0BAC64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=49CjZOxDeXcpbReFKMQg/SF+T5Q+d4BKNHtZZmK4GYU=; b=YK+GlkR3u9ruiVjVb5UreCpQsY
	TvLkvxwHBk1OeKo0qUnmeHW4CE4k1XETQRbR5PVAiF45zTtyop8xpGcpjkNJl3+l2dAJ97D/YARQd
	ZAAuxpV6IfxrrpTIobjuWcneHXApxU7a5xDGlgv/N8AWL8KtGZdp+AX7S2wwUSt5OhY5Ca0id1J+u
	qHq3eJ8KbGildxeYsk0n5x5D01lOIyS0LFRGhdZ1Yv/bC2NaWMwqUO64kCDFeMPfZGmXET/NiMxV0
	C46WvTkY+VxE42aOOgP1Xn+wMFEuDHNE63xTQKBetUm0Bn0CpaEphzjQx+zBX/4yw3d1inICNZl9E
	+PiopnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJLH-00FjL4-M9; Wed, 01 Mar 2023 10:05:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBX-00FdRw-C1; Wed, 01 Mar 2023 09:55:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AEC4F66020E0;
	Wed,  1 Mar 2023 09:55:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664542;
	bh=MxY4ueOZBhNlSB3Ww60xM9JsVfchLfbcAG6Y8p1jhmk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vtqp1STq6IcNA22VmWpCX/xSfdrywj3W2JI2rwI+V3/0IxHQyu/+nOTYd/KSW+v8B
	 Sa8pOsOmmfWXo8TmrnKpjL+Zq3WM5VwZxJsCJRRn21jAXO+CuOquYanePxaxt9DWyK
	 whrAtX2aGdD2AZgj09COHUV4s1qRyDTPmjvk44ptZ68MF0H+Jw9/Cfh+oMbJSpu6bQ
	 1lAtpgahRbrBf9ApF7R2Idt/DMd0QVFszv9WSvPt5cVaMR5k1mfjrxD18qzDPJyWoO
	 GlqNC6AqgviRbX5lTl2mYm8frUmjezgg0c9NsEpAGKUCk9MLsi4mOCM6MbaWqsNLjh
	 1RCthkU9h7Jig==
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
Subject: [PATCH v4 19/19] arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
Date: Wed,  1 Mar 2023 10:55:23 +0100
Message-Id: <20230301095523.428461-20-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015543_560307_BB1E7D06 
X-CRM114-Status: UNSURE (   8.58  )
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
Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index fd327437e932..3e3f4b1b00f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -138,11 +138,17 @@ &mmc1 {
 };
 
 &mt6358_vgpu_reg {
+	regulator-min-microvolt = <625000>;
+	regulator-max-microvolt = <900000>;
+
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
 	regulator-coupled-max-spread = <100000>;
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


