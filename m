Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0D0C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 14:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=; b=F6OmHLpOMG6fsckRqeJzTjzQO4
	dpB2+g9CAnFFaG1V1layrhljK7UXsjUV7AouYjlg7xe0SD2FTx5JX38tvO6qnjqQNzZMnU4lm9l/e
	EfWH9Zj38B1BuNtRhVvS2jq0/L+ZrlZO8L5UxXeAUR4aIdTKTU798dA4sm1rbnMIcy/yICkcFvTE3
	8XkEjuWDb9MV5gHhrHt3ngv1hvJZuBFL49wtrIr6vfZFkpa4O7EEQj9U0dutedTwJFBpRuNq3tbtE
	smWs5A7eIRYHN+kUCujcJCVdbgbHjiauEe2EY+5mGFCM5XsyTsVh7P76mshtjpR1j4qRsqqbOQvsG
	qyc8Yn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWVP-00G8ZU-Op; Thu, 20 Oct 2022 14:26:43 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVHK-00FGer-ER
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:08:13 +0000
Received: by mail-wr1-x42d.google.com with SMTP id bp11so34344082wrb.9
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=;
        b=dPjLmalF4T082X1GAwZDaYuFAMSPpp0aB14UPRgdaK3oGQc/1q4BrzgbFxwyN61ZKU
         U1e00H4orCpimY0WqZV/t9LGcXm04UE9iyNWLrWHOdvrIWV2xsx4LlCkzHT6hK5KzsII
         nvquy01Wo7tMC/c5yV/TbTtTichCO2NtK90Y3dEfHH3GA+uAi7bHThZv41vN7kLSBDVP
         d4kbkSo0XMfWUesBVtYlJ5p9jLiAw1GGo/AvJzFRb2nKinO/sfvGxKRHFaPIlBxs0Zmv
         JxFZ/KWdnf1w8KyOovb2DvVxiyMRAEIJZEGYf4mCbfC7d5hVzcF7yNVFObJYFfPiEifk
         UAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7OTh+ZIjQwPwHMVAfy9H3FuL7YWrhAHg4js/lzlDK/M=;
        b=Hw6Wswb3BUDV+VBBZfYvHZa0b95GjdjjhI+oP5cvpbl38xfYGtU6aqFzHdi5Ka97En
         jIeIjLfnvhsv3L0g1b2t4dP5DktZy20AUA4UcpUo2/b6BYcAxM+4oJghirPRmC61BjN+
         CqyRgMEquuUuVHsFhaX29xbY3e5zqaUqPVEnqSaZd4ZonGwcg+ZgIj/9EXzawCzBkAkh
         h7Xb9ENJXigZ2dHmt5AvRhN7D72VH5o4bqSvQIW5OT1zlZHWjwoieilzYO7pKJPQ+4kp
         GWO6gpDPRpIQzBPs2we6zU4gDUOv18WsTYlGm4/2QIRbcZ49j78XgYjbhG7FI1dxGHKP
         ancg==
X-Gm-Message-State: ACrzQf3DTeccGnHNJCKi/ytIWb4Nmaj5fW4EPANF5VqzBwIvsfBgp65+
	chTJYXSBCklDYJKdgioeHI0+eg==
X-Google-Smtp-Source: AMsMyM58z+ASY8UOi2LgUP/AtKbL5GblBy/jUDVZRHLihya/ftcGyEuGo5VmC6hSj04JcLqpHSVyQA==
X-Received: by 2002:a5d:5346:0:b0:235:6c05:6272 with SMTP id t6-20020a5d5346000000b002356c056272mr2786891wrv.332.1666271284107;
        Thu, 20 Oct 2022 06:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a82:90b0:2979:1615:9a68:f204])
        by smtp.gmail.com with ESMTPSA id p26-20020a1c741a000000b003c6b70a4d69sm2676080wmc.42.2022.10.20.06.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:08:03 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
Date: Thu, 20 Oct 2022 15:07:17 +0200
Message-Id: <20221020130721.24866-2-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020130721.24866-1-fchiby@baylibre.com>
References: <20221020130721.24866-1-fchiby@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_060806_550099_D4D494DA 
X-CRM114-Status: UNSURE (   9.97  )
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

Add pwrap binding documentation for

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index d24e2bc444be..8424b93c432e 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -30,6 +30,7 @@ Required properties in pwrap device node.
 	"mediatek,mt8186-pwrap" for MT8186 SoCs
 	"mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap" for MT8188 SoCs
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
+	"mediatek,mt8365-pwrap" for MT8365 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
 - interrupts: IRQ for pwrap in SOC
 - reg-names: "pwrap" is required; "pwrap-bridge" is optional.
@@ -39,6 +40,8 @@ Required properties in pwrap device node.
 - clock-names: Must include the following entries:
   "spi": SPI bus clock
   "wrap": Main module clock
+  "sys": System module clock (for MT8365 SoC)
+  "tmr": Timer module clock (for MT8365 SoC)
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
-- 
2.25.1


