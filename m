Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A99C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nVuRbxG2KICgo3eNox1HS/XV0dm6dwDBd9w0Ym3pfTQ=; b=EpVhI08cf3RyLTRL3OJanvco8s
	WxvX9hEmrUI//XraHPf/VWWaC2TuIBKK7RqcKyqnDYuRPK+7LJQrUELRo8bCUvIlwWxBMJSnykX0U
	UM09USaX2nWFoiuQ4I5oJYhnrxpzucorn2o0h3bG/vX3jYeuMTrCtxk2dpZrXYH9ERqyh+9y92GRM
	eCOj0XEMrcxEzBcPJkXD0ubnX6JPeb6KFT+IYYSU7xlpvxXL0gG/CasA+BuLXjEpLMdmTOXkmS+/t
	7tv4Zl21mgOcTyZcOMZfssHua2fC2l3FxeDHj0BJSFVcUXnsEE4Wkp9B291g4Ik18BvHvxNBOdUNw
	HpD6G9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi6T-00FMvc-Qu; Wed, 08 Feb 2023 10:55:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxT-00FHyw-QX; Wed, 08 Feb 2023 10:45:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D682766020A6;
	Wed,  8 Feb 2023 10:45:45 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853146;
	bh=Mqy0LgOrBL26ZfucrNTJt9JsISYGYClqtHybCr31CoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AUjBo8hyLbjv5WQUTkYxYo5hESE6F8+22wnGjjCI3xKDFuQxIV3ZfVgiKCdpF/jUI
	 R2de2m9z+Ab2XnjLG1yn/kuuJcGeCzNgceH6vOwVCAqhOQAhJJLuhmndj+tKZo9S4h
	 e1s3AY//QlYxfG2FBb9iJkkxwD2se5WCCS77jZSwgCFRmqCx8xjmWZ0YVBQJtdC3vA
	 5XfiLiGOQeQmHhBORsO5x6SNwzudYjS3x3OgZ2CUx5XN+Tc/faqUe6kN/5oAO0nPfQ
	 9AgtMGf9RZg97bMvVYPvtXyJUA7MuZClvdjMCAtTI/jTTTB17yCBGZeHwRs7fSwHu1
	 pvCCASccPyfNw==
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
Subject: [PATCH 15/16] arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
Date: Wed,  8 Feb 2023 11:45:26 +0100
Message-Id: <20230208104527.118929-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024548_042981_B723B083 
X-CRM114-Status: UNSURE (   8.86  )
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

Enable the Mali-G57 found on this platform with the open-source
Panfrost driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 56749cfe7c33..24669093fbed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -238,6 +238,11 @@ dptx_out: endpoint {
 	};
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&mt6315_7_vbuck1>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.1


