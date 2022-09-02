Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD291C54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+0R+ZSsDADLTNWhxT11QcpS9+2qzJXds0b4GmRWjvs=; b=ZL20rcqg6qLUT3ec37C2kdbUhf
	JuNkVZizBmW/uahZHz5VaBNyVrYImi6Dm6lk13oh6EU4jqByMHqytNoP/pGNqU66b5WYrSFDOm80t
	AQ0PCi/9B138O6R1WUZpelCwh63lLqZC5u6JvktlgolbNpxtgg7ov4sJhtp/0xHskm1dzYW9e34nm
	ap21VHmROr7/sQUjvvipgnCVfEjq9kKYV63+F4eSdOMFb2tkEy0AotvBB/hmgG2ztSl6wkLnsIX+7
	IvDcK2nQpLdwOTPnbfiFc/1pQuaNznXAhbUIG8KRDlry9sImosBwunVUC0j4koJpjZ05uI2gUZdeF
	jjkFLq2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1nw-001glZ-SM; Fri, 02 Sep 2022 08:13:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mh-001fw3-Il; Fri, 02 Sep 2022 08:12:19 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 13FEA6601F07;
	Fri,  2 Sep 2022 09:12:12 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106332;
	bh=998n5hMYVCUv2bH+6FpSZP5lPQ/OUg9EIEPIyAx2NbI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eu0AcOGskTUT8S/+xhZ3n/Vd9VKnnDOS9BVh2oIZKTakgeTtbx1Zrf5t99wBOZVPP
	 b/UQBCR+HwH2/Y2TmKgzkRym0lnclAYGlpL+nyA3I9PK5peBHWxpNbzNxxVy1VCAsi
	 YEYIziloJVAUTZ8Gr71280wCE29dxCJIXIQXKwQKsKfPshDSacnw9lty/hlaM6umIE
	 7GLdQSQmwo7LJcDZSltwsyRNwdltGGyIcGEMCjkYFwkLzShVTZKuCiEb5AitnALKaY
	 yEOFI352yeFq1pyVWXn77GM7e9dx59BD5z/+afQ6S56R6uNplOgXxCZeI74YI444tw
	 eKllllaR5m7OQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 4/7] arm64: dts: mediatek: cherry: Add keyboard mapping for the top row
Date: Fri,  2 Sep 2022 10:11:53 +0200
Message-Id: <20220902081156.38526-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
References: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011215_891477_DB078AD1 
X-CRM114-Status: GOOD (  10.13  )
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

Chromebooks' embedded keyboards differ from standard layouts for the
top row, as this one doesn't have the standard function keys but
shortcuts instead: map these keys to achieve the functionality that
is pictured on the printouts.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index a07e7fe66315..1174ab344e47 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -821,3 +821,33 @@ &xhci3 {
 
 #include <arm/cros-ec-keyboard.dtsi>
 #include <arm/cros-ec-sbs.dtsi>
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T8 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T9 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T10 */
+	>;
+
+	linux,keymap = <
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x00, 0x04, KEY_VOLUMEUP)
+
+		CROS_STD_MAIN_KEYMAP
+	>;
+};
-- 
2.37.2


