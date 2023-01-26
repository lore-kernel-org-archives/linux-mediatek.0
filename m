Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DF5C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQsfoZbXuZwou/TbdXt+KlmirRkhUgvJHSvx6afG21M=; b=4raiw++vzrXJ4/zGEk2904ibhg
	cD/bzo//kMEiTVq5U5O1NpHQgQ513TSQG+7Q4k6To5ZgciCj1GeOez1GMbOYBTXA3KAVPElYtWfLj
	8nCpGqYxjTLu0cmOIHat8YDnRnZ0Sle+MuQaFKcije430OBOU18bKoeCySlo9gmSfs5L/U2lddBTz
	HARELJYnd8ewkSUx9zpWuX9cu1njdGXK4+g74+pjOurywLbEuL5W/LeW27PIyXa3BY1LYLg6sPmb4
	4QnXbajkCNdMP+N0PEP3BEa8eTwvAzGCNZ1WCXXF3c85zz2ZMlYRNb4iSnZn9Msj7Df7RctPcpNb6
	m+KpGrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzdz-00AUaS-UQ; Thu, 26 Jan 2023 10:38:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbZ-00ATHG-7S; Thu, 26 Jan 2023 10:35:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 871386602E70;
	Thu, 26 Jan 2023 10:35:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729338;
	bh=811mGtt7JeQpT1SuTm7rNcFj7Fd9S3mKqBcc7+C7qO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dLEWxzAERpYLA71egOjO1LATE/G5//9XwW2RYijXWjLBe5kqhJ3/LtFQpMax9utRN
	 qz8/Hv4oCO8+KLAbBReSaZ/B+VmF7Gz9YWHK+/KCNmEv+uTJ9Ks9Yf1HTZ1lQBLICO
	 8BK5wVqph8zbM4odGWGIpXiZw0pfEJTVFK+9b/A3RumiYMFPLegMuYjc74AwKSEujX
	 9NIN9hOr1GMELINFzyKxZOSdVxTl06G10xlvFF8SQxoimP/1pNMVBCHtddIJz9PTwh
	 gpxyBVVO9E5kh0T/p/MUmD0CuHXQOZ+qAUo2DM+2SvrdHnxDoLZxWJ+fNuEEiQPtpw
	 2U8HKU8f8jfjw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	seiya.wang@mediatek.com,
	tinghan.shen@mediatek.com,
	allen-kh.cheng@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 6/6] arm64: dts: mt8192: Change idle states names to reflect actual function
Date: Thu, 26 Jan 2023 11:35:26 +0100
Message-Id: <20230126103526.417039-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023541_600253_8D351062 
X-CRM114-Status: UNSURE (   9.64  )
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

The names of the idle states are misleading being this a single cluster
SoC, a cluster-sleep idle state is impossible!

After some research in ATF, it emerged that the cpu-sleep state is in
reality putting CPUs in retention state, while the cluster-sleep one
is turning off the CPUs.

Summarizing renaming:
 - cpu-sleep -> cpu-retention
 - cluster-sleep -> cpu-off

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index eb46cbadd310..87b91c8feaf9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -62,7 +62,7 @@ cpu0: cpu@0 {
 			reg = <0x000>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
-			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -79,7 +79,7 @@ cpu1: cpu@100 {
 			reg = <0x100>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
-			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -96,7 +96,7 @@ cpu2: cpu@200 {
 			reg = <0x200>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
-			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -113,7 +113,7 @@ cpu3: cpu@300 {
 			reg = <0x300>;
 			enable-method = "psci";
 			clock-frequency = <1701000000>;
-			cpu-idle-states = <&cpu_sleep_l &cluster_sleep_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -130,7 +130,7 @@ cpu4: cpu@400 {
 			reg = <0x400>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
-			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -147,7 +147,7 @@ cpu5: cpu@500 {
 			reg = <0x500>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
-			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -164,7 +164,7 @@ cpu6: cpu@600 {
 			reg = <0x600>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
-			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -181,7 +181,7 @@ cpu7: cpu@700 {
 			reg = <0x700>;
 			enable-method = "psci";
 			clock-frequency = <2171000000>;
-			cpu-idle-states = <&cpu_sleep_b &cluster_sleep_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -250,7 +250,7 @@ l3_0: l3-cache {
 
 		idle-states {
 			entry-method = "psci";
-			cpu_sleep_l: cpu-sleep-l {
+			cpu_ret_l: cpu-retention-l {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x00010001>;
 				local-timer-stop;
@@ -258,7 +258,7 @@ cpu_sleep_l: cpu-sleep-l {
 				exit-latency-us = <140>;
 				min-residency-us = <780>;
 			};
-			cpu_sleep_b: cpu-sleep-b {
+			cpu_ret_b: cpu-retention-b {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x00010001>;
 				local-timer-stop;
@@ -266,7 +266,7 @@ cpu_sleep_b: cpu-sleep-b {
 				exit-latency-us = <145>;
 				min-residency-us = <720>;
 			};
-			cluster_sleep_l: cluster-sleep-l {
+			cpu_off_l: cpu-off-l {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x01010002>;
 				local-timer-stop;
@@ -274,7 +274,7 @@ cluster_sleep_l: cluster-sleep-l {
 				exit-latency-us = <155>;
 				min-residency-us = <860>;
 			};
-			cluster_sleep_b: cluster-sleep-b {
+			cpu_off_b: cpu-off-b {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x01010002>;
 				local-timer-stop;
-- 
2.39.0


