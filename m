Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B24C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 17:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o7FOV0ynWvj0jTlasoccm6vUBuoQDs6v5Aj9nJALco4=; b=btDZohvGgeYOLd
	OXCC4ZVbJB41fMqUXtaIAOu1y3vU07d4gxIjTVQfdRD4RS/mbuFQ1Fhp1qNSlKgIPkjlzO71Bloqr
	Va8Jk7dBPOi0XF1jkranT5XBgmbZgRGaRkjd1pnn0caeYyOZfD29AFme6NmPPcHH2BRBakizurZ+v
	UDz1ZUXDBlRx4HnUWhwSWeASDSnSU/hcqpJfg9/bZN6YNm7FrrvGbstP5gv53UcQumLT6BNnG8gdk
	cCMeNnPzLwLCokO+x71CciaQ1LmqL8MxT28RFb1n7nGiJJynR645e+JDcahSb35KpPZht25gqdBxU
	GRIyL3qJ759VQYQ0T5CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfPJA-00AxlZ-0r; Fri, 15 Apr 2022 17:00:32 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfPJ6-00AxiT-94
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 17:00:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5350473wmz.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 10:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gq0WGrwCFa0DH2fCvNOkSonNeptkGtqY34LwdIN3LF0=;
 b=I6rFcA21cGHuPTs2RY2P37BAl0LZBd8+WMQzCzxJXVFUKbRMy7ncw42qJXS2bQCxdF
 bdbFwVu6n2Ns6/wkqblBtVEFUZYKzjtiWgSz1T2aSBvGRBa96d5jm/Y7koIUgKqWToxL
 TBMwIYiv+x7PSkmSlR8ytbDsY5mzC7pY6WIB8KBSBoSXUeS6VhNScGDognj48gg+Fjjz
 qwRoeYMejvdOMD+q8hJsaDowApxmZhenSTfcTNe2dUKxEkOlbiHJ6SCl+IX0520CVuq9
 rfNRCedszqfnhFyvKRVyFN1ab4/c1B9YXO8W7uWH6Y7WpQw3NsLcf6zIW+/vur77qZiX
 6xEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gq0WGrwCFa0DH2fCvNOkSonNeptkGtqY34LwdIN3LF0=;
 b=H4vuroZp5HLXMj2PzbHdkfXKFqQ+Pr9Wjbxrqkxc34cFxB+pqae/ES4QvyfT0DKq1y
 B369E0eqHa8jvY+bKtab/CdCqrORo5JNi1C9cXfgISN0CijHoJMuFKCGY2aLsJ1ksPY7
 ikxosIWtpLjbA3uoOHLJSP36jvSDb/QgRRr0LdeoQjPHN5kqC+I08b4gCSFeaW3sQqRI
 3EQXq3HrksJRuZky8BEIzj2Pcp8gX1MxwLncIAZQInQ04PlhqSQNZ+DNJCMSMzNbF9+j
 oaic4EklLL61ZRSr1y5PbuiUCAtRVjfsXHKDiVCoFj4U4CQ9pWLeMyQHSbjypvRZp5Pu
 sPPA==
X-Gm-Message-State: AOAM532aNC1e1f5X7J8EoOhPGhG4gSRFJQcQAlmvEcH7WWBT4mCg26o8
 DgV2FUccI2BHzZjERGAI3Krj3w==
X-Google-Smtp-Source: ABdhPJzV1ptXy802vFVzTiBT0RWKqMJu7qvTmAbOiw85HDwqnMbN4MS0LF3Eo41Npj8bE5cEzpbRZg==
X-Received: by 2002:a05:600c:1548:b0:38c:ef05:4cdd with SMTP id
 f8-20020a05600c154800b0038cef054cddmr4090179wmg.71.1650042014517; 
 Fri, 15 Apr 2022 10:00:14 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 i127-20020a1c3b85000000b00391a363f5adsm2119704wma.36.2022.04.15.10.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 10:00:14 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: ufs: mediatek,
 ufs: add compatible for MT8195 SoC
Date: Fri, 15 Apr 2022 18:59:38 +0200
Message-Id: <20220415165939.1861470-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_100028_375716_ED63A91B 
X-CRM114-Status: UNSURE (   8.89  )
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

Add bindings for the MT8195 UFS support.

The MT8195 SoC requires more clocks to be enabled compared to MT8183 and
MT8192. Document the clocks required for MT8195.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 27 ++++++++++++++-----
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 32fd535a514a..5ed36e95e933 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -14,16 +14,31 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-ufshci
-      - mediatek,mt8192-ufshci
+    oneOf:
+      - enum:
+          - mediatek,mt8183-ufshci
+          - mediatek,mt8192-ufshci
+      - items:
+          - const: mediatek,mt8195-ufshci
+          - const: mediatek,mt8183-ufshci
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   clock-names:
-    items:
-      - const: ufs
+    oneOf:
+      - items:
+          - const: ufs
+      - items:
+          - const: ufs
+          - const: ufs_aes
+          - const: ufs_tick
+          - const: unipro_sysclk
+          - const: unipro_tick
+          - const: unipro_mp_bclk
+          - const: ufs_tx_symbol
+          - const: ufs_mem_sub
 
   phys:
     maxItems: 1
-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
