Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D290C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 16:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMIykHCAUD3vGsd7ZtCWfmIQ2khralxjV8iO061TwcY=; b=ps2IfoKgooCUnP
	LYnVCcHqiCY/BsK2u9Kxr2YRyYNoyZkzlZHqflPhm+r3vJh27m3wwCQzsT+bGFQVJqU6VXzDL4/p5
	htQ36mntwFmPrFE+BsIoC6mM1svLLrDbzRgpYnSrHKWE4h+42BS5g0dNdx4ctxE6xJKMunERfV56R
	ubygN434zMXvmHY4vJwwgW6hzUM7sHWqKu3gr1hb5TQdm7+takAwqeLXOMSxv6qbhvQUd+B+mv13R
	dkNeyYqWhbkP5AzmBwFPisd05oR+HSYmo2i8VgPmhy/VihjywRQ17LHAH6ptrvzwoqyjoEKB9thvj
	P13NppD7mt8LnC9TPcKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npYVg-00GuYh-2f; Fri, 13 May 2022 16:51:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npYVI-00GuOZ-9v; Fri, 13 May 2022 16:51:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5D16F1F4228B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652460657;
 bh=71uG7PAcLUDV/b9HnxX+1uY8eqEWrWAzMJjvR2OBRg0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vuxx8MFgndwlpFBNZfLDj8LYMpMHaWgwGK5YvhpDMFqwA/LieF0mk4DJn2QYNJ+en
 IT7qup4jY35qlrWnH1kRHOdxXRK3cHm9a3q3LGcZB6yum0hpDmNnFNuAJwaAg1ujZj
 jya92zN8O+tSomb4kbXNciBvqyac46uq48TctfrS0vn+viesFyNYgFyclyvAAvfAKw
 SmEHPaMqnnQ1SzpZh7Jmog/ySfx7st54YQFVZR7meHnTG8D2qYG0qFTENRY3aDlt/t
 zxsoNkW/Rw0Jf0e8NCF98/d4jej3R6qiYxYz89WdG8wTKAavUDoY6rhwBfm662gb75
 0epHrKU3au0yA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, angelogioacchino.delregno@collabora.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
Subject: [PATCH 1/5] dt-bindings: mediatek: Document MT6795 system controllers
 bindings
Date: Fri, 13 May 2022 18:50:46 +0200
Message-Id: <20220513165050.500831-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_095100_666696_7FEF5FD6 
X-CRM114-Status: UNSURE (   7.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Document the MediaTek Helio X10 (MT6795) bindings for the apmixedsys,
infracfg, topckgen, pericfg and mmsys system controllers.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
