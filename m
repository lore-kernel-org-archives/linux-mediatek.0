Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6117EECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 14:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=go5+dPyR/CU/+h6S38uOSI6svsd8/ygd6Agr2YKEpkk=; b=OuoHtbyW4nC3CeejP2fXhCcpP4
	AiynxScndfl24LstvmWKBrppn98ip9mCTzsGMisDqQAzKTG8fnK6hTFcymOWPUzliZzbcXFUOqguV
	2AOYbBH0JwelNzoNjYsUaQ1GYUfKm7GIaQS8x6bkvkl5UnMnLwLnrjTuYXBDfXHSOAkhPOLtBHkJ9
	EiKCV5bfXY2+f+RQ8jv6RKzfq0YyA1z3hNwjsenD9q+CQFAukXWvIsZyy2gKioErax0cE7nfOM1/p
	4EmXey6DtYoqyPo5MFCKGDzdG7xUVs2WrGdZorMMh+cr6+K8l+aubXkTt0rMzFPYVNkXlL2keNGLh
	zX3U9eHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snf1X-00000002Cd1-0F7b;
	Mon, 09 Sep 2024 14:05:47 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sneoC-000000028lH-3yHi
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 13:52:02 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a8a765f980dso26505666b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 06:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725889919; x=1726494719; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=go5+dPyR/CU/+h6S38uOSI6svsd8/ygd6Agr2YKEpkk=;
        b=o4zqincT+AT8sVQ5tMPNI4YU00DtQ3DRtti/Xz9KzUWR7zkLGHR9ANhdpmvx++PIq6
         U5ZjP/OFffN3vFT+L/jiAwEMtAWFNWOVnISEXGpAWGF0hYPXgUxMdfirtZKul8cGkhGr
         QdOap3FWXlUls9+REl7noTWxEQgnvu2Gzy95Dk6WkZ0l1sMKYvSaLHL+xqC8s/ZLF34h
         9J9IdkmkFCdKpfuAmUKDQCkifgMegNhK8isSOkekSxFP6ixl2vWRMmAdllPk+l1DYajS
         6Sx8dIbTvGhxuPmXm3Z5kjGaGHOlnP/jcL5mAZ6T3UDDF+cUziSkV2Xkve2ihX4FnU1j
         VBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725889919; x=1726494719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=go5+dPyR/CU/+h6S38uOSI6svsd8/ygd6Agr2YKEpkk=;
        b=VpnLW/zFeRuH0Fs7ns7i1AzDfuHWaXcrP54UYxeyY+yGZy+YLYFa1U607WPqudSKG0
         RG4nDn6phc2tWZJ0QLj/m8qMWwubaxvpKsigwc76Ay+lS8jFKCl/Q4UPrvfj/v1IVKWQ
         Fj41dudbu5hLAFRIBvWJ0zxrr5/b3UQD4F6cxiKrjqFEM4djMydgCaC4M2DF/6+5q9PM
         I39P1pD3MvHwUv0BBrTEK4t0wDb7kLAm59F62kVgOhoz+RT4zLl5ypjLSCgYFeTT/YN9
         qhGwIbHjDUgWae+zFENoBjjr13koLzppAVW6+YeAaw2gXkwlWf8/7fx690C6B54qL8LX
         w7iA==
X-Forwarded-Encrypted: i=1; AJvYcCWrSWKpicGt6kHlSFv4ashWos89XqHhzk1lhQqoc0fINyQYfhb6PWXKj8vc72ulP0Vj6I+0n5wHWAPNnz0s7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTRQZXIVRc6zAlf7WRY8NCdfx1tHifUToIfqQK5UlEDw9dwGX4
	dZvNVpchrlo6j/ASNXf65adJy0DgM2xvJiRMsYzU/d1+sxlr8WYEWfIpOP8H/Nc=
X-Google-Smtp-Source: AGHT+IGy1tiHdaQw1EmLxWCIRZx0QTX7/qecRmbSfYliJR+FY+WlBher2f7vPLzcYnQtkfCEQty3qw==
X-Received: by 2002:a17:907:daa:b0:a86:83b1:5d94 with SMTP id a640c23a62f3a-a8a885fa928mr395447566b.3.1725889918257;
        Mon, 09 Sep 2024 06:51:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cf3ad6sm345344566b.148.2024.09.09.06.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 06:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 09 Sep 2024 15:51:25 +0200
Subject: [PATCH 14/17] regulator: qcom-refgen: Constify static data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-regulator-const-v1-14-8934704a5787@linaro.org>
References: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
In-Reply-To: <20240909-regulator-const-v1-0-8934704a5787@linaro.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KcmtvuFpgJTQr+NrBtSfkFBmPuXrmTaJALoNQh34mgc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBm3v1khpb7WzxyunM5lYXMazdM4ujdBKnR1uNAG
 IJMqHk63k6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZt79ZAAKCRDBN2bmhouD
 1xTvD/9iDwh1+cEyfWNjyNGqc4y9wqU0ZzDeg3tyTbYWtWgBrDXX4gYRWsD0etQouIuhs83FC5m
 7m67B+n4Q7QjrfQUtSTkfGWvYGHjLQ/RooOdXrg4+dfjO6myAtqeTeaHlNZu74tr0xVQMocpWC2
 CpBT9Ek9UtovGtrVKAqsQhsSbMXSek1w7kB/u3fnRe6Z7N13lKr8XjBaqaaRPsqfS032KXyQ3uv
 Le3dFP+wqoLN+CqPjM6LMPx8iRceIuX1rSb1CpJgJaf+zLVAVMi5ZitneFTPpWjFHEWw9i2ZxX1
 atam2jSgTHB3NgxVpjBoaayFmWv6Rwq5uBmrYvXVpKSK92NHqDmd0hxrq3G3Xl8bF1hpCDtkqVi
 QhNR3/DD87VK4Jt/7pPG4f1RYHZhNl9qJ2jEqQwLFVfK+GqI1xLCRsl5TY3i6dWXHHqV0KTOtw6
 lJn32B6vGS9haLMgSBewc356tSJEBwE6QpycGFI+ENmABZSJvasyHqXQL563bHFyQvHOhCNjsaD
 R1We9KqaUZJALCSELvgzu0qBevYrx9Yw5VqdwW4id3C4UjPXdVOzId9mlYN2laxcb1+RkTbyEIr
 yENminEQ5sFMNejQBF6CUF8SBl08MgdL43RBCT7XKPzK4MbNt9K8Uwgn6NVVVrICJgXS0rscTtM
 y/G9xuQdIzo4sZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_065201_020730_A4CCC8B3 
X-CRM114-Status: GOOD (  12.16  )
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

Driver does not modify static data with regulator description (struct
regulator_desc), so make it const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/regulator/qcom-refgen-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 063e12c08e75..cfa72ce85bc8 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -62,7 +62,7 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
 	return 1;
 }
 
-static struct regulator_desc sdm845_refgen_desc = {
+static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
 	.owner = THIS_MODULE,
@@ -74,7 +74,7 @@ static struct regulator_desc sdm845_refgen_desc = {
 	},
 };
 
-static struct regulator_desc sm8250_refgen_desc = {
+static const struct regulator_desc sm8250_refgen_desc = {
 	.enable_reg = REFGEN_REG_PWRDWN_CTRL5,
 	.enable_mask = REFGEN_PWRDWN_CTRL5_MASK,
 	.enable_val = REFGEN_PWRDWN_CTRL5_ENABLE,

-- 
2.43.0


