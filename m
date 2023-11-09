Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33FBC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ireTpCfN0lAkDpS22SoHjbEWTJUzLlFEUnZESQj8kY=; b=vo+yDimAwAb3mN9jtln6GKHHvo
	KMQmWKkWXk1lWT9yhwKpZg1tx4jUw2peX7S6YialIx9RPGu33+zfWIQFeoomg37NcJqJgR5dV37x8
	WJodUQl8ehLtByfxLFtMfVVqq53k8aM44koa6GmunJsvXcyKikm9xQxIO8T00I9JYm9stV0efWX8X
	Adw/OyHCWmnK/45Wf/ctkXNhnSBXywZl4eO5uxH91J0tCIrL0IlCNjVjvMj2vS4SIi+JkJY4TE9uF
	E/mjnLOhYb6KwpDjg0HpleLsCsLJcGgg22kQtoP5RxH/0+vqL7F75OIfH2xVWYg4/igM1AUDjbZBV
	BPZMunxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wO-005s2I-2G;
	Thu, 09 Nov 2023 10:07:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11wM-005ryS-0X
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Nov 2023 10:07:11 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso6248345ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Nov 2023 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524428; x=1700129228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ireTpCfN0lAkDpS22SoHjbEWTJUzLlFEUnZESQj8kY=;
        b=DC5UOEl0AQO/oUE/Yr6XKlwAqcr1mZlW118YWGq4vVCI31ammryw2QVmBG1yLw8Nz/
         pZ9byHrunUtHj5pMKaJOyn62WFC84NNN164ISAwiLxRELA0+s3KCi2EINL0PCYtaeTSd
         LVOGIYA5s7EXe+veW4dcS+RxZaQH0vse1Z7LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524428; x=1700129228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ireTpCfN0lAkDpS22SoHjbEWTJUzLlFEUnZESQj8kY=;
        b=VuKN2msAASMVM30bZn3/o3SoHwLFwjNrpPIW0ulxlKKsNK0nQZ64LEOFUorRgqQ60c
         QGmJdmlkiVDM9wyF62dt62p+QoTnf9K8OSJ7J0kyxXi9/pPKPzNKnnqI2MNMNXFgyR50
         jCXWmvFfYSl4xthXsoktQDLU/AHkmZ+2i9E9XRHFwuo/3iZD5zYZ89aeYHYPCMPfzON7
         HcvYIBr35HbGXMto2sZkKObVPNhC8GF/suk08WuHnHNZuztRBR3lv65AoNL5Mt59xmpd
         ymGe2BPul1P4EcoRwOdpE0GXOkcjS4lYElHsTpynVyBTlPmrf6wEgJ1oDeV49wqr3H0S
         DIYg==
X-Gm-Message-State: AOJu0YwpVFQNZ1FfjOT7SvT5gEA7ELneNOayl5SFLjq8Gt5XAlneXgdW
	2sXlbwSWknK1eNpBZBhjLlHvjQ==
X-Google-Smtp-Source: AGHT+IFYLvEMMUZ9GrbH908WNtQJvicj83HyjofOmfRWFZrCflNz7TaOuy+rHHNosFSsiJ8aNjo+JQ==
X-Received: by 2002:a17:902:ecc1:b0:1cc:2ed0:5ab1 with SMTP id a1-20020a170902ecc100b001cc2ed05ab1mr5039394plh.17.1699524428617;
        Thu, 09 Nov 2023 02:07:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:07:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	andriy.shevchenko@linux.intel.com,
	Jiri Kosina <jikos@kernel.org>,
	linus.walleij@linaro.org,
	broonie@kernel.org,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	james.clark@arm.com,
	james@equiv.tech,
	keescook@chromium.org,
	petr.tesarik.ext@huawei.com,
	rafael@kernel.org,
	tglx@linutronix.de,
	Jeff LaBundy <jeff@labundy.com>,
	linux-input@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 6/7] dt-bindings: arm: mediatek: Remove SKU specific compatibles for Google Krane
Date: Thu,  9 Nov 2023 18:06:03 +0800
Message-ID: <20231109100606.1245545-7-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_020710_241438_82936E0C 
X-CRM114-Status: GOOD (  10.94  )
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

In cases where the same Chromebook model is manufactured with different
components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
touchscreens with conflicting addresses), a different SKU ID is
allocated to each specific combination. This SKU ID is exported by the
bootloader into the device tree, and can be used to "discover" which
combination is present on the current machine. Thus we no longer have
to specify separate compatible strings for each of them.

Remove the SKU specific compatible strings for Google Krane.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a4541855a838..ef3dfb286814 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -186,9 +186,6 @@ properties:
           - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
-          - enum:
-              - google,krane-sku0
-              - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
-- 
2.42.0.869.gea05f2083d-goog


