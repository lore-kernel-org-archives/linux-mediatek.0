Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E27C05023
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=; b=cO1WW6bPwceOsjC2qL6CbQdUeB
	QIdjvjYvadpE6dcdzZxcSCL4Pp8+MeIqFnaI/to0Mls2TWdH1DbysUtKI8IaDVeeyEUDdH9JPzHom
	i5I4zdOr4Ba+CvhBauAm1/KhYIx2pvU9t19RnQUC3j5311HvuKgXJRmAOfxA2rT6spWh9zY6RPv6K
	97N/zJ9/gFLay5ulgVUPuWxul3m7a+N7cPLjBX5ojizTyZ/pGXU6pYvtpEO3P1fiA0oCHw3ssEiUA
	smkRglLe0XTfgM+iZvj9jDOgw5U71oLCk8lr2GvQTgAO6Yc+5pKXK604unSPMHYAnaKkJI9m25GEn
	0Eez5geg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSaK-00000002Yxj-2Kis;
	Thu, 18 Apr 2024 14:17:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZz-00000002YkP-3WhT
	for linux-mediatek@bombadil.infradead.org;
	Thu, 18 Apr 2024 14:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=; b=HSC5U7W929IeYJX/k7k4vue0xu
	Mr7+xHjIHlzsoFNDovzFLp3f4dDlyPeJr2xuRg2HWYnXcan2exqAkis/qZX4N0sWmg4hrvP2zJbJM
	4mKbUhHe6ugeXtRcFzHGyr0bq7pKcnxGs4kzd1vFM2ovFxHjjDU6PpY4NAemQDCsSPLi4ayYALYzK
	ZeTXzqO3KDnDjqdFoI0zMdkYzcMb7oRlBUEBkqruvgEcSr+qpHRjjfAGFLh3Jkzt37E9TxySnRAwX
	It4ff3Sx8VVIa4meeBKSM73oImFdOCH+iwR92lcnpi4L/nBm+konbqHuHGwAIpTs1LwqBNDHiXhUM
	Z/gP7EUA==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSZm-0000000C266-3cBB
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:34 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-418c0d83d18so6902805e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449841; x=1714054641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=;
        b=LRiUdtktexCzFGui12jOdy4/iq5NmbdQYjNQkuQd5lm5vTJBItZ5JJlirV6CfRg38f
         gHLgb2Kg0LUvAwjPqpKp6lR1c4mBSAkPDSKmq9IVyTvrduVskt5rfYi8Ehz9KKaYeQ7w
         GarzTCW32eMTfA4fHhbNJXw7DEBnGrqV6x0nlcu2Ewxax3sdR7b2hHoHriFsl/Mq49ZO
         7m9dRTKzRod6iXk3ylgeM31HEErf2qIyddcVDD4PPoq8LccHEdv26Xj5RCJx9kqrTZnR
         hRpcBzIFi8m+i1G3TMzZlfwW7YnjiO3LXm0KyCqXQ53eQupbsFSJX7x2AuUrjigL2Oq9
         E/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449841; x=1714054641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A95n4qk+OzmeppmcDHJlgcxg2vp1t9jUT+VVZ3XCGv8=;
        b=wkrYzxZyH0UM+vUOgrGPKQu2QwwzYlQa1PWTxSeq4wdQnR7zhGHfKaOY7t3q5xLFE5
         ot7kfWZOkzr/fvKqHw9+VDRNa1P0J6/3E77HSH5hhlE4RP6Ik1ensIE107/HqRAyWfI9
         QkEyWrqGdKhqbDlfjibsX3I2Tfugz9vYQUD5zAkqhQ+xvgIOVKNbU3sDkfRRzHfiwJ8j
         Wgk//JGldLgAWwjUACkHZMycGyNzZycwVU3q/ecrtPAASeUYf0Zk2oCOB8mR+X67Ep5g
         CkTcXALlRDvD1Uk2Q+luTs3XoMg6EXRpgi2G3KFD9ERwHBfkQwVob/y0l+cq6bfa08zP
         uttw==
