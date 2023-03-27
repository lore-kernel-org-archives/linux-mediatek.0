Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6152C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=et9IXXnwuJj8gBw2w84nxQj+qW6lVRl9tm6flakAp/I=; b=jQxjCMykVArfhJoVtKv9hJoR3b
	+h5GxENq530GJofGwF1gAg5hkhMVXj8g588M7cCMRUEjXszzT0VzJfzjmrkFZiwLiwyTHz6ve+QQZ
	7AIfa/dsJ9B6SlNSHB7RibXbUZcn4pXS8gYDz1RbsjR8r6twwfGosoZJym70ZtKlzUh6re2IH2uNh
	WQS46yZSl7nCSinGwS2mH3EiBxWN2WqDhlLbxFVZx8O64t+/IhaHN5ltwyMYOz0SpTB81uFEy1yze
	B/Fm/0I2Qde7JzB+KzcxnkxohkU1uKaIynLlCnFW7eoIt3O1jIay8aRX+DYGzkoZmS4fysm7hxOdS
	xp9wWrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiN2-00AHwe-3D;
	Mon, 27 Mar 2023 08:38:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLg-00AH8s-0r;
	Mon, 27 Mar 2023 08:37:08 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5601D6602087;
	Mon, 27 Mar 2023 09:37:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906223;
	bh=klZ1wIb0qi8AUCKdFQaQFYLZ3ZlhvULeIjT368zNwRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oT4am/2rygp9oD0xzETCoBVYy3dYoaJvHb6Xp0G2YKpVtk28BAxPqwiPBXIKdBHCD
	 ImqbXMpYnR8h973p2LoGosh8Z1hYNRIqTM/lZo75wOxVtD+DW78CjsRs4QlzWnaLPf
	 zCAc8qkeumH3mCHnOZKhBSpMMqEtKnbOi1+Zc03RK8dgfOHzVzLDdkA1Wd/nECHfrJ
	 8xKcVuLKJrRxb9tBVkfAvaZklR/eLETcY2mi8WO1ghcxrEZYxdfYbVxOT8JB39Wv0F
	 VES4JXfo7J5jJcAaW/LjeNpFieTvrHRipea7vVsbYqXP+BjFhxn3IkH0PopNptWil1
	 G0mJewBE28nQg==
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
Subject: [PATCH v2 10/17] arm64: dts: mediatek: mt6795: Add VDECSYS and VENCSYS clocks
Date: Mon, 27 Mar 2023 10:36:40 +0200
Message-Id: <20230327083647.22017-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013704_436645_B12581C2 
X-CRM114-Status: UNSURE (   8.40  )
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

In prepration for adding the IOMMUs and LARBs of this SoC, add the
VDECSYS and VENCSYS clock controller nodes, providing clocks for the
vcodec stateful decoder and stateful decoder hardware.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index b721971d4e5e..a8b2c4517e79 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -647,5 +647,17 @@ mmsys: syscon@14000000 {
 				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
 			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
+
+		vdecsys: clock-controller@16000000 {
+			compatible = "mediatek,mt6795-vdecsys";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@18000000 {
+			compatible = "mediatek,mt6795-vencsys";
+			reg = <0 0x18000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.40.0


