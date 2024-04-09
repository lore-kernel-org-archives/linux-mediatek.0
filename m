Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33644CD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nuyt1zn1E6u10R4RLD0HYmhIs7BJlMeZw5ShFyoFGJQ=; b=DGitVPXHfnOxptmZM5rnaQdWFr
	XApWE6mCEGu8T2ZrRi87ADk9jJfc8ooqG0bVeb7Vj3jgul51/+9WaZs2DUXZSsE1YxWlKataxuhCF
	bb7zy+cZHLf73tPl8dthdTAnAfEaFHaNldSI4WQD4TmJ9qZDwLkAq4iHuXcVOPb8WchPFU+5K3B1i
	QMnejJLBCRqDf6NBLLOvYXW39VnHepgJ3Ut6q5ZYfn80L9Q+ZPwLINRB/2r92b6udMM9p9HK8dcx5
	hHWcKtQjvWb3spt/xXuadCiPKDrT23Y7AymxC5tbTdJ1fMryARFuZD8psl2Bv8mnmQdGK0Rdf+dUk
	5nSx0ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9sF-00000001kti-2ade;
	Tue, 09 Apr 2024 11:42:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9rx-00000001kg2-2ldp;
	Tue, 09 Apr 2024 11:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662948;
	bh=Xl9MIcf8lfZ5gHbLv/p0PZMszA5xQbjg2yFtG5nVZmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PWxzLdINqOxTG6w44mrSRWESs5zyZcyU8dCPhaqQTlORHj8EftZOwEfUB1eDZ6fri
	 QbbhGn0h8eMZsEtR9aEaY3f0i6W1v4LMBc9Gvb967Atequs1pm9qKwAOdqNxoicPyo
	 xInbB2Ffchhmw22vBC3jYpkbl0rwsFJytZ0B4aKfD868OAhLs8/vkkIZuJqkCSBP2r
	 RzFId9fbsr6TApp6Hwm7+VCEo2mbKJnc/YUVEZMFPxOJk5WjgTbg6BSf25tI7GaFWm
	 fmVGsak3ZylO/6c67gzNuyeLEocc3sbYiqQ95LGv+cbWQJCH/z2g5otGMomlTtxek/
	 AveThPDNe34sA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9D5B63782111;
	Tue,  9 Apr 2024 11:42:27 +0000 (UTC)
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
Subject: [PATCH 3/5] arm64: dts: mediatek: mt8395-nio-12l: Define RSEL in microamperes
Date: Tue,  9 Apr 2024 13:42:09 +0200
Message-ID: <20240409114211.310462-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
References: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044230_043261_BA156A3A 
X-CRM114-Status: UNSURE (   9.84  )
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

The paris pinctrl driver supports specifying the RSEL drive strength
in microamperes as well as internal bits definitions: choose to specify
those in uA to avoid using hardware specific values in device trees.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 86f7d4dd5eae..f699633659b6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -434,6 +434,8 @@ &mt6359_vsram_others_ldo_reg {
 };
 
 &pio {
+	mediatek,rsel-resistance-in-si-unit;
+
 	eth_default_pins: eth-default-pins {
 		pins-cc {
 			pinmux = <PINMUX_GPIO85__FUNC_GBE_TXC>,
@@ -509,7 +511,7 @@ i2c2_pins: i2c2-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO12__FUNC_SDA2>,
 				 <PINMUX_GPIO13__FUNC_SCL2>;
-			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+			bias-pull-up = <1000>;
 			drive-strength = <6>;
 			drive-strength-microamp = <1000>;
 		};
@@ -519,7 +521,7 @@ i2c4_pins: i2c4-pins {
 		pins-bus {
 			pinmux = <PINMUX_GPIO16__FUNC_SDA4>,
 				 <PINMUX_GPIO17__FUNC_SCL4>;
-			bias-pull-up = <MTK_PULL_SET_RSEL_111>;
+			bias-pull-up = <1000>;
 			drive-strength-microamp = <1000>;
 		};
 	};
-- 
2.44.0


