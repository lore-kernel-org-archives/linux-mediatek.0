Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DA8C10DC3
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3qOBfJHT1+5PjLRRaf9qTSuTN75gznyCQLWs4A+G1fg=; b=uLCGEFtVnKs1xD8MV727bOGKS0
	Lha/qAXdn79h1UWmTJ9QrNQVfT1uJBKedPz1R5PXz0qRk1jW4lR+eN5kgyee2L16pQs8opHQegM2W
	rCpcyM7V2nlFFd1Vs86zckBCDFaYnZ7sFY5cy7oWbrYkIe3c5g1Xsab+j2WLDTaFHN/QsyRw96206
	RgPMrH5XxbA2mJxC+Yh5KViKX3rfQB1lVWiGxKWR9TDXKo4Z+YzYtY13as2x8gkmMnFQZ9LYt5kUI
	+p4rRpARGmbPbz/twwi/kWygrc+qMqOsvmJk21JbidLEObun3/TT23MEzePGLVxhgO3FBP7oj+1Io
	NiWC4FGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XD-003IO1-1b;
	Mon, 04 Dec 2023 08:42:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X4-003II5-29
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04c097e34so20285985ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679346; x=1702284146; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qOBfJHT1+5PjLRRaf9qTSuTN75gznyCQLWs4A+G1fg=;
        b=bNJqBWI22WwcgWIs6YUdmRcVG9vl5xw5XkLzxKhfGXm5Ge7u2lda7yUPbNi0DmSkHy
         7CLCCF9SJqYnk9x2T+bOlXi8oJ/5JO5jqR4uUk6quAcXxbyb0IOnF4PwccXasc/eE3y0
         aVRw8rfX5G3jv8DiJBLOHs0dj/g4P4f3+Viso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679346; x=1702284146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qOBfJHT1+5PjLRRaf9qTSuTN75gznyCQLWs4A+G1fg=;
        b=Pn+dkTbpB64p0Y2eHiqVpWObQcb0QIvqAYxESQ3zsX0of8yQsF5JWwwsYAKXf1GaJr
         mvCes+kCN39mC0gZe96G2Dq8RlhEfmIj06VOVtPSyWxsXgNCH65GO+HQLOK/K7C1DMqM
         q5l1H1vMY6gQa+PocqzIh3ZZW0ZBfiEVqDX1cECrGk5E8upayS7pJpoaXTYeb+YFCBJ8
         84sl1hDLTnXgBGq+SnZj2XuaGN26AlERqzmmTMyOSYvWr3/QRhoTCacIIhtkrFxQrRNC
         Yjpf6hRAAOCJtUuZxyc1NcyKs6h6HGO2Jk34JpEvW0Rl/+s2YcCJtkqUx0Nu4YabhXHW
         jV3A==
X-Gm-Message-State: AOJu0Yy5S1FLMWOSc/gxRcJYWgQuGVJJVDtd1H3ceNzBP0Z+EWTVCzOP
	jnHoS32dJViDDCSCHJ7Ktl5v4g==
X-Google-Smtp-Source: AGHT+IH3r/F4nbYXPOG1kQenYe0KwmiblO2QhUP+W7XTVCgN8GlIr5u5FdgB35I5wSnpXh/9x+QlNw==
X-Received: by 2002:a17:902:aa48:b0:1d0:6ffd:6120 with SMTP id c8-20020a170902aa4800b001d06ffd6120mr3339981plr.66.1701679346161;
        Mon, 04 Dec 2023 00:42:26 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
Date: Mon,  4 Dec 2023 16:40:05 +0800
Message-ID: <20231204084012.2281292-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004226_923400_549E6B8D 
X-CRM114-Status: UNSURE (   9.26  )
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

Add an entry for the MT8186 based Steelix Chromebook, also known as the
Lenovo 300e Yoga Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- Picked up Conor's ack
Changes since v1:
none

 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 709a1292bca7..95d2b430ab17 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,13 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
+        items:
+          - enum:
+              - google,steelix-sku131072
+              - google,steelix-sku131073
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
         items:
           - const: google,tentacruel-sku262147
-- 
2.43.0.rc2.451.g8631bc7472-goog


