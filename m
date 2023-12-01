Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6644C46CA3
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vppgLjSmhUrkns2eunD5T4MJYG5kmc4rlOiXGna8MDA=; b=h5+Z13I9xSwm7+BrfQDPbLw6jk
	NesrqNt99HFCh+AjQIn1ywXK9RaGFmjsrYn5YXNyCENAmd86rtNAHejYMBg3HhMIs2pYzFfrEITqn
	sRxg+d7AIHOyibOAaKVdRiD7Moj7nYhotZ04WBGPx+S100gmQCuJLiLH399vyi5xzN8f+K4rKYhzs
	GORev6ZRPvfTTMtjKuOQ74kIBIlznYc+2xZEB2gFUlRX+2z3GVx7IuMOqP0xkTULkYeQwzRveQRop
	xFUyhHNHg0i7+lE7E3zg0aTbKvcLvhiK0X7j+BrMBDD7OptiSxhTJNVqkwR0tfOqdnFjdUxGC0Ibu
	rbvwT2hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xdL-00CqnI-2Z;
	Fri, 01 Dec 2023 07:08:19 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xcq-00CqUL-2b
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ce28faa92dso1999255ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414467; x=1702019267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vppgLjSmhUrkns2eunD5T4MJYG5kmc4rlOiXGna8MDA=;
        b=jf+jJHdDzldNS6O8lvnQ8GUSu1HdZRNk1xQVaSE/5NAudatdPAxr5vmUgvWNULilTZ
         V7x+E4ko5bt45ORQ9/XPs6F60u4563LisqsWLne5U39c6emIjIQNqfvldRfTVlqeundc
         FfV8GrHcPqLUiPYaeotEg7mOLox88iEXKcw74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414467; x=1702019267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vppgLjSmhUrkns2eunD5T4MJYG5kmc4rlOiXGna8MDA=;
        b=hKEgPJhf4kZXjd15gHnsVihWT6fOEZDYFh8AOoHUsxpCyMeTxmP+xg/l3MIjWXMwHd
         V0+MZViQw2sUOGOIIF9LA+uyj0cvMOWiIUWN1gpVz5jRbWVy4yDMI0lm20AG0zK9oRnd
         5ux4s7Utmq0F8qJ8mQDKZ46d3TF/NUmdiPuohA0BhizLMa2R6ITw8fbDajYzQb2uP4SP
         NQB0OmWGB5DAcRBmCduz41xxjNkMfS0YB9wPPZQwBMmJOlSLl7eAFNPqPrAPguJisJDD
         bbGthe+VN/oxKXNT4QWTkBqeIGoqbigbI1B+MSbbqqzB7YzjMs+BtFMlMWJCZV4EDZ4V
         RtfA==
X-Gm-Message-State: AOJu0YwyAs8ywxUcrdM094Kk9j4gXGp5fgYYemJ3T7ST2AakvB6ZItG0
	3GiU+yXJF+3b9rYYgUvuBedIpg==
X-Google-Smtp-Source: AGHT+IGTphmUhRjkz/SwX75LovD8m+jVDaQwDhTa9OZZPnZS0R4hi69+nJ/+7tnZ5aMIt5gAr0YasA==
X-Received: by 2002:a17:902:f805:b0:1cf:ad71:6f64 with SMTP id ix5-20020a170902f80500b001cfad716f64mr17581637plb.59.1701414467395;
        Thu, 30 Nov 2023 23:07:47 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:47 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
Date: Fri,  1 Dec 2023 15:07:09 +0800
Message-ID: <20231201070719.1229447-6-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230748_846250_BDDFF243 
X-CRM114-Status: GOOD (  10.75  )
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

Add entries for the MT8186 based Chromebooks, also collectively known
as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
the "Steelix" design. Being a laptop instead of a convertible device,
there is no touchscreen or stylus, which is similar to Rusty. However
Magneton does not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Reorder SKU numbers in descending order.

 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 85d394e390f0..155ba22e2ad3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,24 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393219
+          - const: google,steelix-sku393216
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393220
+          - const: google,steelix-sku393217
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393221
+          - const: google,steelix-sku393218
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.43.0.rc2.451.g8631bc7472-goog


