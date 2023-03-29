Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C1FC74A5B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 09:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+n7kTmZSLyy6JZOnafgLqENkBorz7cVoGb/c2ijGPg=; b=zrQbnP1ghY3rLVqReyPCvpWZ/z
	skkvcR0cGhmSnsrgm+Vehf9kSI1fCFfzxA49ywo5Sx6neE3eZUGxiAYb2dQ/n/+u/DWSIpvPIUsya
	+oHEqeaoE1ZXd2B6e6+4YHnH+IrFlAAqXZLNKd0iH6RabAhgwO997Lp8vy92aR1vpIdmmUPFWDoZq
	BP9Yfee4kYYEkooAnheLIuWDoPqlnZow+hzeQmLdww7DyFhC5VrEJsdIIt1PPuPJlojJ11FyXlP0D
	DdBaLMgl44ZPzr2ohWmO5z2jeAT78UHIBA55YbrROBprRh3FiBWE1aKBvgijKGcAm8ObTitjUrir/
	oiQM1EpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phSNO-00HLbx-0r;
	Wed, 29 Mar 2023 09:45:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phSN2-00HLS6-2W
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Mar 2023 09:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=k+n7kTmZSLyy6JZOnafgLqENkBorz7cVoGb/c2ijGPg=; b=BE5DTIQ9vaPcBE1JhbmOoGsB61
	2GKXkG+ZCzXfzSUy5MDCcrqT2B4iFJkcGZzwj0hTIlF7IfPU9gOUs9Izo5EmB1y42VGke82yU+DQ9
	EDOsIRmB8vfWP99yIOB83+2qZcKYpFlF374jRu2Nig3jpXWl82qjPxX6ovqUCd9f93h78rG0wU5ue
	SnAKBgv3O07hminD6FFlKHblKVmUmr1c18o0K/YPezomAcG9ebW3icL1kVhq48jAtQiwNrIS/my+i
	vrLK0UqN+fSykQH9Qvp/NO3NZGFqlv8lKu1spMMS9srBgLeOqYOcvWPn2cBMTVJsOObLTNZzXtVUk
	qgFVyqNw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phRaN-006oFg-09
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Mar 2023 08:55:17 +0000
Received: by mail-wr1-x42b.google.com with SMTP id r29so14817390wra.13
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Mar 2023 01:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680080112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+n7kTmZSLyy6JZOnafgLqENkBorz7cVoGb/c2ijGPg=;
        b=vZZKjgfgUkaAmm9eDa/n0yIPp/jvrZ8rqxyyVarmS9MeQTQuWX+9QtAws347nXlLsq
         9hIswfhbaOqCvvgku69nubwSIS2vxcyy3NpfkWJAcG33bZLRAatBAyrLEy8u5n1P0kjF
         +TSopNQpv4t5BvVsIwJxFsHvTqaZhHGrt7q0fqKnfMHiWCpFM3frNvSDSddWylBvplRE
         xnm64vTf5/2nwhoboYtoz7sZ/o0wrtlty5pr6e3Zut4ZD1DqgKZUejA47I8IX3mTygjM
         QwC5E+Hk3i8USpOCzXSWDpilwCpimYsxnwl7FOoB1RYDbjKxZ13PfNVusfiGkBDfgNh0
         EC+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680080112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+n7kTmZSLyy6JZOnafgLqENkBorz7cVoGb/c2ijGPg=;
        b=rLbqYCmZcMzLZy/7Rd7iye1uERTnwLGL9sWdrJVYNNDO7cpo86J4aIy9gcrhQisen9
         0lkJQUmBsoTsIRcG1O8vayfYcBxq17Wad58CeaaIqTox1j3S/DBmYx7mm2Zz7A8lQsqa
         RnwlFORL9hGcr+uP++pb2ycnmofF+IhRx0MJUCUe9QGrvCH7/aqajf2azmWKQDQOBZgS
         XcQ2Zsf5vLyx14OO6eGYKQmRL8fu8vF9W6q3p3n1QtrjBIz8b1xOKzhzbWzc2MnWUDnT
         5PLHMG+uT92gjv8ThiOo3IUJnI1wXLkOSiuk9x5PsTRQ9rjJvHyFM9zfm7eHR8Yvw5uI
         BbBg==
