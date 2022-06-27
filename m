Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47875C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D5ercffD5Az6aAg+oruj2uC+XgwUcFB5VE9+TFvtiqc=; b=E1zc2eaIOP2XReOqYht0aZI9fz
	ilEfYPgjeXGbC9e9tgLrB0LpX9gPp2aU7scC/jjWlhz0FjYRz0l9pUNqzRkT0UQyd7nEl4oaoZEni
	YI4pQ/GsXxpT0tZluKZ7PMF2WHiMKdBbTEdqyQJwHk8KMTCTO4VhBzvA7DT5QLJg0y0NeZSr3MSZZ
	b03Xe4WkYf7zR25EAIbZjboVnilfwa6q2UK3HCbFmXxLeyMNBLRFL0HtTkZ4Jdwkvr893UR96DFDz
	X4fFSheDGkz9ak512DccQ87Xnj5QcHOY2BOdskmgSEWZ4w7S9J7Dtb6exHP36hAH8Y/8ZjvWBRHZB
	zKSWQ3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5sbI-002CiJ-Ny; Mon, 27 Jun 2022 17:32:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5saw-002CZ4-AE; Mon, 27 Jun 2022 17:32:19 +0000
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C504660163E;
	Mon, 27 Jun 2022 18:32:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656351135;
	bh=pmO4Ykqu/l20TUXuLhKhk6GbE3MTS3qlWrVbXnn/+6U=;
	h=From:To:Cc:Subject:Date:From;
	b=g/nB/8IAeor6UrcJ/kdz+O718V+XFBHN9Zq3n8MTcJdc8FRc5LcQ6SWSxfipd22Me
	 paFkUhw9ToV3wCp9P+PIBY91UjrQCPMr5ksUMPO+ra5sTUdybdVNEV4a3fNQcrpHy1
	 dN7I6+iYlLzslQKvfNRclWUjNkIcrJmjXB8nx/77mi3ZbcC88/wHEXv2KKM0cEHJKq
	 oBLOIVk6hln1mQOxKF9PGN3+nVzfTm6qNVjNQvNde8S9l+bcOIqw1Zj8xZN6JPyIgD
	 kgO7jphOwrI2a5BJMlzFfeNSPAcBNhsRU4OwGmtNv/bz9eXG++K+J0ExqnZ0/k7PsG
	 dhwWV56rPC4Og==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: pinctrl: mt8192: Add RSEL values to bias-pull-{up,down}
Date: Mon, 27 Jun 2022 13:32:08 -0400
Message-Id: <20220627173209.604400-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_103218_508956_8E3FA027 
X-CRM114-Status: UNSURE (   9.33  )
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

Commit fe44e4984018 ("pinctrl: mediatek: add rsel setting on mt8192")
added RSEL bias type definition for some pins on mt8192. In order to be
able to configure the bias on those pins, add the RSEL values in the
bias-pull-up and bias-pull-down properties in the binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

 .../devicetree/bindings/pinctrl/pinctrl-mt8192.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
index e39f5893bf16..e0e943e5b874 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
@@ -90,6 +90,9 @@ patternProperties:
               - enum: [100, 101, 102, 103]
                 description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
                   defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull down type. See MTK_PULL_SET_RSEL_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
 
           bias-pull-up:
             oneOf:
@@ -98,6 +101,9 @@ patternProperties:
               - enum: [100, 101, 102, 103]
                 description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
                   defines in dt-bindings/pinctrl/mt65xx.h.
+              - enum: [200, 201, 202, 203]
+                description: RSEL pull up type. See MTK_PULL_SET_RSEL_
+                  defines in dt-bindings/pinctrl/mt65xx.h.
 
           bias-disable: true
 
-- 
2.36.1


