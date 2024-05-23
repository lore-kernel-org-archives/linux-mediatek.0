Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895F8C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kkJmBq6onyQSq+T7hLJMjqQJ9w5LaJXZraoLV+X8Auc=; b=xitw0vwvMWONMEuAKGa13+N0Ar
	KB5jhNEXCGltvnqvIGxittbXMAt4jYyvUNOnrhhArMBUoRPacRFsqvdHS0pzBFhsSc30ZJ80N+0Q5
	kqxFT61KtQcWSR2q9hKJSsJgHOBb4j/TJbaJtJdNDno/klsGPIBhp59OxOrYeN9jXYUg7qVD1Clow
	TlaQGJMF0RqpRICruYBCU2+KHZ8Prd+Q/CB1elUCsx/jQzj0l/DzS0U+xk38zhiATb/3u8KmHLJ0R
	wz+J94gBAH2iDjoxJ5SjQBKuuW4PKuUhWJz24cDqXN2fGbnmClLjjipDy/B3X2hSNCoX+QpLvMW6j
	3iml6bbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7u0-00000006Fjj-0MIw;
	Thu, 23 May 2024 12:50:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7t5-00000006Ezx-3TSp
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 12:49:41 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-354e22bc14bso1554028f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 05:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468577; x=1717073377; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kkJmBq6onyQSq+T7hLJMjqQJ9w5LaJXZraoLV+X8Auc=;
        b=dPUnNRzkMu/VyEq6ml/nbZcL4yDsDjKFi1H6l6ab4j8eEXXi92Kx8YYTUiUeZd4+mx
         EFeUZMu91DRJZTU3Y6hKr5fo5OLtyRDkVSDLYgsBivsRiCAW7fuuCOxeVmRI7PBFu+Qo
         5gdwX+gKFI12AKId+aRAw1ng+47t0QYWwaNzMYBQhsBiKxYLXZ6m/aVtDsa8oSqyD/ja
         N/7bbomSNxDMrgC/QJWzjSmHs+PWSJr+gO4VjoJoAHoTpKIlvfPtpS73AxH4tix03PzK
         /T8xsXgaaZJ8DFRu43pGPbGGsrsyAo3XBtLjxLTRpkUqf7ekX9aLfTeCVD68W/s9saDS
         xBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716468577; x=1717073377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kkJmBq6onyQSq+T7hLJMjqQJ9w5LaJXZraoLV+X8Auc=;
        b=EM4RUxeKNDy+NoNkzzWfALoj9avnmGt1dJKcgqmpYS5O1QeZcL+NrBwwgQ6KJ/8RU+
         wh8pCMCN+WYOV4f3/uznmxyZw7D+1U+4E/0/PT8j97qkfgFwmtB7wkmg1Q20walhgEwK
         vxQbaxJ9WB/U6Hpng9yCWxdr1jw+Bw7CqBCQYJNyTmVz3tRMz2TMDdwefq9KtwE0WYrH
         fY16zEO3p2+GQcsFVF7NjucMApBfMWfpQo4GAgJ0R+EQIoh21GQhBxqjQlR3VAV3r8Z2
         ndD+ziXoPAIgEhAunCd4er48zPEstSjbIIi/a0igxUiOYOgJnvCmXnYnmiCAswlSJ6ov
         muSw==
X-Forwarded-Encrypted: i=1; AJvYcCWiVufZsKlvzZBXweuSSD/1WECukEecjMd2HzF/MPaA24BdQE7D3vizrTTL/lsLQ+O3uZ7pXgfxiPoW5qLO9txkv9wMXSP8HX1UH8BzPo8Rgd5A
X-Gm-Message-State: AOJu0Yx/p9bOX0HnH6cgAPrkuOnqayu24Jla55yeMd0DykMLIWTT0L1H
	k43bahCP5g3zeby9VUf3xIVfWDCc5z9LYUgI7Y15AGKQv4YjRw4R7CsV1tXVnXg=
X-Google-Smtp-Source: AGHT+IGdHb+2nhRmWTFg31x3CwTvhs3p8/U6MNgzEjblZfe0qTk58c4045NP6jEabYi5nerCmPBVUA==
X-Received: by 2002:a5d:638d:0:b0:349:eb59:c188 with SMTP id ffacd0b85a97d-354d8c7428fmr4286365f8f.5.1716468577068;
        Thu, 23 May 2024 05:49:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 05:49:36 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:21 +0200
Subject: [PATCH v4 08/15] dt-bindings: display: mediatek: gamma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-8-ed82eb168fb1@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1060; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=DEIUlOZDb8oCu073O6xdZzPGpsJSPUdkpGXdE5hcq90=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTYUWDKmTXjiazVz8jH3hWP22eE7eomiqm8qhE
 7KBFP8CJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURVWlEA
 CR4mlMMfr4kWE7n8zvTLVPBqU48Mean15/WOP/9YSkzRk0mkEJlhQZNGddl9H4UEws3ztdlyaUajcE
 vASa/78GPL64xAd8qk+iljbwhBf46pmz5lPRdNWspQWq/vBk1n2FWYG0TVNyprKK1kZLF77oksMym3
 uGoxmsU8St6XPBrptLM+rbuxtvNhnahTdqCr9H3kSs0dGcphK6YgOnfBvzDiMzPtAc9z5WIN4BBG39
 3qU+Lh7JtybXGHrzgpYtmKBnipxE79PMZP4Kf22wFt7Q9s/nLh4OOCffZQStJxB8bDfn69OEiB9pW9
 lJVWcsxmvd69z5ElMA411LOggE5hHC45I87S1Zn6gGxGTiDrY4BVVtP1EkrDgylFY5SsRoyGKhKssc
 pKnBA+LuS9eLUTZocmwYHYEL1IRP8Q1ZDC2WLs6FUX/f5EnJs37vysiE8/0lw50RC2qoPa0YfI1J8U
 O0mzuiHQcMcBhE85ePeztAgrX7zkt0R3cDFvZnMnZwT2AShtOgY/baQaDpZAkipGnQ338BFxWVgOS8
 5JNbiL3/aQbUyRDKEZJtCZ2viL1VY57aNhSGVE21IqvKtSk7ZTaYarw+1fFt8fO1kHHz+YpbRPO8b1
 4U4mHHm66kI7zTG/XxnycuBYFEKnJPOnXhFyOrCVcFrEc0E9SA4c8KPv3MXg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054939_988405_5A88BAD1 
X-CRM114-Status: UNSURE (   9.08  )
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

Document the display Gamma on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 17f299abda11..48542dc7e784 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -35,6 +35,7 @@ properties:
               - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
       - items:
           - enum:

-- 
2.25.1


