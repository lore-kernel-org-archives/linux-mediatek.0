Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C015C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 13:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2oRYhQiIHd6UjeWm2BNaRmlMckXEAf/HgaAJfjR9b3k=; b=Vk73zVhKCVhQvkhK3opxnmZeH9
	Yvl61Q/RTaLw8TCxtL58sdJPsZRfzZcFxzTcktlva7c5CLnUtZqS5c2qx625kp+MF8H1/qlSAnijK
	4d/9wo5lWSpLbwjhvHzmqW1hAVwfIf09itYLe0j9Z5gZM7wPwVJQUg2ZxcQw80Ww+VNxy3b3pATh+
	MC3fEtM2oaZJ4i2HbgWJNLLvhLT1WEg98Epny5yt7XQb5B5cLh13hD193G3Ept7RN6JhJWthNQMCo
	SebHzrEiAPkMuUEo3xcfu90kyLJSIactgga8+qy9ZySETQWpZ2wPQ+45tAFx3N9WXXzimrVCCwGSU
	YUR4YZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmy8-0090f4-HK; Fri, 07 Oct 2022 13:00:48 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogmx9-00908m-R7; Fri, 07 Oct 2022 12:59:49 +0000
Received: by mail-wm1-x334.google.com with SMTP id p26-20020a7bcc9a000000b003c384e59047so585299wma.4;
        Fri, 07 Oct 2022 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2oRYhQiIHd6UjeWm2BNaRmlMckXEAf/HgaAJfjR9b3k=;
        b=ScFIWgaj3yLcgJnEYfYsCRiVNeuvze2Ok1tg8ZiywyeDYWxTXoeqcfEHkCeGiKG6Vj
         WQTBcpav8TT32RcrSiqWIemM3pZ5hW/JIFC5zcYa0sb7C+EJe6SleZS+JDw4X0xAIoW+
         fmGCG6PWHHXdHoIys1lwRPqK8EGSzjy+jH3w9xM2BllV4JmnXFBtMRrLNmHwj5XvM2pu
         IlznhUZ1uu73KCpsLqxV5pZZx8F8SlQhmk084eXhiYjVxu9pv8zn6XTE59o+rG+vfPv4
         Zy8kFkvk8ZMXSkJaQZPkh1UH+iy5O6J70SxCn6f4Z4xTbh5ROBKCfl+G8C+QLUEMUjNb
         Vq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2oRYhQiIHd6UjeWm2BNaRmlMckXEAf/HgaAJfjR9b3k=;
        b=4tIdXT9rRbCh51KHCJvh7Rjac2p3tBsEI/lsfxwmiHmK1GoYOxLPYTWaUbRPpKBiCE
         lT6gfYZmT0mKoC42jfI5U04WiDB9v9a/tLHFibmp+txeL3sVwJhHWYUcJirDKowCj2g+
         poVNjsC+GRmF2o6/OWXNAohYkgiQ8sx+W1bqS61+TK/P76VXWUUwpxEV7GyetSvIls+q
         O7LcFNW5OenvlRkd0/E+tqaSV2QCBjjcxNyUiJmCG/Cipx7zkGgWJmfXvJ+gBKPWC8dF
         tm5F75QpIRuFR/qTlFf4hTK7g1eB5Iquc2qAVyKXmJu6YyuGVuHWONlZp4hVPcu7qnIa
         DeVw==
X-Gm-Message-State: ACrzQf2jo5hU2P3PVABbBDddXuetiona0nRiP3wCKiqsaSsfsX/fQJPD
	QCJON80+UHO8ETjZ0gmRNug=
X-Google-Smtp-Source: AMsMyM5NNXj9ULU6LrQtK0blsjNwRouxeAolg46uvewAEbt8vKaKi6qKFO3P17L12gnOOMIPhSzcew==
X-Received: by 2002:a05:600c:3b9e:b0:3b4:4cf1:9531 with SMTP id n30-20020a05600c3b9e00b003b44cf19531mr10126717wms.64.1665147583483;
        Fri, 07 Oct 2022 05:59:43 -0700 (PDT)
Received: from localhost.localdomain ([95.183.227.98])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00223b8168b15sm2008243wrs.66.2022.10.07.05.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:59:43 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Andy Teng <andy.teng@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] dt-bindings: pinctrl: mediatek,pinctrl-mt6795: Fix interrupt count
Date: Fri,  7 Oct 2022 15:58:59 +0300
Message-Id: <20221007125904.55371-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221007125904.55371-1-y.oudjana@protonmail.com>
References: <20221007125904.55371-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_055947_932940_AE39C14E 
X-CRM114-Status: GOOD (  12.77  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

The document currently states a maximum of 1 interrupt, but the DT
has 2 specified causing a dtbs_check error. Replace the maximum limit
with a minimum and add per-interrupt descriptions to pass the check.

Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
index 73ae6e11410b..a3a3f7fb9605 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
@@ -47,7 +47,10 @@ properties:
 
   interrupts:
     description: The interrupt outputs to sysirq.
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: EINT interrupt
+      - description: EINT event_b interrupt
 
 # PIN CONFIGURATION NODES
 patternProperties:
-- 
2.38.0


