Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F487C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+2+4sTQbA5X/G9lnH2CC3Ie7OPleD164AzMmpiRfi4=; b=bCfG53rRvVBMJD
	VhPRHcaU4goh4CgyTcQqJynwkwVUfkyjyiwUy1sc0/xbOzBP436n231df0Jk43Xu+H+uTgxj9vIMU
	rUW1Jr0UFpTxEcqAifMixcwRYhv+vT9ld2JGqLgkMDE1EMMLD8ZxYI9roEzXx4aaJc7/1uznFQzqa
	dXwZZJQLNxL501GNJjCcumdaVteni2GetGMksOVlxbgFdcYIjYPMwmXUjJaMSdAoBaYl6davNykXs
	H0dIO9S5KSloTvl7E95yWo9NMD6TkCuwGfMevL5Ov53A+M4dYPIZ9DWgvnxNHeLB7vHtgCSaxagEc
	aZvOz2fBesFjmCyyx8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGHP-001HNm-84; Thu, 09 Jun 2022 11:24:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGFu-001GNC-8Y; Thu, 09 Jun 2022 11:23:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6041E66017CC;
	Thu,  9 Jun 2022 12:23:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654773793;
	bh=NJSwSw76l8UspZAF7umM1X1OBA6724M67znvWvKVr0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sa3aGIYKFhYL1kmiz71MFEmJCd0hHSu21kud2qXv2L/prEAZ4gqLbV4A9BZEwYWKR
	 hvDTGcjNb3guYyydWHJYEs+peCAvDhsAfulmjLLIt2+fis6wsncFuwKILbtC4Tfpv3
	 7h57GMe4PoM8uHl5CLOkJzBU4r/1Ppno4Xj6MCJhrM35FNHkMDDjQHo/T3lfxIUze+
	 bkGOqN/vKbauCbn9KUqFowTdBQSP1USbbM3u9tzVvCmrXE1XgvkdpTTz8Hw7ZqxGCp
	 UKPCOxxvlTJ0EHHn9zKwXW3HFeEt1MQRjJSrb9g0f9OPyJobwzLS0uP2LarbUaH7hB
	 fwXWGZbN7k7Jg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 05/10] arm64: dts: mediatek: mt6795: Add fixed clocks for 32kHz and 26MHz XOs
Date: Thu,  9 Jun 2022 13:22:58 +0200
Message-Id: <20220609112303.117928-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
References: <20220609112303.117928-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_042314_513501_F0F11722 
X-CRM114-Status: UNSURE (   8.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the 32kHz and 26MHz oscillators as fixed clocks in devicetree to
provide a good initial clock spec, since this SoC features two always
on oscillators running at the aforementioned frequencies.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 363fa25b4edc..7123c1bf8d9e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -142,6 +142,20 @@ l2_1: l2-cache1 {
 		};
 	};
 
+	clk26m: oscillator-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	clk32k: oscillator-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32000>;
+		clock-output-names = "clk32k";
+	};
+
 	system_clk: dummy13m {
 		compatible = "fixed-clock";
 		clock-frequency = <13000000>;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
