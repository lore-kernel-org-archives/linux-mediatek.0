Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7039CC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:41:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0229861243
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 09:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0229861243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yFy/c6Odc+FiAvXihc38UIrnUzjPK4Z3GTZ5d2Vp9d8=; b=ivwbi2sHQ1FFJkb/wqBaYHoNU
	0XjjdHiRt8jjNYI/uSNJYiLJy3h5TkzkPUzR6g++w0lVrz2rSfa6n9jUrwIflPp54SZw4ya+tmP4Y
	po59Dn8M/wpZwUFIwd6i20rZDRU1IWHUF2vgusO9N+apPiWV9U14wJNG9WVLvqWXY3MYUsop5QNo/
	yL/153oZ65oZLeeoVumH7QRZGYAfzO5BWO22J+FFVW59jWFbR/LX7XRsoo7j2YgWh9E1tiAOSewOC
	2bOdne018VCAMRAqH7fhFAoZOQBDQRw43eSvGsofBuP0CnWyTxgtEH9Ec8pkPTZJd0mzBIn2qYfNd
	69674DxKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVt44-006JoP-2g; Mon, 12 Apr 2021 09:41:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2i-006JWT-7A
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 09:39:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=hIB5ovbW1Quy+W36SGjHdu93f090uQNPnQqmgWziz2Y=; b=RBd9el/21odC8j7is3ZH84xshL
 VlG13nxS5We8h1tTTrrPyxW14AOyNYbOfoDvnnMFtFcrPgSq0dAKfLxE0xbHeQz0lyfbq81KQg0ir
 vgQ7r82QBMdHtZCjNDHHD6deEpLvvJhCL6w7wM7pqQ34FSH88RlOLzW5zFJ3mqvg6HqRFnkMVcxAF
 bJQ48UFX8l/MIUnlrk7AMIt5N47fiZaM6nDSQi79sfemAtw29wLoEpnjOjDSLsQVu7+k2ULoV8RQH
 XFhDCIRrX5vBNCWqn13fJSfwCSpKc/sJWSgwalPsxk4bkoNXTD6MM+er0BwBqOZEPDFbnNSEPQvzc
 CuqPapiQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVt2f-0064uT-Ex
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 09:39:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 12so6396865wmf.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hIB5ovbW1Quy+W36SGjHdu93f090uQNPnQqmgWziz2Y=;
 b=zm2xIpJUxLvzkqUTEm7Kux2j4hsc7UsSYGnXv7d2oBzNu+GMnYnhf1z5//irUI3AjJ
 MMLBh7mFElwdI+UCUkVSCWe+ZwhCqRnhDoZkVeFLOe355xwrscIYoZtDX4Xv50XAFVWn
 8iWda9Y3ht52ceGi9cqPxCKnmugHB8RTh33+v5pFyiKNADnH3k3O/OB+pfkERYORBZuK
 5zu79RUvFTSKTwZ8+6pOdcgn60pGG74Sxq7MtkWFRG3jNyYPenQXIubqmXPT8uWucvE/
 e6Hz/7o9CqCd9w/EZJMVrGxOkoXvFolAws6QSI2o0FhzpIXWaw32OXrQLmJEX0PuVY7a
 RX/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hIB5ovbW1Quy+W36SGjHdu93f090uQNPnQqmgWziz2Y=;
 b=jj63QJEkzlTWdAndLtX1L4seUTjKozr6o7fpLCYS1jJL3ZhSLbBih5sPto4xuxBZer
 ZGcui6vJnyewtNN+Iicg0ZNkKnqIMdJPD5AuKVbMou+WUODyFHOo+pP2sDGw3QIRGz7p
 XlhYM9OkYFr3RFkKlehZVA3EAGeiUJXh6k3Mav+9MeR29igptZLocnu1+egK2ekrEwYS
 8XzIjuTbFASPrIWHk78DoJX5vevWdL9Txwgj9yKL8lkEjAzg9rBsZ/7n5L61Q+dCfY3T
 mzwtbDNbISAUHuLB5XIViPeV1N6lGF4GqmxnBocOTYuyZ5vXn3MlLF+y/+rhSKIu7Ws6
 VK/Q==
X-Gm-Message-State: AOAM532ewnpqfz0JkKUbbSLCy5cxNQB3UVtCKiy+F7w5v8oWlcfWyxWz
 FD52TQPsQ3Hcdefz9XCXGtz7cw==
X-Google-Smtp-Source: ABdhPJwxIfToJ6h311EOoJdSj7K3pZVeoBB4kmyIbIG0GYyMak+pMG/9kiLac5dW9hAThNV4EkUzdQ==
X-Received: by 2002:a05:600c:2945:: with SMTP id
 n5mr24322799wmd.7.1618220375929; 
 Mon, 12 Apr 2021 02:39:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4c21:b00e:ff79:bf20])
 by smtp.gmail.com with ESMTPSA id
 r22sm14405902wmh.11.2021.04.12.02.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 02:39:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/5] dt-bindings: mediatek: add mt8167 to hdmi,
 hdmi-ddc and cec bindings
Date: Mon, 12 Apr 2021 11:39:25 +0200
Message-Id: <20210412093928.3321194-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412093928.3321194-1-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_023937_519704_216C8F49 
X-CRM114-Status: UNSURE (   9.27  )
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

Add mt8167 SoC compatible to Mediatek hdmi, hdmi-ddc and cec schema bindings.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,cec.yaml       | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,hdmi.yaml      | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
index 408e7dfce409..23e21656ca55 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
index c15b3470d652..9d7148b1a7c3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
index 9c125d7c8934..01ab0e8e02bc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - mediatek,mt2701-hdmi
       - mediatek,mt7623-hdmi
+      - mediatek,mt8167-hdmi
       - mediatek,mt8173-hdmi
 
   reg:
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
