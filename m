Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB457606A9CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wud0cCRT;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RKA04JJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=; b=Wud0cCRTV1DQye
	tf5NvKrWjR8a9OV3PioMrmd7nA1IXWmP3LoxcPQ+jMuD8JiIKGRGeSbEiwBzEyoNd+mYSKHaxFRVM
	U6ZYoY+f96+JZHdx653/moQ7Ytb/FDiE+3lmsb+suhNLsosu3e4KgT/I9frr+6b/yQnanLNx02tKJ
	Uaz/Hp7Qn06G98lmUDYhCJiUfjogUSarq6viV1D99Gg49Z/fIga4z0nO3AT5iDBKliMdIHZFuYI/7
	A23SuuWTLe3brUCpMGLSn5dZ8XN8GqtRSZFWzW0MvAJUc+DYVWN7fs/GROhJpIhZTne4INy9xrv/0
	AlL2FXJ1dmqlxh7T2kRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSc-000000029Rx-2q1m;
	Mon, 26 Oct 2026 09:57:46 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSV-000000029Gx-2K3Y
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:40 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso24549445e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008657; x=1793613457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=RKA04JJvox2ES+3gzG5UfvIRoRWf3B7hg/7hzWewtzn2ngRSZCvMnGnwlUDeuiTd2Z
         N4CHn/rAqOSjVazIVhi+IVf4/oxNVOmiJ+l78MAErhx4Eo64cDF6cQ8vneEBNDSugI2P
         JLBfkTlqrgaWbNGagfH1gkvwwW91r2qpK+g6Zg3bjx2FY1FI5KLAgrHTUCR7N71Wzkao
         oWt7YEAqy9WanHb/zcn2AKh23tIVR7k/w7Iv3Yj8SaihdgceH4xt4HRu97v0+A87+125
         dmFgXp2w3CwnA6E/FRLOV21EPkKD4Vn19NAN5+xQzdxitriyLgsrsZKBT7cHMNowdTdQ
         xwWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008657; x=1793613457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=F5/whTPXJ4TwJiIzCOtu0fJEtFPssDni5EasuMfucqk=;
        b=pzYcmWKjMb05sTKpLyco++IK72Vh1ExoP1c4LfAugNykNWxv23tZaQwqw5nW9yK00+
         xVUa85hdMmDOYpD7asFBJ+DXWkoe/VXYveeVfnHs3J4yTmQrf1raQl2B/q+2O+mctWek
         zWaQD23AMyQ0q5mh4igeOB1MhlYCr18LZVX3U79nY7B+NxKsFNzld22L3QdVMvdkrmDx
         y5mA5Cj3scjD/z1Z4ecOnXuss1ovmpvM/dm2LnSv+RqxXz0xtvmBPoow9fQEzWf1aKij
         2EW4GTvIIbnpjT/3hzwwAp4pm7pUnGrIra3IsH+AZyWGkxDuJEHxfhOSMG4vOgyOadLM
         orOw==
X-Forwarded-Encrypted: i=1; AKwUvBzD0+DwjL6vshJUnYX/0WwlBV8z7DORkOChAhHzevntkynt0OLgmxKdGGFYLokADEtGvJZ9nLMG3qAZ0BkL8Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLwbNh2q9M3PbcmSvqEhefJ/CVyPeY/oi7qAU0J5ZPvYhOFNyw2
	l7Q6Jo9xgUOXiXFaRyQ1ICrIgHYjpqvLuicfp3ryIGL5TKHpWaTuI+ZY
X-Gm-Gg: AYBFou2q6K6nI5auMvhxmcht8rW3iBbZKWXEpHAoOXStZlwwmEvHfEA2nL7eiXpnT1B
	fFixuv9BW09IL4RfTKBg/NdPaedWRtbYeFwmS14j5NlMdfK+MeG1rjSQj6YL9kQYqHrFx29vLUN
	6UtfCQzY14y3nnkeQSAX2BX6zekKSxNlmreENK1gBGW0MrabC0Lm09JJutiK6r4DNPvCEDFNRTt
	5Vc5t+9N9Kcm41AlQ9cHuRBsp1rcHGtuMKyW67IZLr34K3HklzMcBJshmJkmVJ0vBUJQhPks5d6
	zv4ZyC7C6gS8OsiXQbuCwXtD52jTZRIY4oGyq3r3TmOf8evFqsEE1UUwA1Ui2ODKOOzOJ+3E4T9
	dLXr/lUTjywROfgoAtBtNirIj/mc63aBzo3nETWkNRirVG8hFyeEAU/IE3/qg9cE9eUOBgv3CYy
	mff+kRu5wJo/t9nt3a+y5fnRLJhK9qL3zO1yj6L1OyCwyAnheID+gdzZVufIq3VZl4pRNYclb94
	wE4YmnlKYey/KVlU8F5U3Cm0H/T9gL9DbxIUIFAdcQtMh0U7cOkfafd4YYLR63MR7rWE9ZuJh02
	h74GLE3YGbJhAXSEsmIX895QWaIH6zcP0oHBbDzu5NMHQNVKxX4GYJJPSeF4
