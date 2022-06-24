Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36160C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keiVJynF+S+m8Kw5lMXhzeWZLnL1Xg+dWMl3kQYc6LQ=; b=4rfc10P3I6N0wpZtPniHeZwfyv
	WksrWrE62AZKnzEZ9O9miyjBtw7AVTEnk/12F0qZ166ewqlyNNl5LcSvoPooP29oIgGm9EGgEjyxq
	Ue+yQUTI793x1ybLkeUJA8+nE03S8jGw0dnC7014jKpKdK18Pdg3P2BG4pXWD4NwuqSOfyPtPAext
	+phUcvV2RTAEn5ORA888U48nhehcBvXr/HpTP/GJKhyzYQMqcP98CUd5PTLk1EXrYfclHo4KweMTk
	8JVGF0oXdYMc0zE1tRVYCW2BO4YtbDiMe4dYSuDxrTSlUtCvpLJcZPAFyb+qshzjZv5CkCg7k4DgE
	VMnoUbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4flO-001Sug-KM; Fri, 24 Jun 2022 09:38:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4fiz-001Rr8-SJ; Fri, 24 Jun 2022 09:35:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C459666017FD;
	Fri, 24 Jun 2022 10:35:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656063333;
	bh=dVpnFJPWijR0G8zrYTyz0cKQZgjOoyAvap7TVzXSsS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y4Co0gSCm0tLPLO0JQxtcFV863Ms2LHq6GOUqvDjLYgkEr9I6nhNvlVdshi+ORkhm
	 H5EP+1RCILLBpsV+6DeKxjd7aDPXVZ4eWvleI/ZDl+ypyq0HYdVF6l7MTf/mZ9bITo
	 nwRAAs/KrEvkh2iB77yDpmUQ6e8Rzl6nqXXykY30Uk/+SBkBIICxeHYfHDUK9nseEe
	 9pdjxTZ+w2Z/o7kIr4USrxYk5YFtWgQecU2aGZ2UfpaoCwfKXuzHPqtqfRDaYuUl7M
	 T1ri4mHUQu/68OWkoLPT6MA/CREKlchF5fNscBAS4hM78CX94FQi2cqNUUQfrqhJMN
	 lH+NMw7yd/5zw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	y.oudjana@protonmail.com,
	angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	ck.hu@mediatek.com,
	fparent@baylibre.com,
	rex-bc.chen@mediatek.com,
	tinghan.shen@mediatek.com,
	chun-jie.chen@mediatek.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	miles.chen@mediatek.com,
	sam.shih@mediatek.com,
	wenst@chromium.org,
	bgolaszewski@baylibre.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	kernel@collabora.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: mediatek: Document MT6795 system controllers bindings
Date: Fri, 24 Jun 2022 11:35:19 +0200
Message-Id: <20220624093525.243077-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_023538_244462_B1945E2F 
X-CRM114-Status: UNSURE (   7.91  )
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

Document the MediaTek Helio X10 (MT6795) bindings for the apmixedsys,
infracfg, topckgen, pericfg and mmsys system controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml     | 2 ++
 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 1 +
 .../devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml      | 1 +
 .../devicetree/bindings/clock/mediatek,apmixedsys.yaml          | 1 +
 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml  | 1 +
 5 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
index 8681b785ed6d..1d7c837d9378 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -23,6 +23,7 @@ properties:
               - mediatek,mt2701-infracfg
               - mediatek,mt2712-infracfg
               - mediatek,mt6765-infracfg
+              - mediatek,mt6795-infracfg
               - mediatek,mt6779-infracfg_ao
               - mediatek,mt6797-infracfg
               - mediatek,mt7622-infracfg
@@ -60,6 +61,7 @@ if:
         enum:
           - mediatek,mt2701-infracfg
           - mediatek,mt2712-infracfg
+          - mediatek,mt6795-infracfg
           - mediatek,mt7622-infracfg
           - mediatek,mt7986-infracfg
           - mediatek,mt8135-infracfg
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 6ad023eec193..597ef18f3c5f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -25,6 +25,7 @@ properties:
               - mediatek,mt2712-mmsys
               - mediatek,mt6765-mmsys
               - mediatek,mt6779-mmsys
+              - mediatek,mt6795-mmsys
               - mediatek,mt6797-mmsys
               - mediatek,mt8167-mmsys
               - mediatek,mt8173-mmsys
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 611f666f359d..c518ed3c4153 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -21,6 +21,7 @@ properties:
               - mediatek,mt2701-pericfg
               - mediatek,mt2712-pericfg
               - mediatek,mt6765-pericfg
+              - mediatek,mt6795-pericfg
               - mediatek,mt7622-pericfg
               - mediatek,mt7629-pericfg
               - mediatek,mt8135-pericfg
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 770546195fb5..731bfe0408c2 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt2712-apmixedsys
               - mediatek,mt6765-apmixedsys
               - mediatek,mt6779-apmixedsys
+              - mediatek,mt6795-apmixedsys
               - mediatek,mt7629-apmixedsys
               - mediatek,mt8167-apmixedsys
               - mediatek,mt8183-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index 5b8b37a2e594..81531b5b0db7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2712-topckgen
               - mediatek,mt6765-topckgen
               - mediatek,mt6779-topckgen
+              - mediatek,mt6795-topckgen
               - mediatek,mt7629-topckgen
               - mediatek,mt7986-topckgen
               - mediatek,mt8167-topckgen
-- 
2.35.1


