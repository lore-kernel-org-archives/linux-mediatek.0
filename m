Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E267C41513
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 21:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=brMOoyRcmQ5W7Ic7tEkLMb8OY3+MtSi2g93xfzfzyoU=; b=F+xPcQE+Bs4l/GSBB0NcwJX4F5
	qOZ96m1VO8Xd1qudvU6tdaP4twPXVZHOSnzprKzZ2dqPIyhGwtF+x/xFDOeyWwnny5UdHDgfEByNP
	B25BYK7A7rGsHnnEHn1qqLDj6frpR32qZ7gi3uJy2i8Bn/BQpJgtTbEchRsoxhIKljTFZNomsKSPX
	5Vu35OsNwTE1g6kMv2j8nac40281/q+GgwGSQ19Me/ap2g9XE9ik9H48kwl5ScL3pOz4c17/1rXwC
	Q9z8kV3r1Tx6wy9OD798lsUeYUGUSdMxMUoNYbZ67Y3jEBMtlLLxD38F0HrOafwR1wIavsdyepsFo
	4hBEraZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLm-0000000AnMY-0xup;
	Sat, 18 May 2024 21:12:18 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8RLh-0000000AnIE-3HOL
	for linux-mediatek@lists.infradead.org;
	Sat, 18 May 2024 21:12:16 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2e2c70f0c97so20967491fa.0
        for <linux-mediatek@lists.infradead.org>; Sat, 18 May 2024 14:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716066723; x=1716671523; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=brMOoyRcmQ5W7Ic7tEkLMb8OY3+MtSi2g93xfzfzyoU=;
        b=WRVmBFYBeIapdio2a+mm5lqt1BY5gBDyAEHHbj8BE4AcGW2ovS/Nd+HPl6ZmzKp8GA
         Jv0pve98TFvkdGPEYJjZeKxG5K8oIy/wh8eDPF8o7U9PayTngQcOfZzqNKTghkjxWafe
         ZskV3hMSv2xnytfl3JmtuYzFnNXPBoWzYh0dzwtTeDEaXvr06QHuQctqVp5HPGMswrCy
         a4EW6qEHvDiCBK7inImW/6OBxaZ+AEb8wCdTYOVabLwZpvYwD2Fq3xi51vJDpIQ9TQev
         5Sl4a7ty8J0qxwupgagnXWyDqJoJai6MG9JF56n+hWfozcl6tvo6pLnufUvz4Ex1X27j
         0aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716066723; x=1716671523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=brMOoyRcmQ5W7Ic7tEkLMb8OY3+MtSi2g93xfzfzyoU=;
        b=kxhsPFlEqjTC8fVRBk+kvKIJ0R3ziFrii7q6vrz94rxZsIVjnW00LPfnbD6Ive4kH2
         /3u6qBFX9Z/YL9sAs1LyMC/FFLXpHjCJnL1LILgRLLG/3hyJy5IgfeG6ffjX4pJOHLWv
         nWh35+f94gEVRp7BAHb/GA0qDrJEYzG12KwwTZgS1NaSFb8zTRDsvhRxXntu1P7+rsoW
         EWIH46WVnQK59xLtOtRA0GWcvwY8RDj+t111gtD68QGIORSUGEc/Df1kNDDckkYm4mhK
         A3OOPvBqNVo5qUgMP2Ctx1Lrg6BTQuJN/nbMQRVfoNXwxT4qcix2G/IBEVFBC4BsS4+9
         4PSw==
X-Forwarded-Encrypted: i=1; AJvYcCWvpgCZfeBvSqsXhIjnqJ4XJxGDZH3Hmrx0G5yJbe5+DuZc3dIB4HniDObKO3QkiT/P3l3pkgs3h19gNJcClsASYP3aIMSWCpCtRhme/udJffeP
X-Gm-Message-State: AOJu0YwWH9Y/2BA0zN52y6NxLj6JS7Qxp2hb4yii2LZ1eCqHVbKBTIs6
	6icec6+3QYPD+HBs8hbak9W/1a7JoEQBfeuaVCSLvCZYoHnGZrDbIyut2u0Zl0A=
X-Google-Smtp-Source: AGHT+IHcZoP6Of5YY+498D+2p+mQKWV47GgZqqRIdg7kVoGGBD308008Ffbm9x3P/U7/JXkzTx3MfA==
X-Received: by 2002:a2e:be9c:0:b0:2dc:b04b:b3c0 with SMTP id 38308e7fff4ca-2e51fe52160mr207086061fa.6.1716066722853;
        Sat, 18 May 2024 14:12:02 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c323d3asm13151340a12.90.2024.05.18.14.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 May 2024 14:12:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	MandyJH Liu <mandyjh.liu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] dt-bindings: mfd: mediatek,mt8195-scpsys: add mediatek,mt8365-scpsys
Date: Sat, 18 May 2024 23:11:56 +0200
Message-ID: <20240518211159.142920-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_141213_963939_C924E676 
X-CRM114-Status: UNSURE (   9.30  )
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

Add a new mediatek,mt8365-scpsys compatible, for the SCPSYS syscon block
having power controller.  Previously the DTS was re-using SYSCFG
compatible, but that does not seem right, because SYSCFG does not have
children.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index c8c4812fffe2..1aa27d14145b 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt8186-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
+          - mediatek,mt8365-scpsys
       - const: syscon
       - const: simple-mfd
 
-- 
2.43.0


