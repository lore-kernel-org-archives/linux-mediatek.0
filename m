Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1B1C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 May 2023 17:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=; b=HrsOn/szq1rP/TojTC8Ecyx1Po
	rEytBNRFmkLbnmw5DQe2x1QbAtPLstCONvP9W7ym6gUM8wk2t354/z8rH0pUCNTYapCa1p7zVGbUM
	3ljVE1d5rnT9eUF4USoedXxPcZmyPmqLE/Nq76YevajJsGNoNIIUTKCmrtTlVVEBj+yJS46CpVzvi
	sRPT4qNXDLvC912jk94REONPVij8oCinINRAVfueYvjI0Iqmdk1484ZG1Ff6/Y/ilGOgdczwhm7v5
	hlgr56Js6Uxgx8WaCGczGsJ7rEuFT7AhQHjqctC7hJ+ZJW4il1CAUayOi7TtFKMGcLEGQhst/4O+5
	/kBXHMog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHR-009aeC-2r;
	Thu, 11 May 2023 17:40:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxAHN-009aZL-2O
	for linux-mediatek@bombadil.infradead.org;
	Thu, 11 May 2023 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=; b=oA/lxBwDpHOl8Tje8nQDF4EReL
	X4WM5mx5a6Q86mwEs/W5BTHxjCwRBr5PcZHYQErQFzA4byhtFrRLoliGpUTJnGbULvU3q0Qxa+g3b
	AQK8euwNZpD8yo3PMsKq9B30QbtOe/TXQ/uw8+7wZApqowbOdyIr1uiAg4VnMicq8drznoSpZaW0U
	EwKTuYYVODqEVZiJzc8MA1Vhvss6XADJknDN4XJQAR91BshumNk38VnatUcNr5O7UkkT4rVXMO8R0
	ORw7YkxAbFAuC/6pr7AX5EHCtx1ZjVZLYv/74Gz/K1Pu/y/2dNzBuLLuoaXpa9N0CynkYJek+1D6o
	nclDZnjQ==;
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9BB-008Ioo-2T
	for linux-mediatek@lists.infradead.org;
	Thu, 11 May 2023 16:30:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50be0d835aaso15703770a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 11 May 2023 09:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1683822608; x=1686414608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=ISfdWkZv/Iw828dOTZK6gvk3bjb4HRSYjlRZ3CAWigxamJ/UCk7oSNLJybZciZvuY3
         PO7TRIPQoshED11yv/YYl4KkwzF9J+lyvWWoOyUB9PvGhnUa1ZrehCRtCQh9RRMpMv5J
         BNgrAOnOOILu2OX5oDxZiAC//sftWAJKYFjHCwcQokl/5BeAa4S/cY/Z4UjmQJvRVKLK
         bc4hxEA5w2DkCCntW5DUPxg1C/gbuaz3tS+jZ5Il1W7Vj+WVsZJDTbWLZisr+KA2qIML
         cNnJCsm5+RIx+M5OjcpgHdonwB/AyeZw9pC+dN+HPsNN7QwgIoSJI478Ol4Q2W+r1i90
         w/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683822608; x=1686414608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P8BG56Q0+m7b3FaG//0Q095XeVZlwC5hERE//1oBbUU=;
        b=jV5cNr0EkIj2PbozENDE+73OTi/460L64ekLuq1KQqL6kdSqdlHnk297pEQwjz2oal
         A7q/dq2PfF5tXhplanpnSopuTiYfOzEwhcyrb/+VHEhiLrfZyTu7sgdD5cUr7rmlf7Qb
         xPllpEEkMc2XPD08L1c0OXfm0I+UEFEfbgR3UjOhySg0+QOysGWxPHgJ8gh9F1lgyzqj
         av9iTyIkg1W1TuO8eZeOfE44p1z6AeJ0+l4wGH0d3CVS2zTUX58ePYKnEgfcfv4M9kKz
         84ctiVsNG7AKuDxfqgZW8ciIYT2r0plImrqZLYRyRNgxOxiim8TpJL7tvEcOV7/f+RHI
         g4ng==
X-Gm-Message-State: AC+VfDx0C6BQJ9NY0sf58/wlpbLa0TQSe110hB9hoi4oFfUTLB5gW4pV
	Pq/6N30xUIMuyZtAyL7Tj6/kiQ==
X-Google-Smtp-Source: ACHHUZ4ADpoih4waHZ7BImsHI0anNX2jehque6QTdkuMQNOQAc6sInCgTKwjzQsCq1zw/UIa12FXuA==
X-Received: by 2002:a17:907:868d:b0:953:64f4:e42e with SMTP id qa13-20020a170907868d00b0095364f4e42emr21611278ejc.5.1683822608649;
        Thu, 11 May 2023 09:30:08 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id v9-20020a170906338900b0094ee99eeb01sm4209935eja.150.2023.05.11.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:30:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 11 May 2023 18:29:29 +0200
