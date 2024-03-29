Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECC1C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=rThyQLM1wRIf5bNuNAzeJ9cdpt
	wQ4Cc0BEF4tO4Hy3Vwm0R5PPlnYQ3ei7QFkfZUFQzYhLG+mpn8sz6WgP73TVXVTf3fQdMx+DI/g0Q
	gUeJhHAqGQBe7/Xq3H3uqk5nNJFAVuxS93G8YP6KGuBi6s0/iSv4X0WbS0xoI5KWUT7n5ddB6vOdl
	TBMYRR/wef1JgTzAoVbfLIGEJZQ0+++um6C0neDKpP3nlx14W1AFf+K11D9DBbsZhK13grfiWCsBn
	cdak68Bw3wvFUilxHsRlKk8LkwFgKZ2WgGV6WLnPwjXJL24N/80PIz8C80nJsWNi8GZDRwxijqXFS
	OokwktUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBf6-00000000TNQ-1jjk;
	Fri, 29 Mar 2024 12:48:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBcz-00000000SDW-1l9B;
	Fri, 29 Mar 2024 12:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=Ywkz8lEN7Vc2iQn/8oryvaB2z9
	SeJn1+1ymIaTxwZqnMHFQfTv8kccyEPeyvIFA9sNv41mjgBk933bDldm37ycSIEO/Tqy4akbq1+BR
	sEWgfitQRl2WO7J+PeoaJZkxqob/GhtAxSIEKYk8CN/x9BLmgbStJWV58PqKtIh5qGAWg2ZviYraj
	+TiX/pcSnAg5nqdiwqlsjV4B0fylKMuHtz6QKrvquWNDKi6LdhUTNP/zWGHI3SDu/gxUUzG/1xbMe
	Mt8pDLMS/I06ZFCjUFqEV0vjfTfe2CVvCtPBKfcLbiRRNPidlfgn5kvAPpWMr7Bif/46opNQPybYQ
	MfEhZSIQ==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBcw-00000001Za1-0agr;
	Fri, 29 Mar 2024 12:46:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 46241CE2F9A;
	Fri, 29 Mar 2024 12:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2963EC433C7;
	Fri, 29 Mar 2024 12:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716390;
	bh=Kx+1H+QtnuCB8ciX29fyhB79zT4Lxwy5pONlNfKxAiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sLLRPfomblxWnL5E8qu46AJV+9GDc72gVoeF7+a7nr8txIB2Yx7pQEKiudlo/IIen
	 03jmk9Ws8E5CEsMqpaJtIe2nAEYYJFk4BOCisHENYNHQsx3NlMQ3DEVYnzd2fd6G1R
	 HEjkOjB9wK20w0iHUmB4Bg0nPJ4DnUVY0LZM9wMkaJFzH8392K0XypK51K7ErWCB0m
	 syFs8kn5l7PZ3ZTp+Z0EhgnDJmwPgr+qyfFC504zNnF3+SOH8IXDvvBjDC0pRlXjDZ
	 820BrgWqvVk0KXaNkZBRyHyG5JnoP91toMOttPmHhNOpuDLv/4KpfJ8GqEyqC8GGa5
	 ffKdNLBFx+J3g==
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
Subject: [PATCH AUTOSEL 6.1 14/52] cpuidle: Avoid potential overflow in integer multiplication
Date: Fri, 29 Mar 2024 08:45:08 -0400
Message-ID: <20240329124605.3091273-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329124605.3091273-1-sashal@kernel.org>
References: <20240329124605.3091273-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.83
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_124634_631917_94A9FB60 
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


