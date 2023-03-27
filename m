Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B40C76195
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yXvD5OwAYM9B6FG+dSZmPNM4+LQMwkEo9gfqrLfj5SI=; b=JrZWHX83ZtR6sAAEFtE4HT2/Ec
	d4OI44tnOCNAtQAaANUyNUx3yTuAVFFjSOgBYZkytXeHSp6qQf39VE5diIW+cGJDNucN0StaqChDA
	ZUBT+H/4rnqHjqqHOcCfKcyOJdq8KoLpJmP/i93dV0wvUCJYpTurpiMkBBtqHFeUxLS3ILP6478gz
	I0UySYNNbcBybkAEXm/BSISYnbCxZYTEzV6to0bDu7D97BTjk85PQOxvpmBZ+xY5Z9P+3JAvYbOGd
	lVxjasBRS0F1si01pGrP7EX1Ng2L0+zwuT3pVnoBESW+40MAhAAyxKqGfiWD/PXAiUwc+UiVu7Oge
	Up2dKLCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiNv-00AIaW-16;
	Mon, 27 Mar 2023 08:39:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLl-00AHBO-05;
	Mon, 27 Mar 2023 08:37:13 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 17CD3660313C;
	Mon, 27 Mar 2023 09:37:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906227;
	bh=/T9WmBbua2oCTw4GMfNhun8IUtdf0uXbZIh9+7jUzSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZDsHIAK1e7zUj1Sf4asd/mmg6RVoWeec0+v9Duw3DII4USKasTToxblsMfg+5oAsF
	 s3haNXogKx8uNAwV4TAicN+9AZ3NTColuBG9YKlXc6kxXf45HsKptA1E5Lfu17nfKA
	 P3xfdbOGzx4f9uJKpHvuzuzKgELg786lelCwwPgIUz+5Mvnmaabfo2ouD1dFSSNOqG
	 htk89i25gLx4NyBI9eAorikkPDalrZSUG2x8EioNFZWJdX6EgDUfBrFzr1cAoLHmck
	 0TSVpUqZYBZSYvYrXUvtNhhZpJsgtGtDzj0sfbI/61NJrkNOf+ElxdZCsoHM/6J3Em
	 iz5UQ8yURUm8A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 15/17] arm64: dts: mediatek: mt6795-xperia-m5: Add Bosch BMM050 Magnetometer
Date: Mon, 27 Mar 2023 10:36:45 +0200
Message-Id: <20230327083647.22017-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013709_217768_63040488 
X-CRM114-Status: UNSURE (   8.72  )
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

This smartphone features a Bosch BMM050 Magnetometer on I2C3: enable
it with the BMM150 binding, as that driver supports BMM050 as well.
For this sensor, there is no interrupt pin;
readings were validated in sysfs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
index 54a1f7f306f7..bda14c74a8af 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
+++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
@@ -106,6 +106,11 @@ accelerometer@0x10 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&accel_pins>;
 	};
+
+	magnetometer@0x12 {
+		compatible = "bosch,bmm150";
+		reg = <0x12>;
+	};
 };
 
 &pio {
-- 
2.40.0


