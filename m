Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA283C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Jan 2023 22:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=; b=jvsG6xK0x5wEHXt1XuWG/cNldt
	3GmCywiyroaRdWCHCUdtZfFUexH0nGo8YPnV/irSVEQZxq+uW/fBwGFNo6MgXxsU9e7Y2Wk9OOR03
	jBKYUxhdyDySzyX8UE7kneMbCV4pMS9lE7vFWUI6EzS1yqYD57n3enDa6DOOdzQfbFVP/eLfLCY/P
	4yLu5Jh1huD5pL/cwrwAnS8DUCQnt/oeVham1b5yNhE5wGumfiM2aVO6tl90oLgUuy8Wejo8vV065
	vfi6UlanoGSMoSRJX3ToPPrP5TqNcwbuPxJruSbKzqThgCWgrvK0N3HOy+EEs4woTyFqlXXr6ZoEo
	1/wG4SOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6Wd-005k0h-V3; Sun, 01 Jan 2023 22:09:52 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pC6P2-005f7f-JG
	for linux-mediatek@lists.infradead.org; Sun, 01 Jan 2023 22:02:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id fc4so62911705ejc.12
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Jan 2023 14:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=6tmSGZwjOUabk0Tay5+t+RCnJxuU/Q+E4bAuPZ5vkzcNaUtgRpVrZL3QZ2PGBDs5nZ
         MVicZkyjmjnyuhsNwYFAXrKghCMxmNeXdAWaFYzUGsxicEUrTolsYdv+Cgh+JQJ6QJbQ
         IRzFRnw5oDCIlXfud4JBKTrlTjIhMslkMJtBY9OQtGYJukpQyPnSTupRWot5HvIxj7sO
         wdwUkGa2wxua4BKqZULIASKBMVn8rTldahPxGcxy3I1e7H0nCJDPdn8s6mNjVAKlFe7H
         gNa40Bl5e72GGjlcg0mR1U1OS44xc93Gck2NxwMLRc7NEiyA0fb1OPB5unkmt+A+ztz1
         bing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=eVVvzureAHB1YdIlIETRyQQYXNbuuWhtSWBTowmtzJakE719jQVFwOtluJ/m1VzQTA
         zP23Z8YogcTJ6Ke7AqtBIULdJ+bi/FKNHE2UY8TEh1y1DjQaHqmyD5Z1oC2JBCUbjaAN
         SaopHH9XOi4s5Ej3qR9VRDR0tpkUbnpXK5EoBawbjTP8XjPeaJqMtCSNbOAKgYVpWBks
         iEdvJodJ9r3ftMumSeEqRWJfVGqu5hnsIo1eoSs8czaMldMNl9bTHYOwwFdzPrJdzQxu
         CosanvgJGbGLp6WqeeBWGMBIgKwmfH7hp8SMcjADbnBQ6dAgfmDpXZ0DKynIDyz9qlot
         H2wA==
X-Gm-Message-State: AFqh2kozAl2T1ptqOK05nzM/2JMmHQgi1lTlPJ7+7oP8QZ3qAp+YWBya
	zLO+912PtwCQaCKzD4PblCchCA==
X-Google-Smtp-Source: AMrXdXtgygK9dvnVdrlDMNTfpGZn77OgXyintLIQ1gNB5Dj1uLzbvkQ5s0f0tiODrRQ/1YQ/WBHIaw==
X-Received: by 2002:a17:906:f6d7:b0:7c1:5169:3ed6 with SMTP id jo23-20020a170906f6d700b007c151693ed6mr38129337ejb.48.1672610519356;
        Sun, 01 Jan 2023 14:01:59 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c23-7c55-d800-0fbe-25d2-487e-ae5c.c23.pool.telefonica.de. [2a01:c23:7c55:d800:fbe:25d2:487e:ae5c])
        by smtp.gmail.com with ESMTPSA id d12-20020a170906304c00b007c17b3a4163sm12486807ejd.15.2023.01.01.14.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 14:01:59 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org,
	angelogioacchino.delregno@collabora.com,
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v7 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Sun,  1 Jan 2023 23:01:48 +0100
Message-Id: <20230101220149.3035048-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230101220149.3035048-1-bero@baylibre.com>
References: <20230101220149.3035048-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230101_140200_771142_C5092ABA 
X-CRM114-Status: UNSURE (   8.36  )
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
[bero@baylibre.com: Cleanups suggested by reviewers]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index a3c37944c6305..c119caa9ad168 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -35,6 +35,7 @@ properties:
           - mediatek,mt8188-xhci
           - mediatek,mt8192-xhci
           - mediatek,mt8195-xhci
+          - mediatek,mt8365-xhci
       - const: mediatek,mtk-xhci
 
   reg:
-- 
2.39.0