X-Gm-Message-State: AAQBX9ciMtCGxtxoccIY3zjvjlnUX/iSKN7i27D9QsCE043HKHchTv/L
	myO9hn+9xSPZKZa0fFAgovMvYg==
X-Google-Smtp-Source: AKy350beAHR2vBXDYS1dhRBIKKbrEnZiLQ/0TwuX8udPaiMplnlJkeIrKmdL2bitTYxYcDqOr5pgGw==
X-Received: by 2002:a05:6000:114f:b0:2ce:e571:5cc3 with SMTP id d15-20020a056000114f00b002cee5715cc3mr1068616wrx.28.1680080112211;
        Wed, 29 Mar 2023 01:55:12 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f9-20020adff989000000b002cea392f000sm29571964wrr.69.2023.03.29.01.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 01:55:11 -0700 (PDT)
From: amergnat@baylibre.com
Date: Wed, 29 Mar 2023 10:54:38 +0200
Subject: [PATCH v3 17/17] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v3-17-0003e80e0095@baylibre.com>
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2606; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=aEgSs34mkL8gqjkYVK8GMwDs4v5ClGcJt3CH4UkG4Lo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkI/zcm57eLBHsA1qwn3qogPxQmbXLdagGVtEIgyHC
 A29k4fmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCP83AAKCRArRkmdfjHURbQOEA
 CuU6n9SXlN0b8BAXdY3HrfCBV6LkNvTlxVo3DJ4CPxk/rVU6JdnNLmC5HgOG3cpN8++XvhibH9jO+8
 mh3hExwx6XxEo1HDXphJlS/9KH1hfRQgjvqRXCVZlSczl878fNxY3FVX1frfoEpTTJ55tJNZdCVo+a
 /MxH0lbca8RH6DEJVdjJs8L5a5FftxtsbMY/Y8FJjIf934MXMHQznJJC9P+SyKHWUuNx1/W3Y9drAz
 o4uDE8UZRg+xyL7QTi7Px5EzGoehViSW+1/Kavlap2mq6kM4IhEJUINhuXLaf/NtpIG4WqVFwNJe+W
 7yDVgM81dDUOug9HBWDq7P7cUKFw5lrW6utoY4wT+Z3TwKqpTr9yTZCMwSrVfKqvHzMQk+jrx6pxhb
 eas0/9+WEFrE/pOvy1UyYqsYjs/HzDMacXrO/8ecEUdgEzWxVt7vEhrlnBG1LjwhBw65sqUmj9LUbd
 B2hmFzlEjxGz7shN6W6n4I7MviMnRXFJR2XWIu/bmlzZLMZf1Y4eYWw/1immWUBjVJ+lk//FQkUbHQ
 nfOPre2roDA4sCR37ocJIm1/Hp/bG478zGFLSAFbjun+1wzvGDLJTzK6Jd7zr+ZTxW8LBfqtFgvF0s
 3HPh3Gx1WxpQ42/QAfObOir5xPQ0Lqp+jP/Ccx4M7WfBqrLYfQEW252gVOHw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_095515_592303_F0BC1452 
X-CRM114-Status: GOOD (  10.80  )
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

From: Amjad Ouled-Ameur <aouledameur@baylibre.com>

MT8365 has 3 CPU Idle states:
- MCDI_CPU. (Multi-Core-Deep-Idle)
- MCDI_CLUSTER.
- DPIDLE. (Deep-Idle)

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index 959d8533c24c..b5f5c77f7f84 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -112,6 +112,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -131,6 +132,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -150,6 +152,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -169,6 +172,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -182,6 +186,37 @@ cpu3: cpu@3 {
 			operating-points-v2 = <&cluster0_opp>;
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			CPU_MCDI: cpu-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x00010001>;
+				entry-latency-us = <300>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER_MCDI: cluster-mcdi {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <350>;
+				exit-latency-us = <250>;
+				min-residency-us = <1200>;
+			};
+
+			CLUSTER_DPIDLE: cluster-dpidle {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010004>;
+				entry-latency-us = <300>;
+				exit-latency-us = <800>;
+				min-residency-us = <3300>;
+			};
+		};
+
 		l2: l2-cache {
 			compatible = "cache";
 			cache-level = <2>;

-- 
2.25.1


