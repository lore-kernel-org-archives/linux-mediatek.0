Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1376EE668A0
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Nov 2024 09:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=; b=sf0YsLTsgMxPC3
	IRNIkGke/zV2S41hmjUqL5ucWIojj6HKWWBmVwepXR8NOMnO3M6zIZUUdVIBrJ6AufcX7g+AhZSDM
	5RSHv/mrBT/ctROg8j8r4S574m/pZ28AEHzdtaoC6i0qj+S12m/cf6UslMienygFhRAZPcqBWxNa1
	zhgMS2cyxQCrW7YuLArBrr9q/SVMOj+yVuH8ys0e7ad6BOzBF3dbzaws/VWosg0lTaNfw65zMNjEq
	dNhyQrYkpr6HvIeoBP/qtVFkijYn8mrx1eDJojN1YJEiY955Sm0KmlKMuPJ0sPpxq2cOUtTtuZFeq
	S3I/oVxIa8N9GXv5blYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8UW-00000005Wf9-3MNT;
	Sun, 24 Nov 2024 09:01:16 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8Sf-00000005Vxg-1kte
	for linux-mediatek@lists.infradead.org;
	Sun, 24 Nov 2024 08:59:23 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fc2b80c845so11932a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Nov 2024 00:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732438760; x=1733043560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=;
        b=lxKfRIXvmQUT5ZFJadE8FIU2NO/M1382DWIDzzbDh3Dv38MjRIAleN/USx2xnNjtPJ
         UVtz/IAdordfGQA3+ii9eU5RwmSdD+gv0Q6Zr8Ebm4fqpC281S1xTNKjZcGcg1DKwkWf
         PyIhra6C2wQQJ8mCtSeueeDVQXaZ0UvN1ojFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732438760; x=1733043560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/IvUBcoipMDIe3/pYAHB/bcuEx/FUoQvLyB3GzlNVU=;
        b=BBuztuar8mwme72vsP770ljYk0iPohYir2x5ifuT+8JEuDody1dKfUyjxeguDopBhC
         8LAvlPxf+Un4n5/YtgTjjr3bhWmL+Tm5lFgJkPFs72lz12CUltiRYRqg1SNhtVdXeyKi
         4UQ1Hi+k68rgdrWPMGUJjpqUbSW+/2G3kql4sILzFOONYp0b0Dfs0ArpL0rJ5EnRSgRT
         KOevg3MTy559dGLFVEMKT8t1OXTw/Z7jcPEQOGv+5Cdeope2B3nEh9JPGNB4qlhhXqKy
         PV8d6VuNdgJzv0MzxRLy2eWTZFgxguVDu7Lh4npFLsrG0lzP8v9BEG8wq5l0MTT0aywZ
         Q6qg==
X-Forwarded-Encrypted: i=1; AJvYcCUBcS9PR1JkfyDxIfBxA8cNY6dvTKitLBG8fTD6RmoP4bPLRmWSniajfd2GbiE0CQjm9Z5HBxGd9nd++yHKNw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztkChzcVXHa+2fo02bsiIrh2vUlbQ9171lmtiRufN3cLFLrGwb
	nW8Da7aSPZO9xK2T++A+yhW4v5y2QBRxGJg1gIlG6bqUhqGQgMRNi/05zJqM6A==
X-Gm-Gg: ASbGncvzla+M6xu/fE3lAi68X38hhS9QsGGixaHcUdrzo1IPwNJQyCuIRS/U6AkRhdv
	vpezvuNWWeBgbCHYsh6l37UpHs1ojwmCaJlfTG33GfAwJhMsngOJLMWp16xl9qACwJSVZVnm0ma
	kNmYBpqyhpBg2vAdl2BwYmenTFgAx2jeT8aArtgxzVaVQDpYiQ8FOwDEisMPHBH1zYY3/nlVZ5r
	JZ2EvHWM2LX7gx+oNsSixlH6GLKttwYmdOgTEzFYeCxd+EguWrp+OhH1wHbHsrv6Ypz/w==
X-Google-Smtp-Source: AGHT+IHfzR8ObvybrfM7pUctOZmJy+v/RQYyVAaGYmK6XbUOyVSBD4McBx6obvZbzN9dxMWFrAHZVg==
X-Received: by 2002:a05:6a20:9155:b0:1db:d932:ddcc with SMTP id adf61e73a8af0-1e09e452055mr9437889637.19.1732438760553;
        Sun, 24 Nov 2024 00:59:20 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:f699:9cb9:f928:9a14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfc4c28sm4465890a12.3.2024.11.24.00.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 00:59:20 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
Date: Sun, 24 Nov 2024 16:52:37 +0800
Message-ID: <20241124085739.290556-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
In-Reply-To: <20241124085739.290556-1-fshao@chromium.org>
References: <20241124085739.290556-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_005921_458565_6072061B 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add entries for the MT8188-based Chromebook "Ciri", also known as
Lenovo Chromebook Duet (11", 9).

This device features a detachable design with touchscreen, detachable
keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
combinations of second-source components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4b68f0baf010 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -307,6 +307,19 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - enum:
+              - google,ciri-sku0
+              - google,ciri-sku1
+              - google,ciri-sku2
+              - google,ciri-sku3
+              - google,ciri-sku4
+              - google,ciri-sku5
+              - google,ciri-sku6
+              - google,ciri-sku7
+          - const: google,ciri
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8188-evb
-- 
2.47.0.371.ga323438b13-goog


