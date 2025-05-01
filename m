Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE645C369DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 May 2025 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LzsO/skmVgtqLRk8Hn8ZI1p1OwGSLJGPUwYOe0XwdxY=; b=Yhkb8HpxV06iQn
	xgQrrVpfPUjKusymgEuEkBactS7OWvYoE+WuSYpBc0pKKdNK95tyHykFo9Q/fpnkJW9tKvjWEOSuH
	sQcJUkQlKrgbFW4iffUyk1wHGwRiBfSxhnrsfjIqKYwwcqfXfVVVyLbif7A4Q2ZEgx5F8oMzR9P1d
	2NXck/flHzcrHWKcaqca5wIlUY5N/2z4GSE41z98MG1gmQJC455yPXFV6bJ+3NrZf/2bn2d03Q9oV
	+dTGhVavWnNd4kyrMzRJZF1wgVIxxd7rLMMG305GKE0a446GNBOUx28k1aNYydFli1JlYvIgXus9d
	bP1CNrjOdcHl5rqDONMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWwP-0000000GCHN-0QUg;
	Thu, 01 May 2025 16:39:17 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAWuT-0000000GBvC-36Ix
	for linux-mediatek@lists.infradead.org;
	Thu, 01 May 2025 16:37:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso1507155e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 01 May 2025 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746117436; x=1746722236; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LzsO/skmVgtqLRk8Hn8ZI1p1OwGSLJGPUwYOe0XwdxY=;
        b=Y5ecrn8Bt6HUT3xY8tKckVJGnujccJCar0E+lNVFBOrXoX+wSe/VfbQ4BIbieRybIa
         VKAX2msCRukjtwKLXrleGngvp2dkuMFAP3EAFcaA9FAyEwa3k+lflP/u7xQwv4/zCegJ
         aEp5tzZA3s9SH3eRkx72tFwQ+lSeeHlvmrcgPjD2VHbFHXiOocrfx54EOcPTBhZRE6UG
         Fpg9zlEPyGSwe6o4T2rlT7D8OuwsneqX2fCaByWkXF9/T0aK13ibQE/V2u7JEALrHIk7
         bLZaq9imodpTl+GjRAvm2A67Niin++3/X6otXxcpGeocCJHyO87s7cM3mDty+n9cnQFx
         RV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746117436; x=1746722236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzsO/skmVgtqLRk8Hn8ZI1p1OwGSLJGPUwYOe0XwdxY=;
        b=OW89i4wiLdFREX8VzizXCpxOl9FFe9Dud2JKfrnFGuVkfgdFqjuLK6KAdhbjRdi/LS
         65DLDWThFrfs0fhbQbAbnk0G2j2g9dRGZnpxT4Sn0shrM1RjKd2/tp1qTtOtYFw5kv/H
         ucPHt0h8YqdIC34zgpWOBAOx3cp8w6vXuMJONJ+xhKbAkrtO+X1FxySeqnzl8qIIhxHV
         tLB+QKLLCcoeWim0g+BLmzHkYS9TFnG6GJfcjoYvVGMgRoc7L/0igv9aJiHTvJkefOcQ
         707kkgWOejSCCbuvjh4hkR4y9lQQhcm8I2pSpEPEn+hNv8wL/gCtVVm3BeJV4m52kv1g
         t2bw==
X-Forwarded-Encrypted: i=1; AJvYcCWN6ULu5IWdppZ+yGZCTltL3d+1lKmzoTTtvXiW7ZpzaVBaF+w+HolcYfWBrxW9Ju918nzEa/9WTLmRokyDWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKQ4iYz14M4MHNNp8ytPlRIjA6fuuGbfJ7TipZoq9L4tfvka0M
	O0tMrePj6xKvhfElVFGhAzBuUhQNaYWZpBF33FHEsl90dLQQMTSIxDdB65hdDNU=
X-Gm-Gg: ASbGncttkf4WOUl7yzJkunN5efnx5a7++GlNvThYUMexQ3Y9PkNDCRRF/VqTGNv8n3W
	yVy8jDjjxIePLmiQw5kDvUkl6UhbgMRZOKwBNqvLzHSVwmE+7BbNXFnoxdf2IKrBBs2LF4Co2De
	F10i8WD7JrrAT7Td/VtykyA3ASGTo8kafW91qqXz52ovQoW9+3+B6TtDOQr97RNs43I+BaeKJ8g
	EMPRhCz1zaIpSUtRqtxlARKG/CPEbkfrU4h3JJZybpTYi4R1yYu3ZUC88972JRTWTD6c0KHT1MN
	iqJefh6RdLy/1oebcirLJyh9M07vtgI7e2Zgqeef7vqylQoMkW0qonV6tQw=
