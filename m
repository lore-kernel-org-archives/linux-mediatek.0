Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDC7C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=; b=GOwkuBVt6mwiPQ3+oyhQB/fwL9
	3+spkI5mQfo/p2qxdMl/8SJQ6hKdnx8Y+Pwpg3voYbMo5Aw4Axn/3i1WXMn+4m2dmeht70exzoaAs
	M2eqe9Q/90eoZbbJO+F6GAArehC0N9sglWQN/YSuOX76W20a7iUi3vDCmZq7RQNVGSIM7oCgGVJbQ
	nZjvaJ04RwLlPWrg7Ni/LFsGIi2Qgf7eIYRdDXBgDfWAyxUjpDO1UydFTMaurI1jNEohTLJwLLFZH
	OO6l7LOItBrEiHYQXS0kaJTq6FGf9KS6TMlYJD3rCSTWT7nVaOv0HRt28ro18tEYVhvN3Ck4rT+gu
	rXH50D+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7uy-00000006GMp-12xw;
	Thu, 23 May 2024 12:51:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7tB-00000006F6F-0yeo
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 May 2024 12:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=; b=h3rU0hKDyENvF5p91k2BhoKB1S
	Rwrx0Rr9TJd2b15UgDMrBV7Pop7SDBosHdSI1TgH38BaXYYk9RCpDuM4/YvNFUSKSWa//3Ck0hPbx
	nYc3XLAxNX45rJ17ZMMr9ERI2dkq/1pzfJZdvjWPVapEH4gpvnF/U2yvtjIdxil0L9WXFV9oYGdBp
	qYDTJ0fL7ZqfRY1jwOAZZv2bSTSztZ+qgqpijp9aiQ1pBjlit13v5dEbbwNBaOEOXqbbEHKBwilUA
	CdvwDMiqWJhkK08IIorhtOfwE+lLhnsWByqG9ihs1VYvW+V94wjF5L+BCZB4n/yc+cgIZY/YISqZZ
	T/017RSA==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t7-00000009JF9-4B1G
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:44 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4202ca70318so50925905e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468571; x=1717073371; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=;
        b=PsAa608KsqDotJCFzAd1q6QAvzDk7e1ja7aHBtM9u2mbyWKgC8cj+8qwTWzVbQslX1
         EkQL/nwToRHU7HuUgEXjgVSJUH8tA7XoWOgrj64DppPKEgcX1qo+ygobWghsFKMnMVAv
         n3Uqby04r871N438flI+AVSJ4PvYUTMZ7gQGMjL3zIaC3c1XzJDvZYXUWZeZIUUgAuKI
         1Vp+jmtXu3ED8LKEw9hEIsc0s5F+AsMY3gQXrzxtx5focyLPl6WkPzx5l1jrMmSxTPQ4
         CpA1IYwgmeEFrJEt/L+aazNrY1dVJkiTQBOJJ9EMMYJ2lLDPafBVlFC/2H8meQ+tGafY
         EO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468571; x=1717073371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4+lhQwg6d0dw4D/M2LqzYSihjAzASjj+z4J8l/ZvJA=;
        b=GC8BjJXI0O+tLWFxAVijiRYywJMU4kcusd7AWrzj+STzRh7P9jM4ptDluorxDwujVk
         XskbvY0chhvkHrf1rntrerRk8I4dxMv/vA7CxM4wLoDevb7xd8hiuyXKwUytUQWNvt52
         TmnCBnDEM5fLJ3ZmiMhcxa9dx/j39lQvy+e7Vi0i+yztRX/BeCVkQnUB4hE11fexYA7G
         I0NtInNBl2kPBDoDxTfJ0bOcj4kQ1iyQT/tqmHiz1RJ6KM7hancOANATiKPp9j4AGdN7
         jEFDZ7QfJoOHXN1ZmqtVf6U4EIeEZ+ZpR5cY6UXCI4aJxjJQezq+mMNyix1wEMFm4geV
         9PGg==
X-Forwarded-Encrypted: i=1; AJvYcCWRbSw4UaaZ5Emt476p0hA/JAv5V1W89I+V3GAoNZoTUDTOGaHO5UfDb4PA0yLH+KXXNPjVYJdzb26YB52pSFJcTd0VH/QfAWETKyuDoCFJFTHM
X-Gm-Message-State: AOJu0YyGSSxGDUh8n9B18wzH0zjErl7KaC/+ezmLUZNAFlU50f6fIsXQ
	yHhxch3E7ClHvvpetwGMkG5gqLHizmwPD5zybCxGTIuvKmYVLlOMgzNLDtsRF1o=
X-Google-Smtp-Source: AGHT+IGE22UqtsLajB5J2AZLCW6T1wLmkDjk6Ujukx8eL5dtqwesn4j29CTzSuVzDnzCA/oY9cqPCA==
X-Received: by 2002:a5d:5486:0:b0:34c:cca6:3d18 with SMTP id ffacd0b85a97d-354d8db5facmr3414527f8f.68.1716468571321;
        Thu, 23 May 2024 05:49:31 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:30 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:17 +0200
Subject: [PATCH v4 04/15] dt-bindings: display: mediatek: dither: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-4-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=pgul3jyPnwLlRqrVeieDrjKje7AnvTfN/5pB8LOeEww=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTJWMDmQgV1eFukFRne6luvhDCe/jawZVZUNOA
 UANg9eWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURddGD/
 4pQDxdcLdE71Q27pfLrGFAI9JkPgBfXW99J0aWLRqy4VHlnPMUPUDxjN4uPw88EKX8/ofiTBGYAReY
 jVxWJwulOWiVE/UL6hHcI/dZRtlosGVE/nTzt3hM4o/yNfdvClPtgO+huPOGUW32N5UXMjkhW+zXlV
 L2aIFffducIIGxuuD1pJONWfkBvA9RNeyqZvRj2M5ouTSvnastV5wdWKkz0DDp5250jDvDz0B+/trM
 /temZhZwC5129b92SQdZqEYq33AS2tU04hHcmlpV23FNBlvWLblgTG5mOSQ50nfxrunMWV/I6ZQzNy
 ZbElei5EV48g4kbgPdAg8M1rsLaLZ1Inv9zV1AiHE7tly+gtBLAAOm/8bqTq5AFLJyK8z72nA4finq
 oTZ87Ohrw4Vyi3T+EGk5/EFoPUI4aYWS8O4oUDbN/Aw443qJbjtMrizwXKrTjXtZtJL3wl2Arkdb4I
 yeeW+Okn9sPqwjb+EqKyAYWA3iVLuT0heByHfKrRmcRFj6sn/CtYtJ+APQCzEC85GoJlcVzqcVCj5o
 k/QvVNe2a47syYoSyljC2jLLH0D6VyqAWdJ745H38BqBxX60vIOcMNRztD3vkIMgwZWeUqisK/yFqy
 2TsKkN97isXcuv/g2FhAR2TSbpHgw38WDbw40Ipzc8htIkhT9fmcWAf4kaKg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_134942_407504_D163DFB1 
X-CRM114-Status: UNSURE (   9.14  )
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

Document the display Dither on MT8365, which is compatible
with that of the MT8183.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 3d4ab3f86294..abaf27916d13 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:

-- 
2.25.1


