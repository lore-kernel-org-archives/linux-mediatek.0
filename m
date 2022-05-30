Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447BEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaX4TyJcaX5ftbfHZlVdyaSk6gb99CR7qgmUQVFh+fE=; b=FSPKRrXzi0luYJ
	+w6pRVoq7J8FVsCSXbfnBT8NFGvhqxgKFwVN+fKLD5DBiZF0l6unptB7LagxTmFOrtoEGPCMQ8p4V
	2uhoQhciUplCzZhhuzNZ4EhzeT1LktPalUM7VgxPTGR3H/McIMnDu4mnI0O1DuUJMKk11ARdnkyZu
	HO7wZpd96B3l3EMXgRxVWoFT64fHUg/VslsUACHjrerq5D7SRs+k8635wxa4JtaOvynK0y5JEv7YW
	9pfbN847AdYHxdMa52YzqDEkdda16YwteLez6irTn0odjZshb1/RR3sKiTTDGQl9LQPKO8nq/P+Tw
	FoS8PIUCf0VJ+MglM1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlnd-0089QN-Om; Mon, 30 May 2022 20:15:37 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvln5-00899u-NA
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h5so7931887wrb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=68IUzThINQHS9c64e/2mypyGj3LqFegF7aUXUpeQSII=;
        b=u2d8p4QAEi3ctSajLm45PHcAdGNb4dc77i74TOisR6B9VoH4w4onMoONsDGc3+PD+H
         +CrhEa4dqWqz9Ox/kXTWVRT8E7CQbbf7aihiXS2nwKfsF7QdmyITkvGLWshI6CBe8T3o
         w+MZ3qyL9qilLXMp73nAWWB+Wf7+LKB0j1tLpB4aiA6DfeiwUpupRWzLyf2NdaFVwFhp
         06XaOJrlzigu+lK98u0RqdZ4636R+6b0oGqiR/Rv9Wpdw2nS8VyJTiojxul5B+VTONR3
         8g+oeqgqR/+0BrG0MjTMrWqf6A0PMwEMqEuRVaqq+3TNoBTalrcrKHPHGw0XGUawcdLW
         kgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=68IUzThINQHS9c64e/2mypyGj3LqFegF7aUXUpeQSII=;
        b=mWyCBcl9YnPaTRPwjnOkRqTx72bFSmvo70BpHlOzrUu69u0wArYz5HF0Ilunr7W4r3
         2aC1FUs/rD73aL7af2oUyP1igQ/Tpaimp3+pzc+qM6ksNO5mAC7yFU0UhDKU2R9GNJaa
         sLZs6nlh3XEJm+BsR00Rd4lDYRBBIuExmjDNZsEeqh4P4YbFyKrSK4Q6DDgq0JwupWWF
         9Wem7MYJ88+PzAVWMqFYsm0s4LEAIen6aQ0dH8E4yVUxD+K9ZS5M2WF/AVOqCpf8oZNY
         BE6r3bWAMj10P6Kf4/c1/5BbnV7sCxuFvcE/cI4zb64dBrAr8Jcbj/TpwGsBX+hZEK05
         0pMA==
X-Gm-Message-State: AOAM532mYsiUDFljXuWa7vO1zzKkckGa7VmwsRhTW3kQm3O7ickvJOUa
	CCagWH9vEaGzJVuFlEPxh7MpzQ==
X-Google-Smtp-Source: ABdhPJyV//TAUQKJXHBmXItC+7NmI594G8rIKaBMVmslTUXdIAFnw+TnofqHost0A6YrIMpMLuB/pw==
X-Received: by 2002:a05:6000:2ab:b0:210:12ab:76e6 with SMTP id l11-20020a05600002ab00b0021012ab76e6mr17162232wry.120.1653941700978;
        Mon, 30 May 2022 13:15:00 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:00 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 2/7] dt-bindings: display: mediatek: dpi: add binding for MT8365
Date: Mon, 30 May 2022 22:14:31 +0200
Message-Id: <20220530201436.902505-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131503_783990_FBAF0BA7 
X-CRM114-Status: UNSURE (   9.51  )
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

DPI for MT8365 is compatible with MT8192 but requires an additional
clock. Modify the documentation to requires this clock only on MT8365 SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 44 ++++++++++++++++---
 1 file changed, 37 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index caf4c88708f4..c9c9f4d5ebe7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -17,13 +17,18 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dpi
-      - mediatek,mt7623-dpi
-      - mediatek,mt8173-dpi
-      - mediatek,mt8183-dpi
-      - mediatek,mt8186-dpi
-      - mediatek,mt8192-dpi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dpi
+          - mediatek,mt7623-dpi
+          - mediatek,mt8173-dpi
+          - mediatek,mt8183-dpi
+          - mediatek,mt8186-dpi
+          - mediatek,mt8192-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1
@@ -32,16 +37,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Pixel Clock
       - description: Engine Clock
       - description: DPI PLL
+      - description: DPI Clock
 
   clock-names:
+    minItems: 3
     items:
       - const: pixel
       - const: engine
       - const: pll
+      - const: dpi
 
   pinctrl-0: true
   pinctrl-1: true
@@ -71,6 +80,27 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8365-dpi
+
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
