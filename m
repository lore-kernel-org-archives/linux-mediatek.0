Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F4BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDC4hvuX7G5GRURKJ2Y0VXSx/72Aos+1MXMc2zBbaos=; b=qPXFojNhGtH/3x
	S0G93VgNNcFUgAYixvyP6HaZNZtTJITbBvoAPQYUO0m9b1oRPxr2Ton9FqNKOxfHlzam3WJkWUpBe
	QRiYNJx164on05/Rz0bfnHT7JKVFO3+KCw1ENESiAwzhq9OWjTiZ5bPzwyzo0y3JA3NwO+hBl5rRQ
	vMoYVABn+wnpUAtdKyf1UNGQndVMdePHNAQW8CvnOmOhzma0FjPZNwh5wFkcIZCD3J6LnrmKJq2Qt
	sXzyDf5gAZWnn/4UqfebjjEIqPfbN0BnqS1VcUCjyAplQrP/5LBf/kEnbW/j6X1JNQQ+kGdxr07DY
	ePqtWmlROshQbJHOZhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt66g-003dsM-Lk; Mon, 23 May 2022 11:20:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5E7-003D8B-R9; Mon, 23 May 2022 10:23:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61C56611DD;
 Mon, 23 May 2022 10:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 600D8C34119;
 Mon, 23 May 2022 10:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653301430;
 bh=vUsnPjeIxXkyjg70eNAh8JZuEF/mFk5yfd2/sAihNms=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JfbsIsSyH3KzxP0Soh/5qiLLMFKa8ZgGOC5rI8NsETXsLEdTXaL5SqgQh0kpdIPJe
 SytazElEMl6XNx95MZY/Df16kjPyY5XuKoAdzXx+RSOqrUxwOK6oGR367FFhdpe6so
 Pdk2VHogUSWRUJcf1zLycF7pwjfb97f4fT5bupP/v1WweXd8iYwvqVMqxdojhpbgz9
 PyukX45GlyPFwOnMJcjSJgTzeAOJ5eg8ACe0bYPJQ6G/pIniM3Xgn5GIziHsHYhGFb
 2/OMJjDpBz16fgWoHqyG0eFWYiLbXR7nzW5nrMxMbIxLeIaDAQaVCXfxdeJI1HdnoZ
 TdGZ9cM8bU7fQ==
From: matthias.bgg@kernel.org
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org,
 ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 MT8192 clock
Date: Mon, 23 May 2022 12:23:38 +0200
Message-Id: <20220523102339.21927-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220523102339.21927-1-matthias.bgg@kernel.org>
References: <20220523102339.21927-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_032351_975211_78CCDD8E 
X-CRM114-Status: GOOD (  11.71  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

The code controlling msdc clock gate was moved inthe the consumer, the MMC
driver. This node did never represent a working implementation of any
peripheral. It was just a lonely clock gate that wasn't used. Delete the
binding description of this node.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>

---

Changes in v3:
- Update commit message to explain better why we do ABI breakage here

Changes in v2:
- Delete compatible in binding descprition as well
- Add RvB tags

 .../bindings/arm/mediatek/mediatek,mt8192-clock.yaml      | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index c8c67c033f8c..b57cc2e69efb 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -24,7 +24,6 @@ properties:
           - mediatek,mt8192-imp_iic_wrap_w
           - mediatek,mt8192-imp_iic_wrap_n
           - mediatek,mt8192-msdc_top
-          - mediatek,mt8192-msdc
           - mediatek,mt8192-mfgcfg
           - mediatek,mt8192-imgsys
           - mediatek,mt8192-imgsys2
@@ -107,13 +106,6 @@ examples:
         #clock-cells = <1>;
     };
 
-  - |
-    msdc: clock-controller@11f60000 {
-        compatible = "mediatek,mt8192-msdc";
-        reg = <0x11f60000 0x1000>;
-        #clock-cells = <1>;
-    };
-
   - |
     mfgcfg: clock-controller@13fbf000 {
         compatible = "mediatek,mt8192-mfgcfg";
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
