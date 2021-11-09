Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3230AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0169B6113E
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0169B6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8irSapryZWgf28Jy+KXL4FwBHEE1nraBeN3pwfZlroI=; b=UMjJj+XIvB2LeZ
	Ncu0HtNa9NQNG+geTk9vyam/9Tb0IscEFCTfKUQ+BQo6UJEOdhnimXnvY1IvDvanW5Y5MAk4ZFr0u
	4EOf8EuT5YDPagJrG4/WIauG17OUd7oM1WLkZWs5plEZDDdWklzX83dZMCdje8/6SflMk0EU+aaXS
	k0wa6jXly/AZwmHXyjwLIBjh7yJ99wROTQlL0OqVGd6YeCk6qKoGHbNw0eDoGIRQMUV24iypvlBYI
	SM/v075egszPvpAIqxAVt2JkfvDW6KtbQmvR0WbuFoltoogL3ZJHsKMYFS8i/aW1cSfAJ7UemBZs6
	nDcpgFT3+/xClWqw3z/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJmB-000iFi-Iu; Tue, 09 Nov 2021 05:34:31 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlR-000hwt-0B
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id y7so1829852plp.0
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=Tm4npLty/l5AM/Js01XtTRKor+yxYHW6IRBDxBmsD2yXj8StaHtSkK3j0y3oj916Zd
 TBBBAXrcoc6QwTVKELFb8kCXqOVVuaOe2/Sd5vVPD7RpluQKKAaueTGMvTTjRy/npXau
 HtEVEkTHkW+p1xE7V3OwEzLpJ1yVgukEQ15sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=3PjrK9P763VfM8N8mLo5jEE4vNEqrTQk35NEPL3EHxUmQj6qmxTaAbV5e/a5acFppS
 +4kWV0P69DptsaeXhA2KLFcak7utLcOBMRf092bm8GwzSueEUSiidEpIo0mQf+Y/zAMp
 h0hl1IlwA+tO1sPA+1ewaPp0DSjHZjvUD7KqnIaNHsixG5Xg4CKPZSkTWLSAyCDYNse8
 B6HQtT8mXQ7H/C9+wRykbG9C9CjlGtpUmQ2E37pQQK4ddfq6HRVJAheB16TIdO5UYAOq
 KbvEP6nJ9MFHPyXiieC9cz2a/t9ZuGCHvjZ+NWv9OhHXQ7HpbSQ837DN/wqxUsTbxLNK
 C2Og==
X-Gm-Message-State: AOAM5328d2auOAhacNJw0byaPsjw3TDSp24jIiW4/FPmqnnyJPqDY++P
 Sh08IJLu3fmu/+cH3c95l3XTNQ==
X-Google-Smtp-Source: ABdhPJxV6YcFFSMlfxvMpuBcJgAY5UI83IJHkfCiAreiXqCZlk03BfOZ0S3nPu/VjSCpvJwFL7amgA==
X-Received: by 2002:a17:902:7001:b0:141:67d3:adc6 with SMTP id
 y1-20020a170902700100b0014167d3adc6mr4509246plk.65.1636436024460; 
 Mon, 08 Nov 2021 21:33:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-cozmo
Date: Tue,  9 Nov 2021 13:33:32 +0800
Message-Id: <20211109053334.1840273-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213345_083536_DE5A96E2 
X-CRM114-Status: UNSURE (   9.84  )
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

Cozmo is known as Acer Chromebook 314 (CB314-2H/CB314-2HT) Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0fa55497b96fd2..7cf0c76cd31006 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -134,6 +134,10 @@ properties:
               - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - description: Google Cozmo (Acer Chromebook 314)
+        items:
+          - const: google,cozmo
+          - const: mediatek,mt8183
       - description: Google Damu (ASUS Chromebook Flip CM3)
         items:
           - const: google,damu
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
