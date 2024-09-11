Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF98EE49BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flO2kMjBbd38S9uV93LXACtUKy2NNrMVAURW7PjykH0=; b=G0ASGpxHYFFhg0
	ztnfg2RULPuUY4QNH8b4eCSP3GmNToSTx31it0BVz1c15g4F1JswMHC7cFZnTJY2hiJC6tIfQnjwi
	eQ2vfwqfZ98ctfwY8QDISI7JvS99elubh21J6fLnYjvLgby5fZAwpLhd+gUMC87AIVMzoxzrbP4Sf
	XXw5JIgs+H9IJl2kyLhc8crKjFZvQdM25aIxUjmwJaPaWk8a+8AfOXKrwZjhZFsFLtN2X85cASAGG
	jDng/DqwPcfbc44ACxruJVtiAH9YZPZTUwM2letQ1Q/cmUmYjCeM36kD+onXIgvUD2ytQY2uBtkLj
	/sC3Vs02QLpsgJ+Ka1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soOfE-0000000A0n2-1cP5;
	Wed, 11 Sep 2024 14:49:48 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soORB-00000009w7b-3D6H
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 14:35:19 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so691840b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 07:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726065317; x=1726670117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flO2kMjBbd38S9uV93LXACtUKy2NNrMVAURW7PjykH0=;
        b=RbxOv1pyEEvLL2hvhTST6cmrlnDmEIyWLLtnivADF23DLJJnxfuZ4P8KzoUxNIHHeP
         H06s4I6UDhPtjWoL31Gv6xMtaoHooRJIPmzxDtpwkb33JBphlxJvMipZsHiqndvgb+Ie
         alis9IsdTINOSiDdaQeucPl0NckdQy7n58zFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726065317; x=1726670117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flO2kMjBbd38S9uV93LXACtUKy2NNrMVAURW7PjykH0=;
        b=tKByc/h94saEff2GgQ9bMYyl9mIMQ8FnDgDPUvRsCatnt3aRpym4GV0xLJSgm3MMCd
         T6xWuHd1MeC4tIs+m5Q2ztytrqDE/isgc2dlavadRFdDNec7BchwiWarR0MLJU1BFi1Y
         5E9BH1up8xf9iY/qX0n/tr9lMWe+UM4+NOS3z//qZ/+YyGURhuoRYH1pBcZbFrW0rrRf
         LkvKifd37vMJzxxQ80qi9QOyobS2w017mcFwocHDWe/qyoOtv2bZiQVtBaS3ZRX+eyTv
         CIgzl3X+QW5xxbdatvEjiz/8b6PZNyrcutlKb5xvV5NypH4/hlU8HFJBajuXR41hEWjL
         mkFw==
X-Forwarded-Encrypted: i=1; AJvYcCUsZVzsMA2lrVEE61Tb2tqssbNNAq7Ei47I5XEyd7LpZ5DehqVNOCJUvlCbUQsBrDqY5Jcy6zaNpbEirgUqLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6ajDWk/czyA14XHoWZEAHstaREN5i6oT3d6j4KN6GSKb+KYOA
	dcEGUA6r86t0OSuAwfmYrQnTtOiT27RNPYGXimQNeaEWliwrN9pntsC04y+3og==
X-Google-Smtp-Source: AGHT+IGWqqDq3WXUh183xK34Rxbjn61wnWFW93OstXI7bPArv11G83ZnspRU58x8mGmEmitA0kG5lg==
X-Received: by 2002:a05:6a20:2443:b0:1c6:8c89:88c9 with SMTP id adf61e73a8af0-1cf5e1ae57bmr5808169637.18.1726065316653;
        Wed, 11 Sep 2024 07:35:16 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fbb5901sm46620a12.24.2024.09.11.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 07:35:16 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 3/8] arm64: dts: mediatek: mt8188: Add CPU performance controller for CPUFreq
Date: Wed, 11 Sep 2024 22:33:56 +0800
Message-ID: <20240911143429.850071-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911143429.850071-1-fshao@chromium.org>
References: <20240911143429.850071-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_073517_810813_FCA0FF6B 
X-CRM114-Status: UNSURE (   8.76  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


