Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1BCCD11DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=ljP784PbR91lXBwwwEcpx1K+WA
	9KKuZEgdn162E929nzlY+4NNAHu2OajwNMcw16futQmJ0RXpZYFQuuI7tIwOpzmzWl9twgV5rFDF4
	SoMJ41JWvv2tRceYjo26f9CVkKqeM9Acw5e8lFRah8MbBddEAtTfcdX8bI1dr3fKRcClLlsfdPeoX
	uV6SdNJx1qxC5BaL5fusRR9esjnC7HQsiF72gGotMsgrrdH7jcmqwFYStakOUWwAraRh3JVg0yRv0
	lJGhlkaFQHP37SVf8KmJPMlAfvf7TvjCsFhQGkxSKOuv9Xo7FKMKdzgdVkd6sOI2l2Y8dinCLiO9x
	2lsyP1Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQm-00000000NWB-34Nx;
	Fri, 29 Mar 2024 12:34:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBPL-00000000Mym-1dWI;
	Fri, 29 Mar 2024 12:32:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=LgFLwwEULx4+1at69I4D+mORw4
	l9Cp8DClKDiE0RdvbFjrCjSEhzgHwdrIvtRUxh9UmnJMaNDdblyOn0vVjYb07JbZKmaWtDF2rfOcS
	toMP/N/HoE8giZELtWKqWsWDpfMN+J4YtykuPqO0sA9fH8mDy+vs/OJwa5sBO3tYoUo8DaSxUTMDz
	eM3pJ6NDlq/KHMFtPBCxmuvdYDd75WRrUrBP2T5klifgTsh5QsseYSagUyQGTtMKzF5G3TrAImFN9
	t4xWQfLkEWtcrrl788a9MaVOMqodhrwn56kWqn2DPiiMpcrdvuNmhHJs8wb29KeKSk6BaXE60/QTC
	YOVMRNCg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBPH-00000001YPe-1jCt;
	Fri, 29 Mar 2024 12:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2FBCECE2F86;
	Fri, 29 Mar 2024 12:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A9FC433A6;
	Fri, 29 Mar 2024 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715543;
	bh=Kx+1H+QtnuCB8ciX29fyhB79zT4Lxwy5pONlNfKxAiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FjfCZSp+LMd4F7YfUcmRR8Xgk7/3nx6T7UYhN8/sav9hg8U7QVdz+PSCKwNlwM4dt
	 xja3t+2tEdO6GYwZKFRcSIUkF91LnZx3fbw3f4UyKgwFjbku9jewGeA9R2jWdxhO7z
	 vuHXdJJwg56DY0bEdx/LhcanXzz1ijXpYVCLBLmDACb8tj9N6Z8Sdsj23h0S50beot
	 6bb0BfcztITz20RBTsdR0cKjrovjV03v1/kVsWJ9vpvmS3ZR4Hm4m5l4ivgEQeo9NK
	 zxrFaBXRyXazof29MLUN1IjiBUBe92ac6AfSPOVSXy1RbJn3kej+syPrQpDMj0UNgi
	 7shQYN51LGBRw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: C Cheng <C.Cheng@mediatek.com>,
	Bo Ye <bo.ye@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	matthias.bgg@gmail.com,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 09/31] cpuidle: Avoid potential overflow in integer multiplication
Date: Fri, 29 Mar 2024 08:31:28 -0400
Message-ID: <20240329123207.3085013-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123207.3085013-1-sashal@kernel.org>
References: <20240329123207.3085013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.83
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_123228_621683_32B5EB02 
X-CRM114-Status: GOOD (  13.61  )
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

From: C Cheng <C.Cheng@mediatek.com>

[ Upstream commit 88390dd788db485912ee7f9a8d3d56fc5265d52f ]

In detail:

In C language, when you perform a multiplication operation, if
both operands are of int type, the multiplication operation is
performed on the int type, and then the result is converted to
the target type. This means that if the product of int type
multiplication exceeds the range that int type can represent,
an overflow will occur even if you store the result in a
variable of int64_t type.

For a multiplication of two int values, it is better to use
mul_u32_u32() rather than s->exit_latency_ns = s->exit_latency *
NSEC_PER_USEC to avoid potential overflow happenning.

Signed-off-by: C Cheng <C.Cheng@mediatek.com>
Signed-off-by: Bo Ye <bo.ye@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
[ rjw: New subject ]
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpuidle/driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
index f70aa17e2a8e0..c594e28adddf3 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -16,6 +16,7 @@
 #include <linux/cpumask.h>
 #include <linux/tick.h>
 #include <linux/cpu.h>
+#include <linux/math64.h>
 
 #include "cpuidle.h"
 
@@ -185,7 +186,7 @@ static void __cpuidle_driver_init(struct cpuidle_driver *drv)
 			s->target_residency_ns = 0;
 
 		if (s->exit_latency > 0)
-			s->exit_latency_ns = s->exit_latency * NSEC_PER_USEC;
+			s->exit_latency_ns = mul_u32_u32(s->exit_latency, NSEC_PER_USEC);
 		else if (s->exit_latency_ns < 0)
 			s->exit_latency_ns =  0;
 	}
-- 
2.43.0


