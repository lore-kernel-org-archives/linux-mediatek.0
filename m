Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF546C28B20
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=; b=wfI8X2n/q8V5k11LFUHnLmLzXg
	Fu/Xz2hQb5bRUlsWHUiKXB+WMHpICMcO0YPiduWBUWvQyDjug5fubFyTONL7SBnWyLEsVckr0C5qN
	WSVxjG/8Epo4VMr8eDV4hKkSMIDOf0PTEraaKj/RXn9IOOyWzsBwO+W5/LHJmQCfq59ZT46UZsLHL
	wz+N2x651tIi2LrUJa5J9E0JvCEq5qTqELdOEk36LcJQCQVesmw1DEE6SQhmU4a4yB3MnZHwMpGj+
	RAI9jKryw7R7quJyJSJ9z7Z0eY3BeoQzoJDze3sa9e6zFXfsulWakQuRPMdeZWoiClwuWFP7cDoYX
	26tG9ZnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Cv-0000000D345-3wwX;
	Fri, 28 Mar 2025 09:40:57 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6Cs-0000000D32p-02KH
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 09:40:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-226185948ffso40899855ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743154853; x=1743759653; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
        b=vJ34NRXMd9C5f7IhLluu5VAe5tP3lMNLy7+WC3Str1JrbLi4d1yLYvuLDu2MMxHmjw
         +DD1lmdpcxRheVwdrU9m42bDSUMxVFVCG7LR+IvnUlN2DMuMR32Q2s1M+sxuiManteSW
         6gmHlGRAtQQGHv3aXrqpJoOvWTAwBiNhh7OdoRfull9EgBtRakzoMSKZ0cyhvYVcjchI
         BszlT3zWDtJknzeLpl6zKQArrvgKZMR38EGBvie06t9dldssGTu2AQDv95zq+MR6tGsF
         96J/+hpc3BDikogStHTrmhfWaC9hwIkk5OyKKT3ezrUNhBh2uiJrU885oK8Bj46+uTJ5
         4HDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154853; x=1743759653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
        b=WRaZPSJCSQsUYk97CwN6r2PUAn10sP6j2+i3j6oRnMXF3B1RcDaBHeaRptV4/xAj/c
         8W/PLFkIHQT2V8zZ6geWENyoTigJSuohHMk6eSu1xf53bC2b3yq5JPI/9wRRIRK8VhPD
         2VRdL1Z5Yj/foW/46j8O0CxSO6DVaGhAA0xlDAk/1ta7R5d/vaB93JikE41JdkBBy1eI
         JH6clpv9zqyK0KeG6bQxw9Slk5Mrtc48kMJnol4yfhG8XqEgUSSbMRO9jYqyKVjul5QB
         ntM7Yp5CcGMYB6Ul3EajhCq01Ii8Uud+w+OSLtaYdkIRRZ345AKGGNT1yySvcIuzyFrI
         z6ew==
X-Forwarded-Encrypted: i=1; AJvYcCVnIJfCPPL7NcaxkMEnHvCFHiAoMD3LByS6hgve2f+cPKdUaX6dbkaV30qCb8XFHPxTlSs+KL3WUT18cAtjrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkmJ9YeGXaYnR3sxdKcpT++/KCuRYI/C8rTtmgfES6+P61QIiX
	g+K10Rjl8UjX2n9JG0vPazkApsEDuuBMDEG9XavbwY87tE3DT/C2teFJJm5NVJo=
X-Gm-Gg: ASbGncuPGQ6EArpndA2ZKI8gAPU+L80CN78Vgs2biYuK/hV6eVdZR2ibfCDDK1i3ozp
	3iig7gfsE3ciC8W2IZmh/zjTa05UZzGl75ru3XHMmWxvEIEasmF2BzkvylDx0ICEFDVSuDIwG8G
	J+G+G3fOSIGXqFz+C+n4NtbR9+9B7QPLrUKDzdeI4EcKHbXMSMKmAk7LoeEe7y4LEIWl2N1yUsV
	Nmf+VzkczPYBKTM0ymWPxTeqyvKXxTbAQ21Pp6T1CsqK3MGW/zz0dEqV8sOOVZSU8C0Z67CkgF/
	vXpkJks4ymviMj+Cc+Kx5buSgeH4TLvl5Ga7EAgTucvpywibiOW04JRNrSlMjNe3Bu+bR+5Xy0y
	zwHK9+CtGnXXkPg==
X-Google-Smtp-Source: AGHT+IGp2o3LkuIAgi71QZgUHz6T+RQ1Ol3kgJLLZiH+h6Iuyl7UW85ocR8eAQzVe59u+58NXlwvcQ==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id d9443c01a7336-22804968a3cmr108743245ad.48.1743154853027;
        Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:40:52 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Fri, 28 Mar 2025 17:40:33 +0800
Message-Id: <20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_024054_046056_40238471 
X-CRM114-Status: UNSURE (   7.47  )
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
Chage in V9:
- No change.

Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

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
index 108ae5e0185d..fdc57c140af7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1