X-Google-Smtp-Source: AGHT+IFzBR3+bg1K+za0m3jmhBGaIEWJTaw2fxYEKMYSpYAY2Ghh2og1xXnvvNCVK4hKBJzyuscRFA==
X-Received: by 2002:a05:600c:2d0b:b0:441:b397:e324 with SMTP id 5b1f17b1804b1-441b397e367mr14138705e9.9.1746117436018;
        Thu, 01 May 2025 09:37:16 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm17166175e9.27.2025.05.01.09.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 09:37:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RESEND v2 0/3] iommu: omap: Simplify few things
Date: Thu, 01 May 2025 18:36:54 +0200
Message-Id: <20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACajE2gC/43NMQ+CMBAF4L9iOltDDyjEyUFWBx0NQ4EDLoGWt
 EokhP9u7eak47uX+97KHFpCx467lVmcyZHRPsB+x+pe6Q45NT4ziCCNhBDcLa42mk++bAbkyna
 OkxnHJwdUQkIFEKuE+f/JYkuvYN/ZtbgVlzMr/b0n9zB2CZOzCO0f+ix4xONMZg1imqdKngbSy
 pqDsd1nLRAg4BdRx62qklxWCXwR5bZtb/RUOqoOAQAA
X-Change-ID: 20250111-syscon-phandle-args-iommu-2ea162b223a4
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=5wab0/otZ82OVE/rJrbhgL2wR2IQtZ76AkM3zQixsM4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE6M1PHN0IE6o7mwFsELVIe5+r9pleayfwxEbo
 f5oPBaEkyuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOjNQAKCRDBN2bmhouD
 1466D/0S9VB0/93O6znO1M37ZFRqm8qIG8w0AMML9qOAyuf6IzOdPuOkx7bkYPFE77CefdNI7lQ
 x+YPqVrO25vpVv1VDZh6DJ0thxYl/9rosz64P7VA5qcvAyAoQ23h/szrrHCcnI5AO+cSUyGUYdf
 lAQZjS1oLelqm/EqU1SX0mbmElBJh9lkWL51xc8IkR7TzG9Io4oRWK3ruCGto9uom2V9HLROx3k
 oUVzzP7rCrRCEJtH4aU2h9p2MdaulNZIzlpYoHwIONVm6IV90H8QfPp6ZnqjftlbUUDUpGiZMRS
 /TB+WOyd26I8CEJMlms/1irTj6R9Bxq2BIjlSyUM+ExuNjjGanakUy1jdgpyAPS1GMplNc9CWxx
 j5mmy3HqNeTwKzwfHx5mVzDAACfbG/U4bN5LFzr4HRcb2wc3CFksZ+SnXBONFFXYf964R3jRTox
 r5mQznXerKtYHGLnEN1HOjkZEynSzQ9QX8GWaOmnTP7uO01n/m1POcWglvL2v9p4Jj2LqqIHsud
 De056uHkSOMdZQBQKQP5Tgs0ykchwjQu3szjmXySLVwfusGtK76V4vhJjJMVtfivckZ7gc7Ft1A
 SFuLe8d+VVCLiraT1fYNoZHdZFV5Ymosp3TeQetnFf/heqHiD2HWqVzm7g6+vroQdvlOTtGjJSU
 r+nGXyDYUCnukAA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_093717_771059_249CEA2C 
X-CRM114-Status: UNSURE (   6.30  )
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

Changes in v2:
- Combine patches #1 and #2, add dev_err_probe() and drop the comment
  (resolving Robin's comment)
- New patch: iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable
- Rb tag
- Link to resend of v1: https://lore.kernel.org/r/20250212-syscon-phandle-args-iommu-v1-0-c3fab486b426@linaro.org
- Link to v1: https://lore.kernel.org/r/20250111-syscon-phandle-args-iommu-v1-0-3767dee585a6@linaro.org

Few code simplifications without functional impact.  Not tested on
hardware.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      iommu: omap: Drop redundant check if ti,syscon-mmuconfig exists
      iommu: omap: Use syscon_regmap_lookup_by_phandle_args
      iommu: mtk_iommu_v1: Simplify by dropping local 'mtk_mapping' variable

 drivers/iommu/mtk_iommu_v1.c |  4 +---
 drivers/iommu/omap-iommu.c   | 24 +++++-------------------
 2 files changed, 6 insertions(+), 22 deletions(-)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250111-syscon-phandle-args-iommu-2ea162b223a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


