Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE59C64EC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uI8ks2HSjCnl59mBX3gQui6Wi/0PmjCI1VR792jQrk=; b=HYczc3wXXCfqF2fE1iz4YFRpgT
	ZtfFh+Dhom7WPzN/PWEPdO3zsHYV7pgVGvodFxAa5YFbtvDynzXKaopRDWfyOGz4ihpA/uXVxaww0
	UTZo2cc5VraNb6Av4IBA8WUtVE2Uvyq4i0NSXi3o1qZt6rmu8K7ljudc1KNv6z1cd+JlfyS7Nwx9D
	0lCx9L07hbJwY9kG/tlEF8e4otc5kgR3u+h2o0oMBuCKEw6XKIg8HFlCM7ArPMfXCeH7gb9N950OY
	DpTYspLAr9peu1m0IgtT+cPxO6m6uSQP54ucTn8elYQCel3HQhKHJxpHCihFeWuFbjhRduBCiztdD
	ckt5pLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxa0-00Cm5i-Ry; Tue, 28 Feb 2023 10:51:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWW-00CjyM-Er; Tue, 28 Feb 2023 10:47:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C54BB6602FD8;
	Tue, 28 Feb 2023 10:47:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581275;
	bh=/37a11W4Djj29RkQI1F06mX5BvaAyxmllH1tjzesJsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jUnwV8DkKYgp0efQlZ3Av9SsbY6lnJiN2sKcpLo/e4f3yhDfgFMfut41lHFFvxFJF
	 7ZaNMdC5qXqThl/VOOPyDJdTSvotOxLx6I+hQtMNgy2AOkVx3GjwHFHi9BUzXETiSn
	 D9Htts/fzp+ZHMRu8u0SVAE1T0LxZOfO3pjH4tZ4b1omL8+eroO8SAU9tvIIYkpV4X
	 HuZP6Nfj14F9VHdUOvoAnRyABirJJRD/x+vGKaHFNDPmpbXHv/adsWc7yVjjjBVEXK
	 OcUP987PtCzd+cLJT+jhhJzO5sBuqKgFmsGi+MD9ec7pmuT6yg/NL2+TSUsQSBe5Yt
	 1NNvMZLvyqSAg==
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
Subject: [PATCH v3 09/18] arm64: dts: mediatek: mt8192-asurada: Add MFG0 domain supply
Date: Tue, 28 Feb 2023 11:47:32 +0100
Message-Id: <20230228104741.717819-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024756_656683_6443E1E6 
X-CRM114-Status: GOOD (  10.32  )
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


