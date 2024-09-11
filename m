Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78B9EE01EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiXfhH6Tnp1v6o4UDgk+1tYvrebnqA2dEhUrxtMqtKQ=; b=FWdDyXPhUbaxOy
	dWylQOZebknLviZHtwA4bhY0K52rPgLM/aB16RSoDzwMurqpB9v9YY3XDE8CoB0UD69SeINoVUUA1
	6ZJO6V9k9fhnECydmO+4qYEJg+WolALPQhOnSJX7/T8N13G/uptpfj6oF9ZDQoSaVaSuSn8p/DTm+
	A8TPUfmPliUNKzpOcF11GjMGdXZeLqQAnu4EJljytejODYHQwFZyJw6DVBwpub8yFqSGdxfAYUD98
	Z9IGF1dBxIWIGmhCwzAX4pT0PHCABJ43t+a6hhsqBdV71ynwZi+epmGNd9pHIT3Tj0fOsnJh1h+ed
	j5blirT2fFFHNeS0/BUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soL8G-00000009DLo-1f3e;
	Wed, 11 Sep 2024 11:03:32 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxI-00000009Atf-2Ier
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:14 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3e05a5f21afso814956b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051931; x=1726656731; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiXfhH6Tnp1v6o4UDgk+1tYvrebnqA2dEhUrxtMqtKQ=;
        b=iT0peCWsrberQlTukvzkorkr8Refu7+BUQTGjv5BCL4l5mZmtDtVltj2sNtKmeWCUO
         Em4QeKcfKKM9HtW+/D+9zlVnlTd2JTJWwCmPQ31QhbDDBTRyGUPF/SHKt2e4l05jGRjn
         jQsLt9QjR1WGwRvAS1IfZdNKtOIA57b12O18g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051931; x=1726656731;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiXfhH6Tnp1v6o4UDgk+1tYvrebnqA2dEhUrxtMqtKQ=;
        b=Xmw6UDHlh73IcD8/Szirtn+CgpJyL3FwZUX4YCwdaB1PQOxLX/9yWReahBtB34T+ez
         CvyitKrvC8bfbXI4MJI7rdXyadp+sjWRnqbEVfE8oMpd51Bb0wmbd6kml5JS+V/AA6zZ
         DYNZ9v5EE2Hb8f4+P4fgCPffE7SWaIYvG66nc+wKqLT0HkT4zWTY+y/+FpXK2sjV1f4z
         oQmUF2zGN+SWXoyJsqI5W9VpVprUO4LFJx3Kkh1wLeOrR7zLVHRKwFvPrfOpYcOAbNI5
         nL0noVa9ETVTWmeVacBL3y8tzGK6+lkAY3UVOygwIR9S8fQhBPClqnepjJ5p/+zB4Mzp
         vd8w==
X-Forwarded-Encrypted: i=1; AJvYcCWCtNiQm1t5UgJNPkWehtYt6RMgo9XZRWa4u2IbfWIY4c1LqzCtOTJ8J5ZDHuTDWnoCCc/3VZUi4spav2j4Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyXZfnZ7tB0lSJIx6c9bBeSzJJg/tFcT3K1Ye3nbNn+jshMZGY
	qDhZloszJj9NZbuO+P0sgMPVIYdvLOz9hywdqtC2dONEyH800iI1MbZgTHot4A==
X-Google-Smtp-Source: AGHT+IHW9oSNJD8oopaqEVzs/tys0SbN6+/1X0Ax2ScypJxfEIBlNpu9QiRwIEeqPSCjhbtYV0wiSA==
X-Received: by 2002:a05:6808:3c8f:b0:3e0:3d83:49c9 with SMTP id 5614622812f47-3e03d8349f4mr10035939b6e.7.1726051931237;
        Wed, 11 Sep 2024 03:52:11 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:10 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/8] arm64: dts: mediatek: mt8188: Add CPU performance controller for CPUFreq
Date: Wed, 11 Sep 2024 18:51:08 +0800
Message-ID: <20240911105131.4094027-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035212_650174_AD385842 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add performance controller node and performance-domains properties for
CPUFreq support on MT8188 SoC.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index cd27966d2e3c..cdd2fe14effa 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -41,6 +41,7 @@ cpu0: cpu@0 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -59,6 +60,7 @@ cpu1: cpu@100 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -77,6 +79,7 @@ cpu2: cpu@200 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -95,6 +98,7 @@ cpu3: cpu@300 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -113,6 +117,7 @@ cpu4: cpu@400 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -131,6 +136,7 @@ cpu5: cpu@500 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <128>;
 			next-level-cache = <&l2_0>;
+			performance-domains = <&performance 0>;
 			#cooling-cells = <2>;
 		};
 
@@ -149,6 +155,7 @@ cpu6: cpu@600 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			#cooling-cells = <2>;
 		};
 
@@ -167,6 +174,7 @@ cpu7: cpu@700 {
 			d-cache-line-size = <64>;
 			d-cache-sets = <256>;
 			next-level-cache = <&l2_1>;
+			performance-domains = <&performance 1>;
 			#cooling-cells = <2>;
 		};
 
@@ -880,6 +888,12 @@ soc {
 		compatible = "simple-bus";
 		ranges;
 
+		performance: performance-controller@11bc10 {
+			compatible = "mediatek,cpufreq-hw";
+			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
+			#performance-domain-cells = <1>;
+		};
+
 		gic: interrupt-controller@c000000 {
 			compatible = "arm,gic-v3";
 			#interrupt-cells = <4>;
-- 
2.46.0.598.g6f2099f65c-goog


