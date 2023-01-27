Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C0AC61DB3
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/FOgQ0NZG0jwRqHnOj//3vzxfhNSgcxkGZMIRLxc18=; b=jHktfzKbw6rxvGPrblMGdOozT8
	lUsN8wwxtptOvPa8OImFoJuLJHBetmuhkOv4T5n6dWjZ1PsHMoOkm4ofuDlShdyE2WTFbRfeD+PQT
	gJ3zA9WMw/f6xJ7WkpJ5XDx3j9VCCBGhNmzKVEXdmzWBucwGr3KkNPolpGF/z6EH/zQqPiSeXpiaf
	zVo60Ix71hZ9Tg2la6nfevmVSBVUrcLNbhjZVeQbyBFa6+wd9Anbza5VilS856j0xTq5ada3hfaio
	xV72/m37T/Bor97wnIazP2TUbZrZCu4CgsbCXM22fl/qtvNKQhzvfUNIZadLsd+pCMB4LGwZ0o7tu
	u9WgDB2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR9Q-00FZDW-35; Fri, 27 Jan 2023 16:00:28 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLR91-00FYzI-Ix
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 16:00:06 +0000
Received: by mail-wr1-x431.google.com with SMTP id h16so5342212wrz.12
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 08:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/FOgQ0NZG0jwRqHnOj//3vzxfhNSgcxkGZMIRLxc18=;
        b=Z581dVEflQIlkmAKVpzH1Hx78FcKmqgluOxsgZVKB34gp/ileDSKefoZZa6XtitIdh
         VeyfnjDVQp2URi7NSUQ6bfXScFnBxGluMOrrpalAE1hlJYoypTK5wriQD7F6LWFf5hSS
         cqAbhI+M1KnpkLcR1KxQKLrj1pvLyK6A18TsnpbNXC6/AiRIFHvd5LmfZ6DAE+N4NsPN
         jbWWNZNKISVB16cKK348o+yXYUhLdlwEZC8Iq5M8hxtXRVb6TNeLqE/FxYA64xUYbnC0
         2AfgGKURgK4IW/6uTHPr+SobQH2IGMduVh3aCIULGx8M1W4QTqmGfUwX7vhmtNcGF1aT
         GCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/FOgQ0NZG0jwRqHnOj//3vzxfhNSgcxkGZMIRLxc18=;
        b=6khpYjBn2QtoWVcMRr0YgCcnBuSUA9ZcCE1IlUEaamnVlPd8Y4f0cvPKVtQpmDfT5u
         IkkNToN6I1k6UIeNk49kSEclkNDd9jL9j6S7vgZS2KpA1ZFWzL5rovQSedOwHRztT42O
         4f8iLhrvVNEmoWUS59CFLF1hXkoxXZvxFJtOYi5PWn5x4QPAZDDQlV41TDvFdnLFn3Gx
         UVLixksMM5f8q7YJNA6UFo+cHzUunK8UR43FMYQnR3WSJhmFlrS4SUTTkulZ4e1G9yKR
         dw5CZ5jp+6/iZDvkVjsw/IuQNkw8FqCreJO9mipnX3uuH/rDKRjqQBeNatbmJW/v8TRc
         OCSQ==
X-Gm-Message-State: AFqh2krrrVsWaDlSPnva0QogYsSrFA1whvfh6P6Es2Ib3WvhHKxUvikj
	HnkPHFXIzY7SqUu54Yk0XR2mnetID/oZKZH1
X-Google-Smtp-Source: AMrXdXsfxZfsB12h/I+4kDdqKwJTa4EmVK4edFjSQJRMCkCqjHfeJdCXRiwlufDWBONCnyUY10a/Qg==
X-Received: by 2002:a05:6000:8d:b0:2be:3a6a:f565 with SMTP id m13-20020a056000008d00b002be3a6af565mr26758952wrx.38.1674835200796;
        Fri, 27 Jan 2023 08:00:00 -0800 (PST)
Received: from [127.0.0.1] ([2a01:cb19:85c2:1100:7fe1:513:212f:568e])
        by smtp.gmail.com with ESMTPSA id b11-20020adfe30b000000b002bfcc940014sm3171942wrj.82.2023.01.27.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:00:00 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 27 Jan 2023 16:55:08 +0100
Subject: [PATCH v5 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v5-1-cfb0e5ad29b2@baylibre.com>
References: <20220919-v5-0-cfb0e5ad29b2@baylibre.com>
In-Reply-To: <20220919-v5-0-cfb0e5ad29b2@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Jitao shi <jitao.shi@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 CK Hu <ck.hu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mac.shen@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-phy@lists.infradead.org,
 Guillaume Ranquet <granquet@baylibre.com>, devicetree@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, stuart.lee@mediatek.com
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_080003_670131_CC0AC60A 
X-CRM114-Status: UNSURE (   7.98  )
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

Add a compatible for the HDMI PHY on MT8195

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 6cfdaadec085..f3a8b0b745d1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
2.39.0

