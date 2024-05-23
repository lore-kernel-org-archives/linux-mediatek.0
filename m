Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735E6C25B79
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aQzYfx/ie0kc7+1Z32he9tzRpQ+MgXQM9NknN/D5iA=; b=T4dn2VFwDVE6ffVZPo9dhFBTbH
	p2X6+Lx2kiRO/cCVdt/Wi5x5ZauE7rRUdZz4iOcI8t+SdyCnr7VqPw1jDMfqJlLOe38Y+VvsEMjVq
	vs0HH36LR6lY/RLNBdz23is6HqXJoxg4NgfNqpDY5/NwtBnQzJRfRPav6IZNzThCMy03v1KjvBnIc
	kmpJQJ4Negsl9LFRyWsW0l4wti6IWookupH3Y7QHEXZCKnLIj3Xmbn4pn+OwSjF2i2kprdNGpMKfk
	kB2vkicqCBBtVcg7RilWmG2wzlsn1XMafaCyX+3h4evHHeVp42B1+reLN2QzcK115Y+s71ZQjVs1i
	FJWg8fmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7u0-00000006FkE-3EE2;
	Thu, 23 May 2024 12:50:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t7-00000006F0d-007u
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3504f34a086so5010513f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468578; x=1717073378; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+aQzYfx/ie0kc7+1Z32he9tzRpQ+MgXQM9NknN/D5iA=;
        b=lFJ/yJneElMOYC7U03D+YhsT83lSLclNyZzhTPEnRAliv9FF1IVC4x6LYeLeHvFukx
         tw74NrHebKrHHjxgohm3oUr21eQRREld0hJwlhM8B05qsb9Ha8Ubg3OoSX10WXge6RcC
         zy7/MCpAJ6PSNVCVBFGzyNoMvzR61b3Z8XWh+EgJKO5k4tKNKRx1ThZ9uf6pWX/hXyQR
         8uIYkwRfezmVCemzE2/aBolu1BsNMW/2qTn0mJ542Xle0MdQmf1Jmvt0JJXL/XxSGN3p
         8HzGl4xl7AqX5RsjleaKYQwR/AMQ6fAxFXV/mo+itgsaJvHLV1BRJvID5HMjSqDAgYv1
         F8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468578; x=1717073378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aQzYfx/ie0kc7+1Z32he9tzRpQ+MgXQM9NknN/D5iA=;
        b=kO9Bz3Ek0HmCZOXaRWA3EkqUNoLVWs7KdSfB9hfE8s22AHAuRfhK2LN33xngl/kbTq
         WZcz3a5YFV/BYWZusPEVbyECgYChWRtH0nzAzOD+QMymJL5+MbM5CNrfpSwqI9g2pNPl
         /6uQudpNnL5Z1n5ZuZP6HzZM3PcBfE3KhHvWyC9Mb3wjX68JGvR0b2JBaoGXKXowbVRx
         iYfH3WY+Dl5ju+9Ul+ThBO1+jKEdo1nnw9v1tlopusqZDTaYsUQ3obZDFNJkUQYUGjSh
         XmKwgUPH3oi9Md8Jkf7ocmnNGV3twbSHktfeSfJ4aWBq8FciFl3HzUBvXKCyWUyZynS5
         HbYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhrP7jAM1w7d2lPw5j830yeBzCOxf1sNKiqqdOJqyVzH4fF9pPAwr6/QqXvKfEZSmnYr1rNnB4EA80RdGxgNad/sZB0vU92h5iv6aP720sioq9
X-Gm-Message-State: AOJu0YywXN+iCbiH48h4HoizbX7mnyJCsdIkV10FxLLh5eroZ2fqQS//
	jiniBIQs1wfPEsuJ/Od7cGNi4lQMl1lGoPo0KkyEcS+lSs/oN6g5nnhe9OmJg/w=
X-Google-Smtp-Source: AGHT+IH4iGNET6SfDzE6zGc6HrJXgpoDsPJFOQ6KQfsfG3Wg0YhjoGdSQjdBLOB748+cCcpmxdRUOw==
X-Received: by 2002:adf:ed0a:0:b0:355:2e7:376f with SMTP id ffacd0b85a97d-35502e73990mr193601f8f.49.1716468578424;
        Thu, 23 May 2024 05:49:38 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:22 +0200
Subject: [PATCH v4 09/15] dt-bindings: display: mediatek: ovl: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-9-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UlNxnBvCjVx/6W65jQPfxXx1AFy8RRqkUMIMHAwcg2c=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTvT9SVcXKFGF/GCpDExbo0SpPFXpWKioJegyL
 m8sMYAuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURTHMEA
 CCECqLgS+dIQk5Iq1e8TB/sKGUiM4+JLGu0ybDlieP1yzfLUZvaakMMuUvb0c2wHeT8euFl3vT+hUR
 /hhel+PfLj/+7c5BO6Jal85N8SlgjnErhq/bwMPRpGEjfqgoDbdizJC0o9nsmYMJPzHVeVXKsVnoNo
 TQFwbGwjWirTY5zIJGNIEItsF8THGHZEhW5AML0R1chmvnfGSiwBPXtCCSOJE1jVHKvwbFErSwbBRc
 TdikgvrqxVVVZPONucpi3aj9YdzMuefW2GyC4+lfYHUQj+xVFkThOalr8vDA3ul3wD1wkXNP2EdVYy
 3rJpcB+WNfKSsfGefWYEo060oeXA57sjJDwRJ+Iy1ImNa+RwvX0eEon8fdvuygMpGt0Z4M8pbGLn+/
 VveBekcnfmasbPIVFTjmBUAnYakjWnRkq97bJtVt3WKrgvAHsaZ0amrtvZKdMagOPse5GNqJAi945S
 XJPf6KuuKHjmk7IEDBzxpgrI6sR0qvtz92ckGoFGlwSxQFRl1Fdt1w8NUYTLEXqovUC2PXkAqB7Vai
 aITDWPs6S75IIWJxk9Dpd9u6xDSzoSjTCSw5rHHKbLSEXxBDzDHU/FYc54Rf0Wf9NddVmZL5Re2vFq
 fQ+13hrduYg4lKbs3wZbD++TiLXf2U5H+/QT6C97HjHvFoe2Qow1CrcSZcKA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054941_142587_5FF5CABF 
X-CRM114-Status: UNSURE (   9.19  )
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

Document the display Overlay on MT8365, which is compatible
with that of the MT8192.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index e93f0247bdcc..9ea796a033b2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -44,6 +44,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:

-- 
2.25.1


