Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5B8C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+shCuLeYUeGg9T4PC0PI70XXw4EiiSOxksaZg6E+gi8=; b=kndQJwfVrDxHnr
	V4D4GgYEhIxLMNHbjzpQhlThrnK10qZEeW1Wx07/A4PkcGfBl0rvmjyoge54enGk62ENlMXVZC12S
	zIOz+4F2sng2+W97ddNiPfgdmQswWU7gC/mSRoIUQWCWsUDjBn/5Hf0Z2i+21SO/J86cehfBbVLSa
	pFZcofLL0FIlaQvHpFBWzknfQzuToyMNKgUB+50Qy4tCCV2rJmMEki1QlcwIN1xvQZZ0tIyWzWZRg
	EcPldXdPbhOLEfBMlBLDSUb4JqqzUCoxOjSfcsK3i2/fBg+6oUklzwEvJy2GM3yj+BG0zW9pHmO3l
	QiL7o5mNn2vf3Z6w2aZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xV-008Uvj-2P;
	Tue, 24 Oct 2023 00:07:45 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xO-008Und-1M
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:40 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-577e62e2adfso2367409a12.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106053; x=1698710853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+shCuLeYUeGg9T4PC0PI70XXw4EiiSOxksaZg6E+gi8=;
        b=bg4MPjzR5ZaDlE98/a96/rElfINDdGuJsn27sXx5bmATdmXqe6icY+Vx5f4APBEZ6e
         r1oYIEsCo+/ojC8uSIc577jpGv1zsKyeh6KG66nvfgqRZTV067DVzi8jDYJVuV5AUABd
         EZ7gVfxzX9OACYQa5kVUZRrfNIOyRH69iAo7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106053; x=1698710853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+shCuLeYUeGg9T4PC0PI70XXw4EiiSOxksaZg6E+gi8=;
        b=fwsQ4W6X+CY/bpTYf0lYsPDpYxNj6IoUeXH2WwLFG5aPBCHjn2CfzdHB+yd8ZSViuA
         kQUkBfUrMiC+XjL64XYuoHuO8uF1uCpUqvLWtQoSurRzaGx37KXB5W3HNS6I6f+CbmB5
         rOSwJZbzcuxL0A/dmxWw8BBO+TuX63uSC5gXGQOpIRNHI+DdDxrHmIgAvhDBvb8maYDe
         JRzG5KP+KwrTbVFkkJ+31nki1FzW0k/I/6dxK0QCA2cthP9dViWfzL+hpr1RbZsd+jR8
         Tc1f1UA1ujO/+IrCuj4jnKUxaxRSI/5y1Zg7Zffg7aw3krhPawI0hA0Ajb0Ema4E++WI
         GvTA==
X-Gm-Message-State: AOJu0Yy/qczWa4ytTTW1rG4QETghDd+b7PFMEhgKK3tlS2PC8v3iz0Mi
	QJH2RO5bwzvFcO2U341d3sxXAg==
X-Google-Smtp-Source: AGHT+IFyDFfPXnOzCWduhBGQR8TvVevfvrQncsDbKw4d5+Hws9B2jLP9qII9Z2Vy6KpNGikr7rQrjg==
X-Received: by 2002:a17:902:d2d1:b0:1c7:398c:a437 with SMTP id n17-20020a170902d2d100b001c7398ca437mr9319153plc.69.1698106053509;
        Mon, 23 Oct 2023 17:07:33 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 3/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
Date: Mon, 23 Oct 2023 17:02:26 -0700
Message-ID: <20231024000724.57714-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024000724.57714-1-hsinyi@chromium.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170738_459933_DF2E86AD 
X-CRM114-Status: UNSURE (   9.09  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add makomo sku0 and sku1 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index fe8c488a3207..b131e0bdbf01 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -250,6 +250,18 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - const: google,makomo-rev4-sku0
+          - const: google,makomo-rev5-sku0
+          - const: google,makomo
+          - const: mediatek,mt8183
+      - description: Google Makomo (Lenovo 100e Chromebook 2nd Gen MTK 2)
+        items:
+          - const: google,makomo-rev4-sku1
+          - const: google,makomo-rev5-sku1
+          - const: google,makomo
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


