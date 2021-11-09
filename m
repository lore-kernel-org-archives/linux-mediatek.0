Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91D4761107
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91D4761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9QowUO6uInA7N2i+3RYt5VbWCKF3DZ24Z05jBAM95tI=; b=mV5YJsE2PlFUZa
	j66JGNIhRwJQO/ik7ZywLUnE2f4icdF6jk3yAa0+JT0/3Edf+eEesesqIBIRi9VAiUPIWJCWWz9I/
	YPr/Z9hWMviAhaLBFyx41eLvQokDWosgtt4VKlcIykyQP7bACVMEswFzNXMN7qj+XjqKDf+MOz/dc
	XXtVjw2g0wXichZ5Hosri+fogbOWk0oNdjAEQto05qGqL1UdMVmG/rOFfgFdMXpmVa8MxaRhPvOtL
	G6tA7QqZuaA4kSbN80foRzMYkS8R2vI+j9o0qcn+RnaN7C7JlQGNsgbSuqdd5yIuFj7KrNzzuxwXV
	3fdjCFn+cvZHOJNYKQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJnK-000ix0-Jr; Tue, 09 Nov 2021 05:35:42 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlU-000hyW-AK
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id r80so7124877pgr.9
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aGs0imFfCIIi9peSh9xMQNmQGGyfoBu+v5r5spN7t4c=;
 b=lGYZsguWD/fWmd5YVWbJ3Zxt0D/hj/dfFX0T7usV/K5o2FILCYKmQ88Mn5/Jo8TyML
 dWdCl+lyiWNBQPgXnNDvl8q/9Ov0uThCcB7f6MtsHQa9sGukSu+nIfw2LnJU+86tuihK
 W+aIQXWYJne1d1qrMnmH7ECSv5ceb1hlXITHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aGs0imFfCIIi9peSh9xMQNmQGGyfoBu+v5r5spN7t4c=;
 b=nH84RWb0UWBAPrdViJgCvPHvNX4NrqginjYaeILEkectlchnW+Skpx3eJSFgKfPwNk
 mLEH87IGf54seY6TSIgzxEoJzE76/9k39I3uH4ZUTPx0M8w2+xAPydBgEWiwUpdbPHHl
 hHr1QhWuEFmHxJR8yBAWv0G4w3f8yIgdcfOOKItfqblxeoLnxUJtew0JoWjuxbdbmshi
 TGPZlgwS48GWUk3F+i8ichK75qH5/yPy5qVWk0M3SbMzmtwoJiXvbrmcjVdjo/jvDpAX
 j39APYmG+qFbZ13lZmHlk94eB9mI+IZM1D/3w0eMSrJU3L6CL4qdtmta+S1vQIh+smyt
 UQng==
X-Gm-Message-State: AOAM532qpXOwgOg45BwBZpYFd5e71zUYWVArqdU4SIDBAIKIUga6Mr8a
 qZ8a8y3YB3PujhOiNOGSl9dalvRUQVFHSA==
X-Google-Smtp-Source: ABdhPJx7+9wnj4bEO+9tMDgaq7DvX6hC009rYk+EmfpDn1fmzbk4HRcpfqzml/7z5oKx+zl+3YrB+Q==
X-Received: by 2002:a05:6a00:174e:b0:47b:d4d6:3b9e with SMTP id
 j14-20020a056a00174e00b0047bd4d63b9emr5136764pfc.21.1636436027528; 
 Mon, 08 Nov 2021 21:33:47 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:47 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] dt-bindings: arm64: dts: mediatek: Add sku22 for
 mt8183 kakadu board
Date: Tue,  9 Nov 2021 13:33:34 +0800
Message-Id: <20211109053334.1840273-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211109053334.1840273-1-hsinyi@chromium.org>
References: <20211109053334.1840273-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213348_386573_D61E4B9F 
X-CRM114-Status: UNSURE (   9.85  )
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

Add sku22 which uses different audio codec than previous kakadu board.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: fix compatible items matching
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 99e7f8e294cd03..d08f0fcbbe12ae 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -161,8 +161,13 @@ properties:
           - const: mediatek,mt8183
       - description: Google Kakadu (ASUS Chromebook Detachable CM3)
         items:
-          - const: google,kakadu-rev3
-          - const: google,kakadu-rev2
+          - oneOf:
+              - items:
+                  - const: google,kakadu-rev3-sku22
+                  - const: google,kakadu-rev2-sku22
+              - items:
+                  - const: google,kakadu-rev3
+                  - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
       - description: Google Kappa (HP Chromebook 11a)
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
