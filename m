Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D988C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2CIQC/2p1w9W0o0VSFt4Y6a9lpfZ1+hlUln3h24/m1g=; b=g80/+8oNx+ecLG
	MNBdVcQxbXbw0YXuOR/x58a2K3zCvR+8FtO195TSH9mycv6W/o3/buKUBvw6GOvXsa6y3e1UhGL2m
	Ib2LbChPCQpyR9FwSomB1jk9v05CUC7vwW4IIAZbdhUEG0iiyq06YBo3YuaAcAKyPMyqlSEipVF10
	qNC8k9Iwd2wwAHz/jBGY1GXQInpaJK4/wSpDwFWMg7lukN6r3vP8p/yacf7DW0URWOdtvcXX4Q2Hp
	DixwoM5sMrWH2ujYJXO78mnNi/+Hcq0ldLIpGzMNIhOZW/l0zZUijEE9geFiLVkwOX/GGhC4/05IG
	2Mnd0wY52s6PCtKoMKHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8mF-00GTVI-Ox; Mon, 22 Nov 2021 12:50:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8en-00GQVc-NJ; Mon, 22 Nov 2021 12:42:51 +0000
X-UUID: fc171ba683a04523b0dcbeaa4eb095ee-20211122
X-UUID: fc171ba683a04523b0dcbeaa4eb095ee-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 339758171; Mon, 22 Nov 2021 05:42:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 04:35:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 20:35:58 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 20:35:58 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v10 1/2] arm64: dts: mediatek: add pinctrl support for mt7986a
Date: Mon, 22 Nov 2021 20:35:51 +0800
Message-ID: <20211122123552.8218-2-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211122123552.8218-1-sam.shih@mediatek.com>
References: <20211122123552.8218-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_044249_811687_C70C22E8 
X-CRM114-Status: GOOD (  10.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mt7986a pinctrl node, and update pinmux setting for mt7986a

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts | 20 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 21 ++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
index 6911862390d7..5cd760abff51 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
@@ -29,9 +29,29 @@ &uart0 {
 };
 
 &uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
 	status = "okay";
 };
 
 &uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
 	status = "okay";
 };
+
+&pio {
+	uart1_pins: uart1-pins {
+		mux {
+			function = "uart";
+			groups = "uart1";
+		};
+	};
+
+	uart2_pins: uart2-pins {
+		mux {
+			function = "uart";
+			groups = "uart2";
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 77906839cc85..b8da76b6ba47 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -107,6 +107,27 @@ watchdog: watchdog@1001c000 {
 			status = "disabled";
 		};
 
+		pio: pinctrl@1001f000 {
+			compatible = "mediatek,mt7986a-pinctrl";
+			reg = <0 0x1001f000 0 0x1000>,
+			      <0 0x11c30000 0 0x1000>,
+			      <0 0x11c40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e30000 0 0x1000>,
+			      <0 0x11f00000 0 0x1000>,
+			      <0 0x11f10000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rt", "iocfg_rb", "iocfg_lt",
+				    "iocfg_lb", "iocfg_tr", "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 100>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&gic>;
+			#interrupt-cells = <2>;
+		};
+
 		trng: trng@1020f000 {
 			compatible = "mediatek,mt7986-rng",
 				     "mediatek,mt7623-rng";
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
