Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCB7C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kscIbARNzp8jYoYK9E+kt1blXXQ5IjBNG2803sPwATU=; b=xAOzq9AEIfzWi0
	bN+btTgSx0i6Fb9xgxwLbH9PGz4HKxeEXEhS0eWy4SQ3AKCexcOAAI/y1pwyBv+PX2nA9ddDoUHqD
	Xu4coGf5P6vdtV0GNikz6a76mohjGfmLFIRRqnJLxlsHgArqBd9eVC5HfVJjzulJN4dLziueJviQ6
	UYbX37WRFlhwxzFkkSgULh1KD43Gi1/54LL7xBxVj3r8Oug6s/i8rMAd+WKiRwEKqSaR3KYMhQRg5
	W88KSbmKcb+hWR5UWjYYi/bivadmd24EkSN58OkqDiueLGdHvKRJoue0rpxSFZKSyjXHBdr6OBZlA
	PRHHo5qfmJ/trfSRDYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkPoI-00B9Lu-Vg; Fri, 29 Apr 2022 12:33:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkPmm-00B8bu-9f; Fri, 29 Apr 2022 12:31:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C1536B83512;
 Fri, 29 Apr 2022 12:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37FDAC385B2;
 Fri, 29 Apr 2022 12:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651235505;
 bh=U1fnlH5OyGJ5UIzfEScyxiBRXPgHxk+UHE3ZSX1gPvY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ISPMvNcSQFkMZIWSHYxdg5JmBcRxJsqOeGCndtVUOHzFSep/BT5TXtbexxYIN9Zzv
 +D9a9cf63EfihTrNLiCSYnSITsZ858oBCjHM9OAyLTHtFm/haWeZ6ioTJtFEM4508X
 W4q4abspHfamRw89c8Qu/vBggzpAMPr5smLkEFCN3X2QRJXSA8oQRWQzbjenxJVFU4
 vVvWes7+RoHQf0M2d4ygN8Fj6V6mJAIK2a401iKT6MLqVWYU6t/sX2ZbKs9zsTqPq2
 9k3JTkOU1u4t9YWJ/E3OWsvCRpUR6bsW1GSxvr48e115hufTW00WQFhXx6qalzVU6F
 IOrrneGjSjqHA==
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
Subject: [PATCH v2 1/2] dt-bindings: ARM: Mediatek: Remove msdc binding of
 MT8192 clock
Date: Fri, 29 Apr 2022 14:31:31 +0200
Message-Id: <20220429123133.28869-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220429123133.28869-1-matthias.bgg@kernel.org>
References: <20220429123133.28869-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_053148_541318_99A4554B 
X-CRM114-Status: GOOD (  10.61  )
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

The msdc gate is part of the MMC driver. Delete the binding description
of this node.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

Changes in v2:
- Delete compatible in binding descprition as well

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
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
