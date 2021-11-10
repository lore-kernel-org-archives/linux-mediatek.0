Return-Path: <SRS0=x/8t=P5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4191C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 813F260F6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Nov 2021 06:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 813F260F6E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8irSapryZWgf28Jy+KXL4FwBHEE1nraBeN3pwfZlroI=; b=BXyt8DTOCwDmso
	XghfodgHor3MSyJKtaS0cnUodhR9IcZsIPP1QRMCz4LptY9UdZuasCglcX5zghTexDCdtwoCly8fc
	JHqec43LC4aB3r6Af7jhjalUyso0og5+1ysD/TQmAZusiJTd7eT9UQMA9ed8ul1wCRLRjrlZ3BW43
	nr/lWniUa3FxwPbOBrApFyzHGL0cLU88sU1hpg07Ev9tK28E4nIAUVeh/AqDqAT/PKPJs/kDKud8B
	N37CLqFbih+EL8VNwssgVc++VRSIjW9LoF1ERThT07+AlE4JmqLRAleM4RA6JCVGStCrR4QFOC54E
	JihZWmkqunNVx56LLkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkh9f-004Zqh-WF; Wed, 10 Nov 2021 06:32:20 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkh8r-004ZTd-HI
 for linux-mediatek@lists.infradead.org; Wed, 10 Nov 2021 06:31:30 +0000
Received: by mail-pg1-x52b.google.com with SMTP id q126so1328292pgq.13
 for <linux-mediatek@lists.infradead.org>; Tue, 09 Nov 2021 22:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=XHheJmSpYLVQSr3R4rxKaf5taYQBD0bYs1rjkecMNt0qVAN0Ew+VJCgsfYBLeFjOT1
 zAfcGf9/NzWjxww35M5fSyXsEcQnYuxh+qgmuOhSUYBSrnZ7LPT9GLQXZW1g6Z5xjQa7
 zsc0h9a1O+7zMrHQQwlL29Hd+5YPCxouHsz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=57FmUMuUa69FpXrWP0JD1fRD1ixeKtbq2gZUFF9Bvmf83H/d3PvtXkqQOPkrP7kVlg
 5UaFOcSIh2WS4NUkgDpb79doyVLLDt9FAunskXkYhwoeRP0kf3D5lZFi9P4ZsCwVXsWT
 mNvSgneoLi0Mc4bVBpC5IVlZX2lIQkSaCjmBeBY8+z6dQJFRte51cX7IE2n1WPqPu7mR
 fvTmBwRGYDKAla1bzznWgN+x1Ke+UJ6ep+T5UR0jwQsdo4qCgnkzxPromG/ozqzXrV56
 ASaAJHT6SG3wIVtFchQYVOsfwrDCh6fujDQREYX6Y8QefztBhs3T5+NxblquDnSQBelU
 1Juw==
X-Gm-Message-State: AOAM532zApi/08lwNXJBPuWQ0QZlTRsO+9YGJcEfsFaNdES0shXJV79S
 luBD+XhXqj/UpJfz5sAWrCSZ3w==
X-Google-Smtp-Source: ABdhPJyGjFC2Sh8vaHJGhq+5Jw4jMiG6OxOmugcVKfn7mui/GLCO5k7lMCWwoeNTqLpMdAptVvaqRQ==
X-Received: by 2002:a63:dc0d:: with SMTP id s13mr10597486pgg.254.1636525888877; 
 Tue, 09 Nov 2021 22:31:28 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6886:f712:1a79:e3d9])
 by smtp.gmail.com with ESMTPSA id w1sm15623959pgb.50.2021.11.09.22.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 22:31:28 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-cozmo
Date: Wed, 10 Nov 2021 14:31:16 +0800
Message-Id: <20211110063118.3412564-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211110063118.3412564-1-hsinyi@chromium.org>
References: <20211110063118.3412564-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_223129_643760_3D94AD21 
X-CRM114-Status: UNSURE (   9.78  )
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
