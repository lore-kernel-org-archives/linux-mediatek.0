Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848ABC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Nov 2022 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=; b=It7+W8fQQEtBbUOpn7bnqAvtug
	nqQjyHmbNieEvFtkScLlUtnbefWXPOjQSlEAERnL6EbCJSpoNZTYx493IF9t6RqAhAWX11RUnHj/S
	ofeibIKhnUA3D/ItQ3v0pPJTbVk1U66/GPRR08x+XK5oS0sNIygAROLaEH2v6XmZiBinQkjBkYxqr
	E7Sui+I+SYBUIUZdqAqsOSP7fs0VbL6ygjxl/zSJ95ru9nnNoZlISaIRyK56LevnWJcxeYS51xfLU
	eDJL+hY58hE0jvGc6Dh8xQx+qQiUpoNZVeg8mLovOdUmpUntW24xiR/RexHo4D5q6hN1xeiWtK7Nj
	VqeBGCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm42-00HUMa-NE; Thu, 17 Nov 2022 21:04:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovm3Q-00HU8h-Jr
	for linux-mediatek@lists.infradead.org; Thu, 17 Nov 2022 21:04:15 +0000
Received: by mail-ed1-x52f.google.com with SMTP id l11so4406082edb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Nov 2022 13:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=;
        b=u4zUPtRBGTY9L9LHvnW9DqAWYRm0igVQllWoBz7XgHmcYSdMBuVAy58/lGWh4Dilqg
         1UGWqw1Tezv5eZIYrQAdS5o5Y1q3ZB5f7z3i9FiJjFpOBmoKbUvRPlKrhKORJiYDLCA5
         Pxu4VRIheLOlOvgE8Q7uWtouFjvgiuGkDdNjTP7dtEzfOp32WFKde4Sur0OYVYFhwHig
         ej/t/AXSZK8srV7eq50+nqPGqdyKShmDbKr5Vy2Pb5n1c1+TBEbgFx4xRQmV7BdicTpY
         2McR2oldXKaFyZNjoYkZerusy/kP6ufcoRqtvQa+Fw+QK38iG4Ra7be2auIaioimyX+D
         xsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6+ABKaCFT5+1C0Y5clbHMJQa6kjF8TIULfr4cCgl3o=;
        b=jSnYBl7QVvo3zPu9+2I72HdeSk4Dj8Ss2j9fBVyETtX65qmySU4ZytQrZxvYTY4eJM
         neltfCCK2QvlAC2QEDeOC3oKGfLZqVQUsPtZNL5kRKKS8LCx947DLn6gLpkmYsRawjHs
         GxD4tJIPjLmGmoIFFkSuEG9Hc4XK5bz58+PoSem/SbJv2eNU6zAiSfEvbzvo2kJbFxSR
         12vUOw+EMXspKsJmCOU9VKpKiR/+T10XpnxwflQWMT/Pg7885bkdlK2mJGiJCd9b4jPj
         PYgwiswTyJiy5Hws5YFGj4Vtz+XfIxsYCd3MXMT4zRrKO5rFB/sXyPUUKL/jxuRwHtBo
         BTHA==
X-Gm-Message-State: ANoB5pkbnzF2lZH+Xw0JA3dTq66julOCGKi/gkrzoAl9C2LQte2124Pq
	veTsdS6CQgkMG2TQ3C2hP4f2/vYQ2gAy0L+v
X-Google-Smtp-Source: AA0mqf74WUgvaOJMRkg/rYttZ/P7xDEgL2yEBGs7v+osI383w3rkMb4HYPZYzRoe7OA5C12sjAKUGg==
X-Received: by 2002:a05:6402:176c:b0:463:c5f7:fae with SMTP id da12-20020a056402176c00b00463c5f70faemr3583579edb.152.1668719049319;
        Thu, 17 Nov 2022 13:04:09 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id p15-20020aa7cc8f000000b00461c6e8453dsm970807edt.23.2022.11.17.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 13:04:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogiocchino.delregno@collabora.com
Subject: [PATCH v3 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Thu, 17 Nov 2022 22:03:55 +0100
Message-Id: <20221117210356.3178578-7-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117210356.3178578-1-bero@baylibre.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_130412_726133_8C0A3901 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 939623867a646..3b92725bbc99b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -34,6 +34,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.38.1


