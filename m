Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A511FC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=; b=DCRuc5Y+H+2zyZs84grJJwSsn2
	z8xPAwq4Vb1MtedIn0jJdPQWueUxnmAoNnbhrQetvc1Ahmfw5Ut0B+1fqA97Ijzt/OVV9afD0kjAQ
	HSgNPn6tzzKaSg6SvlDaYLkXeTv4S2y5B8zaXp0pDLwhanrhxDBNNZeJtGo2+N4b0zsmQ5fe9vkHr
	NFodn/AukPhi7UE8g3xkIHV3n8wYwRPpWocpZknws5Yxe78r5O9vQITM/A5Drx0eWup2ZvkU6qeXy
	gqFtkUVxObH/DoDyQju83olk9tsxkXlxyJFsC9jjWEUZw/R/WM5ThyrNiL1PnJlTiVUrLCbaL50Mv
	HHGxbHVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmQ0-00ANAq-0F;
	Fri, 07 Apr 2023 13:46:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkmPy-00ANAA-10
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Apr 2023 13:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=; b=N7XkVgzbU6ENLWxIz7p6LPyvrW
	XhSQWyheX3jGu61haHvzns8uvUE4cluEFHou3m0I+Kvo91TxQ5CNRb/fAl/BP9PxOVAP6pMhVrD7r
	7SqHkXYHP0O+9An0/c3tGO29NYSI4woO7BesV6YmbceJQdMjreZkKEZKhj7MwbVK5nMJunPcE4yIa
	BbJZ4amI6glsF40NcHEQ872QjcV8Z5029z4EBvIN28J/V7pesEJBYRIBZ3cwrPlu5igtdLaViJ79l
	VExNfJKFSpI5G7bJevfgc/qwhDhcuE151iqxAN+KONVcJshVDZi2YlMwPTrT9Zwbp2QOc42SozHS8
	GiN5BkFQ==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pklh6-00B2xn-1O
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 12:59:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id y14so42279861wrq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 05:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680872395; x=1683464395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=;
        b=31aAu/BHjejVg5FWkqBC79NltqOUEQIa8983mCIwYFlMW1A/XOImuvaDr8LznZ1WSM
         GI/VH9Y6G7sCKwe5L3Ur6qnCj5xICwXB8SCnqc32PX1EkK+UELeoKsOZ7PoJb7WPhbsB
         Z5wbAEGTD81vJZw5+AY7nz3rALN9Iy/Dh91/B9jDRmXcWltlifL5unzZGGyCIZBek2Ei
         8WEl9FVRYekDGFjGQiRrW54ywYW3F/Uhqt4/4nTeHmsYRyxcN4YevLyTKzn21pf0qEc/
         qfEcMjChuaEoWvip6p9VfPCsYsmk7aYpTPbBvlELRBbPdLofwZbVhwH2IfB+6n95RW/6
         6Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680872395; x=1683464395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fPFA2+mMpDkEnrSlP6Q1vK8FCaXq/JFd8egtENDoR5o=;
        b=WG+93GfiU4ptNEPhzplUjXNiBbgjUZAzQMW6PsngP2JaBmqNKKDndLcNb8mhUudJIK
         7imJG3JI0nkFqTNeNF2Ea6w/aOWUUv6G6CIS5kZa3oS0MbNI0bKjQLEf3+tlFh7LKzxY
         ubrK5zuEApDoowQwCVPnbAiO+pQykg1qXcO7iRmFNJ8AWlDzwI8TPSCGK5rjpQAM3dnl
         Tf8v4mY4VWg/31F6skJOsghFDOedKQYfFjZcqxtnePsNVRjKnbm2VLOWxti1d2gQbSxx
         un8rM1TmA4u460NkFce0LUKNQo5YM2U5C+gxVNgvifBWL5fjRAZKhwLxgHdw8Af3o1wW
         rV+Q==
