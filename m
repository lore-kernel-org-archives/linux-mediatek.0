Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5387EEDEBEC
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 19:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKkgtekbPY1RubSw8KzAomOXLrhdGpkkWDAczAbTOhQ=; b=0/xe9KZHom2cgv7oACEXRm250y
	tYqgqWbE03NdYiO0oWAIL9Li0PHCmtrHRxfd/684jYhjzITQzZLIwBKE2/qhXFuaJsCn3YCDlAvB+
	MmfeWdb7nY885h2fIDOz8S0PNDw8hSz9YpiVfFuCTKtTvU2w2d9KsMm1ufL4dnlveNfEUJiOWekFp
	/QkBor79+87WKFFjb8eoMWYpkTj/px1Y+6w3dgBTqQ/dEzx2x4iNoaIKGMcDFdStXfMdnDlaBMvmF
	/EltMvv+50wV1OIdYjuDcnEk+B9Xa5pWscomNsWIxnM6PFYQ6G/dXpdAjD6iW+qTaa0Ktlzfkcjln
	w6e+dvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVae-0000000Fp74-1xbz;
	Tue, 03 Mar 2026 19:39:32 +0000
Received: from mx4.wp.pl ([212.77.101.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVab-0000000Fp2M-1ewN
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Mar 2026 19:39:30 +0000
Received: (wp-smtpd smtp.wp.pl 27543 invoked from network); 3 Mar 2026 20:39:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1772566767; bh=YKkgtekbPY1RubSw8KzAomOXLrhdGpkkWDAczAbTOhQ=;
          h=From:To:Subject;
          b=E4FT7ZCm02JgZguuxHAAIO4kAV7PgBOIGBRHZlrWgV/Fvvj+f3C1uwn9MPgXOsqbM
           EtUSx3h+rvVR+JkyYEu9f1a0JsuHqxPmQVPQ1LJZH1h8aewuOR0mkfipk3eiC+BRAS
           uDazu5gjK3ijGdrmDfuw8ZOtbllRBsE3UfJTmWvOpfdUU4PRbiKbKTLb1C2pvldPms
           d6QYrc8HsIoJMSbkXNbbvkwNvpyUG7oNzrTBLSnbNV+Hkd/TZMSNebks5K9F6dEJ7U
           ptQYT9owcL4zs/LoN8kFHPNbZrhDCsvtdxj9oG4T0Viy8E9PwlBGRDnG574+vBEq5o
           YX4sk/Gcg0PqQ==
Received: from 83.24.116.171.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.116.171])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <ansuelsmth@gmail.com>; 3 Mar 2026 20:39:27 +0100
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: ansuelsmth@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lorenzo@kernel.org,
	olek2@wp.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: airoha: en7581: add crypto offload support
Date: Tue,  3 Mar 2026 20:39:18 +0100
Message-ID: <20260303193923.85242-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303193923.85242-1-olek2@wp.pl>
References: <20260303193923.85242-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: fd91f4b048d23eafbae91f1322a9d673
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000009 [QRq0]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113929_581734_1C6331D7 
X-CRM114-Status: UNSURE (   6.85  )
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

Add support for the built-in cryptographic accelerator. This accelerator
supports 3DES, AES (128/192/256 bit), ARC4, MD5, SHA1, SHA224, and SHA256.
It also supports full IPSEC, SRTP and TLS offload.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..4931b704235a 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -300,6 +300,18 @@ rng@1faa1000 {
 			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		crypto@1e004000 {
+			compatible = "airoha,en7581-eip93",
+				"inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			clocks = <&scuclk EN7523_CLK_CRYPTO>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+
+			resets = <&scuclk EN7581_CRYPTO_RST>;
+		};
+
 		system-controller@1fbf0200 {
 			compatible = "airoha,en7581-gpio-sysctl", "syscon",
 				     "simple-mfd";
-- 
2.47.3


