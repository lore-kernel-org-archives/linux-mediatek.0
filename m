Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E57C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bXf8YREyv5JKmYqLjem21OYAkzeEkFUPtwJ8dQi3DfQ=; b=sXT3obS9lL/nRPn3XA3OYj0qqX
	EVgs/ODAV/A5EDe/IXY+WnmyOIeILs9mVnu9LHF9kOZIOFhFKPn1sY3Kk1r8kkE+CGKylEEf0XtGg
	UWSbRR1Xa0y7XSExwq9iFFSNRRaQJBF3ip+E7Lf5esqoqhWvDZCuNUdQzrb8E+skEEx4tTLQqK5H1
	kX64Wu0f6edAvbdgWl0Ri11oo8udageqwO/CPeCaf8r3pDW2R533wyW1pVDj34ANeAJxRbLn2URgG
	cBQ1fhVp5mnZhTSKDOztT63ze/8t/UlF+6/L4J3lJbm1saV1pQYP3nNFs6KIixSwoge0zYbNufhsS
	XO2mRiTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bXV-002Y27-1n;
	Mon, 27 Nov 2023 13:20:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7bXR-002Y17-38;
	Mon, 27 Nov 2023 13:20:39 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A30DB6605835;
	Mon, 27 Nov 2023 13:20:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701091236;
	bh=U01xvbnT/mSsl9CGN0alnznWYP0QePGrsCETHRIiTB4=;
	h=From:To:Cc:Subject:Date:From;
	b=DRB86tVsQiup4pC8UN6u1wD8FXSHJ//4EtVEPAwxTpM22gF7N3A1WCZ+Z57IBi2O0
	 THwGKGvoPlzoQZfkdA/T12FKzYzyt4COlrN1vXp5XysOIcfCZtqQjGJvELWCRo/tzM
	 9b/lLu+jrKDEK3zDIa5ZJmFnoi5B8nSP4XguLRaHB4iaRMAgDjsAkl7HdrSL93vnY/
	 v+aLaFJ3VVeIYCIGduNIGaLp3B5RrBHkzFtJluoB5yLgwZwESxGIvP2yfTzit2sTNc
	 Ym0hgd7va6OZhKdtHD19UcPfTssfc6GZ5+bpUoOKgUokORYvNA8MC8A/wNMWIgRar5
	 glZwXeWUSjluQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com
Subject: [PATCH] arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7
Date: Mon, 27 Nov 2023 14:20:26 +0100
Message-ID: <20231127132026.165027-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_052038_135745_89404FB4 
X-CRM114-Status: UNSURE (   9.76  )
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

Change interrupt cells to 2 to suppress interrupts_property warning.

Fixes: 0de0fe950f1b ("arm64: dts: mediatek: cherry: Enable MT6360 sub-pmic on I2C7")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 9d0f3d25cb07..ecc7a96ae358 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -466,7 +466,7 @@ &i2c7 {
 	pinctrl-0 = <&i2c7_pins>;
 
 	pmic@34 {
-		#interrupt-cells = <1>;
+		#interrupt-cells = <2>;
 		compatible = "mediatek,mt6360";
 		reg = <0x34>;
 		interrupt-controller;
-- 
2.42.0


