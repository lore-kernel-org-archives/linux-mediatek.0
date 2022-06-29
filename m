Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9799CC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PYAuu012TpLSJo0/KsdaxT4y44bvl3lGoQvPBrCuAGw=; b=IyAOeTG50AK0LZVlRyZgr4bRjj
	LtgC5lhZFsmWJAI6PM4jyNEG+lsAiTjQ1yNmMQEAlZ7NT15mmXpcsf56cHIb+QB1g902UOSboelHT
	lB7Bj6r/2hG45erXTve6wg5mqlmDgOhZYCTXhyEtIn0mi6dAqcqhXJjuIOBZecJjIIu4Cf6DyOsQY
	6baqIdIx8NqeAPE8eKIcFTrVx/bCsjs31W5KRA32goPxU3OMFK/Trwn/3F82jhg1DStv9deji2kPJ
	Wjx5pAQLOrFjJNj9afceZJ8foc70bdxnOpRcUAwdkIdX4sEqBnyJDrPCD9r4EL4LcomFHH5Bqgq5J
	JOkFgCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6aIU-00CupD-Lw; Wed, 29 Jun 2022 16:12:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6a7D-00CohL-8M; Wed, 29 Jun 2022 16:00:32 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E41E26601942;
	Wed, 29 Jun 2022 17:00:28 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656518430;
	bh=KmNdf8Lk6p2VGyZm7KaMsN4jtyH8AqBYDyDnUr4zQv8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oFvFtIfBURHS3ZZHKugEn0//ZEcsdDsTrErP5vkTXbzEcdAbsOIwyazlkOyABX1he
	 ER6r/KqucfUgDcuSYnU9gui98HdQI+juVDsi8+An/KpWk+5304ocKtlr4elPkS7uFb
	 H4IFywTLAg/VtTN/8VzY9Wt+KUpYIdHwqDTVn1j6UBkytA8IjkxA+ahyoNR0gdUAp/
	 A8yqflPdo3ZoiU2GlKq3/CMnVMmjal7PBN4UarjnQQxnSsV9362Y5zNWqnwNCQrdIq
	 dk45ILOlvXooKcWslEcJrX4tUR+ilpKGTBte1kptsMEfCQw+KvR/36CrNWI8pdXoB1
	 ns3qT56GKTOvw==
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
Subject: [PATCH v4 18/19] arm64: dts: mediatek: asurada: Enable SCP
Date: Wed, 29 Jun 2022 11:59:55 -0400
Message-Id: <20220629155956.1138955-19-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629155956.1138955-1-nfraprado@collabora.com>
References: <20220629155956.1138955-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_090031_513889_87EB09FB 
X-CRM114-Status: GOOD (  11.51  )
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

Enable support for the SCP co-processor present on MT8192. It is used
as part of the video encoding and decoding processes.

A region of memory is carved out for its use, and remoteproc setup for
communication with the ChromeOS EC.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---

Changes in v4:
- Added this patch

 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 7b89f6e552c5..a5625b3cb317 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -105,6 +105,12 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		scp_mem_reserved: scp@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
 		wifi_restricted_dma_region: wifi@c0000000 {
 			compatible = "restricted-dma-pool";
 			reg = <0 0xc0000000 0 0x4000000>;
@@ -680,6 +686,12 @@ pins-pcie-en-pp3300-wlan {
 		};
 	};
 
+	scp_pins: scp-pins {
+		pins-vreq-vao {
+			pinmux = <PINMUX_GPIO195__FUNC_SCP_VREQ_VAO>;
+		};
+	};
+
 	spi1_pins: spi1-default-pins {
 		pins-cs-mosi-clk {
 			pinmux = <PINMUX_GPIO157__FUNC_SPI1_A_CSB>,
@@ -735,6 +747,20 @@ &pmic {
 	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&scp {
+	status = "okay";
+
+	firmware-name = "mediatek/mt8192/scp.img";
+	memory-region = <&scp_mem_reserved>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+
+	cros-ec {
+		compatible = "google,cros-ec-rpmsg";
+		mediatek,rpmsg-name = "cros-ec-rpmsg";
+	};
+};
+
 &spi1 {
 	status = "okay";
 
-- 
2.36.1


