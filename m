Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E256CC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:14:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88529619C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88529619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eqDIqIwUz8G2lcNSRn8Q7+v7LumGGlO5RbSQ7bYUOoM=; b=WoVAhprkZTFpNC5k5cezrkgvw
	Br2NVgTzzUfQs9HYwEjQF8dmvAGw3cWCKOLIB+n3kf2Jqfy9tNU54J+3zT9+mMYguosj20WB/dOCR
	1LwWtobGYcpUoR8J6K5cklYKYLPGBDYcq5B2Tjq27jAIaZM5WsqYqAHif3y/n8ux/+gvvpo335oH0
	eY8i9Ihl8JXTucGAIsYRhr/WC/wYnZoGjyKaNXemjJFl01Z0jNr7oNn2bbuydnCdoODTfiqNRvBYo
	AToGISK2hiqS6y/oLfiq6Kl5eHJHFdiuZffi7mZ0LUy52s2MHgESsuQ9YGG0/+kJ7a1t63OIS88Hn
	CaWpqgUJA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWvg-0064zo-Sd; Wed, 31 Mar 2021 09:14:25 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWv1-0064rA-TF
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 09:13:46 +0000
Received: by mail-pj1-x1031.google.com with SMTP id t18so9176930pjs.3
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 02:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Pz7Z5j8vF+y9QTZ6X6Ijd3UIKgXWavlXGezKvBp98zM=;
 b=QWSpZAyLCBFJZFXGbCObt6VVs2FSJdJUhL5c0D1d2UxZenJ89hmjkumKRnBZGN19EM
 7DneS120Kl+QHDfW4abWa/rWiYbW8sCPZyS/RgiZVWiYFD/gLqNtIKTc1F4nJ/CCSrRv
 UI06ShdtNRTRY/YXA1cFX28GfNbTyUvP9GCew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pz7Z5j8vF+y9QTZ6X6Ijd3UIKgXWavlXGezKvBp98zM=;
 b=q+uiGPd7rjbf73PNlxAKr4PEqF4rdNoFS+D4ta5jyBa/F/kxKQfWb9DEGNsE4EVbY+
 WzTJ3vb4amSdDr7q3S0rn0BEo9tVZp6YzgJ3TpxEXe4w7gdhYJ/bTea300mg6DaqPAQd
 IQP8Mey6ra3dLrOY/+cWZjJnJRaFSPFydpXPffNFxgHylwsRzvhr/NieIsZzJrwXncAF
 tWSu7pmvgFNKSIBeubt6Nk9rYkIYKOJbIJWYsq4QjUsKnkD8zeLBmTLbRW+DDAtzSjap
 3je6YMrPQwYkfO62XYDonJ4eERSwQAzE7PKVAkwkT972/OCv/4WhSDexKDP0ay69kDwm
 h/1w==
X-Gm-Message-State: AOAM533XB76JXMa8cpcV7gbMWYOBZEY0tL0rtifsKGR7I2gMr3y4hwZS
 ri5pwPNdvTFp1lwcFeKtaHHDoA==
X-Google-Smtp-Source: ABdhPJxGkCKZMCI4i/E1qaOe7U/FYbvm4Fs3hB9UQ3N4UPc+0s6R0VJ/mkrP9+mKkF1E+o67YCeLxw==
X-Received: by 2002:a17:90a:6c22:: with SMTP id
 x31mr2583500pjj.213.1617182013867; 
 Wed, 31 Mar 2021 02:13:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:85fc:9f25:6293:28f1])
 by smtp.gmail.com with ESMTPSA id s7sm1484723pjr.18.2021.03.31.02.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:13:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/4] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kodama
Date: Wed, 31 Mar 2021 17:13:25 +0800
Message-Id: <20210331091327.1198529-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
In-Reply-To: <20210331091327.1198529-1-hsinyi@chromium.org>
References: <20210331091327.1198529-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_101344_402859_28EE8EB3 
X-CRM114-Status: UNSURE (   8.89  )
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

Kodama is also known as Lenovo 10e Chromebook Tablet.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 9774f44b51d9..c6ecb510d372 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,15 @@ properties:
           - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
+      - description: Google Kodama (Lenovo 10e Chromebook Tablet)
+        items:
+          - enum:
+              - google,kodama-sku16
+              - google,kodama-sku272
+              - google,kodama-sku288
+              - google,kodama-sku32
+          - const: google,kodama
+          - const: mediatek,mt8183
 
 
 additionalProperties: true
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
