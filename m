Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1909C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOQ3ZMLM6BNgqZNY26VIORkirN4X+ohLlja4VMJ4YDQ=; b=n4cC2hWPLXtsLAxA0O4frNgJRf
	HuZdNN9xA3PCMdRpnXgXzF80rTft1AdlYrmiMeiNS5S2pBKE1qXmjOmyi9fN3SyKiUmQ17s+Fb6ht
	uE1IkGFt1AmXkR3T//SoFh7lRyKwRspwWpb9hpI6HOrylAPn+PxG5cJDA0DUDHFlKBe1bhNH9jlG7
	GPdooMpQkvPEp/cVbwPx3R3+SGsBWASmgFHga4Zm242yPVwZgVi8wfHwfwhkby+DpnrIR6d+5q6oD
	EYHw96OCwuCvOqEA3Y82N2V8KhtOll4D19uH+/33vbER8nx7rZN2d0TVS6q6mXDOsnJm6QHP1gu1Y
	vvb9OIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjW-00000003SrE-25ti;
	Fri, 26 Jan 2024 08:38:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjG-00000003Sgz-1U3M
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:27 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d780a392fdso917435ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258306; x=1706863106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOQ3ZMLM6BNgqZNY26VIORkirN4X+ohLlja4VMJ4YDQ=;
        b=S7x56/uAVigI5W8eskdFHTl/f4wgfI9fNPqFWMUjnSceSptvNK3pjz5HCV5qTHte9d
         MENbILrBXK5HYIAE58DVT//FjeZ0w1ok1xvwTsuIci+HJyBABxcjjGbYHS1bQRrvVFrO
         HhZH+6JUWcPuLRh5fFaWGRgoDy328LklGBDno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258306; x=1706863106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOQ3ZMLM6BNgqZNY26VIORkirN4X+ohLlja4VMJ4YDQ=;
        b=SS0AS66ZFrlRw3FJ8ygJKCRqdTg2JGHn/2BNpdF+pcWzVF6As96qGRhXTpS0Ubl7i/
         evKzUT8ItLK9FkzQekZzECZoKa1+JvG1poBpLxbPdjacNCGA5lQRVPSrhpeUNzmm/XN7
         8HcuTakg2GcDlqTdc9ilf0f9RVpykI442ulWAQv7fV1DQwKHfV/S3xjeFTTCONXbTjto
         0Oqrkp0tZF9tZbfXtjNo70EhHj2wy7PTwgbEr6YXVh6H+XHOK9atcAUyAfJJlwVUEncu
         2NSoO5uYItv1Z/Tc0kz8OOuTt0i7aMCHL77MsP59bmxUuraFnXbJiTrmQYh4jgRXcVcn
         V4qA==
X-Gm-Message-State: AOJu0YwykNPEJNZWf7rSxZLKKF3pxA/7b/BR3GYOBhb67t3ZQgJfveQ1
	rf5tRz7Vfzupt98B0h3RkE79GzI2h+zVopsAjaReejaFkIeMjo1sNzWA07EJ+A==
X-Google-Smtp-Source: AGHT+IEdU0jjp4x1vfdUDk27VzbSzMJV7tHx5EPjaW1ZDfrbybo5kZdbWLoY7h2ux1gijzQ8/dWEiw==
X-Received: by 2002:a17:903:22c8:b0:1d7:c27:2d32 with SMTP id y8-20020a17090322c800b001d70c272d32mr1144102plg.12.1706258305852;
        Fri, 26 Jan 2024 00:38:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
Date: Fri, 26 Jan 2024 16:37:54 +0800
Message-ID: <20240126083802.2728610-6-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003826_443940_4C1376C4 
X-CRM114-Status: GOOD (  10.88  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
none

Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
---
 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 385bd2765626..2a2ca4756bca 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,24 @@ properties:
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
2.43.0.429.g432eaa2c6b-goog


