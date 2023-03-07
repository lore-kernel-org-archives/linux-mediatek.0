Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4906DC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 14:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mJVpBJj7Q47tDVHQbQFKEbwqf8M1r6OvMJv941rag94=; b=hscURT2EMLM18OWhegfXuIHosI
	6S8dJYrTGpD9NuPOCYwXR/Ue6w2L0kBe8CQxPSMH6ks7gWK9G4pbE7avgv0IwPkSzyNKEdlEGHdjN
	5Al9TGwIGr6R5rFpKVaWXPUfiFAXWXhq4aWDmBp/aHJ0NrMLcZVHT5WWGYGRswvSkqcnwm6RcCA80
	AmqkY34wyTXP3aeLtOP1eLxBoJedmP13dg+1ySQ1iDAT+j2or1IrBtPhEot137RCI6iN5BIKt56y7
	YFUYrWIAqF+ejZqw5pdF/KaKKGi5nnl9PTdbqBQb1ogDkmPnFCWog0mxBhn4OVoi4f3kVy56rEoM4
	kZPWr2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXrK-000aZ8-3g; Tue, 07 Mar 2023 14:00:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXeC-000V1B-UW
	for linux-mediatek@bombadil.infradead.org; Tue, 07 Mar 2023 13:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mJVpBJj7Q47tDVHQbQFKEbwqf8M1r6OvMJv941rag94=; b=b64+M4/NkDd7SZsut3w1VwegDC
	3t24F4J4pI3La0QsSIS5I6TBGYgu5tXHXwZWsmKobSn+vPoQAEWdDmd0VO5Jjcmq516OZnoIujtC4
	eTh007/c2SlZ3ykQKltnkT73rZKZ1SZk8hfBzgfQH+dNTyAOw+z5LGjPC6CPH3IE+Cwp7EVy4AvWZ
	uStiFCkrjy3EUWMsMjSu6zi96wDYfdQYSdmCQAZgedo4Fjkd+8Me7pKW8kxdrTGXzK47zYngpDQRL
	1I88Ej/7DP3HeIyUxxvdNOECdfCI+NRrKeGyglL3fziKYQJBDi2mIN37L4+FUPbrGMbv8YIYgjFJY
	1vzr3wug==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZXCw-00H3Dj-0I
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Mar 2023 13:18:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id az36so7750797wmb.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJVpBJj7Q47tDVHQbQFKEbwqf8M1r6OvMJv941rag94=;
        b=IZg32YgLf+Ob3FqrwsTYqi5GHtsL3B2+OzidEnAamlmCMYWXlNM5iF8j9UVsn6jyu/
         lUUx95nLxxea/evaLSGlxEnFi/BajfETqf7bY8NpRCro/Wjg8thXKvKwAojLINPM+H5S
         zkzfQNAncIg3Ve2YK2HWUBhVoiqEVN9A8ZPsEdejTIoSbr0LCisrkAiSQbLTr7ZTudJK
         2KGG8T1o1DLTICSz/TkEFlRBOMq1qQxfKrV05KuqD/vwjgp2PKfAY2UY+kH0TwGsJ2Rh
         EuvI15oB89y+ST8wtn2gpP1BOsgsomd5aNMIxrCCz8LzYOMYucQ+Q373gEJn79qCixba
         Hxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195100;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJVpBJj7Q47tDVHQbQFKEbwqf8M1r6OvMJv941rag94=;
        b=Y4D4nrkZ84geXkC60lj5Q2kPzYqaAaOlZz9KOlomyQWS9rOm/E6VZMLUZfm/QNeVFN
         cvqznrPn3pKWu6AHOeEJcIM90fM2qkPXjJMBcKnHw1AJ838StFHdNvUXGzR552vwAx2g
         +Jn0mToVk1F3t6twLxbA77Mobun0YCXUva5m2rbiA1FVpdnWl+goEI+8CHNTFk32eSBM
         FM7UK3U2zQwaRzWt/fN6xFpApbLpXplN2/ZDryQgFpaoezKyncwokAmMHVfdZWmdN8DE
         WjLAcGDOxj+xL6cZydgtuhY5I84zsNQ29iYARmDo+NnaYYUkLYjyUqxQmIJWSsI4GQs9
         N9Aw==
X-Gm-Message-State: AO0yUKXLRasrGb+ttq8IZzoee72Sa1o0yJkcsVHJ1JJKZanB2u58p/nz
	33ykzFzR/mJ2IiAxtWCwA2ctRg==
X-Google-Smtp-Source: AK7set/i25Rk5nwLo2x3J80rqpfPHXWm+zuJxnKC4fugCyM7LvMbur3zuZ3u/JjGdfIiWtZP1OnthA==
X-Received: by 2002:a05:600c:468b:b0:3df:fcbd:3159 with SMTP id p11-20020a05600c468b00b003dffcbd3159mr9947470wmo.3.1678195099918;
        Tue, 07 Mar 2023 05:18:19 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:19 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:47 +0100
Subject: [PATCH v2 18/18] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-18-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2609; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=PpXbegqyhWKQM1ZMMzVId+LMr9Lt16YQvGeGFjFB8IY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmFTOpOgQPHjN244A+ti+23VUEeI0ssQNVxIX1S
 QjiLHWqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hQAKCRArRkmdfjHURdaZD/
 9OsOd8QzUcRygK5Z4CW5UnTYxlvCOS/vUvVxIGwHtJg9z98s8WA3oKbQl4BOAqKVJGm3jzHrgSEbDJ
 cj9nNv9An3T2UVh+hJ8jI2dsh5Cb63tB6P7SMGwlBFVdC80E9yovd5CQROrT/J7cQeBLTT+MSHK6Zx
 2Q3DWeaegqXQHTZpbIsWZY3xpRYYyR45/ojmig6ZOrq5MJwnTVENqb5nsuWmKR6Jb4LpxLRyW3drpt
 4dJujkWx/uVKogPLyCUQdMVAvDa3I3Kbyefxdkz3qRVQXTAlkddBWbcLseZEzOhLCOj2duGDV6fOFw
 t0GmQyIcQKfaSWcCb/Y4Tp0SkryKhaXw3A84mXEepahjA5i2zEG2ScUlOC26Sc0vy66teApn94S3U6
 1Lk1CZqclWL6YL+4nGbtcs+I1FymmsmCgP1Z2yloFvFB34xSueFFNeMivNnVkBNre1htNOxfzrh/7J
 xEfgoExFsckKhVBIU5C7w6lt6RUFxqjlti1xs/kPoK8cUG2pAXMYD+zQEyfhym5V2K7UFPxa3nMUV8
 7kRneDYtcanK64kg4r1gfOpuCct7ZHl2f2/+xBXWHbDlgdF+3Cp8ihSZw38Rpa3Xl+qe8gb1rCI1hg
 xNK+e0opvI/kzs5dHGvrRpcui+l2CJO3g87N1DVn5G++3of8VZD5XareiSow==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_131822_264681_A4ECDD2E 
X-CRM114-Status: UNSURE (   9.93  )
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
b4 0.10.1

