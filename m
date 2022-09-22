Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A34C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GpZtFrMvgpzkW7K6t+sA3UQxZl7aYxl7wu1jxpPoQiA=; b=4Sikm0Pv0HdtEs3JbLpd099DBW
	kyCyE3q/EETTrFIPkSGRjmbIr7rZzMoZREW3OcQQSiEf/3elymogWZ6vLDS6fXK7o43T2PMxd+7DV
	Vvea7LvOdxhmJvDK7/s6IHFFV8UFAirg3yPkjHK8vCz2n9jQ4Ldux8s5cyLQHszVOcvT2Srr/GK93
	WmxTvJXV2f3GzMUfofOO3DCDa9JPzywKs14C1jzTW6lCC9t8ZZTvFXuKOK8OQRiaAmXm08r9MvCka
	aVa+Z5bXiXoixoi8QpBzCOcd0TqglN39WOTn77weqBMsAtEhsYXQ/BHqVyY2AKoTt0wLri32UQsCF
	DH6jTNdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8F-00EnFp-9E; Thu, 22 Sep 2022 10:08:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIpb-00EZ4S-GM; Thu, 22 Sep 2022 09:49:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CF352660221E;
	Thu, 22 Sep 2022 10:49:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663840155;
	bh=fkgvOEpFveDqGiVfiz6Zm3QLw7vdRwQw9bnbQlnHoOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H+cBS6rhWgJGmzcx2x181scVLmXL0RRRCKb81jbR7XY+bxqAFOoe8fxZLJJNUjmaM
	 W2u1BjDecDBjzsEGdlKBncc1kL6TBkts3u1L+3MXyRLTlhSX/zH3EzsJqSEieGvnTJ
	 /QXRoxI836Z/1bLxlrjPRLF210jBZKCfl/RJ/GI2PdndpujTkHZe7XoRqNlTbhkuyD
	 e6KZzvzFXPoXikVzvPSPxLArNjFQS/FJ9ghUFt98KzeJNS6RN3wyoleReKI9EM9FfR
	 vFtoDj4w/hXtsPr3yP1UwoRr632syKWUcvIdAmbA/t1xYWMSgv3Xve/ai099UjiMIY
	 ZVXY8j0XP4d3A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/4] arm64: dts: mediatek: cherry: Enable the Audio DSP for SOF
Date: Thu, 22 Sep 2022 11:49:06 +0200
Message-Id: <20220922094908.41623-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
References: <20220922094908.41623-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_024919_868590_D5D84795 
X-CRM114-Status: UNSURE (   9.90  )
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

This platform is able to use the Audio DSP embedded into the
MT8195 SoC: in preparation for adding audio support for Cherry,
add the ADSP related memory nodes and enable it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index bc7890300a57..3bc624e6f499 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -118,14 +118,32 @@ scp_mem: memory@50000000 {
 			no-map;
 		};
 
+		adsp_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0xd80000>;
+			no-map;
+		};
+
 		afe_mem: memory@60d80000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x60d80000 0 0x100000>;
 			no-map;
 		};
+
+		adsp_device_mem: memory@60e80000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60e80000 0 0x280000>;
+			no-map;
+		};
 	};
 };
 
+&adsp {
+	status = "okay";
+
+	memory-region = <&adsp_device_mem>, <&adsp_mem>;
+};
+
 &afe {
 	status = "okay";
 
-- 
2.37.2


