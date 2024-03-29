Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66A5C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eQKwf0Z+/IU8P6FzXPXgNYGM69mSrUpyYay8JCX58M=; b=SmfChvrHAl4Lt7aAjYMnnw53Xk
	UT91P7XP/hxT3/opWNfbw2d7Itllbfh+RGWNLsepxK6zUrfb9aAX065XvBYOvQqJKJdoJ29xFaQ33
	IXXZJmIWCur8zq/uwJyNgqr3Gc7obzhp+JINFuoDUFCiZRrQm9r+2DLt8p2j5ponZZQ7BGQG1oWfo
	FuvK5eFHzQ8rIZKOTQ6qLtZkYzeSy0uKk082P8e0JI8enH3ibnwwsnEjAHyED8dyxPNFLYi1C9gYW
	8bn/bB7/ZuJMUp7n6J8ya+mGro2vsmDf9PX50fLpxzD+r7GFNeUY4naTGhZLuHXGewFjndVJKLHa8
	kuERD/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBNO-00000000MFJ-0kuC;
	Fri, 29 Mar 2024 12:30:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBNF-00000000M9V-3tex;
	Fri, 29 Mar 2024 12:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4202CCE28DA;
	Fri, 29 Mar 2024 12:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCF1C433F1;
	Fri, 29 Mar 2024 12:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715419;
	bh=uRO9hNSHchqspmCb1F6je6akXTN4Hy8qBEMg95DG9jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SFlaGjzjCEXWlMQSkYxntF1dfRWgtVpKNt8cyNEAG61rCUcy6A6IVWT4DTzAEQndR
	 zg3BhendHhFcs7Sfoqze9oaafHh8ZE+nJ46WEvq82xCuYCl2qda7MWcJz+yaG3mdPz
	 DKYbfj9VhFPXX7hSav1mpiShXUnUUu8gln2Z+VRYTa6sRGODOaXc0Njv/QsTewbZT+
	 1v+2DJE26Jv9H3sy502RIK2iUeEBLgdEezZspfPHOWkBo3BhEaMNb6i7Rcz8MkBKYV
	 WMMg0Ie+H0o0aCcvsU89iRrMNVw+X+KYaD6L9mzAD4DaQYoGR4yp+lJ57SlkIpjBRP
	 jUkHr3hklRWqQ==
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
Subject: [PATCH AUTOSEL 6.6 14/52] cpuidle: Avoid potential overflow in integer multiplication
Date: Fri, 29 Mar 2024 08:28:44 -0400
Message-ID: <20240329122956.3083859-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122956.3083859-1-sashal@kernel.org>
References: <20240329122956.3083859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_053022_526864_08FF46EA 
X-CRM114-Status: GOOD (  13.28  )
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
index d9cda7f6ccb98..cf5873cc45dc8 100644
--- a/drivers/cpuidle/driver.c
+++ b/drivers/cpuidle/driver.c
@@ -16,6 +16,7 @@
 #include <linux/cpumask.h>
 #include <linux/tick.h>
 #include <linux/cpu.h>
+#include <linux/math64.h>
 
 #include "cpuidle.h"
 
@@ -187,7 +188,7 @@ static void __cpuidle_driver_init(struct cpuidle_driver *drv)
 			s->target_residency = div_u64(s->target_residency_ns, NSEC_PER_USEC);
 
 		if (s->exit_latency > 0)
-			s->exit_latency_ns = s->exit_latency * NSEC_PER_USEC;
+			s->exit_latency_ns = mul_u32_u32(s->exit_latency, NSEC_PER_USEC);
 		else if (s->exit_latency_ns < 0)
 			s->exit_latency_ns =  0;
 		else
-- 
2.43.0


