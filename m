Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7085ECE579
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 12:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inMWF7mAc4RQp01FZVAzZYJjZGIEnM27V9mYFjLFKXM=; b=Hzlrz2aBXistk7
	qEGeQ53abVfofoQO9j+YR2xOjXx/fnfX/ZJGdVmXSIytHz467JXYiCEdoF0uRpJTeoVu7t9GOWOYa
	6trS2bBkgjeiKTmSfETtqRv9hKfzrgvOSHihn1BBk8tDpUoFvi+T8LODkimO+T6F0uce69zJfoZYI
	DEWUjcAct07ccK0zYWIOaQLkeAdwNMMILbg/b4wdiBXmX4x/bIifWKOsueMTmEqsyp39Xu48eSL0f
	njhpozkm8LsTn8R3GyjW8wq5rjBbjA/WKPpCQNATripLvYv3+X1xNPdOaaxQ9UCwjGrC169poZgZY
	AOtd6Gbi/kmcqo8iXeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sndmm-00000001tYG-11AT;
	Mon, 09 Sep 2024 12:46:28 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncP2-00000001d8z-0b8j
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:17:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7c691c8f8dcso2841694a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880671; x=1726485471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inMWF7mAc4RQp01FZVAzZYJjZGIEnM27V9mYFjLFKXM=;
        b=UWWWcHSt+wGabcTfVs1yQSKrqZYdmSOYvvZLJNhaRmjJiUIhBXfVxJhraF+Xbe6FQT
         lUcJ2bqsOArBxDXuiILzv9QCkq7b6EW7vadinZSWEPaKIafinDcSpG1dYEYgRNPMfUAr
         WbZit/JXAcNDHhYvFk+tVGyBpgVf7BuGo6CoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880671; x=1726485471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inMWF7mAc4RQp01FZVAzZYJjZGIEnM27V9mYFjLFKXM=;
        b=Lv/BH2B00eZJ9eXxD5sf1StZuy0jeR8G8di2A7nxNCuWlFWCh9S3yFdytZ0jBaaiGD
         0ljd/t0sbbuCUyZRFGqR6TPH/hlyhVMEM6SZ2Wy86HJ3hhRLJb6pTw8/xocfgRZowYm0
         723TUsWWHkjzY1cMFfVd+9BPe5b4in+urSLqKKg2mc8EDZznzkkTeTuf221/mIRtOwLi
         vIoiBPMH4Zc299DrrgofXpE4ekcBl5bP2tFWoQesG5cB8TP3kGVNM5IRPqxLxBpVqQsd
         /lPd02m6pI0rZSEbXAYgCE9kEZfvWsdXvtIUyVYfVJmZFLKaorL917ZoMF+lTo+61ebW
         4EWw==
X-Forwarded-Encrypted: i=1; AJvYcCXQXOkl6lQG49SOSQFpgwOq3kfFl8mXa7h95ZtjLb5QnSt1p8Jq8DgGPlOhAbbONCMQGOFWrNTUgYbZWx5Oqg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye3L9oLQVnmwGUP8+CJujJ1YgEMu82n8iDavw0xwGz6hmt6ZUn
	xKSXwEzNY9uFk1umRm40ode2D/nPaOd5+OKLoF58c/37cIyaRpQqeLG+ojk0qg==
X-Google-Smtp-Source: AGHT+IGEoXdjMPDfBAFuOqotyznZjRHcP++k8TLwSTP8JbDeKXsv6apEUH19HjF6RrX+uRkTQqMG/A==
X-Received: by 2002:a17:902:f549:b0:202:5af:47fc with SMTP id d9443c01a7336-206f0511f66mr171192305ad.13.1725880670880;
        Mon, 09 Sep 2024 04:17:50 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:17:50 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 01/13] arm64: dts: mediatek: mt8188: Add CPU performance controller for CPUFreq
Date: Mon,  9 Sep 2024 19:14:14 +0800
Message-ID: <20240909111535.528624-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041752_209206_03B19968 
X-CRM114-Status: UNSURE (   8.92  )
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
2.46.0.469.g59c65b2a67-goog


