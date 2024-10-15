Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB485D1D893
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkkUPaaFKSKR+PIT0UHypuJjuSNncGPG5xTJ06RAQuI=; b=OgcnLDo0ZxKtR3RzKPXLA0fwju
	h78zg0kHYhdzE6SrMulXi+Khu/4exzXWjRsFxjvMVjZ5qy/J/Psk1+Jlze5SkM6L8E8VEp6hofEQZ
	VSm1gJHegRepuAw0GIru9hB1QUrtd2Iscfw4qJfcr6ZYfVKptBVxBvtxE63LB/Km14SF34kIpea+W
	cWjgiLCvQaXRUpZpHG0v17JtNbEJQR+EvzTC0gvSDqvUUrOgvbwjMpaXVHUm2A6hHCf92fzIqTMPj
	3EkVrXqbSL1XEEk8o4bUg81wouzjXDOdDr/3nsRqq9rtXAU+kWFymQw6RY+cz1QTT58w/uVuKJmhT
	nTrpB06w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mF3-00000009BZP-3lCi;
	Tue, 15 Oct 2024 18:25:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0m9k-00000009AZn-0Mzg;
	Tue, 15 Oct 2024 18:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729016426;
	bh=E2gOs3UqePmkVJladD+DLQjs/f55bJHoGr84z8564Nc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jH4OoGPDk0aVyfiS/cLKMzw17XYyB94r8zru2XB5x1vumpgmLUYp43Uu08VsDvo+D
	 LvwnBCKHcXC3kWjR9iMaTMPFbllHPgOACPH8YrgLgvuNDr1XOSPEdGgcY2Xa43LCyz
	 KK+F37ETvJW4LX/Q3JKL4eKGntWxjo3fNxfel2FFT4r5HsWLUtUBw7hxsP8lnwXql+
	 OYdzdjJEtT1dSinjiYq6WhpdkEJbDEZu5Zhs1X+tddRLNE42yPx/euBRk6HXnuEQBU
	 wgJYTFAe9r3kVt7PqBbK/p1EZjTVVTumFHYih8mDCXdHU5BKPIPEiU1uZkyXH8txl0
	 6itdU6TIKv6kg==
Received: from [192.168.1.206] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC39B17E369C;
	Tue, 15 Oct 2024 20:20:24 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 15 Oct 2024 14:15:02 -0400
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241015-genio700-eth-v1-2-16a1c9738cf4@collabora.com>
References: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
In-Reply-To: <20241015-genio700-eth-v1-0-16a1c9738cf4@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 fanyi zhang <fanyi.zhang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_112028_299401_2F196B09 
X-CRM114-Status: UNSURE (   9.83  )
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

Enable ethernet on the Genio 700 EVK board. It has been tested to work
with speeds up to 1000Gbps.

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: fanyi zhang <fanyi.zhang@mediatek.com>
[Cleaned up to pass dtbs_check, follow DTS style guidelines, and split
between mt8188 and genio700 commits]
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 0a6c9871b41e5f913740e68853aea78bc33d02aa..73e34e98726d36785e8b2cef73f532b6bb07c97f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &eth;
 	};
 
 	chosen {
@@ -845,6 +846,30 @@ pins-wifi-enable {
 	};
 };
 
+&eth {
+	phy-mode ="rgmii-rxid";
+	phy-handle = <&ethernet_phy0>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default_pins>;
+	pinctrl-1 = <&eth_sleep_pins>;
+	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	mediatek,tx-delay-ps = <2030>;
+	mediatek,mac-wol;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethernet_phy0: ethernet-phy@1 {
+			compatible = "ethernet-phy-id001c.c916";
+			reg = <0x1>;
+		};
+	};
+};
+
 &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.47.0


