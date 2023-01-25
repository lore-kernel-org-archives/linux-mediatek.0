Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA89C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=; b=LQ0GtDnUvC0iiq9r5xvaqrxWOu
	nSi0Y1ldBDmF1rUp8Qoc5hNLjvBD0YtA9QuNBqOz1u3zr4vHNLXUZ4rQVkyw2j7JCnrPdBRDSu+j9
	Kj7/H2zZDVLkV5O6/8GhFx62ZfHecBQuKjU0jQIrRATpuww1axouM7SGe3jlBB6rJ2zyt36kvsT8m
	SnM52SMRCcaA3wLU8qdXWY0PvEloSxap96u5bpSGRtYfyAz4574oV01eee7LWicVjIg7mBW3ipwOB
	1lH1qilmBOn3dk53UhhkCz2u4hflYZHXHsKLj2WcNGZl8GiynPlgJ4NFNU9BoiGAF+xYCyOzRRI91
	pPlOrjHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgug-007b0n-BM; Wed, 25 Jan 2023 14:38:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgrt-007ZTg-76
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 14:35:19 +0000
Received: by mail-ej1-x634.google.com with SMTP id hw16so48090037ejc.10
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=;
        b=qRmANpnH4is/F+5qvIY7noxMz+f6w7INvOBkCDarf9jnGLHpHmwGitGjNT7YsoAHAO
         I3tiTJWahRU0GLdO62FJgkFOMohild1tYcXsnyTqSKpQTNbcAO13t6pcEJ2k17WnvXvd
         0qehQE1yWK3Gg75asV51FzK1WVSqqoGyKe6LtT3qZt6UjDgVKJ1fMViRDMfM3p7cVqIy
         iFKWdhRxTP71DB/R4RgvpC682xXNu0I8d0mnJMxw1RMEbLI7ByX3Y5ZftXNkdt68U+PG
         XUDv0RZvEERPmfDJjErtNfi6PJDpDWkpB7EWXorereoU4PMn+ZxAvAFiUSd5N2VqeXcJ
         Di5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=;
        b=28PfAkWdGOEn7ytEAfRwTsGmvt0ZR0iJnm/RA+gbZmYRTf1vfKymw3olaVH9iVcWiz
         JDp3434CZckOVYnUyWxkwtytwnx4wRJaubD5IMwYYXlbpLVt2cIeEQO4m365kr9qbcMo
         0MUKFih6n6IbXZRECG7F4jHlhuSExyVqSevsBBeQQ6UuzAL/7QswjDGRG6q1mTcnghff
         TRhCrsRDRuU4+TFm9I8RaET7OtMXX3OVYrMcG3CAwxIpfCyOvArjb6rSfs3nVDr0/DjN
         KgsyMk3pZ7IX6ytflINH8tBoYq7dEssZNUjshW+LbQICnJIuhQXJhLkxZARdSJVyaHg5
         UotA==
X-Gm-Message-State: AFqh2ko9mr77rPfEvbz53bgXiQWNn+t6fp6u4KY4hQYc/dsE5eeZR1M8
	kRP/4Bw9cPMhec0Y3mT2hb9144ErPGFq2orN
X-Google-Smtp-Source: AMrXdXstzqV2XL+/aQuS1AHHAlcElDVNa4FiNkbP0JXJYw+8OsK3hRRkIwgHSZHeYfhdvGBrMMlZDg==
X-Received: by 2002:a17:907:6d21:b0:805:1e6e:6777 with SMTP id sa33-20020a1709076d2100b008051e6e6777mr61071823ejc.23.1674657312110;
        Wed, 25 Jan 2023 06:35:12 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:11 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 5/9] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Wed, 25 Jan 2023 15:34:59 +0100
Message-Id: <20230125143503.1015424-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_063517_298314_BC3CA645 
X-CRM114-Status: UNSURE (   8.28  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 7168110e2f9de..d2655173e108c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.39.1


