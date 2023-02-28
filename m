Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF577C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oy6LEbOn/tv93sD35WQSAVMzmWw0tw/enIbu+SQo8tQ=; b=PJRY1CO3j2oAHTARtf28aYkwXM
	Dgh67obv3gZIz8/vRsg5sCcoapJNBujikKUlKrEiX9WivdEiDvzD4X4QPCVEX3WpLBysmQAkisGd+
	yDhFTJSZ+Qo0JzxiWpGfHVaviVD0XMUGhY6YlHqGJGu8E0FbvXA9J9IPNjP25aQUN79it++8zLtvr
	6YksqF1xw+kEoFx30NN9rbbMR+YbWwWcnvFlCtwGNWv6hmuo6/xmd/cvtj9J0s+sBXIaXgcrEw91x
	91TEgI9mnR29NAoHostJhMqk+SJbfJYa257geOTQS01Vp57GIm4DoEXMyEY+jdAXg6tr7WzHKswKb
	Uyt80y8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxfH-00CpEn-O0; Tue, 28 Feb 2023 10:56:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWb-00Ck31-MC; Tue, 28 Feb 2023 10:48:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB3506602FDA;
	Tue, 28 Feb 2023 10:47:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581280;
	bh=Iwin79s7Du0gnKNyuCiVlTOYzAcjAthdmz358wfq0fA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ONRPHnIoSN/2rIxjTIP1qdq1UCGfN07Z5Pgt6f7WkCkjwy/XUFFsA3fCwym+ZmK/s
	 yxuQ57xO+xuczLY9KBo67vhLS47z/Mrkyr+Jo4RMvB4GUqmFd/NquiDnoJKk6bZI2r
	 lcFzVMxj9xQAK4ulv7jpj1My1JddC8Ipteop4gG1l/vZQ/+5o6z3lc400s7ee1jOHu
	 nsErMvydS/PzCNH91kH13fgkRFBju5L9X4Tqjfyf+453Gj30yP1cLimBAGchtX96iU
	 tzcQbnZqPfBaeRezWagDfHJBKYh6srThZbRrboB+rJmZPlvtrpambKjp1GadifDxCf
	 v/309XhTRdyrw==
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
Subject: [PATCH v3 17/18] arm64: dts: mediatek: mt8183-pumpkin: Override vgpu/vsram_gpu constraints
Date: Tue, 28 Feb 2023 11:47:40 +0100
Message-Id: <20230228104741.717819-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024801_878156_F90488B7 
X-CRM114-Status: UNSURE (   8.10  )
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
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index c228f04d086b..526bcae7a3f8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -176,11 +176,17 @@ &mmc1 {
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


