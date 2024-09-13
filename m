Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F4AEEE27A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=; b=JXx+40GJl+Dje+ovqwCA90XZov
	HejEKZCJBD3CM6hcIlAfcPGYmLj7oDfLAk2wcNSllpH9lcvTQ8zeIxTIine5fyOKcjexS0SnQxqje
	CxEhEOrcMRjHrj/reZBPY/+mOx5G3lVA3AXPlBmntIrd7+YJz+z8Sg10JDm31HOdnRfSxY66q/V58
	KDg0vV/My4RyZrbD4DlvSSO8aLnsA/6pVG9eqz1OLdtvtWYbl8NBsTdSqBNGGjFewTrRkjcZWzQ2+
	no5VfjMPIEMm17trJ+G1iF/Ld7IHdpNJl1xAg+ErdjX64Vl8cWt1C68U0R9Cuxf87iAiS0DWRp+QJ
	qFUE+NFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowmL-0000000EnmS-17tG;
	Fri, 13 Sep 2024 03:15:25 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sowmI-0000000Enl7-2Teb
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 03:15:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2068acc8a4fso3886755ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 20:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726197321; x=1726802121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
        b=JkZiGUDHyDA4oXkeXMnLgiwf9phCETDocjkrt7NZABEX5DLMiI2vrc7uK/TpLYYVrR
         kJqF2uKngK+WdM8GAUcT7qUMGoH9i56KfyfUMfGlja5+rymeC7hZYTjC5aYDjQTqwKy3
         w4OusZy+BhugWSVVghsxlaavpW831ILadimAT1FnBI8Xlx9O0bI1zQYXsOsxFKZ2Dndc
         VVJLOaqdZlvq9A6fP4wbWbaRl7Z4mT0a2/PIPjyExTmdbRqpTjhWEne8Z1h2AnLv5DdI
         0JDXPyXQoTIcNWf4Wu6bqn44kQziUGAlXB+4MuyBYvLdJZlQoY2J6xvOaan1M1R9/TXF
         8xUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726197321; x=1726802121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
        b=JfTGX5hd1T4MzaNDpUkyLy7MYiYV5iJUPZKEvAXU05pyuHw65WC1oKYEAInorDsS3a
         fBsw9m1JfG+HzuivlScAGOoYf1qEy9D0/Ily17QAuVALKTN8HqYY+H1iutnIaQa4BbP0
         nK/O8fD6iZSI+B6cp7NIYwAvv5SyV/l1M7IiLEeoSgK4uC/HhFfkKualkLhsSx8G7IJS
         PgVvSn29WysY3uNx9wJmlvV+5f0Wup0bQ7n0bE56deFtVhUVhGlMiXe4B5yTM0bEzZFp
         qS//X/2lkvLVvcKTe4VAr+E1B/K640JDHSRXPzn4bXgrDgQW3Ndi2PUY9nv+lovIsVyA
         /v+A==
X-Forwarded-Encrypted: i=1; AJvYcCW5hwV9aMPWzB8SRCQUEKMU57etHBe7Gbl63uCIznk4U700N5udY5PR2V1MmdOS85L5Qk4nqB4WDhUsfjLqrA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx42fXE8aPIqWe6EqmhXiWPhw2+9bBHrgl2AmJXfCfA41Te3ny7
	1Mwh3sPxDbHUjESkjPDBoHxsedlWfCX1NkekCS3dKcohkKh9Hkmj01dkgy6DsO0=
X-Google-Smtp-Source: AGHT+IFLcFR9k1KDMp3YZ8kv5zDdnsd4R5MF4jpiNdAwCjYyvN8FoBA8JFiQndfJ/O13ddyQ9AEPVg==
X-Received: by 2002:a17:902:f643:b0:206:a935:2f8 with SMTP id d9443c01a7336-2078262cc4amr22980855ad.2.1726197321379;
        Thu, 12 Sep 2024 20:15:21 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af45432sm20382305ad.91.2024.09.12.20.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 20:15:21 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com,
	hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Fri, 13 Sep 2024 11:15:04 +0800
Message-Id: <20240913031505.372868-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_201522_635518_F379D64C 
X-CRM114-Status: UNSURE (   8.05  )
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

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..43a824bee1b6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1


