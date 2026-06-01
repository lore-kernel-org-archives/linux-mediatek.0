Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4EECD6E57
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 14:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVvHuOhjIXUrVYlNJs/TCcWdl1BNBMgO8o9W3lfGs40=; b=ZZVfbwji+uFX13ifLJcjY4iqGW
	H4b4XhWBtZYEbjrEAtEFP/ZPmRwtbsrWzJIqLWVozD3YS2lOQ88+RwQx7j2EZ+b7myLspVlEbwfjE
	K3HOMrLYhXn+w3cPSKAaocCd+m3IwqAx4f3gzei4+K5SPLXIB6Es+0nxqhajtF5NfOeVfNxlxhx5A
	ukaKv/t0E2vA2Rl+JxcQgSUjACAT0S7xWgnuzk1fn7x0jftKmlLOhGTWHxl+1fCEY3px+1sMP5VJl
	bDaVbqqhlQ+vOtBP72fajUfQLNrOiYjj/K1k6GSlFN6Ugl/zGTf/D3xBraUa7KDCoYs/UFfD+0GrC
	XpQwTkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qz-0000000BGBq-2rn3;
	Mon, 01 Jun 2026 14:16:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU3Qu-0000000BG7K-1tDI;
	Mon, 01 Jun 2026 14:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780323358;
	bh=DkikAVnGKjgORZv1zSE8GU2JMUsgiMIzW92OS9cpAWg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cwOFAqKTxBtdxPm+OE3h+fY2K8ab3TygTZagINNtjnQQX4Nmvev2uzqJhqQ4M+vh+
	 7Kz1lQYCl2A79zYCI75Wafx0CHEEQ1fb1FeOPYtxmDZdjDQovq/T8NS5s+28S/6lCf
	 3aUZL+N7uOdoBZSzDFb4FPADJQvccTYUhEZifDNu3IZ4HiYxEP9fDH8oP3zro7HZOt
	 2ws/TA5vwnkMF4WYtdvZ2Q9+pl6pX2afBZiBMKYmmjvqnjPNmwr4o2EiyTAlUxXXyV
	 UTcS2zDDJNhQvRFI2l7h8axXX+4LFHc+b2zClBgdodEIiiCctbHQvhim30N0TiOeJm
	 s8PzI5MEVIt7w==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C38A417E0DD3;
	Mon,  1 Jun 2026 16:15:57 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Mon, 01 Jun 2026 16:15:46 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8395-genio-common: Add MT6365
 PMIC supplies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-mtk-genio-mt6359-pmic-supplies-v1-2-05750080ba59@collabora.com>
References: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
In-Reply-To: <20260601-mtk-genio-mt6359-pmic-supplies-v1-0-05750080ba59@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780323355; l=1563;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=DkikAVnGKjgORZv1zSE8GU2JMUsgiMIzW92OS9cpAWg=;
 b=br6iI46Ej/vA1ql7cMF+1KrsEEYXK6UJ3bxDFT63ouElWb/vPrikd5zpUo9AUVhVpyY4pjI5S
 xaDacGAwGgjDgCB33lcsNB4r1MaJe/zc356HcaunarcoYjcZGGVzdXi
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_071600_640495_A82DC2A0 
X-CRM114-Status: UNSURE (   8.90  )
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

Mediatek Genio 1200 EVK board integrates a MT6365 PMIC, that has a
number of power inputs for its various buck and LDO regulators.

Add the supplies for this PMIC regulators to the board common
definition include file.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index edc5539bebde..7ea45b6bc663 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -1170,6 +1170,23 @@ pins {
 
 &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&reg_vsys>;
+	vsys-vcore-supply = <&reg_vsys>;
+	vsys-vgpu11-supply = <&reg_vsys>;
+	vsys-vgpu12-supply = <&reg_vsys>;
+	vsys-vpa-supply = <&reg_vsys>;
+	vsys-vproc1-supply = <&reg_vsys>;
+	vsys-vproc2-supply = <&reg_vsys>;
+	vsys-vpu-supply = <&reg_vsys>;
+	vsys-vs1-supply = <&reg_vsys>;
+	vsys-vs2-supply = <&reg_vsys>;
+	vsys-vmodem-supply = <&reg_vsys>;
+	vsys-ldo1-supply = <&reg_vsys_buck>;
+	vsys-ldo2-supply = <&reg_vsys_buck>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 
 	mt6365keys: keys {
 		compatible = "mediatek,mt6365-keys", "mediatek,mt6359-keys";

-- 
2.54.0


