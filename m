Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297B0C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHIhjtiHzQWzav1Rzj87gVh2UGLcb2euBMKf+Ai9Bno=; b=IMAlyWGrqQU672oL9hY7HgdY3x
	QNz/lalHCkPz9D1cLtTRlI5C45442JvyeU3gRdeYah7CD5dLYU8hF67bb533+rULchW/RkdOUPI5o
	2+QqVma2vvlQn6VTZnov6Wn5DSv3F0r2cEvmVQdVcj3HJOKOIu54Uyeb6KjypEEn6GMUuMmAgN7q8
	3Jsh6BMJY1ZJQVpk/lvm6Xgx5dTNADhASLjZpgSZND3UV8dSBKLhA6W57Tg3gtKwIHeTERHSXStri
	N+IUvQ2rDANrQQbQEFd4IdMvyIUcuDWAuI3sjQxay9xZIoNDkCg6AWGFjbksMdDVkR7nBpMXb0fvo
	OGAhagpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aFV-00CtME-Kx; Wed, 29 Jun 2022 16:09:05 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a78-00Cof2-Qu; Wed, 29 Jun 2022 16:00:28 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79AB36601956;
	Wed, 29 Jun 2022 17:00:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518425;
	bh=SNen9swPBsEHXS8P51GX0gG1JD4BO4FIhFQGHBNVKtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=laJDhYt22pwi+Vo2pepUI0VbSlrpfKVE9+99pydYxucpyavxNZnYi1Nl2ACq9+HB+
	 LRthalCQTGrpqz4vz1LhnohwytS9H65MFhfJWynYGPl8JitDy6N6nMeqK/GgQci/d7
	 9+NHy6TnS3j9al0+kJPxKIYDf7+hTqttqLdBln177AoCoN9wFeyOOW4qL9SIkHd9l+
	 pa4IARvJxESVRcwEezNEZU+E6cx+IVHfxdxidjiNXV4cTOcIvwnaKreQbN/i4QJ15q
	 NQqp/zGUiTGU4qhvr5Ls80JcQ95czf+deolJwGbmYQnRyxU37zRp+lZ7ZpZgAWs7jy
	 cJ4cJHL66Yxcg==
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
Subject: [PATCH v4 15/19] arm64: dts: mediatek: asurada: Add MT6359 PMIC
Date: Wed, 29 Jun 2022 11:59:52 -0400
Message-Id: <20220629155956.1138955-16-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090027_081034_AB7E28A3 
X-CRM114-Status: GOOD (  11.94  )
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

MT6359 is the primary PMIC present on the Asurada platform. Include its
dtsi and configure properties specific for the platform.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

---

(no changes since v2)

Changes in v2:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index e59c178d3d26..31c9d1f8c80a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -5,6 +5,7 @@
  */
 /dts-v1/;
 #include "mt8192.dtsi"
+#include "mt6359.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -168,6 +169,31 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 };
 
+/* for CORE */
+&mt6359_vgpu11_buck_reg {
+	regulator-always-on;
+};
+
+&mt6359_vgpu11_sshub_buck_reg {
+	regulator-always-on;
+	regulator-min-microvolt = <575000>;
+	regulator-max-microvolt = <575000>;
+};
+
+&mt6359_vrf12_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359_vufs_ldo_reg {
+	regulator-always-on;
+};
+
+&mt6359codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+	mediatek,mic-type-0 = <2>; /* DMIC */
+	mediatek,mic-type-2 = <2>; /* DMIC */
+};
+
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
@@ -555,6 +581,10 @@ pins-report-sw {
 	};
 };
 
+&pmic {
+	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.36.1


