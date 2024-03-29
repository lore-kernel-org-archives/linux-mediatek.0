Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF7CD11DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=VnOWgZbY28Qhy/F5PsvXBvObjh
	B/YBqG5rLp3FB6h4Nz6eW7wCL8MZ+f4VUv9i2kLfbQ8XHTHF524Zdla1cDn4NTls92sgW4bj8jNHq
	xCcJFrjKwLPxYBEzkskf+2tUeC+URE6tBctOS+LSq1leusd6HknJ3G+gjyQ5RGW1LxSfKIO3XttMr
	BgqA6YcYZcE8gHG5hv1XUB+xJCvBfACq+12fsooX6vmRaHSlDjwytFKZExSKchupw/u7TAseYYJ/j
	YkChTUDvSC0tIveHHJTdity9+lnMzGX40ChsYEefCGuuqMJt1oSS6R/zWdm+xir29h2sEuszZNj6N
	IuIpKc7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqCbk-00000000jpI-0Jf7;
	Fri, 29 Mar 2024 13:49:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQO-00000000NOF-3kRs;
	Fri, 29 Mar 2024 12:33:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pwS1ON/JJah49cVCqcFkCazDcULif+FnoEQQ3ZD7xPM=; b=PoPIf2LGEy6Zl5/2/PTghYEOSO
	mpyakE9K8hhii9DsFpwTgLyY5fm017/nJekSzcafOKf0ncVMAYs/7m+QhgxDdm62AvwrnDzSA0oib
	K7b4K3f1vG7EI3flxGDqWba7jka9fgqYU9ruHBjcLTMxQnsNpe3/v/GsNvYyKz4DWPV2Z0IJAV9N2
	nT5mCfZ1/J6DFlupQojni/GuxGQsGpBkYiVIaw7iFAPXUNweMDEeeRwqrEDjAezMu2j/AzjXshBY6
	3+l9iRD3owvEZhZVJcCcDzCoEqU444eeWvbNnCaKY3u5oOQb6ZBnRZGaaRfYMb+WyOUQCSOKu0Yem
	jgAXdMtg==;
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBQL-00000001YUl-1pk7;
	Fri, 29 Mar 2024 12:33:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 179C0CE2F77;
	Fri, 29 Mar 2024 12:33:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2734C43390;
	Fri, 29 Mar 2024 12:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715607;
	bh=Kx+1H+QtnuCB8ciX29fyhB79zT4Lxwy5pONlNfKxAiY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dtIMhUz+sjAK2RIAXT0244Fa83nkSFwUPuMJyUW1fJrPI4ci51MyCJ/qXMDlINIZl
	 DGjD+A197VcN/cZeNK6NxXQMgfObBm4Tp4dBRzUyTjm4Isf9TAbTIa6i0HWxN8M5F1
	 ErEizI+j2IKccahFXAdgHA+W0qt8v0/uSCXoEnOka4yVJBv/UQ5woJAgM9gVwM/3YY
	 rbcHDRe/mT0EjrFV4nwUsai+zF9dsSMlMMjwu1+FL6mn54JLjj7FX2ENEu0yI67xFi
	 zR9ZZXjg3OrF92z9Fy6UCGfPGia5YyO1mI57vmOcDTARIVNYd4Pb+GT/kRbz6Fmmcr
	 e69NRzo/eT7kA==
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
Subject: [PATCH AUTOSEL 5.15 06/20] cpuidle: Avoid potential overflow in integer multiplication
Date: Fri, 29 Mar 2024 08:32:54 -0400
Message-ID: <20240329123316.3085691-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329123316.3085691-1-sashal@kernel.org>
References: <20240329123316.3085691-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.153
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_123333_790628_2B065B50 
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


