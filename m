Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BE9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTPtswA+/sXIRyL2rOIJLCxneLX2J1EeLGI8jVuItrw=; b=uZzBB++vE8feUMeGYVgIXolWnb
	Vs8KZw+Sydt+Ab8D9ysoFq8B50qQtdJ5R+O2oDi3s5X2PoCHVNRwKwAD54Q6MamTGBvvTmGR/JFK7
	q3oNoRxCnPtX+GtUvwfdMZUg/yoWW7a+1wVQUly6JfENUTbkME0al6LCMe+fuRPwb4/CSyExBXsd6
	UHtDsco7JArlvxjoZM+YIvFkbWP4INZjHRnzFc++AFyxeUYKf717KphyFx29MiTWX0D064ArXZJ4d
	iSC+wvxJD4I0UlZqCILYmnxNRD5MZ+LIjiDXG53wN7XLdt4/1i5apH4Rcnv2X0ol5oqn26iuvrOwJ
	clcbQVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aGS-00CtuH-Tx; Wed, 29 Jun 2022 16:10:04 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7A-00Cofr-8Y; Wed, 29 Jun 2022 16:00:29 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E55406601A52;
	Wed, 29 Jun 2022 17:00:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518427;
	bh=vZ9XvC5lN6ld9CuAEKGg4eWU+inCLtaAJj3gykR2qRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kroCAwD9EotEFf6ntWKGoMCnuT6MkbcPEdP2kmpMrqrG8CXL3qErgDCUhnc2ud6RQ
	 E544H3FLOb3gThZbIrN6H3KBnrVc2kB7cTWu5eKjxCE9fo6Ad2SQ/NbbUvS5Sh9LER
	 ywFTqBoG8ofREu/tdXUSQeXa2XPLirgxMo9LJY4yTEobT7dlwRSrscU2TZ5q5LOPyY
	 0wep5r8udr+0OLq09pHjk6wImA/R9UQdG6ZjJ41I22ipxR/jvVrmLXimNFgem6Dm6o
	 X9o8hDdh4d4OHJaAYCpvFnZW/FLf46TJxaAnrugiUhfUrGrquTUU9ofACRZBd8TWxf
	 hi4B5Rvf0J74w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 16/19] arm64: dts: mediatek: asurada: Add SPMI regulators
Date: Wed, 29 Jun 2022 11:59:53 -0400
Message-Id: <20220629155956.1138955-17-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090028_512255_DF495FAC 
X-CRM114-Status: GOOD (  11.50  )
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

The Asurada platform uses regulators from MT6315 PMICs acessible through
SPMI. Add support for them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

Changes in v4:
- Updated Vgpu minimum voltage to appropriate value

Changes in v2:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 31c9d1f8c80a..d56c73e37633 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -7,6 +7,7 @@
 #include "mt8192.dtsi"
 #include "mt6359.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	aliases {
@@ -679,6 +680,54 @@ cr50@0 {
 	};
 };
 
+&spmi {
+	#address-cells = <2>;
+	#size-cells = <0>;
+
+	mt6315_6: pmic@6 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x6 SPMI_USID>;
+
+		regulators {
+			mt6315_6_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vbcpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+
+			mt6315_6_vbuck3: vbuck3 {
+				regulator-compatible = "vbuck3";
+				regulator-name = "Vlcpu";
+				regulator-min-microvolt = <300000>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+				regulator-always-on;
+			};
+		};
+	};
+
+	mt6315_7: pmic@7 {
+		compatible = "mediatek,mt6315-regulator";
+		reg = <0x7 SPMI_USID>;
+
+		regulators {
+			mt6315_7_vbuck1: vbuck1 {
+				regulator-compatible = "vbuck1";
+				regulator-name = "Vgpu";
+				regulator-min-microvolt = <606250>;
+				regulator-max-microvolt = <1193750>;
+				regulator-enable-ramp-delay = <256>;
+				regulator-allowed-modes = <0 1 2>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.36.1


