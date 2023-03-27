Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B320C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r3PiF0lCUBj02UX+EZBLJjyi2r1RA1XbCSu3yCJnP9U=; b=CULlCEwvaX+yNAhhiT4x21eDTu
	EvId+aQN20VrNRHMmdDZscGw57j18vLt1vxHPwtDENhJHqh8I5cEFVzFofFebUD2/aB1ZvQsgotUI
	RrbF/8ay4YmrsYj+xgsXUzrIv4QfPy+l8MKqyUR/MWzyxOIPGRe1PidDJMAXFHbglGkKW9vNlHHJx
	4nlUOHJ0mxX6VcynEI11KNSOYSYx+gyzhMiDF4tIygZzG0ddYRP+3qRQHJzP/GYo2H6X9XS1BDPiZ
	GzWFnDxvhXg+R5Yf/hxBKXOsRW8NvWMHdWOu/76HhlVDvujUewqYDZB+9HLXOFzDuGAMPhbAyL0OV
	tgBLCV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLx-00AHJQ-2z;
	Mon, 27 Mar 2023 08:37:21 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLa-00AH5k-1k;
	Mon, 27 Mar 2023 08:37:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9585D66030B4;
	Mon, 27 Mar 2023 09:36:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906217;
	bh=/m1OL7UsMbNu+kNMCfRtbpy2xlvb5EHGi2lUhT8JrpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LatL6xXd23iT/+dxp3yRnUFr1btzJX414Q9COH/8qxalSOFYNnD0YL7GSHZUgmJCI
	 EgSoHyTgPdr2aoM6Lke3roF3riLHZxxztopPljTNYWggdPmzp1xzrnaC/eLpOqVCDH
	 pvpmBUntRPgNxxyHWLVJXtoVdvp7MNZ9pmbE2qH4UZIe+ah4U4gkDRWkVgwCQtZNZs
	 2xMJ/Iyyo9IFWhyqmZmM77EKFAgE5tLorwp0wuGHZO30f92tmrONxnPAp15m1w+Ij1
	 hO0qX71X/x9BTXkqQj916ymZ5tPBypN6vASbQUiCGrEexs0LF3SvHu2MIkkXuhbKHU
	 24U8Qmuab1tAw==
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 04/17] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT6795 Helio X10
Date: Mon, 27 Mar 2023 10:36:34 +0200
Message-Id: <20230327083647.22017-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013658_705439_1DCE3050 
X-CRM114-Status: UNSURE (   8.02  )
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

The MT6795 SoC uses the same I2C controller parameters as MT8173:
add a new compatible string for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 72ae2e01cf22..685da4df688d 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -45,6 +45,10 @@ properties:
           - enum:
               - mediatek,mt8365-i2c
           - const: mediatek,mt8168-i2c
+      - items:
+          - enum:
+              - mediatek,mt6795-i2c
+          - const: mediatek,mt8173-i2c
       - items:
           - enum:
               - mediatek,mt8195-i2c
-- 
2.40.0


