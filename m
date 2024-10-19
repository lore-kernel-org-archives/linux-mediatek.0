Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D879CD3C547
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 05:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cJNuS83mrwWL8W8iH3SFWUNmmnjimhgt4bHtgaT67XI=; b=lxvjUPW9n1xBtt
	ddE9vtCngkLlhgl+5ma5BvFymdJd7Xce673ClkYfGq4AkVmY/JIlf+vObgnwOvL/JRzyTifD3gKO7
	EQK1UZrXZSJcjEJVisyJsZmNPjqn8WnoD/FLdrkaQNMnO6A4fQ13b6KoxCy1TziOAl6TbUUQDrFml
	L+oY40tcaBjYx3Hv5uxiR8fJ8tK4i3UE9vhPhgSMeYEh1pVhSn9OCDpX4RsfbvfDIN9hN6JhoKAbS
	tEv0fLRZyn38uC+fgnGPsDTvsXByjaViyj/HeCfQdDPajYtGhRhe4wQO+wfz6DwuQTj/qhPRuu2a1
	d505ltOVd4hMyxHmS/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t222X-00000002apl-2FAs;
	Sat, 19 Oct 2024 05:30:13 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t222U-00000002aoi-0vBm
	for linux-mediatek@lists.infradead.org;
	Sat, 19 Oct 2024 05:30:11 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ea8de14848so2073274a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 22:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729315809; x=1729920609; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cJNuS83mrwWL8W8iH3SFWUNmmnjimhgt4bHtgaT67XI=;
        b=LqN0Uaq7CKKrt/7yx/ncIVcgiE+hbtVXbvDwdKrOwprpQnj7AvfJ3/z03IPmCi6WRV
         +7UU5CzgWjUVTlhkyLFvbcIrNaRFM4rNWFdNJ+Zkcc9LelQQdP0xf6b1fDtyQxeZUeAr
         t0GpPl4ERWFoo3pPNQyeA8yO0WT4rFZ86nyhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729315809; x=1729920609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJNuS83mrwWL8W8iH3SFWUNmmnjimhgt4bHtgaT67XI=;
        b=o2QoE9mYXwLW7cyUQnEA44wjKdSzAOBfrb0M06E4Qfo/F8I1kLPyyBzMmhxBQM3e+X
         0EpO+Ttn/YFelhXL0ZG85iKSUGDoVQ7022yyawB5EyT2HGTIttepgpxS3WVQ2cW4Ls6H
         b/vnu7d32Mn1ywosWi9xFXf/lPshv24tStdnbLJe1T+CKQx/gubXu4YkYtgyBvOEt/vq
         Uo4JvccDPpg32cjZBYc+g3VRr9amQ7TRHu7+VSgGMYfAMKFGFWAvFp2R3Amp0v7QiWj3
         46fvVXgaFNMqZZbcDNKbLz55/1HJHP9oaCwOwuO8OsmFC6u2k9kJZ6ZiPIIbjiDZFX6s
         zC9g==
X-Forwarded-Encrypted: i=1; AJvYcCV92EfPLkTs97G9edpVjY9Mp+u+CuValSQDNOw70hnmTweO5GXO0JRLfdW/IOLdrSp8ZgsM2Pn24dOcudXtyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3HXjQ1ntCKID4e6sETWjh9p/ZmCZ6/BnihLNlmiXO6B23NiNN
	4emwwilkbH2Bt7gTJpCza1RBF4duC2aVRmd+8uuvUZb8gX+jO5LP/3cyL2cBdQ==
X-Google-Smtp-Source: AGHT+IH7n9UXYo5nlALMpZiRBbTQ8pp4m9cx7aacSoU54soAc/R6mjW8EzAU5xHiakUlodnb2D1f8Q==
X-Received: by 2002:a05:6a21:458a:b0:1d7:118a:327b with SMTP id adf61e73a8af0-1d92c4a1d2emr6720501637.9.1729315808788;
        Fri, 18 Oct 2024 22:30:08 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:baba:fa50:ff3b:337])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea333bea3sm2370438b3a.57.2024.10.18.22.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 22:30:08 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] dt-bindings: display: mediatek: dpi: Update device list with power-domains
Date: Sat, 19 Oct 2024 13:26:56 +0800
Message-ID: <20241019052935.553886-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_223010_416061_8B1A7010 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two kinds of MediaTek DPI devices in the tree: the ones with a
power domain and those without (or missing). The former are the majority
and are more common in newer DTs. Only three older DTs fall into the
latter category: MT2701, MT7623 and MT8192.

However, the current binding only allows particular DPI devices to have
power domains, which results in spurious binding check errors against
existing and new DTs.

Instead of diligently maintaining the allowed list, let's do it the
other way around - create an exception list for devices that are fine
not specifying a power domain. This list is expected to be fixed, and it
encourages new MTK DPI devices to describe their power domain whenever
possible; if not, those should be listed with proper rationale.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../bindings/display/mediatek/mediatek,dpi.yaml   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 3a82aec9021c..c464642bbfb6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -81,14 +81,13 @@ required:
 
 allOf:
   - if:
-      not:
-        properties:
-          compatible:
-            contains:
-              enum:
-                - mediatek,mt6795-dpi
-                - mediatek,mt8173-dpi
-                - mediatek,mt8186-dpi
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt2701-dpi
+              - mediatek,mt7623-dpi
+              - mediatek,mt8192-dpi
     then:
       properties:
         power-domains: false
-- 
2.47.0.rc1.288.g06298d1525-goog


