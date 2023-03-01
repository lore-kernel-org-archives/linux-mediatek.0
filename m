Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FFFC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uI8ks2HSjCnl59mBX3gQui6Wi/0PmjCI1VR792jQrk=; b=l6jFxm9LMxkk4tavDg7KXEK7/W
	iCdbu+DWOwp8eo5IQz5f/i60qsX/yqDUHJqTeemopV7g3KuuBugFom4LR9m0Y/R5VnVKxxKId81Bp
	SxGptGiWJAlWI+DoiEXQNwP85456pobYF7bVCfjoUQ4JQjUMm8x4R+Af8eSQ90YLCUPNas9UOqf1M
	HvVCRLYrIuVK52qBlypx9T3+8E2l4BAaGmyO0OdiEyXm7Oc3OqXn9Fa0sCLkvwbufTarVGLrXA12+
	O2tg6DvRVxti7wNYYS904yehwc9X9pH4yu60d0aU4vxgYUVedHkhe/Rann0h9t+zhSuE7dqej+cnk
	L6dfeqLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJDz-00Ff4t-U2; Wed, 01 Mar 2023 09:58:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBQ-00FdMx-ES; Wed, 01 Mar 2023 09:55:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C16D566020E0;
	Wed,  1 Mar 2023 09:55:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664535;
	bh=/37a11W4Djj29RkQI1F06mX5BvaAyxmllH1tjzesJsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T7hJnrRxggsAGfxiujww0LUFHX5pGFVS4hmjQnSH/tVaz8Qh7qZ7s95kwI+W9q+z0
	 4rfqlSt9wJVMmkfjW6hap4fdiNZifTi7JnE1FQ+eSSJ8xfnSJciqOR/athpali235A
	 vWd3XzYyWCmPXV9aT9RvGZp0pKVIvkX5ENsaoMXu8HWfxaL1fOVvIANheRLL/ceHBw
	 Qi8b3ndnG3iWTrR/m3T6492/ACaed+E1dao1dRucN44ec6YUkCVJ+OeUMzSiBUrPul
	 Y47EzxMxoS44gkONhhb4Pc7iX0DtHX0DPsvgRFWwUkeTp4+etuApG+/mo72qdz2dau
	 aWTGfa/hz5Q6w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 09/19] arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply
Date: Wed,  1 Mar 2023 10:55:13 +0100
Message-Id: <20230301095523.428461-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015536_636918_7D5FEB36 
X-CRM114-Status: GOOD (  10.49  )
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

From: Nícolas F. R. A. Prado <nfraprado@collabora.com>

The mfg0 power domain encompasses the whole GPU and its surrounding
glue logic. This power domain has a separate power rail.

Add its power supply for Asurada.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[wenst@chromium.org: fix subject prefix and add commit message]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
[Angelo: Reordered commits to address DVFS stability issues]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi         | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 9f12257ab4e7..ec013d5ef157 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -380,6 +380,10 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+&mfg0 {
+	domain-supply = <&mt6315_7_vbuck1>;
+};
+
 &mipi_tx0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index a29cdff8a095..f19d4a8ef3f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -497,7 +497,7 @@ power-domain@MT8192_POWER_DOMAIN_CONN {
 					#power-domain-cells = <0>;
 				};
 
-				power-domain@MT8192_POWER_DOMAIN_MFG0 {
+				mfg0: power-domain@MT8192_POWER_DOMAIN_MFG0 {
 					reg = <MT8192_POWER_DOMAIN_MFG0>;
 					clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>,
 						 <&topckgen CLK_TOP_MFG_REF_SEL>;
-- 
2.39.2


