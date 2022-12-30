Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BB6C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=; b=NeOdbZv7zzJ2mmZIwOWSWe2eEP
	mkA/onN4t3YQ3sfjKXU25EXO2iAh0qFU3iiMlMXBCHYw7p1bCHu67YK5uDJluEsOm7THfXKkFPDoY
	iJzNloBxzg2XmT0TtuB7WeCsUmLawuOzSNYxBl34duDtreOSY1MjnFJW/mc9NtgTKmxWWTFxFm+ia
	OlGr/6h3ikpjlptzZ6wurlV5HyUun6LFX2XbIrX3b98IC24Ex+89CI/8sqA+gx0OkG8mwhs5PYbVI
	Qpe612gZDO//2ep0+wcYaWsf51/W67+MXvReZafvDc+V5OJqJrhEarabFOJLA4pf+jIA+QGOpMKJt
	bn7DLwZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN95-00DpX5-3w; Fri, 30 Dec 2022 21:42:31 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6Z-00DLhd-Ut
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:54 +0000
Received: by mail-ed1-x52d.google.com with SMTP id m21so31706055edc.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=t5pna3QqL+sBeE8/5zDfQsBdLVknUMNTLIqs2q1dls2xGpMch615A286HxjBsN2dOm
         npqoPD74TllHB/3F7MJPp2C7iB8/LLLB6r/CcAIayufmkzp4ccVFNmi42q6Y/jMPRMQt
         5BivKCW0Yi9VAwGfZSYOjBgA5oGcSPThctCYL0XvPK33ZynHjO+0wrMzO9E+E3joBzah
         VLZgbq5+2lUzkhx18uDh4C8Rkln7skEcQupqD1W6sxrGJMioZqCDgK20oYdL1KbfeN6E
         Tir5cHDpFErIg9U7eJu7WEcqKwnMZIBiRqVJ0lQ8qxDP8ysnqcr1gunHlGfo5y8nnBzz
         hjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yM7tLQukK3ee+o3GHKaxNTtqE120eC/46qEVclUSCs4=;
        b=mBqohzuRUvMy0GQVvoacfSX9wc0020fqvrdUrblC1Sljtt8ZK9ymuBiM3ykhVKGc0N
         RWDvrROJuhFN+ZLSwoonCsCsQGpPUsTMll3UmPGiG3zBc6bxARwFX0d4G7Gt5IgPQjZM
         DDDl4i6AffQqrvlPibagoga0huNQGI6LZ95eJRIcTAQPu6V4VpvAad/FCGuFUqstRQTZ
         Z9pHFnju/2YPvdSXN7Obnp9Gy5rL7q1EuEXSCRG7yLEbG8xx5hqCaXdVs/F37n5ytztj
         BuD+NLkfO5CjxzFt3GWChLLzHNLqIn9WmH8z28eiZlsG3ocH0tyT1qEAJJYZ4VvzWv4g
         tTyQ==
X-Gm-Message-State: AFqh2koUd04u3npPVcS1G2+dWC1QRI+QJoJh1qxpTbv4OGGyc3Gmg3yO
	DRVzkE6a29xXkcb/k3Nxe3ry9ZTcdflZV2r0qzI=
X-Google-Smtp-Source: AMrXdXsga6iFLx1oZJHSwuX/gfAy91cdL0LJIGCBRo/xm9zrj7Kxo+hWBVGKehvpRGIKQq6GCv4wLw==
X-Received: by 2002:a05:6402:3224:b0:47d:810a:f410 with SMTP id g36-20020a056402322400b0047d810af410mr39930114eda.24.1672432549228;
        Fri, 30 Dec 2022 12:35:49 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:48 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linus.walleij@linaro.org,
	lee@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 6/7] dt-bindings: usb: mediatek,mtk-xhci: add MT8365 SoC bindings
Date: Fri, 30 Dec 2022 21:35:40 +0100
Message-Id: <20221230203541.146807-7-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123552_123174_63A07F7E 
X-CRM114-Status: UNSURE (   7.81  )
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


