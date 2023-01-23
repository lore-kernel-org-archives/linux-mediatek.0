Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88194C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=; b=Ec3Yt1BWksLix09fyI4Ywo+DC/
	fv4pRZisuFRfsmkOug9+Hpd7gETnl5on+5W0Zb9DMsbWBdN/XX34qfAYQlxvqHFF2QatSJ5zATueO
	mlN4suEGqW6BBzAO4GDpN2MnjrC0SfXvza6p7FCJN9N88seXjv/9hnI7Vkxav2Undhk4dNAStg12Y
	S9gpmDh7vxggwfUoJ8MmDtL8EpcWMEa2ktuFXsjvzjUQ6hnU7vJf4FvdaMDhLyc9VP8ux083QjLRh
	e+0JJjNZ+/MJeHZRwr26kDeE5w28ykConXEwXJQmOvAo94jMtytoCWpj+aSsUR/nOeqWJgSJkQyX7
	Pf3NiqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzv5-000dw9-DI; Mon, 23 Jan 2023 16:43:43 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzqE-000bqE-Cr
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 16:38:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id qx13so31962956ejb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=;
        b=QjrELehf58NiDOcx1umOBtfzjufY690uzbZ6j9DjbF2OZ8ZJuBVSr3CAaXW76DDPGK
         30jUGOyhvvOwyaqZcz5L2R0g6p/lgs7OvUqI8mYEQiM793QGPRqi7dD1Wtkg0RWToWpz
         rLk4CHA5929SMha31bE2tQJdqHFMXp8166lSX4fpuuK3M4fhaj9o3T0x9K+z1tgzcb/+
         ES7Tz0Ub953AcgDXTgz+idHt6B3Bd88ls3UpQ6SyoN0B3ebraDUvKT5Bnb7Huq0qnHs+
         5I4LrNCG5QSrpoUyTraJARy+Eo+tGBkQio3rx5dG78bnCKViz6IiLjRQUSXgxXfxgS+Z
         zseg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mwIzfbsFdCDai/q3cnqayXJcFTx4vajk+OuUztkusTY=;
        b=CJXYlAfz4SlkLKafC7h2WIUIHRRKqoHuX5gbkG7ml3drdRmU6nbqHrscff63mfOAJN
         xCqrbM4ncdydLP4bTK39ks3w2Jts5CIzOzf0ySTfdcK81nXtketSpOBF1EaMYcrV2yKX
         UpxbsbSZaYtIQjdBt4c1M7V4gXYQweM9J7t5sYhLDzlBXUTRHSGYUYc++lU34PjJ7B0z
         MFXFTaLlxEMW1klA98kRSWu3P2DZWyDjWZiD4r/GWQj3/QKUP5G5Iy4DaJgIWZSupY1s
         /wJLQVvH5By1kaWdgOf9M0cYL2A1QUsOzlkcQ5uExXx4aXBSUpQXRVlJCGhRnhHguFzS
         aYig==
X-Gm-Message-State: AFqh2kopj/juJMPmJctvtAwnWNn39KFQzd9rsrII4IX/Nxgot3+Z1HJS
	vK44S79B3UCwei9Yboiv78NBYpy7R4pHEf/c
X-Google-Smtp-Source: AMrXdXsaR1LCQ2VUgGGbrrFRWvmzZc/xLAMYBZvEm4yMHZjJSibP2ur+qU9ve96r0V7MGjpXmSkINw==
X-Received: by 2002:a17:906:abd8:b0:7b1:316c:38f5 with SMTP id kq24-20020a170906abd800b007b1316c38f5mr27711033ejb.30.1674491921740;
        Mon, 23 Jan 2023 08:38:41 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id lb25-20020a170907785900b007c00323cc23sm22198562ejc.27.2023.01.23.08.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 08:38:41 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
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
	allen-kh.cheng@mediatek.com,
	nfraprado@collabora.com,
	andrew@lunn.ch,
	gtk3@inbox.ru,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v8 5/9] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Mon, 23 Jan 2023 17:38:29 +0100
Message-Id: <20230123163833.1007181-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230123163833.1007181-1-bero@baylibre.com>
References: <20230123163833.1007181-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_083842_490837_4EF22923 
X-CRM114-Status: UNSURE (   8.34  )
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


