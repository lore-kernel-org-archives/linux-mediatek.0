Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D5C2BA18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KB2vnbw+59r77dIT1XqZt8Bq4nLOyd8kq/y1e23jiU=; b=BiyHNPehx7Sn74+sPdbRas7/y2
	PcXt/uww6/cvzUBkxBBJ32f4reM3LGwy4VVbT2h4T11TJP90ra38fjuPJnFt/dM1vH+JiqZGIrCuE
	rmUfAOSGCz0P5W29FMpVRvVirVLWqHmMsjV65clhzY1blquFrGrSKpjS3OPH83G+jNJtkD7LQD2Y5
	FXzL5zBa/X5w1HtGyqb/3SJQsxZIm8rl8Tr3sKQBQ8WURjZBUVcbm8mMEeEmg5wfYc9JSXqc7RAYx
	DohpU+F03/uD/k60fjjbG4MXdjoCIR37xcFj+lAxrIIBfpcNZ/dJraASVHDlvN++5UZgitEG8rrUu
	lqMk0zoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOl-00000004Rw7-2phj;
	Thu, 20 Jun 2024 09:48:07 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKEOb-00000004Rpn-00FW
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 09:47:58 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-6e4e6230f42so502667a12.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 02:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718876876; x=1719481676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KB2vnbw+59r77dIT1XqZt8Bq4nLOyd8kq/y1e23jiU=;
        b=FKb/H/TBQvZ0vCr6kVFelXutxTj7sPclU4lDM1gdCqGu9kBEBcJNtd/b9JCWXqhZi9
         4sGr5Fj1GdJomO8LJ75kZx3Rum369YW+ufs8XqRKBuJRtIVaiOhPwCRM1u6YNN2vlLmL
         vyr1PNo+hAkoFMCzNQuwrxMYDt3bTq2zo0Uqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718876876; x=1719481676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KB2vnbw+59r77dIT1XqZt8Bq4nLOyd8kq/y1e23jiU=;
        b=OiAB+110kAdxIeF9xpVKeTefoNfuHrUf5m/6MyYQZ9wJ4dkA1lHkCtzkJwiX/zlKA4
         JspyJ1pYAcWOZQ3Tqmq9O2j2WJbZupMcaCSfRc5d1RnJaB9RbjxT7X3W6S90xLhKqPan
         rUT8tV/YkIgEHKupVPBOsJ19HAb9burzPGsV/bOzRPxZANmUzYvfYOio8YEy1HA0I91K
         EWvglCqI//bVLKu0CDhq7N47SfUCDXXNlMRH4YBZMPo41dwrXevjOHFvhVA2g2SEnIGi
         lhyZ4rOSvxOb1eCrjqj58jOOXrWUqGHGyL9uM5TncXOpxha7kD1f0wgk0AqfOmxeGlrB
         QQqw==
X-Forwarded-Encrypted: i=1; AJvYcCWu85ppJRLFNdqqPlDUL66Jp4oUmlHP9HQOoS/qsbU13r/J6w2D56Enxvq26DEVig/OjEeZaI37xKwHO2m4OPxgEB4Hpd6z/c5t0uNyIL5fEQR0
X-Gm-Message-State: AOJu0YxkGJ9ObTeW43sdgxG4a8p7oK439L19lEpITVUPv6OmgvFVPCvu
	8wkFzZy4PNXUt1P8SvbmKm8yoFloUvw+nieedF8DPeEcZnYXc1OH9Zl+414JsA==
X-Google-Smtp-Source: AGHT+IHlxHx3IJjM2Bl6bnv0ofbMIfZvrxY8EfKGaCgMXMCFaU6DcjSHdYJKb67N3HSA7r0ZPxljnw==
X-Received: by 2002:a17:90a:af8f:b0:2c8:62f:de2c with SMTP id 98e67ed59e1d1-2c8062fdf10mr170000a91.15.1718876875679;
        Thu, 20 Jun 2024 02:47:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:c53a:5326:7f72:759f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-70dbae52920sm4164469a12.42.2024.06.20.02.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 02:47:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: regulator: mt6315: Document MT6319 PMIC
Date: Thu, 20 Jun 2024 17:47:36 +0800
Message-ID: <20240620094746.2404753-2-wenst@chromium.org>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
In-Reply-To: <20240620094746.2404753-1-wenst@chromium.org>
References: <20240620094746.2404753-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_024757_191965_BC7CA28A 
X-CRM114-Status: GOOD (  11.32  )
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

The MT6319 is a pin-compatible drop-in replacement for MT6315 with
slightly better electrical characteristics.

It's unclear whether there are any differences, since the downstream
implementation doesn't describe the MT6319 separately. Neither does the
implementation check chip IDs, even though those are available.

Add a new compatible for the MT6319 just in case differences are
discovered later and fall back to the MT6315 compatible.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/regulator/mt6315-regulator.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
index 6317daf76d1f..cd4aa27218a1 100644
--- a/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mt6315-regulator.yaml
@@ -16,7 +16,11 @@ description: |
 
 properties:
   compatible:
-    const: mediatek,mt6315-regulator
+    oneOf:
+      - items:
+          - const: mediatek,mt6319-regulator
+          - const: mediatek,mt6315-regulator
+      - const: mediatek,mt6315-regulator
 
   reg:
     maxItems: 1
-- 
2.45.2.741.gdbec12cfda-goog


