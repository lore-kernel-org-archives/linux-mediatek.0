Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A66C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 14:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ffksXxoRYYMJUCEb9FODdIW68oZzvUpCta9+dxxRHY=; b=dxdPhZvVEeSouC
	lHQJ3WHRLmkXkqyB+j3TgS5eJD1ykm6r6k/oFGnRfDDxai7MC0iALCXqnTehaylIyrAg6lKQRYFV1
	peqZUpFaqc1qD9XXEivyVM0iAkLQmUHv0POqPK9bma4LfV0wHIU46boRw4uAodSL7ghGRH2UIfXl+
	c4kcNkfKiy8cJwyM628Ca1Tq6cjNyizhpWWWlnzBiVNKQEe0Bj/95vbYwa7oD7ol5da8owDMHGvUV
	kqdCYJfXTst8NAeJEKRUCU0arf8AgmMhg2EPCNvBFzSwY3rjNheU6njXCIjU5q/jmzpfsYS65RDST
	Ut6qn5tYHjcDwgObeTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOz8-00GVVJ-TS; Wed, 01 Jun 2022 14:06:06 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwOqV-00GQyU-RZ; Wed, 01 Jun 2022 13:57:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 42A13CE1C35;
	Wed,  1 Jun 2022 13:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7F6C36AF4;
	Wed,  1 Jun 2022 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654091829;
	bh=rwAcKcC1TTyoUSUWY4uS7Xn/Go0skmGw/R7r7MS/DDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSH20pBZqhenih5BABvB5kAn+1Vj2KxjALUw5D91kHhPvHuIe4xTJ6ZOKVUkkTQH3
	 FDsoHkdW1bTfLugJYNWbhEK3d27Tyl55fPT0W0BCxrM1zbh1qYy7Ly9lBNBARpBB9S
	 MyK3/NvNhrFEryuKwz6jCi/CjdNGaG0CXMZgqz5WQlx2ZztT3rg5aWfYwzOm/s+5/4
	 tWEhecsTSTggCKaIjnPBib/qvmcvSyEPRNZP20q/+yAcFjSZ47btWDgTmGbEFEJuWY
	 OQOaN3AOvMDjxGfbLb9cgpTuapb9aXaDbvi4lKZUhUK/kuWP37iRzjc3kcsb24I6Mi
	 FNLO7daEYq+vA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	rafael@kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 23/37] cpufreq: Avoid unnecessary frequency updates due to mismatch
Date: Wed,  1 Jun 2022 09:56:08 -0400
Message-Id: <20220601135622.2003939-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601135622.2003939-1-sashal@kernel.org>
References: <20220601135622.2003939-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_065712_101784_DD297981 
X-CRM114-Status: GOOD (  14.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Viresh Kumar <viresh.kumar@linaro.org>

[ Upstream commit f55ae08c89873e140c7cac2a7fa161d31a0d60cf ]

For some platforms, the frequency returned by hardware may be slightly
different from what is provided in the frequency table. For example,
hardware may return 499 MHz instead of 500 MHz. In such cases it is
better to avoid getting into unnecessary frequency updates, as we may
end up switching policy->cur between the two and sending unnecessary
pre/post update notifications, etc.

This patch has chosen allows the hardware frequency and table frequency
to deviate by 1 MHz for now, we may want to increase it a bit later on
if someone still complains.

Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Tested-by: Jia-wei Chang <jia-wei.chang@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/cpufreq.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index eeac6d809229..cddf7e13c232 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -28,6 +28,7 @@
 #include <linux/suspend.h>
 #include <linux/syscore_ops.h>
 #include <linux/tick.h>
+#include <linux/units.h>
 #include <trace/events/power.h>
 
 static LIST_HEAD(cpufreq_policy_list);
@@ -1701,6 +1702,16 @@ static unsigned int cpufreq_verify_current_freq(struct cpufreq_policy *policy, b
 		return new_freq;
 
 	if (policy->cur != new_freq) {
+		/*
+		 * For some platforms, the frequency returned by hardware may be
+		 * slightly different from what is provided in the frequency
+		 * table, for example hardware may return 499 MHz instead of 500
+		 * MHz. In such cases it is better to avoid getting into
+		 * unnecessary frequency updates.
+		 */
+		if (abs(policy->cur - new_freq) < HZ_PER_MHZ)
+			return policy->cur;
+
 		cpufreq_out_of_sync(policy, new_freq);
 		if (update)
 			schedule_work(&policy->update);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
