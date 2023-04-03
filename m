Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407CC761AF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 19:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZSGEHV1wcF9QDw9X095419CyG9Yv6xnJ2egeD+2O1o=; b=4ESXUlrBSuCCKzgYnYE7Kv2eP7
	ylt1A6ECCKKFujjjo+FgQC7k4CFxmXgDqMOgxYBRkuI70271RQr0/UTSmjWlWS2b4DiatEa/ERWXE
	YDfRlyGhb+n09+hBAnrvZcTM+ht7pgoxyMikD99+VFcKYEeRrTaQKxrqzmpd8hBYz8CEnfp1cEECm
	CD5FLCid9OFWVnlB7BzziH0MghfwzFMfYkhoQ3S4YAL6Aizt+pcCuPGklevmC1Rc7f1R3xwU3zJRD
	L6+aZPL65swj34u6riyeNCLXsUm8a/59rmYZLNyCGsE0sfl9TovtA80bEnS1R+e5Fy+1PQ0VkDVKT
	XxYKlP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhi-00GMWW-0H;
	Mon, 03 Apr 2023 19:18:58 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPhe-00GMUp-2h
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Apr 2023 19:18:56 +0000
Received: by mail-ed1-x536.google.com with SMTP id eg48so121443873edb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Apr 2023 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680549533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZSGEHV1wcF9QDw9X095419CyG9Yv6xnJ2egeD+2O1o=;
        b=LklJQBi7hsnfQA5KrRPllFlnLE/+fwiO4CR61oHAc7N1n+GjhMt19kI7yYcf4mWKZx
         ovEN6BtGWxjdFpBTVrtJERecaOcriMZlEVboCoqEcFaPJZ/zNoLKhUFzTivWRryVmRbJ
         lDIvn0kBqh0e3DEm7TOz072Dbc1B0T+QHLxzK4XbQhEnRKhO/cLQ2zcEt/NIhF0t3cdl
         kZRuzyaZTTZuCkkgMqF8j1htHmUKHhIEsWULDQD/v2fLBab0geReln5011mAJxQ+Vcn3
         RRBfWrEM8GN/dVPpxskCHBrhlmBWyZmjbKR9MPCCN4Hv0ZHDwfhKlZr5cYWFvNdm7CLs
         /+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZSGEHV1wcF9QDw9X095419CyG9Yv6xnJ2egeD+2O1o=;
        b=5mo0PJGFVbN73fdXYh90+Xm9LcvB6fggFdxWFm5QGrFEfl/wqLQw1wuArl8dTUdAlR
         TUmsH6TFXFp/FOclMOPtPlBL8k26Xd1a90fsPMzlOr9CXSQD6rudadRPJVSvt3N2xwW5
         Gnl9FphThlk68YL11OUzbfJlCy4y+YYPcT0YLZvi61wFDU8e04BFOICCcsO7/9iEsyE5
         q6phWr2834+sOMgaCkf4kZZxFCD/iwGV19Zbzpfg9QRi+Mw0TKyoC5BpxNjQA2MgXiAL
         ergfu0BDaEdR+K1dwA3tXQ3/TmjhDAT9pBDnjPJXkldyCGGEAcNO52rSCzYWyJ9jM+LM
         UNHg==
X-Gm-Message-State: AAQBX9d068zFm/AFHQnAOQofUtVhC9cJCbOZ0c50NuXGcBS/xXeD/QhQ
	uCooC4IfGadGVizieGiI3C9sTw==
X-Google-Smtp-Source: AKy350ZQ8gkFRQMSmLb2vCdVeG/SCcQL8iLCV2k8kwWTOf+zZkhnJeiPAPfb4yy7X5429anR4EH5TA==
X-Received: by 2002:a05:6402:4403:b0:4af:6e08:319 with SMTP id y3-20020a056402440300b004af6e080319mr18475608eda.15.1680549533217;
        Mon, 03 Apr 2023 12:18:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:ae90:d80:1069:4805])
        by smtp.gmail.com with ESMTPSA id n19-20020a509353000000b004c09527d62dsm5022999eda.30.2023.04.03.12.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 12:18:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Roger Quadros <rogerq@kernel.org>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: usb: mediatek,mtk-xhci: drop assigned-clocks
Date: Mon,  3 Apr 2023 21:18:48 +0200
Message-Id: <20230403191850.374839-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_121854_897790_C0E91E13 
X-CRM114-Status: UNSURE (   8.96  )
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

The meta schema from DT schema already defines assigned-clocks, so there
is no need for device schema to mention it at all.  There are also no
benefits of having it here.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml        | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 556bedb96165..72639c6b4e1c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -87,14 +87,6 @@ properties:
       - const: dma_ck
       - const: xhci_ck
 
-  assigned-clocks:
-    minItems: 1
-    maxItems: 5
-
-  assigned-clock-parents:
-    minItems: 1
-    maxItems: 5
-
   phys:
     description:
       List of all PHYs used on this HCD, it's better to keep PHYs in order
-- 
2.34.1