Subject: [PATCH v7 09/11] arm64: dts: mediatek: add OPP support for mt8365
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v7-9-98cbdfac656e@baylibre.com>
References: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v7-0-98cbdfac656e@baylibre.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3792; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=iQCxmnK+eQfy1aBNVxZAL4gcwl2Oh2buOTNBmT3l0E0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkXRgF3FMPqLuv2A066VWzfol3RhbYBg/ASlsCdms3
 U9/U0C+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZF0YBQAKCRArRkmdfjHURcrOD/
 97UlJm0hj5NYARhPphvJ4JCMZyZvOUydKzjJ6KZFD7jlzvNA8hI1z8e1dzS3VmQGXGrm0+JXfmXXfd
 8eTwAmrLy6c+NGIpfjSYRzVm8nD6YFaLX8/aT1mYzXKBTPwmxN9BH4KG7Yb6Ryy0Groop1lVuEzBQI
 HByh3yGfh1xsz963oM0kEOpBe0SUG1qv5FuBWA37my4CFCrjrjRJ52lDhHNRMqTL5ElKOdyFupnvte
 J5sy7Gd4lm4Z3pYtVpVF2NY/b94fFeZP5ZeSv/94GnLH8zYqjRxT0My/qGDPBmc5XGzWyfcD66VPMu
 aKHYtphEjxMzisdBgPuo+0K03oLot7lqs+E2gxNLqH7xvMHH50VF/tkJj5eSnFAW9r/BN9YMEXyPGX
 kExKNLyZfOa5FS8aC/znt+cQHTwlLGxvYjsj5cTRZ3HeHMT2j9p1ZcgdN/eZDX8Zw6DLK2K2Eye9zO
 e3h9KlQ5L0OJkM2kDbiho5BcZaY7uV9taVXt1Bw4Z5eFJmk0E7KrUPl0YkBFrIIVE9oBUVq+VdWUPl
 nqzC1XCg2c+Pq9/FFGtECpj+tOy1A3qlqAJXsRtHkR1KpnmuIHQIHMUJf8/ZvBiSeCxrzSxXAucc3T
 PBnFgdEGL1rHAQJVmMVC+wIYyPu5H+K4TRrRKOUEMDXRiZiAIvOxblm9iYng==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_173010_150193_5554A7F1 
X-CRM114-Status: UNSURE (   9.26  )
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

In order to have cpufreq support, this patch adds generic Operating
Performance Points support.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index bb45aab2e6a9..cfe0c67ad61f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -20,6 +20,91 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+	cluster0_opp: opp-table-0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			opp-microvolt = <650000>;
+		};
+
+		opp-918000000 {
+			opp-hz = /bits/ 64 <918000000>;
+			opp-microvolt = <668750>;
+		};
+
+		opp-987000000 {
+			opp-hz = /bits/ 64 <987000000>;
+			opp-microvolt = <687500>;
+		};
+
+		opp-1056000000 {
+			opp-hz = /bits/ 64 <1056000000>;
+			opp-microvolt = <706250>;
+		};
+
+		opp-1125000000 {
+			opp-hz = /bits/ 64 <1125000000>;
+			opp-microvolt = <725000>;
+		};
+
+		opp-1216000000 {
+			opp-hz = /bits/ 64 <1216000000>;
+			opp-microvolt = <750000>;
+		};
+
+		opp-1308000000 {
+			opp-hz = /bits/ 64 <1308000000>;
+			opp-microvolt = <775000>;
+		};
+
+		opp-1400000000 {
+			opp-hz = /bits/ 64 <1400000000>;
+			opp-microvolt = <800000>;
+		};
+
+		opp-1466000000 {
+			opp-hz = /bits/ 64 <1466000000>;
+			opp-microvolt = <825000>;
+		};
+
+		opp-1533000000 {
+			opp-hz = /bits/ 64 <1533000000>;
+			opp-microvolt = <850000>;
+		};
+
+		opp-1633000000 {
+			opp-hz = /bits/ 64 <1633000000>;
+			opp-microvolt = <887500>;
+		};
+
+		opp-1700000000 {
+			opp-hz = /bits/ 64 <1700000000>;
+			opp-microvolt = <912500>;
+		};
+
+		opp-1767000000 {
+			opp-hz = /bits/ 64 <1767000000>;
+			opp-microvolt = <937500>;
+		};
+
+		opp-1834000000 {
+			opp-hz = /bits/ 64 <1834000000>;
+			opp-microvolt = <962500>;
+		};
+
+		opp-1917000000 {
+			opp-hz = /bits/ 64 <1917000000>;
+			opp-microvolt = <993750>;
+		};
+
+		opp-2001000000 {
+			opp-hz = /bits/ 64 <2001000000>;
+			opp-microvolt = <1025000>;
+		};
+	};
+
 		cpu-map {
 			cluster0 {
 				core0 {
@@ -50,6 +135,10 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -65,6 +154,10 @@ cpu1: cpu@1 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -80,6 +173,10 @@ cpu2: cpu@2 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -95,6 +192,10 @@ cpu3: cpu@3 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2>;
+			clocks = <&mcucfg CLK_MCU_BUS_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAINPLL>;
+			clock-names = "cpu", "intermediate", "armpll";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		l2: l2-cache {

-- 
2.25.1