X-Gm-Message-State: AAQBX9dkeSMq+VjeYgeUFrJGsB2bfc3vWoPOh7Fsq4mImVUFiquYfeCD
	hXEo5b7NDp1lwlmzZxAATH2gJQ==
X-Google-Smtp-Source: AKy350aDy9OHG7oVwjFlDW19uG5rl/1oAcOsCVNzPVxx7v88umH7XsWfH5jN6RA3yU3vyl4x2flNiw==
X-Received: by 2002:a5d:4984:0:b0:2c5:5687:5ed5 with SMTP id r4-20020a5d4984000000b002c556875ed5mr1276463wrq.18.1680872395441;
        Fri, 07 Apr 2023 05:59:55 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t4-20020a5d6a44000000b002e558f1c45fsm4471446wrw.69.2023.04.07.05.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 05:59:55 -0700 (PDT)
From: amergnat@baylibre.com
Date: Fri, 07 Apr 2023 14:59:31 +0200
Subject: [PATCH v5 12/12] arm64: dts: mediatek: Add CPU Idle support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230203-evk-board-support-v5-12-1883c1b405ad@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2689; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tqYiFkOeI53hFAvkAFcO4mPwzuf3UCWBDqz4THM6QQc=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkMBO7nlDuhTGY5LcrIhA3CBgmhjCqwhMH9j4Fbo+Y
 Wvm4aAeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZDATuwAKCRArRkmdfjHURZfPEA
 C6UOP0sfhWwRHPPBo3A0M96nkZ7aEurjo/y27ff8b8D26ePX3E2VyZ9pRCetsJPvXUNIFI0jAO5OSx
 1vLav9Cl8tRgF0JZHFVAVfxBfTbksLMl58XTe/KeR7AjFPODdJvvSBx473XvVJ57sQqIeny0NheV5I
 QynDkpLK21iL4vXXfDjvG/bk2mhqKpMT9VwwcavlIGzRrP+sZlxIm6jCJeZMZbOlc518/eQ5/qQ+ip
 lKQF7WvbXLrAWL/effup193wZDaYq3c9ocabh5aCH3l4nk0BWcZTn0VIOURMUmgOav0Kf/hmkt8WIm
 2DT6mKzDNaEH57ANl9B0wUivl+n5seSCV6JukkvBiGaM4vltprRBH8eoRJ3m019ckPX/KvgS2KR2pH
 Z2zaG2JA9ASLqj+ilusQbuLMHw1ofIoAHKTsiSLiJOpHkAgjpUM4JhO5MvQByByePt8sxoXVq5WpbN
 YQS8tTLDg8MuqmwnbPFP0lhAoSgdIc08osf/vU9d5Lv94u83Y/HW7xGno18pmxVcGw8QLVNSzg/Rzh
 Ux82xCZZi8KYefQEugS954hCb9fy3R+6Ib1ts1xKkiI3t1dhwO6ilLOhHVmm6t3VgxOVsraTQ9EheM
 rRjOSIstwGccF/TDUmtV6FwRg1TsPUXjatr8p/ki937D6hcK6HSvFOW8uRVw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_135956_914793_5F957D5A 
X-CRM114-Status: UNSURE (   9.90  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index cfe0c67ad61f..413496c92069 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -128,6 +128,7 @@ cpu0: cpu@0 {
 			reg = <0x0>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -147,6 +148,7 @@ cpu1: cpu@1 {
 			reg = <0x1>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -166,6 +168,7 @@ cpu2: cpu@2 {
 			reg = <0x2>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -185,6 +188,7 @@ cpu3: cpu@3 {
 			reg = <0x3>;
 			#cooling-cells = <2>;
 			enable-method = "psci";
+			cpu-idle-states = <&CPU_MCDI &CLUSTER_MCDI &CLUSTER_DPIDLE>;
 			i-cache-size = <0x8000>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -198,6 +202,37 @@ cpu3: cpu@3 {
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


