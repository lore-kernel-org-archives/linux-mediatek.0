Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0753C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7eQKwf0Z+/IU8P6FzXPXgNYGM69mSrUpyYay8JCX58M=; b=0o9npf2td3OeZHEKu2S9EuBUp3
	Z8jaRtFGPT2q3vjq1ZjVkv9m4fIAd8YgKuJeAcS34YR6/pIR35ZceNiAxqfQVLc0IYwS6pFhg1ppf
	pOuvXSfhUtXPsvD4D6UQh+8E5LfV4Ydrh67Ir9TDIGYe6EEsXpcNbYZGjof8pUwPRVaFytM47tYOz
	WSAVOIMztppa1CEAcBzxwyBRWBV9nGN2eaWmBdj5jOjnrRQZzty1gl4ZHhgIZcSSVo0vfOv/UgCJf
	DhIuSBEpXfGdSBfbIGSCIj3uJ9Y32vPnIZ1JJ0aeGla1Gu+WRV645r+wvw357xxJfWDU5lT4JVxZ5
	zLzrF7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBYN-00000000Qec-1QKO;
	Fri, 29 Mar 2024 12:41:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBXT-00000000QR6-3ToP;
	Fri, 29 Mar 2024 12:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7eQKwf0Z+/IU8P6FzXPXgNYGM69mSrUpyYay8JCX58M=; b=ibHEFBX3oQRpp+n15aHrdAznQQ
	Od6K9QOrn0sevOwyehP1rUxMeNSobOqShjGkfrvdqDro+yBkLzQMUVAUzpHvXxf7Wb3EeIFJiVFwX
	Fyi18dIFn0e7u6iK7BAxHYn8afRc6KMVNfrVnO/qPPdefcRJKF7PZfWLrLA59mMerHmN4fSZnDlYy
	TTphV41O/AD1LZKhTxazbuwS/AuRx5vOL7PRCy8m74EC1/xBxHcJSvy+0M+VIV069ZGKQyQO4t5A+
	3QRq5Y//PlWK0MDFwqYC+1WlVDf+NG6RqS5z1mqdJ+2KGBHVtqIVwEtuhaS5l4mrO4F6l6hD1Vhm/
	j0XMXV7Q==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBXQ-00000001Yqp-3R1g;
	Fri, 29 Mar 2024 12:40:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2ED5061920;
	Fri, 29 Mar 2024 12:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DACC43390;
	Fri, 29 Mar 2024 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711716051;
	bh=uRO9hNSHchqspmCb1F6je6akXTN4Hy8qBEMg95DG9jg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NrZKtPVtBxsI1CXM7WGuCkhix7O9SUgBdXFPSSxc0cTFh1+nJm+2RvxxChlUc0ct1
	 q2UvZyv2UNtrYBMz2ybacAxfrR3meAKJUl4+EaxJEQLbzIgbCw555SMumiHpwRC/Sb
	 sTyysz5wmC0YDXiD6bEpftRrY4wEYF0ImWn74cKzxX5nmF3A9EpdSmdwKFdDzCovjD
	 R5xc2ZtDLUHKvKgopKgX8d14QNHOzdF93mj+35Yfae8pSNahMsS51VQ70Cp4BK+u3e
	 phahzODtPeGYVfv47i1tquE1CRDUAyV8R+RcOUZYeGXraW0qtE4g3A3ItuADBcWVat
	 vjS0wA0QkFF7w==
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
Subject: [PATCH AUTOSEL 6.8 28/98] cpuidle: Avoid potential overflow in integer multiplication
Date: Fri, 29 Mar 2024 08:36:59 -0400
Message-ID: <20240329123919.3087149-28-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123919.3087149-1-sashal@kernel.org>
References: <20240329123919.3087149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_124053_100985_74668FEA 
X-CRM114-Status: GOOD (  13.33  )
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


