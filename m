Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EB8CDE000
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jun 2026 17:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=; b=4duvZ7niSGQqiYV/IltRaZGFya
	sI76n+2emmAvjee/kTN4Jy/gf6PZXs3NZoz/YDjmf9ec7apazefcagFt8mcBwFyL6Q+k8tku97G3A
	lX7WVAcYyiaNfbBsZabAJ3aD9A/DjkqEowfwU/CCwescZ0NvVtL/v7hD4ovyYDeirm95Si5AcGlL6
	GBJ3SRi9ocYeR2KnyE2lWSZvYO8LSbITFBaKQhnrtAdTRkqrFpiV137nXEon3RO2OzspTHB6OXMF0
	nxKqHtv6vbigOt78ekQBWMm0mGh4e1g5qSLJ/H+ZMrITqOIgGoH/A0Wd+Acm0kXfsc+JrT+xaovN4
	eR6D9Kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRWj-00000008B9S-1ByH;
	Wed, 24 Jun 2026 17:36:41 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRWg-00000008B8Z-2BQL
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Jun 2026 17:36:39 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso999739f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Jun 2026 10:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782322596; x=1782927396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=UWpEhhT+1RTEvJQOXjqMaLntDaOM/iaYxCphNZ1WiTDFTGXJdhEfMhC78miwZd5NpS
         K2jAqdUUESDrRBrj0H3nkE3mtdNGLEApoQEkcl1RrwFSTtyzZko6wVsHf03xK3h/1dR5
         JA0HbfWWpwmPeqJ+kp4R+zGCgB47a4788ie2UoB7wF/to6hlTyMCjaeqTYWj0hDE0CXI
         +Pg/2CMAL4Wbr6BZVFx0toX7Y8qmSZoj5p8xXjTvQiADpQiujxROfOtVDPcYHsJtxw8A
         w5zGOU8VJzyKPifAXWMa22rRFbSZFiGdcwXksdgvhHgCaDuceM7SUlUPUOXrdQYz1T8I
         sozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322596; x=1782927396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G06cM7MjeSchS2SfjoxKf8C946GFsoGL3igB1cEOCFY=;
        b=JSAPv2Om6Rgjqcb+v092o5CQGdPmHLXLD/3kg2JDP+cJr/uznMD+bxexYX66flOxKs
         sIxa2u8B8bEetFqx9/By6b4JXK4Z+CGP78TEMeiODlOHFiCzrDEhvKW7FQhnTAvQi3Zc
         Oyq/6XThyvaEtkS6uPKIm9yJ+3OgZp8g9h17X1z5HVUZwLE72DyvLwgUzuuHgGfgR55A
         vYdim4z7Kq/xwV5kaFOiDTJ2SvRMV49kTvWnwowJbMJl0zaf391fhlDUK1ERzKkmRggY
         wRnClhflPtrj44vfxy620oVoj72ZmcT5leqGhGiiCP+eSp2EK09nf+y3lSq/+eOqzMam
         t8nw==
X-Gm-Message-State: AOJu0Ywnp1cFiWJKQgbAlGaweVPH1uFtGwCaFDnQYI+7uzdN7FdaxYe2
	SdbQ8Q1P8R/wCa6V41NHW9TWhl5e2qThwxXl9Rb4dZhKL38WVsQZo531vCVaiscF
X-Gm-Gg: AfdE7ckpDmcNqBUAxAbqCutJrXD8vbfL1ifT4/f8LxTz00GCdxGFRPwqN0Fg0YZ/RRS
	SCbgO7CkSHYdz1lGiWYQOuRnNDivq8qUTfbHpN7hA2H4PpUDZH5sygvJuMHIc6UIy9OtE9yeELG
	KfAV4oBIpHawwkxnQApcCk7y7HSBKSr9DT5TRPiGqh/tSuwQQuVyzMvuMUktCRilonUN323eSa6
	IQQ9dfFMDaXbgCjrOpNk2oa7LKxwlV8Gw0XzNiYIxwScM8YuACvIcn2AODhwn0hWupEbK18EJIG
	oPfxxELhQCmfkJ05jGh/+9AtVK4wcujlUojM9eCctXFbw/EQPmQ2afnVQuWuab891DikEA8AZc8
	Hd7GpEKU2nW6C5F1fbC47npB+BQ7PlRiXj8rxjNad+8L8MvgBTGwwa5QjE2L9CMBPQ5GguDInrt
	wBxMm1kQ==
X-Received: by 2002:a05:6000:2581:b0:45e:d8dc:922e with SMTP id ffacd0b85a97d-46c0b3e3a86mr7091212f8f.20.1782322596297;
        Wed, 24 Jun 2026 10:36:36 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1b754471sm8165914f8f.0.2026.06.24.10.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 10:36:35 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles for mt7623-mt8167
Date: Wed, 24 Jun 2026 19:36:15 +0200
Message-ID: <20260624173627.19785-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_103638_572238_AFF21890 
X-CRM114-Status: GOOD (  11.43  )
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

The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
compatible as a fallback, but the documentation lists them as separate
entries. Correct the binding by adding the correct fallback.

This change fixes the following dtbs_check errors:

DTC [C] arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long
DTC [C] arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb
cec@10012000 (mediatek,mt7623-cec): compatible: ['mediatek,mt7623-cec',
  'mediatek,mt8173-cec'] is too long

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Changes in v2:
* Fixed yaml indent (sorry about that, I ran checks multiple times but
  it did not show anything - I had to clean everything and run them again
  to get them to show...).
* Added details about the errors that are fixed with this patch.

Initial version: [1]

[1] https://lore.kernel.org/linux-mediatek/20260623135757.5111-1-l.scorcia@gmail.com/

 .../bindings/display/mediatek/mediatek,cec.yaml       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 080cf321209e..bc288b1c6f07 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -15,10 +15,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt7623-cec
-      - mediatek,mt8167-cec
-      - mediatek,mt8173-cec
+    oneOf:
+      - const: mediatek,mt8173-cec
+      - items:
+          - enum:
+              - mediatek,mt7623-cec
+              - mediatek,mt8167-cec
+          - const: mediatek,mt8173-cec
 
   reg:
     maxItems: 1
-- 
2.43.0


