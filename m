Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0FFEEE279
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 01:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=; b=01eGHJ0L2AfGNU3JbXQaT5/Y6r
	3fbTt445EHkL2LO0btKlfystwmFsUCfHKzS6adSFobvrUoxvAzeUUh1j0SbMxuuOYA1A5X2Qf85ks
	hL01/kvmAmQCUyXB5g6fobD2nHjLhCvtrvssAj2xmUE1//9Ml4hEKggJEHcFHAK1pAUuCfWeqaJOA
	jv8J9eR/du2AyPw6G2R9BXwk2PfZwS2DxZS34tuRjyfJsaFh5s8tq6gT7Uib9oc1N9NUBneOAmFXR
	aJqAr3/Mw9Yb4Kmz9UdFdqCaDs/rCs4UX91egJdsTMHHv7y5LFZKdXs0SaV+ZH3V9Fq5ymXQZugVl
	UklQuZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovWt-0000000Eh3X-3df1;
	Fri, 13 Sep 2024 01:55:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovWq-0000000Eh1l-13Io
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 01:55:21 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206e614953aso17791515ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 18:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726192519; x=1726797319; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
        b=DVjrhDRvv+uE67fQ16EJr+Nwd855wsEH3WRey0VkCz8YdS3jU7iw26lJlfoy5eEUID
         I2MutrB72xt5cvFa7u+7dFBcnsJN8BQM6zLh0eaSkKKACQV5l1oc2lARVCXnQk/wOhsd
         piV+r4GPfF06QMoaGyYd+TKTdzYh1wWksSwZKNLuS13rY7aO1OR//G+SR22+6c1rsLfD
         vj528w9adFdvULSXwAPHE2+q8RziPTips+09SAaqxk7EF/K1beNqWFZLIuBrVvV5kLCc
         8q29riEyf2RiiW+W6UApf5V8GZZrF7SyRgq0zOPbCknWGqkNx4BzWMYpCIxuWZdWJZ/E
         v+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726192519; x=1726797319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/tJ6K2p2TuSkkGXCsuIhipqtb2yllodeabGTYDSu2M=;
        b=h66KZJ4PX4kafKFIYVyeXf4CQsAXqiUbNopV/xPpDfUJe8UKtlx/D2ZsQ/a+0yLNQ1
         uKNhD11V2ATHHSD4dIhjbCR0HDrFJC7D7M6wothzer/kN7lO4iwdChmMI+RzQ1Yia0Xg
         UyO3VAaIXA5l5zy5zE7oQ9+dhB5BAxG0FxRAzRroDEZa8LBn9VMuWVBim5PE5hURttJ4
         Oyb1LglibdT6ISec6AJ1278hsOISSXoRZCeacK4zzIh1khelcANKFAKN+k2UyDpIDB6e
         xVpi66+ChAaSVD7//C1+idm6YeHpZvZO8qkuu96tRa4Vy3NTUN6d2LRNI/Igh/mqvVqX
         MMmw==
X-Forwarded-Encrypted: i=1; AJvYcCUpW5McZxXtEQoDs+q4AUFOeYTktTE9VgJPAFUDEZeTe7rgCfo1xLThh8xXt5ds0Y27w5RLcxJz0nd3Lo27aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLk43C8O5RA6DO1+UuSgtAARYD6Vo2yUNWMlla1tfSr8ENnmXW
	BjsHD2YcRZq83Ww/k9lOpdsEy51KVxq3bQz4+nkn48l1MGPrNVnUueqYeqjLKFM=
X-Google-Smtp-Source: AGHT+IFSSYOJX031nMRvpIoTRVNj8X237R7lNtTDrvk+f/3CXcwctvLBX6in5w2tExnnjfh7zFzcOQ==
X-Received: by 2002:a17:902:cf41:b0:200:abb6:4daf with SMTP id d9443c01a7336-2076e41299bmr62421005ad.39.1726192519391;
        Thu, 12 Sep 2024 18:55:19 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af49210sm19896605ad.99.2024.09.12.18.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:55:19 -0700 (PDT)
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
Subject: [PATCH v6 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Fri, 13 Sep 2024 09:55:02 +0800
Message-Id: <20240913015503.4192806-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_185520_315246_5B2FE992 
X-CRM114-Status: UNSURE (   8.16  )
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


