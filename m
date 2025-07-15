Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD79C83F27
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jul 2025 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=; b=lOr2bC6/cnAjIxgrOdhODrrjZy
	JRJVUlwfUkoteMOFYBqTFEyhnWeyi6BDVsOy9lEFZWoToMs5aSVPs7a7Zx/EODy2jYr0GPX/MxyYA
	4rGNGKTSu0FtkZh6rS0JpD+lrQfMyFIGcKN7Ea0cgutsdjfFCDuNz43gNh578gltuaOmu3Wi3LT1m
	Ldt3EwTJ7u10kWE5xFPl7SLMhgUlvMTTvOVP6reiEMZb5FKAYIhkwEE2MITNoWhrAIyVylOO163yz
	ZB7bKyL/VYsFnSPKClIQSVUqmHwus1EEXwgZ8C1UCNgGVTBujfjb/KEwrowI8QdaN8nkZH6RgrWfL
	D2vsj+7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uborb-00000006Nrz-3P6N;
	Tue, 15 Jul 2025 23:15:07 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uboe9-00000006Ml6-4BUj
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Jul 2025 23:01:15 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2ea080f900cso2039066fac.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Jul 2025 16:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620473; x=1753225273; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=v/jDFV2LoFj2jg/PQKlxX6HeQj8ohImyWXFIhF7F12Ha2hWznseeKC5DpNF3zPc+Zs
         Odo6S2c+xRcXIyGaVHjw5+tdVCwzd7Ol02b95hAmFkqW3V27fUFDdVPWiil6V+xr2KwZ
         fAV9Ir/qzFvju/iLnNF0MXXYsbiSQyNqT7EGUnr8t5zSjtyBH3zNnf3SiZxJ8gz1Bam5
         0Eunpj9fIzMlVUePM6fWWbsBZO0av8w+u97uMydBe/M4uGCSlm4PyreMNZqiOv5KMvwM
         1hWOc+Dn6GBbgpb2louHJ8zQy0S3dQAYEXNiGs/ojdRTpRnmvV3f4Xi/WJm4SKGV3+OJ
         seIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620473; x=1753225273;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HMxhWC+6DIUyTBowpY7tH1U7/VAQSY6aI1DyTbhk/6w=;
        b=Edh0yYR2F+MZnje5aTmeapK9cZFwE3JnqQDj8Ix2Yt3oYcFKqvZX1EbZRXlqSEptEB
         zRl8ogMkh3fTyiz6V22TTN8xkF8A5luZdnfUA4j6R3KoKGWaNQJBhafGZtPc9U7UIDL5
         nmWomH8uUYJhen3+CLQfLy/lz1qKuoz+h9+OyjMj9FgZNldtjglCnKHRdRlQLssgISTl
         +bf2Ma/0nKNkdNRv1X3n+GbinUDXoU90D53D+dGd3YcZ8fQY/5X2I4zlWtizWw6DNi5p
         3okctdhu8rKZmIfEPwil/pBrixxfDWYCsXbT/VjuoQyk5VzazcSDKUzNPpFKyaadzQBE
         mI0g==
X-Forwarded-Encrypted: i=1; AJvYcCX8Y2OkYD+ZZDzgWOGOYlDq7igS3xeE6UMGgSFXl2g9B8IyFgrnIPaOtRUp8SpP50xUrtTSZPZVcyUvULyaBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtEN51JQeucvPe8uyZHVj8QqpDFsLfwTkO8DAJl6nXaLDsAJtc
	3mKqUMANy+2NmY2w19zwe/CPgWDAWdYfQGI/5faB8HztGnTPkX6oiO+JZMHcWMuemP8=
X-Gm-Gg: ASbGncuTV9MJvUxgaD6gyCM/XnP8liity/X4loqD0IV/PwVabE3CGjphWkZI9lfPerS
	h1WqlGD+mTRbq3r1DXHGMbZUKfzp32+UqeZyzADR2kgt3AjHrP9k5MwFNN/FjsVtlQXU9Qvp0ol
	4Omy+tlxJlRK8Rl5YgalrPmg411C3YaTR6mx3YdeRtmFgS6vmkbcxnDKHsCLh2H/xwzDMX/cezV
	Spp1cJuYT1DAEgVTbnNiT8s34H4Rm25XsVpqRNsHM7JUXKsveQmeSa5CwwHMdj0H2jt4L2BEIbx
	f6vLTbxl3q9l5/QfEUy34KjykBYL8XjxUKqq2AhruWOBcwLCGroCR632fk+cnaODscFLbRcnfs+
	Jav0wrxBetSc8qoViSpGYKI7iiu+w
X-Google-Smtp-Source: AGHT+IEls5whNRzvN01o90WxbCX3ovBdPRxqs7+TUz1Rw8UbE0E1ggiOCz+d99TGSZRB8SxM8NuTEg==
X-Received: by 2002:a05:6870:d0c2:b0:2e8:eccb:fe1c with SMTP id 586e51a60fabf-2ffb24ae8c1mr586050fac.31.1752620472817;
        Tue, 15 Jul 2025 16:01:12 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11686cc3sm2964968fac.27.2025.07.15.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 16:01:11 -0700 (PDT)
Date: Tue, 15 Jul 2025 18:01:10 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix a NULL vs IS_ERR() bug in
 airoha_npu_run_firmware()
Message-ID: <fc6d194e-6bf5-49ca-bc77-3fdfda62c434@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_160114_041052_181D9D75 
X-CRM114-Status: GOOD (  12.51  )
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

The devm_ioremap_resource() function returns error pointers.  It never
returns NULL.  Update the check to match.

Fixes: e27dba1951ce ("net: Use of_reserved_mem_region_to_resource{_byname}() for "memory-region"")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 4e8deb87f751..5b0f66e9cdae 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -179,8 +179,8 @@ static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
 	}
 
 	addr = devm_ioremap_resource(dev, res);
-	if (!addr) {
-		ret = -ENOMEM;
+	if (IS_ERR(addr)) {
+		ret = PTR_ERR(addr);
 		goto out;
 	}
 
-- 
2.47.2


