Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A509FC02182
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jan 2025 11:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=; b=K0l4uCWj32pZB0cDkD6T2zTwcU
	Jp5//8UUBqPvcrP4EGjZuHaWcap7jm7qLB5nuiJhxmOwH7Cx4rS9OZOilv+dgiVRrmU/NTUOFklWh
	mNHP9FhTewSLi06K19N16p4yzveX3ITSx+PnESV0YapeRh8UTT5ielakUBVDsjZFL05kT7fuRmtoU
	0iUHEXeduX4T4n6xSSEz4gp0BQhih4SW2+T3N3jpDy+5GUARRV+s4hMXtTwRqrspbnQKG2YjWjN7c
	+IjE9m0zjJntwKMdwHIQFZgw0u4LwFRo1IAno5TJndlj+oco9ldfgoZFzwYQsjQ4PH/Mfa8awU0hx
	OZQNjB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tavcE-0000000CMw9-2zZj;
	Thu, 23 Jan 2025 11:43:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tavXs-0000000CLtG-3LmE
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jan 2025 11:38:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-218c8aca5f1so17061255ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Jan 2025 03:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737632328; x=1738237128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=;
        b=Nu8cHLx5meuN6zoek1hdMzrinkBHimL4XcZbmeqvJBPAy/9K5NydWV/uypjXKD68tT
         vSivvn0IEavMzmEycm2C/fvKMi4iL3cVfMg9stVU1Z9vkvOo7J6ONk/9jBV9U8KOBlBg
         GBeNgoWuHQBLHaJIlSa2JXziiB09J5Fg81A0lhF8gfnboqZr1BfpIsSaj4jXZ5JvzpEI
         wfl7PINRoAQzbpQRFCdatAN0YXA0n4wzgyUFSB8F38r5cVQ6ahk07CUGiajlaKvD0+Gl
         3liS9qT/E70SJfWlMpcpM9QZDNIitObDvQDVEUKoIv50CfmjOHwM9IYi5EkSL0bKVM3z
         /Ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632328; x=1738237128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vt1kyyizP9VY8dmYd/NkcYQ7O3bbff4IlhNlXP/VIDI=;
        b=fdTYfnOuRhtIuEgJyXu6NlStGYR4fer2Y2ZVBo7QmITnB3JbpNyl5vhg64h+JulYYH
         ojJFqUGhKyDsU1L3xM/2j9wecEPPaOpK99FOOkgf6jKD09tjQBy5Pv9Ypb8SsEKcTh1f
         fdwHihotxrHon2ZoDqh3YXVe82mbF7ZD/VEBeBKy4yRs4ydc7EKee/xRGClMAnQ2HRQ4
         UqxY0KztmDFnrTtOKI2fY/n6d6A88fZJw9BwGMlDALuT9fkT1n+ogwTaOzZJW1vCQ6nf
         2oS6y93po2e8wGj37QqHUgRNvlfxRRzYxYjsHxtyhwc2QYZZun96c3NkWqMY/sxX6wuZ
         5hjA==
X-Forwarded-Encrypted: i=1; AJvYcCVAF2uKs37LwdjhCCXaxoeUCd+fScUTKWkQspe3uaaZ0VrflSK9t7oK9eRVa3cfCOIfTW+LpE0QIQXJr3Vhmg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzN6BpGyopFuv9IsLgfPLvGuAGAJuGgZuQCXH/HXcrIeE9baSJ2
	6qhZ8F3FBZR/5hPooBYOufCScnclYXKuIN9GVMNTSI+LhCLEyRDStaEok6dc42w=
X-Gm-Gg: ASbGncsoQIkSEUO0b2la4kl5GaG0l6HGNG8Ljzi2HxJW7ub2DmuBlOEDO6aXCZr8DID
	X94PV3Sx1uCaJ5fHJGgoWQc1rhBi6gWZtQur7nX+AKHiGcG5dSnTevsFA03cNLNphyqvKGBuyfu
	aOY11HcAJzhQweZARxV0MHU3RWgufIHNOQnLRKC0FjmoFdYS2b86c2eSIAij3+B8JZLh9VoZSKV
	dRaxM0oCIrYRXYQ0vnxFen8HCw9qMSvECVihWhIvpqw5GjCUPtzYwOEe2+JwBDVa6nXwQEuhNCR
	ezdHkhE=
X-Google-Smtp-Source: AGHT+IEDImNLEpDbeExd7a/CwLwEpkI62SjufT/nbplsqzlm5l6MTyrbVsJXoZ25z9KBxH8jSJvHqg==
X-Received: by 2002:a17:902:ea03:b0:219:d28a:ca23 with SMTP id d9443c01a7336-21c355eea74mr385862205ad.36.1737632328330;
        Thu, 23 Jan 2025 03:38:48 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3d7d98sm111571915ad.177.2025.01.23.03.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:38:47 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/33] cpufreq: mediatek: Stop setting cpufreq_driver->attr field
Date: Thu, 23 Jan 2025 17:05:50 +0530
Message-Id: <4f57adcf5fa9f3c95d5f86c76a323f0c8bf1a0c9.1737631669.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
References: <cover.1737631669.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_033848_834907_4750F25D 
X-CRM114-Status: UNSURE (   9.83  )
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

The cpufreq core handles this for basic attributes now, the driver can skip
setting them.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq-hw.c | 1 -
 drivers/cpufreq/mediatek-cpufreq.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index 9252ebd60373..aa209f5527dc 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -293,7 +293,6 @@ static struct cpufreq_driver cpufreq_mtk_hw_driver = {
 	.register_em	= mtk_cpufreq_register_em,
 	.fast_switch	= mtk_cpufreq_hw_fast_switch,
 	.name		= "mtk-cpufreq-hw",
-	.attr		= cpufreq_generic_attr,
 };
 
 static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 663f61565cf7..2656b88db378 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -618,7 +618,6 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
 	.name = "mtk-cpufreq",
-	.attr = cpufreq_generic_attr,
 };
 
 static int mtk_cpufreq_probe(struct platform_device *pdev)
-- 
2.31.1.272.g89b43f80a514