X-Received: by 2002:a05:600c:6095:b0:4a1:f7f4:7cf1 with SMTP id 5b1f17b1804b1-4a35ac8bf3amr98760375e9.11.1793008657479;
        Mon, 26 Oct 2026 02:57:37 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] arm64: dts: airoha: en7581: add CPU OPP and scaling nodes
Date: Mon, 26 Oct 2026 10:57:08 +0100
Message-ID: <20261026095727.31708-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025739_623010_6FF51089 
X-CRM114-Status: GOOD (  10.51  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add required CPU OPP and PD nodes to support CPU frequency scaling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 177 ++++++++++++++++++++++++-
 1 file changed, 173 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 83b30a340950..c5a335086741 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -74,8 +74,12 @@ cpu0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x0>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -83,8 +87,12 @@ cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -92,8 +100,12 @@ cpu2: cpu@2 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x2>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -101,8 +113,12 @@ cpu3: cpu@3 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
 			reg = <0x3>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
-			clock-frequency = <80000000>;
+			clocks = <&cpufreq>;
+			clock-names = "cpu";
+			power-domains = <&cpufreq>;
+			power-domain-names = "perf";
 			next-level-cache = <&l2>;
 		};
 
@@ -115,6 +131,159 @@ l2: l2-cache {
 		};
 	};
 
+	cpufreq: cpufreq {
+		compatible = "airoha,en7581-cpufreq";
+
+		operating-points-v2 = <&cpu_smcc_opp_table>;
+
+		#power-domain-cells = <0>;
+		#clock-cells = <0>;
+	};
+
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&smcc_opp0>;
+		};
+
+		opp-550000000 {
+			opp-hz = /bits/ 64 <550000000>;
+			required-opps = <&smcc_opp1>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			required-opps = <&smcc_opp2>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&smcc_opp3>;
+		};
+
+		opp-700000000 {
+			opp-hz = /bits/ 64 <700000000>;
+			required-opps = <&smcc_opp4>;
+		};
+
+		opp-750000000 {
+			opp-hz = /bits/ 64 <750000000>;
+			required-opps = <&smcc_opp5>;
+		};
+
+		opp-800000000 {
+			opp-hz = /bits/ 64 <800000000>;
+			required-opps = <&smcc_opp6>;
+		};
+
+		opp-850000000 {
+			opp-hz = /bits/ 64 <850000000>;
+			required-opps = <&smcc_opp7>;
+		};
+
+		opp-900000000 {
+			opp-hz = /bits/ 64 <900000000>;
+			required-opps = <&smcc_opp8>;
+		};
+
+		opp-950000000 {
+			opp-hz = /bits/ 64 <950000000>;
+			required-opps = <&smcc_opp9>;
+		};
+
+		opp-1000000000 {
+			opp-hz = /bits/ 64 <1000000000>;
+			required-opps = <&smcc_opp10>;
+		};
+
+		opp-1050000000 {
+			opp-hz = /bits/ 64 <1050000000>;
+			required-opps = <&smcc_opp11>;
+		};
+
+		opp-1100000000 {
+			opp-hz = /bits/ 64 <1100000000>;
+			required-opps = <&smcc_opp12>;
+		};
+
+		opp-1150000000 {
+			opp-hz = /bits/ 64 <1150000000>;
+			required-opps = <&smcc_opp13>;
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			required-opps = <&smcc_opp14>;
+		};
+	};
+
+	cpu_smcc_opp_table: opp-table-smcc {
+		compatible = "operating-points-v2";
+
+		smcc_opp0: opp-0 {
+			opp-level = <0>;
+		};
+
+		smcc_opp1: opp-1 {
+			opp-level = <1>;
+		};
+
+		smcc_opp2: opp-2 {
+			opp-level = <2>;
+		};
+
+		smcc_opp3: opp-3 {
+			opp-level = <3>;
+		};
+
+		smcc_opp4: opp-4 {
+			opp-level = <4>;
+		};
+
+		smcc_opp5: opp-5 {
+			opp-level = <5>;
+		};
+
+		smcc_opp6: opp-6 {
+			opp-level = <6>;
+		};
+
+		smcc_opp7: opp-7 {
+			opp-level = <7>;
+		};
+
+		smcc_opp8: opp-8 {
+			opp-level = <8>;
+		};
+
+		smcc_opp9: opp-9 {
+			opp-level = <9>;
+		};
+
+		smcc_opp10: opp-10 {
+			opp-level = <10>;
+		};
+
+		smcc_opp11: opp-11 {
+			opp-level = <11>;
+		};
+
+		smcc_opp12: opp-12 {
+			opp-level = <12>;
+		};
+
+		smcc_opp13: opp-13 {
+			opp-level = <13>;
+		};
+
+		smcc_opp14: opp-14 {
+			opp-level = <14>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
-- 
2.55.0


