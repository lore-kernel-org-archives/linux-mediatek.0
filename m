Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E559C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mdziwQAspuox+PQzTApk82dB5pMzG2q9CRP+dkzB6s=; b=rc5sRBJsQp21zpObOMi2ashvwI
	TNDtCEs9JsJJPDhMdt65mtWodpBSvO4zsQca/ktFZdfZW4IHMi31rY/1mP4WnVNEKalwoh1g7Todo
	aWPk2o5Xyn6CEWw52yNt7cWspSAsEYixUOdchby9+8YCuAzZvubzJlJm0WEL9+mJAB+XlkutDCpPs
	5WrE4fEWC3HZTGzgFgp1CV1RcOu+fOC0Ev+ywB3FB+Pkafqp1pHbspmQpDi5jz/ISf7HTUZOyqNzT
	cawnMUpFqgCSoO2EfPFVZCUnWkKC56WLJ6mJJAr1ticL1bUOBmTmexILHD4gpXvpk/hQn8x2H3qKU
	TfejHeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a98-00CpiI-Qu; Wed, 29 Jun 2022 16:02:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a6u-00CoSi-2L; Wed, 29 Jun 2022 16:00:13 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AEAF8660194A;
	Wed, 29 Jun 2022 17:00:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518410;
	bh=JyFvHzF1h6JWiQjjXk8U9t+6ggzEINjp5AvOftmDRZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UAzu/A85hycjxEbqCXIAVNoOgHNbXQE0ToLnVqVwvptkHeqExUIFHw4d1S/y1RsU5
	 z0WfM0faQBYKnnDUAoTfGDYOxk8RVdC+JUEjObFuYnPEVHOWnBBpTvhWzBDPW/ZcZR
	 iaTUDa2IothvqV7AaQyVwLH2i1qEdkOqeCggP4KP8Fs5rbZfU6DTgmVt4bwHinmW3I
	 24I4HSGWrxYz9GFx8slPdSkeGvAsvMT2YWkFoaAut1DRmEevkKA9FgJWNaROhlc1IX
	 zBUOXYAkX1T0ivkZ1wp4ZJa1VBKvjuS3qmoZ9VYPjyq5l8no+nwNXXKeK+HC6k75L/
	 mw7GhrKa1J3MQ==
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
Subject: [PATCH v4 05/19] arm64: dts: mediatek: asurada: Add system-wide power supplies
Date: Wed, 29 Jun 2022 11:59:42 -0400
Message-Id: <20220629155956.1138955-6-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090012_274902_062CE64D 
X-CRM114-Status: GOOD (  10.15  )
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

Add system-wide power supplies present on all of the boards in the
Asurada family.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- Renamed nodes to be generic

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index e10636298639..ca55dd095e80 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -19,6 +19,70 @@ memory@40000000 {
 		device_type = "memory";
 		reg = <0 0x40000000 0 0x80000000>;
 	};
+
+	/* system wide LDO 1.8V power rail */
+	pp1800_ldo_g: regulator-1v8-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp1800_ldo_g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&pp3300_g>;
+	};
+
+	/* system wide switching 3.3V power rail */
+	pp3300_g: regulator-3v3-g {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_g";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* system wide LDO 3.3V power rail */
+	pp3300_ldo_z: regulator-3v3-z {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_ldo_z";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* separately switched 3.3V power rail */
+	pp3300_u: regulator-3v3-u {
+		compatible = "regulator-fixed";
+		regulator-name = "pp3300_u";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		/* enable pin wired to GPIO controlled by EC */
+		vin-supply = <&pp3300_g>;
+	};
+
+	/* system wide switching 5.0V power rail */
+	pp5000_a: regulator-5v0-a {
+		compatible = "regulator-fixed";
+		regulator-name = "pp5000_a";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&ppvar_sys>;
+	};
+
+	/* system wide semi-regulated power rail from battery or USB */
+	ppvar_sys: regulator-var-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "ppvar_sys";
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &pio {
-- 
2.36.1


