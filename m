Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8541EC4725D
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ie3OLWAf5ErheW64ectsfAG+UkqYuQ6pqp4ua1nMxYM=; b=grhk2zrEKyaSqS6GFwL3H/MjW8
	EzNnLUBc5MQX/duCZtz0Y6WReGdw0OMuoD/lFdLNLRePqXCfHLgJJyj3j874CTv5zhFVIsowUbVz1
	uIFVLFJc30Uv93QcZFvqIYTxZoNoYw51wWyq9TicZgEaLFxYh+KB5B45k/kj5HqFkMXmVS66KtAjI
	lCz78hlNBJjsoX2Nx6kOtKHMX01UUPMkWLc1cFuV6wq3bTecc1NP77ruqz/+83XvQgGTM8P1xfGpQ
	rD1OYzjnurd3GQesd+IfxWDjKYo+gi+uggLTPfU9s9Vvlq8yMLqcumixZMmY+TOGjtfgrkaLyabYA
	2lSCRIKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZWG-00CJ3W-0o;
	Wed, 10 Jan 2024 14:25:24 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZWC-00CJ1D-2q;
	Wed, 10 Jan 2024 14:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704896719;
	bh=Juv4XBQIsz1piXPzn18UqxM8IeGZ96xkSUVgtLb3tVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qXH1T33+4hmdEE2IzGKyrDOCEZny724FGd7XanHY7s3izb1GhteXMdtM0RG1lYpg+
	 5OP0ByQtNMNwcBtTHAA7ekWwqynL0F8YsBQa80gz15Yc0WaT2kCGQgoUMep+IfFeCU
	 zf9vlHnQYUVaz+mIuNvQal2+apLgsEMJCxGQEZSg5isSHy10D4hlVODXAzAMG2Tfhj
	 3Q1vPHfAHs+mIZEOvekXSn41i35+YfyDyGMfhkzmCpdSqQUgqQkQW1cpZsO++Kgw65
	 5+RzHQ5YgqgWfYf9bUE5wBCr3XKz2JfA5TqxGH8iLgFg+PUsjgtYaYQ54VrRDlXR6m
	 WLYDZG/yWfmhw==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 39DB13780BFE;
	Wed, 10 Jan 2024 14:25:14 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] arm64: dts: mediatek: cherry: Describe CPU supplies
Date: Wed, 10 Jan 2024 11:23:01 -0300
Message-ID: <20240110142305.755367-2-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110142305.755367-1-nfraprado@collabora.com>
References: <20240110142305.755367-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_062521_058194_1E1C5B6C 
X-CRM114-Status: UNSURE (   8.91  )
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

Describe in each CPU node the regulator supplying it.

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Moved supplies to CPU nodes
- Added fixes tag

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 3c6079edda19..1f3a6755f155 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -264,6 +264,38 @@ &auxadc {
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dp_intf0 {
 	status = "okay";
 
-- 
2.43.0


