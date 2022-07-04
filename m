Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9962C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CL8I88Cy8Kil6BNyOKpjgH5tZqjdkfs+rctUWWj3qGM=; b=Z0QJ9r8SfBUMPX/oowpEMIvkSL
	PfuqNv7YLVoeQuZnyX3j/bk+uu74U4whC56ok+9eV+lRCAvBkKtg6ZIphNf/FDAyq4vH+h3cSUOzz
	bxwIZWpyWBT+rJpFut21HJxf//BJcoT/tQhnzK1iGubCnbqrN8wAqOsB7P48oe8gNOR4uPPO/phvI
	fyC9Tm1SXKVFfSPVJ1Bnm9Ky84Aw9duvWehB0UdPuEYmgVeSQoLAGu1JZz+L2x2khvipXaNO8Uyiu
	z7gTqn33RNRj9SZYw16KN7SXdo+XMHtn1gA4oFga54jn2PMiJXGmta76O42MPLOUXKicrgigVgbA/
	BbbXDvSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5x-006qFq-Va; Mon, 04 Jul 2022 10:14:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J5B-006pdo-Fp; Mon, 04 Jul 2022 10:13:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7385E6601987;
	Mon,  4 Jul 2022 11:13:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656929612;
	bh=azfRUajLehhOzGnLULDEtSHP3GPvrxv+785YAlxnK7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n6A0C0D2vXP+5IAI507YPfLlJVbGEyy4r082aiCTeyut90b95oezKbxkDZdjAt0O2
	 PV/oh7rAus0+v454hyvkT5VkGVi36SSNhYCEkTmLOqDX0GLeXD1rP9M8p/ORw5ePW1
	 6iseI16FjRNAdPTXSj00TQIH2rezVsPj73xK+ec503KxRfh3sOaN9SZCpvdPvh4/BX
	 eOz5pWsicDJxwh1iON1Bs8Fckz2ccYikEOnq/40N5NdW14W0vZ9vKSSy7xlsX7V385
	 /upX+s2uoLhg8QIantBkPEx7G4BPIBhCuq2V6v7EH5wu9x1RmPv8rt6VyVVhHp227q
	 8g6JRD4WiyOEg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 04/11] arm64: dts: mediatek: cherry: Assign interrupt line to MT6359 PMIC
Date: Mon,  4 Jul 2022 12:13:14 +0200
Message-Id: <20220704101321.44835-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
References: <20220704101321.44835-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031333_698657_2AF5AD60 
X-CRM114-Status: GOOD (  10.46  )
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

To allow MT6359 peripherals to trigger interrupts and the driver to
safely handle them, assign the right interrupt line for the Cherry
platform to the MT6359 PMIC node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f4c3d33843a7..c9b2c7246ce1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -125,6 +125,10 @@ &mt6359_vufs_ldo_reg {
 	regulator-always-on;
 };
 
+&pmic {
+	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.35.1


