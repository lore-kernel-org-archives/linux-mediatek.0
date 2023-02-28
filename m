Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D46C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iyLuPdQ36ws5UWwz0DTyVm+DRNbV7aqx7j1g6jgQM2s=; b=Vn4F8xDTFjfVZihK7BCC/t3cbU
	oh4oH7rEfj3iTWXfQeVnTzptDUMmi8z+ztCGBUNw4LjomiP8/cRp22ubl662c9q2BMD88k7jxYP99
	Xr95pnlI7hSCpqcrZ+FqOm18p1bvux2QOa0JDnlfCgkRMpSVODUp7tMttseVzAXfDVXoRKd/0Dduo
	vumtdxrM4UvkV22tAHn7v1LMgCPsezGQkje8de0J3LnIeOZhccbwArihHLAT3/g2T7oNrz93vzNcw
	UmRdjSq6rCxR3JmeMbmCUG/ts4l00wdULIpk1x/gajyYnUpxmOrBcr0/KXd+BaHc2DqUNzi7he3cx
	7clmgBHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxaP-00CmLP-EV; Tue, 28 Feb 2023 10:51:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWX-00Cjyw-2e; Tue, 28 Feb 2023 10:47:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D8B26602FDC;
	Tue, 28 Feb 2023 10:47:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581275;
	bh=0DuJlRJGD/KVpO4odInSp/0rxcgpiRzq3+IVJVwVWMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BkmJzhOgmkJosw1IA7xWf5oLQRhl1YAP7Yqw2UzBw82i7SFvHViUJdyKYMHlIqrw0
	 WV5jf9RJKGj37HvSAr5OGqMUTkikMYvQS9Wsqk8nX8A6azQ1CrSwUmcQt3Fs2T5VXb
	 eY5AbfFxsjXwyzRthyx9e66VpX5QXKsakbdSc79l+Hq5nBpqfN9Q3EAHgvw1BF84Wa
	 37VgzuoWvk9K1yDFPQ4G5U5nEVnt1FJIIG6si1VPRfvS0XCbY+PvofiPlMvDwPXf0x
	 dkAx3lI6gliwfW2jGMXqgCpUjQeDSyjRkES/RDE2nar5VVF084vOFIYB+Wenf8H0kx
	 lDBFULPxkGgdQ==
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
Subject: [PATCH v3 10/18] arm64: dts: mediatek: mt8192-asurada: Assign sram supply to MFG1 pd
Date: Tue, 28 Feb 2023 11:47:33 +0100
Message-Id: <20230228104741.717819-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024757_293091_98C60DF0 
X-CRM114-Status: GOOD (  11.67  )
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

Add a phandle to the MT8192_POWER_DOMAIN_MFG1 power domain and
assign the GPU VSRAM supply to this in mt8192-asurada: this allows to
keep the sram powered up while the GPU is used.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi         | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index ec013d5ef157..df477eb89f21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -384,6 +384,10 @@ &mfg0 {
 	domain-supply = <&mt6315_7_vbuck1>;
 };
 
+&mfg1 {
+	domain-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 &mipi_tx0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index f19d4a8ef3f6..5c30caf74026 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -506,7 +506,7 @@ mfg0: power-domain@MT8192_POWER_DOMAIN_MFG0 {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8192_POWER_DOMAIN_MFG1 {
+					mfg1: power-domain@MT8192_POWER_DOMAIN_MFG1 {
 						reg = <MT8192_POWER_DOMAIN_MFG1>;
 						mediatek,infracfg = <&infracfg>;
 						#address-cells = <1>;
-- 
2.39.2


