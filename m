Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4DDC7EE30
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jun 2025 12:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GIOHrhTp/mewrh9i9oK1S98LI5rxY1dc4uYp1wgAtk8=; b=Bl3ZdKVXoKxxCZ
	J7wat9tufuM90ZCKV4SfdICGbTJJ3azf6sENuq6HuG4BFcq/XO0Wq6PQN3GkUiZ6+6OsWjIvMZGRY
	GRC/D7J0mP/1uBtkaA4z3c4qjIaffncU8pMiKZWh/oZ9x+PWKjBu305eINH2YXjlf1UeqP+5Tb8E7
	0Lw4UbJBlBKNwiGfR4oeUljYiEt57OH5Y2pSQWFKIBOOsQmHwX7PbRvDnr8Y8nkLYhHOIGEqrTNfg
	MyohZWeJLLlw0gQxlMOPMdOThW2LiHt51XiQpv70GNR1hfpmnCDQS27RW+v26S3s7dz8Mx53yf7eD
	fchg20ce0yNGoZMWwEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2nb-00000005aO9-26qp;
	Tue, 24 Jun 2025 12:30:51 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU2fi-00000005YhQ-3yxj
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Jun 2025 12:22:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso64283366b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jun 2025 05:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750767761; x=1751372561; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GIOHrhTp/mewrh9i9oK1S98LI5rxY1dc4uYp1wgAtk8=;
        b=zKRAQ8LT6hMrM70H3eAXm1Wv1SOV24xVGy2vwJSLEwS26Y2DkFZoYp34KV02gSriQa
         qUnMw6yhpRdA9s5QqZLAGxoxb/AV8Ct36Ysik4W+KPJbvjl+D2m7PlSeaoHGxF3fH2LG
         XdEp70Oi3EONvR6CqTwECEfldXktDFlrdWncngT9nnt/KwzT9KgUxFR+AhM7Qik1hxIh
         o1BWdpGYAvwrAZ8UBELrZZO1xPAl4kG4BhOqhQ7v1Rv6Z2fzKDoIeNMGza14NPwRsxcD
         45KL4KAhDG78wcR0riPb1ErT5d0kGjlvKLZ/TbwvxoOcqxRK8OVNU+ZMu8sR/qC4Mbtt
         +8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750767761; x=1751372561;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GIOHrhTp/mewrh9i9oK1S98LI5rxY1dc4uYp1wgAtk8=;
        b=nQYON13jaI3iRUAqLGN5iSAfFVsD4YWyEeSIrQmfapo8NuUMNcx9cO8sCAZh5ZEuew
         1+zX0bEBQlo6XDVfGUcBN9Cy2Vv1O4/jdaLKZcVG7EfsiEFihRLpHWLEOtqCcR0uBOVF
         vEKYtFvLq7MDCEvDIZZ7J7r8LMyNvawGHrTWqy8tdMxs8MmBRTqzXac217xLzQdWQ68Z
         73wOvCzcFCdi4M34+Gdnz4Hil2ie95eYcHcYsYuTgD9ozfi/kKWAx8MtGpN5MyYMnLB7
         vYunYNl+Ee8Lp23g3UICAa5/c60RxCjMLJ3dlSk8qCuxxzhF1pXihjQtA1dZXatFK8wZ
         ggqA==
X-Forwarded-Encrypted: i=1; AJvYcCWKJAcf16oN4aTbvQhHVJxa2YFRoT7jU+yHZm0c+ijg8PtRLGaS1olqD3LmXGHXc/r3/Y7rjX/ueXhlWlGpyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfSb32ASlgIbWIPKZjTYjBY5+N8Ery4VOxIQ9OMCCkoNlTIivO
	nwk/7Tq6LYxkWVBYGHHJG1HcsLg4kKBJQoYUc31irnK1wQANB7u53/rtymIBEJt+Ntk=
X-Gm-Gg: ASbGnctVSmw8UvI92RX84+ExD4osXjsdorSYF+fcG6ALvZTIi3zs/4+0kwYrqDe7uqj
	kgndqGX8yxwwo69tk/b9AtrWiQbvpaV8hvZgDIh5jiaVHbCGB38ydEubDUzj0hVmss9nb/OPOT5
	XViyCY7adbKY4Jrx0s6DD+YAQhoWbl1X0KpouxXJZxft5m76zosExUBQdysao5wD8yBBy2bIT6y
	/8y3/Cl/x0Br9QlFNhM3Bxy4KVXWvCkj+RYVhlOEjjXt9dQ2m0I6c3d0GW0dWbdmlqeoczSQARW
	y4bTa9O2bGzJdjUwd7NGTrDWzigN4nZKEwZL5ey0sw8XFT3OrJP9aioZSLMtVA8BQMPGpZnNlCs
	WdvgDM/aebJkFdZIv
