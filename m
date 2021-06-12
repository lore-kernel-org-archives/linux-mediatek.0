Return-Path: <SRS0=FQm5=LG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961A2C48BE5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:21:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A19461019
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A19461019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DtuqdEmFiOKU3ZgDqTD5wO5ZO8mld8zhSmZMKcmKeCo=; b=rN1Pykd7p4N/MO
	mfw9Z4HzORtcBeg8+TPbikcn11XlsGJVHyyREecasPwHUDft4IrFbZTfmID/mX1Z7aDKWqJ0pul14
	aHUSbK9//7BOmZYmqNEDiV1zjXogO/VwHaUU2Ekp0kEsaMVU1CqvDoEc9lo8OSHRgwKIk/dc0KOXV
	cxCqTv64fvu0T8L5pDCYWZ+3FZhPrx9D7fvj02vyj61+P7GXyDltbqY6rKWkQoyfaRzV6DYYL/IB/
	Iyc2u9ah0EKwda9BtpWaMgxEytzL6WacwbwJ5wWV4xMZScxGmcTtQv6Tg5nqs7DuX3kbbTO2f1bRK
	ftqe3qgIsY9RzGBfD7sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lruB1-007eZM-Fy; Sat, 12 Jun 2021 03:19:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lruAp-007eWx-2A
 for linux-mediatek@lists.infradead.org; Sat, 12 Jun 2021 03:19:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id t9so3972424pgn.4
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 20:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iZrBmMYE0pMOpeejrZ6SD6PbgBG0c1CSAN0mNTGXUKE=;
 b=TNgcUBunGafH3meocpCHNnKt/NA0dXXg11PA8MJLnXVu2euTusqY8Y6Omd0109ghCk
 H0AgZU349VZO8eu0pOFsXQzALup4lPXVYpemz/57GnFvlV8QT+sYZytIoXvsbBfXlbTN
 UMVeOMEPggAA0zdhBz2L62mGEBBfcTnLlRksI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iZrBmMYE0pMOpeejrZ6SD6PbgBG0c1CSAN0mNTGXUKE=;
 b=pO3NHWhsKHtC5fnTHfod8CLWtkGQuTnnOgP0Eb/kuaK7W6zXbBApNpOrhGcr/lVrt6
 TXRaUmJuFgG56l1swtQ7vmmKDtcjiS2kOZm1cBvDps7vnw00nJriGhw1S5XSfaokoKkk
 0hRmkC7i1UsvG4WrbnQGGcdrB5NIXy2zHLrbo5jEaUyhyQghVv189j1lgJGOub+xtUxQ
 Icgd52MbcERdgNSzWUrY/yeC8+3KXByOJcsNyy+B0+zuzqU0Lpf7BqNUNEUrz2UpPz9g
 bz4GhFj5evIs5V4ZazW2YuNzMiKU4F5OId62qWKB/P4FsOFx/1jMSQixU9gPn6GNzr4X
 KoCA==
X-Gm-Message-State: AOAM530mEW/L28hXHu6RyJYIDkNPo306D2fJzwdklvb5clEm0en7bOKN
 hrDWN0vQAxvFH9FkHcTg651EFQ==
X-Google-Smtp-Source: ABdhPJzXg020oCP9I7Nnr9yMMU4Dj1q2AfTjBBfaTk9JMIl35vhu5mQFfDgjlMLikbvgRNYDPfH5UA==
X-Received: by 2002:a63:f13:: with SMTP id e19mr6513263pgl.112.1623467942147; 
 Fri, 11 Jun 2021 20:19:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cbbc:c8a0:4601:2039])
 by smtp.gmail.com with ESMTPSA id h5sm6688519pfn.127.2021.06.11.20.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 20:19:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v5 2/3] dt-bindings: mediatek: Add mediatek,
 mt8183-jpgenc compatible
Date: Sat, 12 Jun 2021 11:18:52 +0800
Message-Id: <20210612031853.3115482-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
In-Reply-To: <20210612031853.3115482-1-hsinyi@chromium.org>
References: <20210612031853.3115482-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_201903_114752_46BD820B 
X-CRM114-Status: UNSURE (   8.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek,mt8183-jpgenc compatible to binding document.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index 5e35ecfd21f1b..fcd9b829e0366 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2701-jpgenc
+          - mediatek,mt8183-jpgenc
       - const: mediatek,mtk-jpgenc
   reg:
     maxItems: 1
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
