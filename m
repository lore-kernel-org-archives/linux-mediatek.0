Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B20D21690
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XoNt4i5O7OlASnZwCet38LjSamye4aKCWat9uJ6wnA=; b=G8r3JSzI0ZQE3Fc4Kfecx9ME/r
	ThEgzi/Hlx85Xg+e4lDOLKaIhPd3W07JuRnL26e8oS9KIsL9+8HY55eC0MIhSHl2/ksqVEJusaypt
	bxYtyuCTAYPchsGY7Okkp6jaDOclTOk89I2kGMBhWT+fTboP9yGPh2yEawWVxQhRWWdoB5vkW/A2b
	VAYPJxyDH23SJGsO2X4E8kn3fdG1U4USUx3iGlFbTfMwBsdgponzVzs9ALjDO8CwZLiVQA0Y9yvsP
	thXNOLudT+IpGcqURs5hFizlkFjV5wJiJk5rfI0P+w2k9/r+/R8TG3YdcjvyerSRXSPUW+1K28MWX
	HZmJDc9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gpX-00000008CIU-2xt9;
	Tue, 15 Oct 2024 12:39:15 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gd8-00000008A1E-0Fgr
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:26:27 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so947101a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1728995185; x=1729599985; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/XoNt4i5O7OlASnZwCet38LjSamye4aKCWat9uJ6wnA=;
        b=rUCFVjBqPJJ3eUrMRXukH0ZVcStyTcEn/99KZUPBYiNVs9f6wMSHiAg7jOT6q4Ou83
         hpRFSHSwq8Ra/WqbA/mF5ylCwrzB3g2Aya35T8oTWvUs7ZiUgRM5UEGOyEIthB/2V7Ca
         XfoILryIu5mJpnNC/Y2morf13s4P8aAgwu512sReros8cqtq9H5X4p1zxVKNOY7GUdhb
         6GBoupU+UN4Oxw/eGOw2K0h5Dc0j+9taI60h8pL9NP86t8onGaa5ywtT+38pObZKILRp
         MzA85NVhbo7MhNCz1AaGfICeB8Lpko3dhRxhekw26tbwx9jpR6TE9OeDO1i4f7t9ho3B
         4OaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995185; x=1729599985;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XoNt4i5O7OlASnZwCet38LjSamye4aKCWat9uJ6wnA=;
        b=sxlTUH5MEbxYGeNfTl8MYtKjKtV+NGYITBE0qt81Po/QJ9wjLAyYqkykxf8SgbEZ4K
         7XARJVHit1hESwBq3oVzCQiblodxl8h3geSr89yewsaMW3UL6I9ToDIaVONc7BTn41C1
         rDdHdw9CZoJ6FTbh0fr8IltTh+YiDFBpHCFInhv1JVS4P4WiBOb/CvwNUj7drPgyaE4k
         sTkoo0ceEKQ5tQPkJZLxa0U+clu+MHc538uRpnkmCcth2EeQgNtxh2ZgMuKF2oaZJgi0
         MntkXoPhobAArQIuNTXpIu7xUlZtQ8VLztorYaxFNq+w6I73kbOPR0V6it9S3FYVvYWj
         bkBA==
X-Forwarded-Encrypted: i=1; AJvYcCX7M5LRoGEEzJTDpP8PDfBCB8P7BP5Iz1EiMBJ6ZQhPwudtIVZ+99XXNU71xVQ4NQuCqX4eiyLg+5xH8CqswA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHKP0Rp659zkYhv40D99h8L+4S3HeubW5itn07puvNMMsL9Yxz
	lIIINnT415vPMd/aFzsR4lVnhsbu80VPP0B7blOlWWHxAcdbAme6w9lxYd0Sb60=
X-Google-Smtp-Source: AGHT+IFv7jUf52x1OapZhDKbF4Wm6PZ7vVJ7+vAWep9+WGnlVyBu3Fs9zTM29tVuAjlxWV3cuJMiLg==
X-Received: by 2002:a17:90b:295:b0:2d8:be3b:4785 with SMTP id 98e67ed59e1d1-2e2f0d92341mr7180386a91.6.1728995185323;
        Tue, 15 Oct 2024 05:26:25 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392e8cdc7sm1592844a91.10.2024.10.15.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:26:24 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	rafal@milecki.pl,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
Date: Tue, 15 Oct 2024 20:26:06 +0800
Message-Id: <20241015122608.24569-2-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015122608.24569-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241015122608.24569-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_052626_139498_476B9148 
X-CRM114-Status: UNSURE (   7.77  )
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
ASUS Chromebook CZ12 Flip (CZ1204F).

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..49188382f6c0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -239,6 +239,32 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Chinchou (ASUS Chromebook CZ12 Flip (CZ1204F))
+        items:
+          - const: google,chinchou-sku0
+          - const: google,chinchou-sku2
+          - const: google,chinchou-sku4
+          - const: google,chinchou-sku5
+          - const: google,chinchou
+          - const: mediatek,mt8186
+      - description: Google Chinchou (ASUS Chromebook CZ12 Flip (CZ1204F))
+        items:
+          - const: google,chinchou-sku1
+          - const: google,chinchou-sku3
+          - const: google,chinchou-sku6
+          - const: google,chinchou-sku7
+          - const: google,chinchou-sku17
+          - const: google,chinchou-sku20
+          - const: google,chinchou-sku22
+          - const: google,chinchou-sku23
+          - const: mediatek,mt8186
+      - description: Google Chinchou (ASUS Chromebook CZ12 Flip (CZ1204F))
+        items:
+          - const: google,chinchou-sku16
+          - const: google,chinchou-sku18
+          - const: google,chinchou-sku19
+          - const: google,chinchou-sku21
+          - const: mediatek,mt8186
       - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
         items:
           - const: google,steelix-sku393219
-- 
2.17.1


