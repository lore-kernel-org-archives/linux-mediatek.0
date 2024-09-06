Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74265CE7AEC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfPCPDyI1RrKAFi5i8oSogBSmIZBHNxCV6AppJiq/Hs=; b=bYnEH2/RwPE71AdCrpHZdhIGRX
	y0g5ITV3lFh7sWE3eIT1RcCPvtJJpcL2gqiOH0ktAv0Mshslzc48oQJguVX5KuiORh+li8P8FaYTL
	VZiNTAxniwt+VyNGdvFz9OhPgItVWF/m3fW6Ix/QxzrvroE8g4H5C8206N4FcJodRpLufA9Wxbv6N
	g1OvRS7Usz3jdpFYeT20hR+ayIPfb9YRBgDm5j1WAFhwihoj9YPrat+qGpO41yekAxjdUu223on7D
	pgFmfaMo8PbJw/ar+4GtYYcGsr6Q1y5R3NY81n0ukEUcIgO2iFBI+5vWAwPTv6bp9O2DwZ1ieSJbW
	IigPdAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUn0-0000000BQxS-3XFe;
	Fri, 06 Sep 2024 08:57:59 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smUmy-0000000BQw4-0MGP
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 08:57:57 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7179069d029so1229006b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Sep 2024 01:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1725613075; x=1726217875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfPCPDyI1RrKAFi5i8oSogBSmIZBHNxCV6AppJiq/Hs=;
        b=ifxNAvquZ8LfvTY+BgHXfwropxhsHzzv6lbLb4iEQWUOY+l7i08gnoJwrbLABp1xr6
         4Ak9vXCGBQweoJQyaytGeV2gKkrcQYnWZ9xHrVr5dIzWbv9KD3KffGgISspwBHAKEVlH
         dS1rheGOb8gbdYjfEToKkt4VU9vz/KwOLzlTyCKia71VQUDB1w4ElBtUal6ap9lsidnk
         nheVSA0Sb/LXkT9J3GrUdf+Q6bSAHt27NRJ3t9lLRFs2UP1V31bez3QonSEDlLO2evF8
         ZCHXfLboaSQBC/TRRPLJBRcVHhIIK01c1x7/s0MdjCnEFtL1PtLDQkVhGp9SVlvHywLw
         7Irw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725613075; x=1726217875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfPCPDyI1RrKAFi5i8oSogBSmIZBHNxCV6AppJiq/Hs=;
        b=RwiemVy6pkTK5Ds8ug8rSRYgZiUeGsbmCCrcHUDB1p4CoEDNH5SvrsDEihDqwfsRGA
         7AWb8XCOUr4RPdk8h/9Q/jteK2XoWqozaU3xxlLpgUL4fHV3GW7x2B/EebItabk4Cx/h
         2uKW+InG+jEVjL6UWDDP63RzOM5ij+izzJKQKIDNRpNdM7k/+2GlnG4YJXmfZy9RT0M7
         cIxE0p3U68hIro3/YbnKQmJbQtSxYoQc/Gy7/7jMWZrqzutoWAhtSzW0SYs6m5i+Dlan
         5OA6Irm2ytfiyArr2YzRNuqL8GHM7g/IQd7boRkbxESr7yl4t6Ld2Hm7LzoU/borafHT
         Wm1w==
X-Forwarded-Encrypted: i=1; AJvYcCUsZ8cDPA4Jlmj6sCQZegqZr5QLto6NTDKmjrivlL59vtz4Zj0CkOM8TjBxYaU/rdQAWH7XkQfSgEyTMNbcgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyKOitBNM2LM5JhVOdFHtpLn+PRFqam8AienzsfXIC8G3k3lhP
	US/c/21/iCc+n0yC5iG4vsvIF5BIM1Kqh9U1Ve1FC2TNiWVE3NHsm6B0BZKW29A=
X-Google-Smtp-Source: AGHT+IEQknbzHq8Vt5pY2Z0mPW8VsXzjXllMF+wnb/G0zbnfo/dO7wl0slgZX4oz+k9PIl8B5XeZGg==
X-Received: by 2002:a05:6a00:ac6:b0:717:9462:8bda with SMTP id d2e1a72fcca58-718d5e16866mr2039277b3a.12.1725613075015;
        Fri, 06 Sep 2024 01:57:55 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71798286219sm1439166b3a.57.2024.09.06.01.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 01:57:54 -0700 (PDT)
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
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Fri,  6 Sep 2024 16:57:38 +0800
Message-Id: <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_015756_151948_F323D854 
X-CRM114-Status: UNSURE (   7.75  )
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

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4bc1777b9ea6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -257,6 +257,17 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta (Custom label)
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta-sku2147483647
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


