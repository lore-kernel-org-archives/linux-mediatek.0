Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A825C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 03:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DUlRTZoc0RsOVgncUU5yNWbhwIH4A9T/yMlQroW7MfM=; b=cygXORnpc1UQUaB6CIJFtZ9kaR
	SHwta7xSRzThM19iSyxLmnAQfGIOevYqNaW+nDh64gX0STJ5TU+yPtP7C3j8W4/ArwTOyzgRwWP9K
	+2rLcSrvYLP1OcQ6/1qmH993Z285QRvvuUjGl3S6etqgqPaRU8c84af+jEshTcMvFRBqUD0xd7VLR
	2RxAVsNPLAhGz4PugsgUM4hmOsJ437YeIMae8PiNn1zgiH6fAse2VFA8SB1JBN3Sv4cDi066I7p+z
	j6Kw1OhLSNdB1alXf51zYX9WSdNWGPlSjWj09zkqASxHfRtRV1t1OiM8RKTT4Z3+cqvAbBhT7DfHM
	aG2SWE8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogHNf-00H6cH-DH; Thu, 06 Oct 2022 03:17:03 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogHNV-00H6ZI-DC; Thu, 06 Oct 2022 03:16:54 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d24so553449pls.4;
        Wed, 05 Oct 2022 20:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=DUlRTZoc0RsOVgncUU5yNWbhwIH4A9T/yMlQroW7MfM=;
        b=ajpXiYgRrfUQXqf10Z4yXhIhgkM5OgpSvRkNqSSlbbcQVxJ+6lmZApC9oSSkcDkkmL
         g1+eeR3+AAoSzE3lrDOfdPzQDRVjv/932eDrszmqUwrO+jVk9vJ1XaRxo7CuhUAiJVnT
         hXz/1E+z7tDRbyE0oWKH62uLXVq+eSVhlC1lM+UTBGPissWuRfie/cRtCFnlgt5pU2MI
         FYwSVO3ee/JtwlqGoUfDHIEhU4xCGfT6swT0TIYaaZBSniPc58ZtMg15d1Zyg8pve4Dg
         4vRMmSF3VWfaWCzDlrmO7/FSTeftat7Z4BcN/QOR+SDlTXODVP6nMds3GApgKwEDyMFy
         96cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=DUlRTZoc0RsOVgncUU5yNWbhwIH4A9T/yMlQroW7MfM=;
        b=eUyxTtIUnaed3ZBQL+hiPGtxdIj0MMQCUQJTfxNq6qM4ba3deIxlg9BBdu3RS4mTTH
         pIddLS1FKfoHsQg4lUMgfsbgBmoqRnnUZ4+BloGS2z6FqHKmqLUucddIPxhHYdo8mJc8
         oNeb/8Y8RniKegZheqY9/A29uWqpiRbhmMMU0Y3Ik2NOma2LWha0ogvaYEhS22Xmpv0l
         kxJ8TIWRG1hXREv634buJjpgC7hQTBXmNhtrSPNkRYDOyh+D4z2Q1lo+3qJjev8KJ1WO
         B4l0kw+YS36tMcOtn1YWwyoo8Ne/DLiiPtmyaA17HJVEIbNUzLHXI0bKS9IVx0HI4tnL
         /9HA==
X-Gm-Message-State: ACrzQf2nNa8a6f8d1iVzfax2wC1ls6x1rnyBTR2mMb2qk1gimKgYNkdN
	2xSGrtYGPWdFHXQK4cjm+iaexF0Vp3Lp0g==
X-Google-Smtp-Source: AMsMyM42CpmEbZ0U5PH0pjz2YSckOJEDaZkrTyt+ASfGGUdLYK62t3yn9YxQjblaItO8hZ1HRa+kmg==
X-Received: by 2002:a17:90b:4d0e:b0:1f7:ae99:4d7f with SMTP id mw14-20020a17090b4d0e00b001f7ae994d7fmr8201587pjb.200.1665026211601;
        Wed, 05 Oct 2022 20:16:51 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-236-88.emome-ip.hinet.net. [42.73.236.88])
        by smtp.gmail.com with ESMTPSA id c8-20020a170903234800b001783f964fe3sm8911166plh.113.2022.10.05.20.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 20:16:51 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: chiaen_wu@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: leds: mt6370: Fix MT6370 LED indicator DT warning
Date: Thu,  6 Oct 2022 11:16:13 +0800
Message-Id: <435f6888ebc20c5abae63eb9cb3a055b60db2ed1.1665050503.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_201653_503352_48070276 
X-CRM114-Status: UNSURE (   7.64  )
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

From: ChiaEn Wu <chiaen_wu@richtek.com>

Add '$ref' and 'unevaluatedProperties: false' in 'multi-led', and remove
unused 'allOf' property.

Fixes: 440c57dabb45 ("dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator")
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../devicetree/bindings/leds/mediatek,mt6370-indicator.yaml          | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
index 204b103..16b3abc 100644
--- a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -13,9 +13,6 @@ description: |
   This module is part of the MT6370 MFD device.
   Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
 
-allOf:
-  - $ref: leds-class-multicolor.yaml#
-
 properties:
   compatible:
     const: mediatek,mt6370-indicator
@@ -29,6 +26,8 @@ properties:
 patternProperties:
   "^multi-led@[0-3]$":
     type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
 
     properties:
       reg:
-- 
2.7.4


