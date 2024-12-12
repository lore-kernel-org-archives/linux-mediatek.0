Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3874DE7717F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2024 06:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=; b=kqMhSDGAWRHvXZyRizZxt2nnRE
	I8cz18+ljvgCiIca+FGDXYtCMzPML84IHUIltrd7jRRkVA/QAGz+civRYN29dPgBSP5jRyYIAEmmL
	bjU+ZJfgXy4r3OR5QfJkCMSzLtRiDNQfAy7GZZUKrTb0joUPg1hgvyzlSLGU5TN2TKTPe/kTZNlmM
	BvBHviuI1YFOVOIJKjhJvp8LVq2pByPJiWTDrmhm/CMNQUfmmdkZXleHpUjEvp6X+yodfPNT2Jg4+
	HJwPnvjY5YvfqEZlXewLWsRLFpdSVo8M24CsXeCBFKRcfYKbhwo/TeDFZsq3FCfd3RvP4lWPV88WK
	wMA03K9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcbJ-0000000H1x8-1fZE;
	Thu, 12 Dec 2024 06:23:05 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZI-0000000H1XG-39rV
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Dec 2024 06:21:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21644b473ddso496255ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2024 22:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984460; x=1734589260; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=;
        b=pt6CPg6ATFlcfxjUeWMVfaMrTc25fVfM36CrGmIhBeSX+UHDU7cgnoHrolPBOUj4as
         qTZXz2AIfkg9dUOLMr5Jz5xvfdjeKjXMq3Gq7MxiX6MIqaPoI9kB+KcHW4/ZkK83GJH4
         WYYp3NvlQGIbYksacINaTY3YwVTWhRUfCrTvHg4iZC/MT9S0kafNPWyJUvWdj3yWoWj2
         CmZdF70ezR3I7Mcu6mGOTh2vtA1O+dwey3yZrM4pjNiWMZ88fxeLwnwyOP/Vg617f6tt
         8czJGxQx9X95du3B06HxxkO9kxeCq39sXXS2HI9nXzVdAByDC37DtT3+Anf31tB+fPF1
         zM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984460; x=1734589260;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmhFFd9OZS3YcXJsK70hE90ScOtfqunHCKFsvNhGnPk=;
        b=tZoX2yl+9MOkx3SM+TmpwnDFq1c5aPPNjXO5OuRUd4OxezMufBzOQlSAAg2Vm12mJK
         ftkp+t415+hF+66m49hAQaum7lpGhpwVZnhuIGSYWS70drVe9kddVydks0nuvaVMKcVL
         lt4OhOMNkqkH3BAZwCNIPyhAjW+tItAcw18m1j2v+bg4q5S6UkP/QCyB21AS4BIHB/LH
         QBIL1KA0982kzJHNiAcBBWRqsAdywU5DafS+3xbSDHH6DgBvzb2YfLFwqsj9XWhHt2Cu
         xMlN1aEMCw6qda+bmXuYT7k0qHcpVZ7eUw2GTcDt+8FEnHZn7A3Do/G/XzryxPcj6sGo
         QUlA==
X-Forwarded-Encrypted: i=1; AJvYcCUMgev3eoxUwXc370Jvz4wbZ0gd7k4AzMDS51IohOtFbStxNmMoWxid0/ZVaC9ONVExGCM1X1wwlmn2BXul8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFPtfl7rMeV74GqKTaL50m3kiuVBPfG4XBDVRFVWLW1JWP5v3u
	n7RV3nhDlVFCMlVq6JYf5nywLsjAZBit1X4eg9x+wMdJf1XYHCEFlMU0bg5d1GA=
X-Gm-Gg: ASbGncuVdkugMi8/ycyaQ/Qml045rniRvJyoircPc7QdADwCcGd4Plv4OQ6OrKa8W7/
	w7uSYhmmov1rWnb8mWsZAs8Vf+Im8RJkeVECRCvuwHK4/fm+9p7kNQENdT74a40qOwJQElNL16X
	1OnmZ3oqQXfodWIV4wjK5UYMBqSkDd14NG+duEYYjEv3NZ4gJTJ1qju86bPAkiR00D/LWigAshG
	8/YKRvkuF8HQK18KG1BFmXs0qmCSuDoXcYqjYQT2Lx1HyF26kv9m+cONJstZH7prNNwndR0vQew
	UyGVO9pvrM5drAPyz5YI
X-Google-Smtp-Source: AGHT+IGNhqg7BDa95UyNmBCMDwuy5gdbsBxRXNYNtSRIJSSwK0euI41N/BGBIkwVFECyb3kJ4tXPWA==
X-Received: by 2002:a17:903:32cd:b0:216:3083:d043 with SMTP id d9443c01a7336-2177856a6eamr36242165ad.12.1733984459913;
        Wed, 11 Dec 2024 22:20:59 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:20:59 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Thu, 12 Dec 2024 14:20:43 +0800
Message-Id: <20241212062046.22509-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222100_783942_24CF8095 
X-CRM114-Status: UNSURE (   7.10  )
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

Add an entry for the MT8186 based Chinchou Chromebook, also known as the
ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..d3cc6fbad8d0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,34 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou (Asus Chromebook CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou (Asus Chromebook CZ1104FM2A/CZ1204FM2A/CZ1104CM2A/CZ1204CM2A)
+        items:
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku20
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou360 (Asus Chromebook CZ1104FM2A/CZ1204FM2A Flip)
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: google,chinchou
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
         items:
           - const: google,steelix-sku393219
-- 
2.17.1


