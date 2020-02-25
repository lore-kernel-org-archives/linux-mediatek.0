Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C21C35DF5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 08:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69BFD2176D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 08:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HULCczY8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SekV8AVX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69BFD2176D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJL0S2DE8G7nGOTEncrD1BBy41wFyVR2K6WTQgwnkH8=; b=HULCczY8TnfNlR
	14XhCse9oMMrDa2rboKBpCVNlBHiSY7E+Z8gdOQhW2V+dKB3II0M3TaoqotmKEOO/tQDpjSxwjjUG
	nF4j+zSZBBfpkGWJFMPmyrj27qQxa2NeEH6oc4IEOHNfXk7oFHW+U16zFb5b6M/AMafiE5j1eEo6l
	Wi5krTkTlcxLUE20DJmWAmzQ9jpBlJPolPcQRrToJdwa1VVE7ys/Z9bqA4OIrUhSHVIExtNWPE2bS
	cDfNAvOWX/9WL9FZmAURzR2bkyFZp3TR04r0Kfk+MxvSAm+odJKgjwMbZW49JemhoCBF5txRjveZQ
	FpWCUYZ9L+BkrdXyZV8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6VHz-0007B3-ND; Tue, 25 Feb 2020 08:09:59 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6VHn-000722-A7
 for linux-mediatek@lists.infradead.org; Tue, 25 Feb 2020 08:09:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id m13so937762pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 00:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GMndQt2LnEzHjp6exHJ3T1kYTJRoFEg9wZ1HqA6gkQ=;
 b=SekV8AVX6D+Htv0APvQ/2D+MFX2epnEwFRcP84WiMctH3PKMmMv3J7li3o6RdTIYQy
 7G+7xHWlBDJYSHCbl0SaHksode9OJULFyaTJvq+71L4aY4H8UIyLkxaNqd1w0I2huZIg
 Ghr6tkjBcWxetOGM/b7t2weEV1nrXLOgV+SQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GMndQt2LnEzHjp6exHJ3T1kYTJRoFEg9wZ1HqA6gkQ=;
 b=ZX9jIJOH0qXNxcYoFiLSOkpHQgn4S4YlR+8VG6zt7q0rFTfp1xYDMd5xdbYqpZ1Yqy
 ejJD1fKbpDy0TJDiSV7Wy32ekSUARzyKBzMJdBgphOCkkhm47rKWZZ5SH9PGKwHeFNyL
 TfR7Pa/qL5Tbqf3R+hvD4AXZt81OEWautzv/nJgvmh4QJC9J0Jvc05A3/I9iGUfd2AHR
 Z2MqfxpozNA2MOhB0TIm40K/kZeoyw7AjUeDcAxhyCjd5mEd0AWWSAS5CLnqL3Up6AGf
 2WPSes4FUItCuuqpPAI+6zsvoPsOGcwpb6th7OqsFbu6pV3jTEhSbXacTjpob6fD5S4R
 NPpQ==
X-Gm-Message-State: APjAAAWkd512nJUe0TB5sfBbi1pVFsoCoLh5RJdxD59RlJ69isuCICZq
 TQPg/kUgVK6xtEoCqilj6J7XIXy7wmBmzw==
X-Google-Smtp-Source: APXvYqyHkDcXeUanCiEXGA0ZJYMMwDV4rYcjrFNFdPbqYec8VEXM5eZDYZphfwlSJ62fbCzN6dUrFg==
X-Received: by 2002:a17:90a:5d97:: with SMTP id
 t23mr3732775pji.61.1582618186124; 
 Tue, 25 Feb 2020 00:09:46 -0800 (PST)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:254e:2b40:ef8:ee17])
 by smtp.gmail.com with ESMTPSA id c26sm16071506pfj.8.2020.02.25.00.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 00:09:45 -0800 (PST)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org, James Liao <jamesjj.liao@mediatek.com>
Subject: [PATCH] arm64: dts: mt8183: adjust cpuidle target residency
Date: Tue, 25 Feb 2020 16:07:53 +0800
Message-Id: <20200225080752.200952-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_000947_359784_7CAD9023 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Split a cluster level cpuidle state into two, so mt8183 variant
boards can adjust parameters for each cluster, and reduce cluster0's
default target residency to 1000us as power measurements showed that
its minimum residency is slightly less than cluster1's 1300us.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 26 ++++++++++++++++--------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f1381e77918b..5c7dd262eaf3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -74,7 +74,7 @@ cpu0: cpu@0 {
 			reg = <0x000>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu1: cpu@1 {
@@ -83,7 +83,7 @@ cpu1: cpu@1 {
 			reg = <0x001>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu2: cpu@2 {
@@ -92,7 +92,7 @@ cpu2: cpu@2 {
 			reg = <0x002>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,7 +101,7 @@ cpu3: cpu@3 {
 			reg = <0x003>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <741>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP0>;
 		};
 
 		cpu4: cpu@100 {
@@ -110,7 +110,7 @@ cpu4: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu5: cpu@101 {
@@ -119,7 +119,7 @@ cpu5: cpu@101 {
 			reg = <0x101>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu6: cpu@102 {
@@ -128,7 +128,7 @@ cpu6: cpu@102 {
 			reg = <0x102>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		cpu7: cpu@103 {
@@ -137,7 +137,7 @@ cpu7: cpu@103 {
 			reg = <0x103>;
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
+			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP1>;
 		};
 
 		idle-states {
@@ -152,7 +152,15 @@ CPU_SLEEP: cpu-sleep {
 				min-residency-us = <800>;
 			};
 
-			CLUSTER_SLEEP: cluster-sleep {
+			CLUSTER_SLEEP0: cluster-sleep@0 {
+				compatible = "arm,idle-state";
+				local-timer-stop;
+				arm,psci-suspend-param = <0x01010001>;
+				entry-latency-us = <250>;
+				exit-latency-us = <400>;
+				min-residency-us = <1000>;
+			};
+			CLUSTER_SLEEP1: cluster-sleep@1 {
 				compatible = "arm,idle-state";
 				local-timer-stop;
 				arm,psci-suspend-param = <0x01010001>;
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