X-Forwarded-Encrypted: i=1; AJvYcCXHv8oB8rJ/AMZpJYgwFXC4jFNXi1rnNR3iBpBFcIqzOHrOmWyBUTBa1E081BprE7PPaieogeZOJOPU3obkaQEpOBYnMNa/DpO2HtzlwJlXUtVf
X-Gm-Message-State: AOJu0YyjLPN5wNnJTYblUybx/0mAuOKQebSMDq/SR/XcmX6dN8b7e2nb
	Uw86I15HPRPqt/j+CWJ3LyUrElxvanq/tuw1JbcWua6FuJl0/0OM43HsZaYEI30=
X-Google-Smtp-Source: AGHT+IF4YULCsvWkwwwfg53QmQuiwnTv5bGuVI1fQmXCyyYK/3/4b6rzPvnr3zpMfDOh+P6uhyoMDA==
X-Received: by 2002:a05:600c:1d01:b0:418:f991:70f3 with SMTP id l1-20020a05600c1d0100b00418f99170f3mr368992wms.8.1713449841187;
        Thu, 18 Apr 2024 07:17:21 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:55 +0200
Subject: [PATCH v3 07/17] dt-bindings: display: mediatek: dpi: add
 compatible for MT8365
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-7-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=RqJmpnpajyvLw+L+E8GifAX8vmrSQx9ohtd5V3Opzk8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiiccS2/CHLvgvZSrpjPICthqNkoAqRcoDoW6S
 2gSyudmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURdNjD/
 9SlFNusJrPYkweUcHXLeozsIQWKFiZuo/9SIS9nySjCqGVF4stQP8TvKOQV2Hr556zdgKw52kw3ujV
 aa6XgY5nxnsuWanKvXkY6T1niKytAaHsN/rK/vt98+AumfpMLwc7pIhQ5XrwglNUx7PqMDK0UYx/ND
 BlFmdZcgbaXm6HY7SqZ1d/oidoqhDa4Wr+d+fLwiUJPC5qJ9rWkBAVJ5FuXD0rGVBbu9m+M7JG0+uw
 4b1c6n/GyfiDCOLCg6+aTgkVbzsjNxCVihXU9YI6B7QwHBfbYQECzhzopCcsRuwJckIR677Hpenj18
 7LbZwmbNBREmKXmfMCuB7AJIgaDK8eQp9sw28TxKUQwuyfGCRcGqYREcImDOGW0FmxdLD4b9Ot81eN
 /g8hlHrHs3nBgUBIIGcswvCj9oDqnkiF8Dvp2GU0Vkzn11iduL4bvivgYs0qIH8b2Z9vvK9s2BKdAm
 KiPQsS3+kUDnWgi4Mz7blpAttddVstOVX/DLRLJlsh8p+wuSxPQr0l0WvwervVe4+2ZGDbSAOE+aRP
 mkgoC1/LfOKKXNsGyHRoBguRRlX1+eRDO7PbNVWkxIGLESQOgKXpfkXpiX8VDlRQ2aTuEENrXN+ISu
 mUjkNdi1VEJcnQRE3vs3PzRbDQi7gBh3Vjaj2Kmwy9AfCJ5QYl98CcN6XBfQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_151723_178228_7725274B 
X-CRM114-Status: UNSURE (   8.41  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add dt-binding documentation of dpi for MediaTek MT8365 SoC.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index e126486e8eac..75d0caa4ccdc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -31,6 +31,10 @@ properties:
           - enum:
               - mediatek,mt6795-dpi
           - const: mediatek,mt8183-dpi
+      - items:
+          - enum:
+              - mediatek,mt8365-dpi
+          - const: mediatek,mt8192-dpi
 
   reg:
     maxItems: 1

-- 
2.25.1


