Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC3BEC05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 10:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aT2HZqCYT3K+IY/eTToGMA4uVoLZpwy6WXGXmJenakI=; b=NrK0iAPuN90z8jtu60nOg6Bq91
	/+QUVqUDQW7yODnTsmhexk0mIYiP1LlxzKe0eKeWPNwwMOz/8ni+kJlIdz7ZKSSnJbEzdrYDHV0ig
	cWV9HytJjq7yB1lMEZx4Zj2PqdrLdxdr7g6yQ+wcGcin2NtE+6nUeEEhQhPl98f04MB69pZ/xumMD
	BVQDZJ3knPXeDgttEJhXr+ijTTm0wUgJY6+xpTp96aUoysUraR8h1mWnQCGiiv4zvpx4BX1xX6+JE
	65OPoSFhrdeMMYRmoogylPJWVrn0K6JZeXqdXjgpe7WEkMqy/jjvu88Rlbj1qFN3cl1pe3tK9ghOt
	QcuW3IBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzdS-00AUHN-OM; Thu, 26 Jan 2023 10:37:38 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKzbZ-00ATFT-7R; Thu, 26 Jan 2023 10:35:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16AC16602E6C;
	Thu, 26 Jan 2023 10:35:36 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674729336;
	bh=ewzG3bsZfarFS++4YljfNfR9eURvUZDK2OObKxm5aBA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPUDNL9YCFo2GUu68Jkg79rx/u7sl2UPyeQWRtrcEgcgZFSum3AkkEc/cGPxA9KTt
	 qLtFVCxSJnY6Z92KogNBIQ8sPavcXV1H21Mp+7c5QPDNiuj5mOtx+2UICa1cN0sAZG
	 bJ5V7vUFSdvAeLvcLFI82gZEY/rE3cBicVUD9RzB1q+hFNDWDeVitgkrQp8T/d3y8R
	 DlcKFDTA5KldK776lW1G+hbL5+jT8G8RSvnTv8qd8PoQQ3YqEWbfxiN5lhmHm9xOQc
	 2nRGRwrRZnoeh0fH/Hn5bJ2faVtvSIfL1zCGbgjqFGyncibQ0+OO/FRuXBUgXlBM+e
	 MBFeOYP7FtJ1A==
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
Subject: [PATCH 4/6] arm64: dts: mt8195: Change idle states names to reflect actual function
Date: Thu, 26 Jan 2023 11:35:24 +0100
Message-Id: <20230126103526.417039-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
References: <20230126103526.417039-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_023541_564917_ED31FAAB 
X-CRM114-Status: UNSURE (   9.73  )
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
SoC, a cluster-off idle state is impossible!

After some research in ATF, it emerged that the cpu-off state is in
reality putting CPUs in retention state, while the cluster-off one
is turning off the CPUs.

Summarizing renaming:
 - cpu-off -> cpu-retention
 - cluster-off -> cpu-off

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index f04f836d9a72..60ccf02b60bd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -38,7 +38,7 @@ cpu0: cpu@0 {
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
-			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -57,7 +57,7 @@ cpu1: cpu@100 {
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
-			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -76,7 +76,7 @@ cpu2: cpu@200 {
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
-			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -95,7 +95,7 @@ cpu3: cpu@300 {
 			performance-domains = <&performance 0>;
 			clock-frequency = <1701000000>;
 			capacity-dmips-mhz = <308>;
-			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
+			cpu-idle-states = <&cpu_ret_l &cpu_off_l>;
 			i-cache-size = <32768>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <128>;
@@ -114,7 +114,7 @@ cpu4: cpu@400 {
 			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -133,7 +133,7 @@ cpu5: cpu@500 {
 			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -152,7 +152,7 @@ cpu6: cpu@600 {
 			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -171,7 +171,7 @@ cpu7: cpu@700 {
 			performance-domains = <&performance 1>;
 			clock-frequency = <2171000000>;
 			capacity-dmips-mhz = <1024>;
-			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
+			cpu-idle-states = <&cpu_ret_b &cpu_off_b>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
 			i-cache-sets = <256>;
@@ -221,7 +221,7 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			cpu_off_l: cpu-off-l {
+			cpu_ret_l: cpu-retention-l {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x00010001>;
 				local-timer-stop;
@@ -230,7 +230,7 @@ cpu_off_l: cpu-off-l {
 				min-residency-us = <580>;
 			};
 
-			cpu_off_b: cpu-off-b {
+			cpu_ret_b: cpu-retention-b {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x00010001>;
 				local-timer-stop;
@@ -239,7 +239,7 @@ cpu_off_b: cpu-off-b {
 				min-residency-us = <740>;
 			};
 
-			cluster_off_l: cluster-off-l {
+			cpu_off_l: cpu-off-l {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x01010002>;
 				local-timer-stop;
@@ -248,7 +248,7 @@ cluster_off_l: cluster-off-l {
 				min-residency-us = <840>;
 			};
 
-			cluster_off_b: cluster-off-b {
+			cpu_off_b: cpu-off-b {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x01010002>;
 				local-timer-stop;
-- 
2.39.0


