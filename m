Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F88AC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:08:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007B961430
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:08:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007B961430
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DtW6Yo4whBx35PB7A2M1ZZFykqV3H8Qb5rnu60oSI6Y=; b=BMGkm9xykypVJhjy50NtYt9Nq
	Sa1WERn8Fz8i/d+Eacmy4vRwt54G1JCckw+GKrTs9ys/EJpV+yB5gKXb7KwXeL2nKTOv177bo5LGt
	w1uqHtdYYGRLXN8Fmth60I86phv5dLZ448fZfKdAZPZ8QEj0gUsh9pPpGG5wyjFfM133ld0pTWAxe
	ZKdTlL+liui09JYy1dvA8pEZdL80CVLYm+5R+cxOxBlPMfXXVrwcOU6buIRjgJSmiETcwDD+GGYL7
	QHds9V99nCo5CQIHj3uzTmg7x4W5QWn1xalVcCbeS2FxDgWiQ57Z/aTyRR/ActFnvXZ83sYBiY5l7
	jCpUqsVpw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8ps-00E3GH-9Q; Wed, 21 Apr 2021 09:07:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oP-00E2wN-6E
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=U8i9idWnh+BD1DYDC6CSI0oIABZbK1MeOIQZQDmArxc=; b=MqoiWVwaqDexPFy1WRqxgANzkI
 zOQjF2HuGQbNPMRjREQAuLysTgykqCDMn7FdDhFsJ7tmsRhJOrg6gMgI5It2LY1HohPAjsFO9/YUX
 0I385oZjjdmuHfKrop3sB9IHM+zPqSdYzVS1aT3jWufwNSeqzWv60cpySo5x3VTkYpe9K3+HTdU+H
 nGVb75MSo41g1keRljUY+MDvJ/NcOsnkr8bWurtiuv4bdsJLH8fprsWxmB+1DTeCZJJm+y+yos8On
 A/+a84C5+T1cWGmtUd7EVHH4SjAr+KTyq9SE9+IAGMERb/IpMYaWftYK9+t/VVb/kFGnEow1QyM+y
 jT5TlG0w==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oK-00Cjf5-5L
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:20 +0000
Received: by mail-pg1-x533.google.com with SMTP id b17so29179531pgh.7
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U8i9idWnh+BD1DYDC6CSI0oIABZbK1MeOIQZQDmArxc=;
 b=hZw21nzEZdpWlGnoJDYd5HTnoHj7KkGKzv9Dk9lTjwvjroxprvopNc2lxsq8Ao6e7+
 CdQjrIgZ9GudWXggHppkpO1I9UwO+DDeI9EKjZyF0Y6Q9Bg3Q0eiPsBqhovqrsmFCEXw
 8UMrTqnHqI8LG14F2fB+ne0qUvOmPyL5mE7/0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U8i9idWnh+BD1DYDC6CSI0oIABZbK1MeOIQZQDmArxc=;
 b=GrPsRO3TKx7RKrMI2FU5fu5d8muBqgCSDVeI3YLlNMf8zzqOk6w9xHp6wqK4kEw6iz
 5ueI9fi2rnJQYCkZe/o0/JLXZdtuDmk+xOh45ogdhMLqX2SI7po7o9fmtMu2DM0+Xb0K
 YJoYf+h4YQrznQuEJGMM2EhQLVY8cgWM0xTsP+b9elvOdsCh3zm0XP0Fcx9Ree6+SH3C
 Sb3Zb94JKnTtXehYlAeDLnfyiNcHLlBZQGS4skhS6jMq1x3kjuUnQq9+2vzJI3z+AcG/
 NYu4YRBboXT1QBxIOdc9XXj7BX/rul2FxVEh0IqpxPcXgUVDD8HCef9aKFtiX/n+cZwL
 2qJA==
X-Gm-Message-State: AOAM530UZGOvEyRPM/2AUsq2DbP+pGPCLikVXZdr9oii6S4e5/Pn6iVx
 5DEljLLmRSIPS4uKdcuJ8yUUxw==
X-Google-Smtp-Source: ABdhPJzdaAjg/Z2Kn+80seKFBzKGWgdCYEiVirKKj44Q5A2AMjLk79uUikTaaaV2NMk1VN8qT5+0Lw==
X-Received: by 2002:aa7:80c1:0:b029:262:ab5f:adc5 with SMTP id
 a1-20020aa780c10000b0290262ab5fadc5mr9521262pfn.60.1618995975224; 
 Wed, 21 Apr 2021 02:06:15 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:14 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 05/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-fennel
Date: Wed, 21 Apr 2021 17:05:56 +0800
Message-Id: <20210421090601.730744-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020616_219655_831F8CA7 
X-CRM114-Status: UNSURE (   9.71  )
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

Fennel is known as Lenovo IdeaPad Flex 3 Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 7afd01aad964..80a05f6fee85 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -137,6 +137,14 @@ properties:
         items:
           - const: google,damu
           - const: mediatek,mt8183
+      - description: Google Fennel (Lenovo IdeaPad 3 Chromebook)
+        items:
+          - enum:
+              - google,fennel-sku0
+              - google,fennel-sku1
+              - google,fennel-sku6
+          - const: google,fennel
+          - const: mediatek,mt8183
       - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
         items:
           - enum:
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
