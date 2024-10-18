Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233EAD30016
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PxEsjCf31Tkw005I9P1OmCSB7WQrpxMmqDKHcNpjckI=; b=k84crakrDphbabOcoZBIxhzd44
	FSv4WttFUo6O3oTYWNSb3CBXagayk7XMRTlLpAmImfH+8rzBEHT+rlFTHvfG7yJahbq2VapE0sTHf
	Vg4XIzKSl3h4HKkzoyenDSqd5n6hWLbU79Fo8hqQ+hA/aObhYiAFx+2OFiWoEuaWOKfQ+Goqnx94I
	DWRmIo0oAmJhH71gH0F0hS/wheSThsgErvWMHNnQeU3Jc2t3hJKUj/6q8F4FFOTjAyu9ajVPLQvWu
	xb4fZ+la+rMn8dtDJoL2uW/VyYh7A+vDXw4Ryx9f33WcOdb7tSFT2g+DovpCwfQr+8qadsPJWJsOP
	GLtg/U1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1opM-00000001BNu-0d8r;
	Fri, 18 Oct 2024 15:23:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ol0-00000001ASI-3GLS;
	Fri, 18 Oct 2024 15:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729264752;
	bh=SxTw5Ce/pOnrjKwvBcbYJ7lzE+rssP9CUicVkJ98jZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I/Q1zbdJ8AWzIFGD0LOOQFgW6ip2mU0szB6ZlEsOCRooFwWD5f2USaSlh6+s4RJYd
	 p8oomaAEBujBAbPDsLqMoPPTLD3QCx2+rb9e7gZX6xoH49E/HyvCq76sA63FO28kwf
	 KKFCyWfFYLtXi+BJw6fqpdemBEIYZ68E/IaqBFeJqwTpilMjypnG7csikHSeQldDzJ
	 VVTEtTx4PMubtB+KRV6bHIml1JPIiQu7a1CtBZGhn7H8LVsFJS81vg+s0LaQb8YFf1
	 z23nrIyaJm5EesCtsZ58Ds86Sd7Z8xjCStq6g6ccneKjyGiDbmzJjPeVTlynMAzBss
	 1G3AT+i2JeOmw==
Received: from [192.168.1.218] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E0FE17E3630;
	Fri, 18 Oct 2024 17:19:09 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 18 Oct 2024 11:19:03 -0400
Subject: [PATCH v2 2/2] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241018-genio700-eth-v2-2-f3c73b85507b@collabora.com>
References: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
In-Reply-To: <20241018-genio700-eth-v2-0-f3c73b85507b@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Jianguo Zhang <jianguo.zhang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Hsuan-Yu Lin <shane.lin@canonical.com>, Pablo Sun <pablo.sun@mediatek.com>, 
 fanyi zhang <fanyi.zhang@mediatek.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_081914_992180_BF1BA3AF 
X-CRM114-Status: UNSURE (   9.36  )
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
with speeds up to 1000Mbps.

Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Hsuan-Yu Lin <shane.lin@canonical.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: fanyi zhang <fanyi.zhang@mediatek.com>
[Cleaned up to pass dtbs_check, follow DTS style guidelines, and split
between mt8188 and genio700 commits, and addressed further feedback from
the mailing list]
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 .../arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
index 0a6c9871b41e5f913740e68853aea78bc33d02aa..a063c7504cce08707a308b72559f2425eee515e1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &eth;
 	};
 
 	chosen {
@@ -845,6 +846,25 @@ pins-wifi-enable {
 	};
 };
 
+&eth {
+	phy-mode ="rgmii-id";
+	phy-handle = <&ethernet_phy0>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&eth_default_pins>;
+	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol;
+	snps,reset-gpio = <&pio 147 GPIO_ACTIVE_HIGH>;
+	snps,reset-delays-us = <0 10000 10000>;
+	status = "okay";
+};
+
+&eth_mdio {
+	ethernet_phy0: ethernet-phy@1 {
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+	};
+};
+
 &pmic {
 	interrupt-parent = <&pio>;
 	interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.47.0


