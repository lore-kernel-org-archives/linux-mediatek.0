Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB05C25B67
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9VOeGW1+YeyU2G0JvKEORbZjMo9uwDqxfDmsj8nfnjM=; b=GD+nL63EZUzvZ/
	eC2ST0vrJ05BK29Y0lxhAfIvqZVonmzoXrx1hkw2egFerVlLWLWmS+pdbfGW/BlHaQ2M+aAYhOmT6
	cA5/mOZRl+smvGSJywP62UHqOoScu89sjwzUmG97CTiat2ma8S65fIlrjP6FBBQ8IvuaPaN5kjgJB
	Z6Eq7ezI1DAXZCQGqb1TIU4wAre5YfzPAv3gVFa74bCahuM7JsFRd+tQ4JgXWfSS2/RNcXiNt4/Ci
	Ye2DVtP0ViiRk39gNb0MinxcKXMglOjMmxf8zsBecYCoVoGKTiG5YW3pNHnQYETGXP2TkFvGzADRM
	Q+hGemtx6N1phFNPdcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xx-008V5o-2Q;
	Tue, 24 Oct 2023 00:08:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xP-008Uog-1T
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:42 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c87a85332bso32959195ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106056; x=1698710856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VOeGW1+YeyU2G0JvKEORbZjMo9uwDqxfDmsj8nfnjM=;
        b=bzYpqqm2rFOitm9VGc4EoFAptEFSoVZ2AX0buuEcT/V0cPNLfaGFjr63XkEz8ZOlRA
         wbMkIEv7iEd2vIuv4L0yBe0awNlDx3fT2eNTe1NWB4HKQq0rjaPlKEOC3h/7lS3zgPgs
         qB928PxHfjqtxkNSsGQF81F/OgNVd9/isq9Mo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106056; x=1698710856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VOeGW1+YeyU2G0JvKEORbZjMo9uwDqxfDmsj8nfnjM=;
        b=C/9C1AVUHXxTQGQuZdFZTJfQnGnIE/g3s8S3IQpSRpF4yMFpfnFsCDtoDryhcskn6H
         mA4RNQKYZRIrehCJFSJ446XhYEAqPU7T+Z3eBtLawjoWCj+lPXlyd4XzOInZT4hE5Dvn
         t0XbR7AiS9+i5/lGBUCccniS8uskyleEahY6lXVN3066uXlPccJ3h15sz1cb+WmMPYs1
         hvESO93aqRhVmBAIZ/Fv/cxEMsucg1i9Yk1W+qrEfGNHr7k+V3+IO80wu/LL6sLf2URK
         E8iPnyHKOHSXFo+0/VbpKBhKWX9DNRPXtO7b+Bo060UI3fmivaaRUHHxQ7qPUDy2PLVh
         bhSg==
X-Gm-Message-State: AOJu0YzPeYIu0RUG8Gq4xi28bDei8aBmKOX5BMN6/e9cN8J8vhdLvE64
	3yB6hYcRSWgfcqi7ip7bLNcZoA==
X-Google-Smtp-Source: AGHT+IGJlNox07Z+qWP/5jJ6ZTp86n/wGTcwmCUD6ggrOUjFIR1tQ0GTE4odCzw3VRIeGQT7pg3Dbg==
X-Received: by 2002:a17:902:ce88:b0:1ca:92a:df0 with SMTP id f8-20020a170902ce8800b001ca092a0df0mr11804998plg.59.1698106055836;
        Mon, 23 Oct 2023 17:07:35 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:35 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 5/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
Date: Mon, 23 Oct 2023 17:02:28 -0700
Message-ID: <20231024000724.57714-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024000724.57714-1-hsinyi@chromium.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170739_504228_E0CBDD44 
X-CRM114-Status: UNSURE (   9.30  )
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

Add pico (sku1) and pico6 (sku2).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index b131e0bdbf01..6bb1d80dd4eb 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -262,6 +262,13 @@ properties:
           - const: google,makomo-rev5-sku1
           - const: google,makomo
           - const: mediatek,mt8183
+      - description: Google Pico (Acer Chromebook Spin 311)
+        items:
+          - enum:
+              - google,pico-sku1
+              - google,pico-sku2
+          - const: google,pico
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


