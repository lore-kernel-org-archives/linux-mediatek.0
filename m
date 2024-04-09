Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CCACD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kI7a0RuILMPScmkILKeGMrOruhi9aXjtkHQ1/wVVqM=; b=v8lnLWJcaSjW/0evgekvRdX4jw
	lyFcb0eDiTQZbrlLDVmD/Q6lJnbLjskWMgrX5tGHlz8pTsyvB45XjDr8Qb0fLZtx5gEdA7m/+um7z
	boVHRezR7UcwLsBGiWdGl6/WJQYG1J+5YUyEjieDY4OBYGmq2X8taWYvzCLLQ4cx3iaotMaD5vmlF
	tgjt5/z3gBUVOWFmc+/8ye2qznMbk41FDDR1nMgsdSySO6/wctkTQ8m3rbWt0qb3jv494OJugVmUG
	Uil/qpcJk0KDyiILj4TaxTVqsXEpYvppmGWrwtZ+9N5joul1d13tT91r0IwYKYWvMLl5TczeZTpsw
	XtIDQPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9sQ-00000001l2l-0MMu;
	Tue, 09 Apr 2024 11:42:58 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9rz-00000001khK-1ESM;
	Tue, 09 Apr 2024 11:42:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662950;
	bh=1IKHkg+bFOK+XIFwPPhCXS2tjDgeASO3rycSgHf2rZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r+nxKpPevPYF5KeaMrPZbMUBWhwIroSMLfrTCJAyZ2z7biBlV7Itac+bNYWXqg9AX
	 x9wnbrJnbg1v/wRm9okRoXB/1y97SMuMIOJk/BzdVYBTIMDJACi2M91C3+Db5aN46G
	 w82qJMCOha7zlg+40XhKJIEJ/P/nYP9AeR4jWR7qkPYMxOSupgAQlx28Y4P19FbU5p
	 5c9e7DVeJsBlD05j1N39auPKoot74PRZjF5/qGT5m4cANizhQH+lkaYXaJ3keqv8pn
	 wJXxnr/dggeGXAdfslqaJxkLvB51wpJdFO1p0r28+YVn3m1Lo5WWZyMnq9E+ox/J8y
	 cmG4JeFVEh+5Q==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D3133782127;
	Tue,  9 Apr 2024 11:42:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 5/5] arm64: dts: mediatek: mt8395-nio-12l: Add power supplies for CPU/GPU scaling
Date: Tue,  9 Apr 2024 13:42:11 +0200
Message-ID: <20240409114211.310462-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044231_672807_DDDFF871 
X-CRM114-Status: UNSURE (   8.51  )
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

Add the necessary power supplies to safely enable CPU and GPU frequency
scaling.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 5cbe969da425..bf6b539e6c06 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -140,6 +140,38 @@ apu_mem: memory@62000000 {
 	};
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
 &eth {
 	phy-mode = "rgmii-rxid";
 	phy-handle = <&rgmii_phy>;
@@ -343,6 +375,14 @@ typec_con_mux: endpoint {
 	};
 };
 
+&mfg0 {
+	domain-supply = <&mt6315_7_vbuck1>;
+};
+
+&mfg1 {
+	domain-supply = <&mt6359_vsram_others_ldo_reg>;
+};
+
 /* MMC0 Controller: eMMC (HS400). Power lines are shared with UFS! */
 &mmc0 {
 	pinctrl-names = "default", "state_uhs";
-- 
2.44.0


