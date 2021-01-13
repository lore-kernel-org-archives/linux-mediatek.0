Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81647C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:05:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0E222A83
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0E222A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=it909XlD6ESj4gMzxPg64BNpilljAODGTAuiZM+1uqg=; b=RFnrpCxj5+b6Sk81FVm6tWhQE
	p2s1w75qVp6T4Tjc3zPF8nq7XJtopV2yd9BZGeqSRIPF9kLpxgpt4Y4xgb+PyNVgNzsDgkk82mnUC
	ngCWTuLvBtbDXptvj/y+hXNN/BGglgEx3dENSCJx7ydvlf+Nvpb5Ug7xqLQfQgGuMTh1jp2AAsAJI
	Feisos0skJJzmeO44l7PmpZNNtH7Z43dmUiqS/m/Cujg7EwiefbQTfFAX1TwNi86qz+kS/opYDBAZ
	NJwHVtdZFVLkfeQO79Jhvv48f5lwLCJVUOr1PDZ++nKczW8mnyN3v3J9Y3fBkWcuHyUCqIu//HC2y
	007VpVpNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdxX-0005FZ-D5; Wed, 13 Jan 2021 11:05:03 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdxS-00058F-8J
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 11:05:00 +0000
Received: by mail-pg1-x532.google.com with SMTP id n10so1258384pgl.10
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 03:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLHbOXH4nbuBN6h6p0MVX+joNFlUG/98KAoeMAkYOnw=;
 b=PS2Yd6r9tWcUr03Sq0GLtVUZ9p4vz58fFMZK2kbTV8ie8SWmf/zmMkJRNHB+dPeMTc
 Ipy6RcRlujAnAU9ll4E2BWxvhUIMU5eHHDqrhTsUQCbYufTXlu+ZvROEUkqs538UilZG
 cLmw2Fsx63WmQdnQ4Q/c+tioZyf/eo6nVzQxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLHbOXH4nbuBN6h6p0MVX+joNFlUG/98KAoeMAkYOnw=;
 b=cccw8726i6LnMhLmaB/XlnJLcB2HGfkJL1NC6qzYt5v4Gb8ljpBfm91iMwohkMwDoi
 8edgLmNI0z108hXp1GQRNG2Mk+DQk6OBo8zsbv5pFEwLEd0EP4e9t2jeMW/ly9UlNh4P
 JwYndPOnrRmq7ucYx1dShlCnzvX39GuekrHzl2S6g7vY4SjOT/OcVzqcI1qPECHSjTRW
 j97KClJqoXE391er1AthcmAGLrnHmvxHW9ntVZnkvFzH7KOBT0PjRlmThOVJ2phQdWB/
 kfPt4jVKlHiksN329NfOGtnlVO7M7JhZzu3cVNZxTEbrkGFC8BOhM84yJfgxmBpf3uoR
 POrg==
X-Gm-Message-State: AOAM5326/juingPJ8+QsL1BO6GWqK3OQvWcmdjiKxmp6QqhfI4LQplsL
 0QoO0UoUvvCB/jjNSahAb6q+3A==
X-Google-Smtp-Source: ABdhPJy1Nmtvwm+ysoYiBbZxGn74kio6/JJQD7aH5m5K32k4tpZ9j2MayfbF+D31+2yPw/Sy9hZjTw==
X-Received: by 2002:a65:5b47:: with SMTP id y7mr1562711pgr.221.1610535895946; 
 Wed, 13 Jan 2021 03:04:55 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id o129sm2114749pfg.66.2021.01.13.03.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 03:04:55 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/3] dt-bindings: arm64: dts: mediatek: Add krane sku0
Date: Wed, 13 Jan 2021 19:04:03 +0800
Message-Id: <20210113110400.616319-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113110400.616319-1-hsinyi@chromium.org>
References: <20210113110400.616319-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_060458_342002_5D7248CE 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Krane-sku0 is similar to krane-sku176 but using a different panel
source.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 53f0d4e3ea982..93b3bdf6eaeb7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -120,7 +120,9 @@ properties:
           - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
-          - const: google,krane-sku176
+          - enum:
+              - google,krane-sku0
+              - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
 
-- 
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
