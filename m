Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAABDC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTzfwVQNhQYk3LSeDUOpai/aL5+NZ7UnxvSU/1W/PzI=; b=dqaqqzeKVhC8TW7HDljU+F7/il
	DAWM3m+oWmYJfIOz9zPPJRrUgS69CMjyqwSy+a3Yt+oZt467cIPpd6BMLCfSlFprWAmvuDe+ynBi/
	rwlAxJfybVIAxetgH63EvgVAVE7aZWY9LfzUJ5RyEB7WKmjuSIo5gph4a42Paek1jiHYEhF7anmm6
	lpPwenuBXQbUklh4IWNsaAopuEMIpIKQDxjd9ksD+cj5ZluRtMqxnvYz5G87ScTglLy3b/6xK6Wvt
	AXePakmjEm+/ChQiFrheHbLmFWBCQYVFM21YtpGHV0PMRr4KLlAPvyNnRwxjv/JEKuuuxmrDzytsA
	FXTvk2AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M7d-00F2K5-6w; Thu, 23 Jun 2022 12:39:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4M76-00F2BR-Hy; Thu, 23 Jun 2022 12:39:14 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D572B66017D2;
	Thu, 23 Jun 2022 13:39:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655987951;
	bh=ZgzmMPSygjLJDHZK16WVrb6boCW48PbwILdNxmzVx4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ls/Kus62omyS2oWsKbe3AP8qdUos5qBFpIZgx0qErociP16Ku3MzkoIYnIVJ2eLPN
	 0x0n7H1QGqUwFqN/s42jvnQ4MplaX/JvI+IJ19IMLzOBlhcNAHW64vPV8eMQp5U9dl
	 lgW4kvRLQkJcbLhJ5NpdHZ36SJ68uxub5ebRTNt9pKCrA16VpUZausPdbhxapuLxzO
	 BYNf/8tp91p+T6iw+Lr40/Gy6+nm9UMNcXxpMxvRbqAmngcmojfXVQx8NXNHIYfDzj
	 CJAqocdlH48y/cy1NYn/NigwXknA0dFhKuplEPoQ4pUCaytzxbqzXaTJJ1Hh/EuFgj
	 OSGGhE6CGjxGg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-kukui: Assign sram supply to mfg_async pd
Date: Thu, 23 Jun 2022 14:38:50 +0200
Message-Id: <20220623123850.110225-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
References: <20220623123850.110225-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_053912_753157_C8B8C210 
X-CRM114-Status: GOOD (  11.26  )
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

Add a phandle to the MT8183_POWER_DOMAIN_MFG_ASYNC power domain and
assign the GPU VSRAM supply to this in mt8183-kukui: this allows to
keep the sram powered up while the GPU is used.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 89e4358f140a..33f3bf277ce9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -821,6 +821,10 @@ cros_ec {
 	};
 };
 
+&mfg_async {
+	domain-supply = <&mt6358_vsram_gpu_reg>;
+};
+
 &mfg {
 	domain-supply = <&mt6358_vgpu_reg>;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9485c1efc87c..9d32871973a2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -788,7 +788,7 @@ power-domain@MT8183_POWER_DOMAIN_CONN {
 					#power-domain-cells = <0>;
 				};
 
-				power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
+				mfg_async: power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8183_POWER_DOMAIN_MFG_ASYNC>;
 					clocks = <&topckgen CLK_TOP_MUX_MFG>;
 					clock-names = "mfg";
-- 
2.35.1


