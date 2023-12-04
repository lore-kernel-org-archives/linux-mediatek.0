Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FFDC10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wldu9pXjNyIoX3DoG7mDhf3kQNOoAJ2MdYX0EVUOaU=; b=WYSGG3+dK/eXvTZgNe3TrfeyOa
	6gLgCkucwJdYzsEuCeVISV8nUJdDE5lkcPl50IJ+m2801AlTqhXZ20LXPKgche/5o0axo1/pPnUAu
	iRAMZ9LXMh/H4KUMARbX+o/gN5ngCnvDba4AaenQPrwumieDsoSyCmqUKTC19ASznPq+Ip4MeCsKS
	6L2haFLzSDU0rEOkzDXVlfCPBAsFGte+1FZb89v1hm9Bg4oRijxlDQxot+fScVSznv0olkuYBl5yi
	aN573ouCPql8vldPxihvrI9HjUb5285TSkQQ2hzrhu82pYHeR7i6Dl79B3lPXnBrs0ZwWYTiJKLPD
	zxDxChuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XH-003IR2-0g;
	Mon, 04 Dec 2023 08:42:39 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X9-003IJl-06
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:33 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5c2066accc5so1315100a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679348; x=1702284148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wldu9pXjNyIoX3DoG7mDhf3kQNOoAJ2MdYX0EVUOaU=;
        b=BTw8Zw7U40fIZyF8oqyJvm95z3R5Z4GtFl1LK+R2Sld693w/0jXEaX0AnpgJgWFmBj
         J+qZW6EC05YNL8h4LE6ZwA8n2TrVtny+JlkLKmen9YzQJ8FHASH6rMUb/dIkfmyda8dn
         5gyVWCXRNA5kcURlj8MzjP7bmbhZ70EtdDVRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679348; x=1702284148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/wldu9pXjNyIoX3DoG7mDhf3kQNOoAJ2MdYX0EVUOaU=;
        b=cZVZzDunQ/+Vdxk/NhC9hklYBcHZlfWoSA39UybFAluLztN9JEJDoULcoOlVmCrhSB
         C4SHE4exRG8ZqEK5Spaeae94yoN04GMo9gDZf8/m9Pb+SYdEowsDsEO2HQOcpg/Kj2HY
         KVuqJBrds35g541gKehNrW+J58ysyVjcG3QxiCUsVD+DLYvBUxyufc7fFIX4Dq0UW0XW
         RKyFT1+MXWtIhpksx0n+mrow8EH612o84KWYjwLSTC/sCAQ6v7GeuDXCf2FVD/5/Y5OD
         ujAgzs3WKSUjDp5BNDgw6K8mEFWRqnJNADgAPSCA6pdUIl+IrB++DEr+egoSVktcFIbW
         U7zQ==
X-Gm-Message-State: AOJu0YwUXtzkK41XLYyMlUwFc2XPy5ohFwwOUn5omvzESPZOiTwdoPEc
	Cgn3Wvk7j1uHuD4rcDeSEyTTuA==
X-Google-Smtp-Source: AGHT+IHjP/Qz9KwXm+qsjE9MAMvFkbEOBOOQnl7A/qRz7yN22jPCAKlx5OMx/9Xzixd9HImd+rjxFg==
X-Received: by 2002:a17:90b:4b4d:b0:286:a27a:f244 with SMTP id mi13-20020a17090b4b4d00b00286a27af244mr607210pjb.22.1701679348562;
        Mon, 04 Dec 2023 00:42:28 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:28 -0800 (PST)
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
Subject: [PATCH v3 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
Date: Mon,  4 Dec 2023 16:40:06 +0800
Message-ID: <20231204084012.2281292-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004231_737778_A0508635 
X-CRM114-Status: UNSURE (   9.14  )
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

Add an entry for the MT8186 based Rusty Chromebook, also known as the
Lenovo 100e Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.

 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 95d2b430ab17..85d394e390f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,12 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
+        items:
+          - const: google,steelix-sku196609
+          - const: google,steelix-sku196608
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.43.0.rc2.451.g8631bc7472-goog


