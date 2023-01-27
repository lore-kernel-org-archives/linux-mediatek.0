Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E39AC54EAA
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jan 2023 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=; b=1r5q3xBemp4YtG+JBrk2MwR6+j
	/mVX/A/SZpFxPR6xf7txCpc6AUmxTh4kYvR5Yz3Kp1h9aWg03UcALftNnuyjMVq5NSlkMXDO+QKIH
	j8iwvNRp20BCn8SFG4u2EPvB4AJbjlO88kYSqUD7ZWmBuKJ0OAcNIAOXDtASG4hN9y4JK9vfA6Ckr
	ffYkjIWqzCSVTTlwv84W6w9ipKMLmfrptBl4GMYMODFeUjtl6XK3Z+H4hEbANLvnUk0EvslrmFMvH
	SL25PoCA9r7DP+7lu38YM1V9iH4O7sjaGOwl8EzRa73xPgZVkr8xdt2t/vYISyZwB9HIR7G1PDILB
	i1ImnP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLRPY-00Fcso-Fl; Fri, 27 Jan 2023 16:17:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLROn-00FcZA-Lx
	for linux-mediatek@lists.infradead.org; Fri, 27 Jan 2023 16:16:25 +0000
Received: by mail-wm1-x333.google.com with SMTP id k16so3819814wms.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Jan 2023 08:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=FBohCa2b8WdTVp7MGVRDS3dLRaOrbrBi2uuIZf966p4bOyGhSJrUVBkAnB6x53m/tg
         VFV5p3BR5QIP0KDyXiuxRd9nI/A8W2Wwjl0p5aVV1a5catHDsxLcXVznB40owoyHVpsH
         7B4RzoNfs1IBKgCCtaya/LHcJSdk3M/U61O5XwOxlFBSJaYrn7XkbngYgHEhVIJl7byF
         7s3j7P7nw7jNa5Vvnd2v+0z2gn+1rKfozE6NFBAixu+f4ELSkxL5qH/2vp29jjr2yM/w
         jjvsgLCRzXAh2gEBTID1HnBUIegUbh/AfMrR0jLG3se0tuPvIcmyW5JoM/m2VvQiKlIU
         K0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Uam+EfbMJvYSMYj1PNEm4eMKYS9JSHriCql+8aR0/Y=;
        b=UttLYMawqFJZqlY/QyaUDAr28HoUhPSo1AGtQcfG6W2UwBm2MqokO0tETqIXIhIw1Q
         CtekysEv1qaOB2vLijhPxZTFl30O+SnzMA0t+IB9sVpLiabWlJHQyIUvkufoU7prtHmu
         8/gcXZsygN4pkH7l4nCzz2b15L6hjy5iyRUOwT4bTzisn1ck+qdeuQDEEKeoEzohsbwO
         Sx05kh0uqlb8vywtsazAv8KE7/jFA17vqeC3kvdoD6jyHadfa1SqxTj9WulPEaDE6nvR
         Rk5hg6ilsLiOkE+9wd2T2N1GqxYGrSpdGe/H3jW7n6L6MqvTdD863r19LTE2gbDJp58i
         PhPA==
X-Gm-Message-State: AO0yUKW0j5K4xXAMVarRYQEmFlmNQbJSvjxq60/9ZgUEyQnsIQ36OONG
	UOLqnua8S/MfYemYkyditnetOQ==
X-Google-Smtp-Source: AK7set9Qn6JT80gbgEpgbkrZBDPOZ76VGGhfU4VDXCnUQBx/8KZXu0IA+WUdtlaq99ASdKMUN1G1Kw==
X-Received: by 2002:a05:600c:17c6:b0:3dc:3b1a:5d1f with SMTP id y6-20020a05600c17c600b003dc3b1a5d1fmr2527696wmo.0.1674836177641;
        Fri, 27 Jan 2023 08:16:17 -0800 (PST)
Received: from [127.0.0.1] ([2a01:cb19:85c2:1100:7fe1:513:212f:568e])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm4744566wmn.19.2023.01.27.08.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:16:17 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 27 Jan 2023 17:11:34 +0100
Subject: [PATCH v6 1/3] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v6-1-2f641c422cb6@baylibre.com>
References: <20220919-v6-0-2f641c422cb6@baylibre.com>
In-Reply-To: <20220919-v6-0-2f641c422cb6@baylibre.com>
To: David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jitao shi <jitao.shi@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stuart.lee@mediatek.com, Guillaume Ranquet <granquet@baylibre.com>,
 mac.shen@mediatek.com, kernel test robot <lkp@intel.com>, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_081621_757142_E6C72BA3 
X-CRM114-Status: UNSURE (   8.10  )
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

Add a compatible for the HDMI PHY on MT8195

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 6cfdaadec085..f3a8b0b745d1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -28,6 +28,7 @@ properties:
           - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
+      - const: mediatek,mt8195-hdmi-phy
 
   reg:
     maxItems: 1

-- 
2.39.0

