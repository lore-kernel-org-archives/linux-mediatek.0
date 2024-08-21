Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA8C52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SpLoj/GHdJ90mGMNH9UOi6XZ//oOyZzmQ1SqbdjiU5Q=; b=UeKgdLhmVTEBD3M1CTylsAG6Fh
	gFgG6OcFb6FCBT2kPH+OGMPY1bvq0o5TZBGtzLE/5nWziHkGgRo3zcW3JcUfEIumRvdAM/7z3mVzV
	qoxSzRMVeQG75saHOKTTjkcO90YzaOXF17ZmSZUHwU5GmWZ5hjJ9pTnqNF02bDd7VQnU03tpQR2c1
	AGwb50cS3PDZISNDU0y6TkEaiTv3Vb+VW9sZDh1tpi1o7/dMQvpW3vMo7E7UkzPSVMUil7QP4YQ5F
	EcHVbWMNqW67GeMsAHDXD01Bl6RC6ovqmbR9FazfPfI810pU49EpHD3vs29nv7quu+G51WHp89QwI
	dqdjYVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghdC-00000008ExF-4B7t;
	Wed, 21 Aug 2024 09:27:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghcb-00000008EgT-3gD5
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 09:27:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d3b595c18dso427114a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 02:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724232437; x=1724837237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpLoj/GHdJ90mGMNH9UOi6XZ//oOyZzmQ1SqbdjiU5Q=;
        b=mZWKZr8ffOSLyGsbZ06JqxS/wFMuvkCyMooCxM+qeG8mGgdzKOdiJYcw+FpkSaBgCp
         TabE9yy+Ns0LqZkPz0AOQgdDGF4Q7pS2Yopy7hGIW0WadS/nebbFHJU/Cukqe3B8hZIJ
         vGiBOI3WoIJxJIbVV9Lv/w6m3odV9p3HpQygY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232437; x=1724837237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpLoj/GHdJ90mGMNH9UOi6XZ//oOyZzmQ1SqbdjiU5Q=;
        b=eCKZ3XWyPFIQrNNeTEJub3yOWhqrZ13uKP+h9sVTuJR4OXarRv6p78TAcy67r4SOuz
         ZGY4RziELQ+JdwzjC45iMbRodLpo1ElN64Ea+XQNMLeRdtYEn/pl7G0Dver2sCYtSYD+
         QWrt/D3AYftlRDisXIq6CTrXJ/YTrmKweWQFeyvP/L6RP+xfy6vl+0Pr4iy8S1LiZycE
         Xo3BE3WDOMR5bqvUBfgjATUJ8QveVTW1MMrZ7e78dok1NcYoUEVZB8SuGR1dTUEAId46
         l1aUMrhauIqfiUs/Xwy7LF2CDWPlKI+fjO41RXuyd3rBRQSk9b+j88daHb4jK4DqztH1
         Ozuw==
X-Forwarded-Encrypted: i=1; AJvYcCWDdVe29QHD59x6+wgUKaX7ol34gVezexmZrz/wj0t9iYRL25grCj9IgmwEO7rKbpF3vSlQa7Tgbkb2Y4rnIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkdTaR9Z68Hg2yJx9tig9GCFxFsySzTxT7tJ/w8MxXzdql3v4Y
	s8bGhiR2DnICVIY/HWuqe4t21LJSA/RGm7zAkVNBOKMWN6Y0DXVX4xJcTPh1Eg==
X-Google-Smtp-Source: AGHT+IH2Uik2B9V5fu3Btspt6fJZ1exe9FDCGD9hvpgvwCy8I2HfWJgIXUX3gWybKSU8xAPUw5kyAw==
X-Received: by 2002:a17:90a:cf87:b0:2d3:d79f:e8b7 with SMTP id 98e67ed59e1d1-2d5e995b72emr3035904a91.5.1724232436829;
        Wed, 21 Aug 2024 02:27:16 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2d5eb8cf420sm1246810a91.10.2024.08.21.02.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:27:16 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 1/3] dt-bindings: display: mediatek: dpi: Add power domains
Date: Wed, 21 Aug 2024 09:26:57 +0000
Message-ID: <20240821092659.1226250-2-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240821092659.1226250-1-rohiagar@chromium.org>
References: <20240821092659.1226250-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_022717_956331_9B7F3A19 
X-CRM114-Status: UNSURE (   8.35  )
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

Add power domain binding to the mediatek DPI controller
for MT8186.
Also, add power domain binding for other SoCs like
MT6795 and MT8173 that already had power domain property.

Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 5ca7679d5427..864b781fdcea 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -62,6 +62,8 @@ properties:
       - const: default
       - const: sleep
 
+  power-domains: true
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description:
@@ -76,6 +78,23 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt6795-dpi
+              - mediatek,mt8173-dpi
+              - mediatek,mt8186-dpi
+    then:
+      properties:
+        power-domains:
+          maxItems: 1
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.46.0.295.g3b9ea8a38a-goog