X-Google-Smtp-Source: AGHT+IF4Jlt2QDiei0JDT0YVWn9adcZO9qMwWDinm6xPhvNP3a25MLMFZSlajNLltiKpdAK3V8gtEQ==
X-Received: by 2002:a17:907:94d0:b0:ad8:cd31:5c31 with SMTP id a640c23a62f3a-ae057a6d22cmr544529066b.11.1750767760957;
        Tue, 24 Jun 2025 05:22:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0b3448efbsm56794966b.177.2025.06.24.05.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 05:22:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/3] iommu: omap: Simplify few things
Date: Tue, 24 Jun 2025 14:22:29 +0200
Message-Id: <20250624-syscon-phandle-args-iommu-v3-0-1a36487d69b8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIWYWmgC/43OwQ6CMAwG4FchOzvDOjbAk+9hPBQosAQY2ZRIC
 O/u4GK4qMe/Tb/+C/PkDHl2iRbmaDLe2CEEeYpY2eLQEDdVyAxiULEQgvvZl3bgY1hWHXF0jef
 G9v2TA6HQUABITFi4Hx3V5rXbt3vIrfEP6+b91SS26T/qJHjMZarTikhlCvW1MwM6e7au2b7sB
 Aj4RZSyxiLJdJHAgdiaTfBpE/p8oyBQCmWJBeQ6T+FArev6BnZF73tRAQAA
X-Change-ID: 20250111-syscon-phandle-args-iommu-2ea162b223a4
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=RvFdNy6eRq3jk+TGzSf8jssUcNniJlHcLRIQMwrb/Io=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoWpiHrbqzI4XtvWNg1LD7hn/LUZqgGqbo4sCCr
 Zd0WoSazmWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaFqYhwAKCRDBN2bmhouD
 10GoD/98RHydJ68XUE8URRl8Cvud7c5JUY4F8J8UvqOe0IHaznPrl6ENd2e+5imRRDCKx60zez0
 lBvmfvH0frs1Escs7BrTcDT0b7GijKtMUsIFDrIq5QfEPY0cge1hijJXgPsrXz7aAEtXUevetcf
 +Htv7A1ovlxGVVJSJHqCELxOj3kxH92Se8HKhrADEUt7NHOq+wPwjh6BxHstmdgUqnBGhcbaGAP
 l2V1xQ1aeHO6zsWhE1wikgp+ELRz29G+A7VBz6DS1VFp0NA1y+1S3DApBPF9Ej5LxegzaePFUJO
 bjwEUHo+GW+prxw5Q29539xnPMP6cwwt3AprX9Mc3Z9R/JmRE6doEiTLu8V/qihWajenLuu7S4K
 RZbeuY3nDmKuPzurPU+GJl2/DbospvmYNBndkl4QqpewpB6xS4pDCc5DRheDv6nnwOpz5aA5N7H
 +Z595DGPrElY7rSDw8ZaCD8NRK1KE9qEcWwDNlsq/ZBCTWxhiaYdZ1jmJKcSuCSLLbmjHnxiz+W
 AcTQOr314cVPQ8+cZNzHyWcxfHj8V6H7R+GjcjQFDR9viZ7sBu+jBQ3RFRZMtcOoeqyHsekkxND
 cGxfkKfQpvNaABGRY+aloO3BMlOwhVRvFWsITX4aDwJVVLNM6L0DUYJZA1Uw/Pg2bphuN9VtOxb
 OmjDc18i3BBuuhw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_052242_993536_B057BA8E 
X-CRM114-Status: UNSURE (   6.58  )
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

Changes in v3:
- Rebase
- Link to v2: https://lore.kernel.org/r/20250501-syscon-phandle-args-iommu-v2-0-5a3cab296972@linaro.org

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
base-commit: 2ae2aaafb21454f4781c30734959cf223ab486ef
change-id: 20250111-syscon-phandle-args-iommu-2ea162b223a4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


