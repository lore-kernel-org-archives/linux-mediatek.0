Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4FFAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:28:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CFA22273
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CFA22273
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ligeuOKjvXkRh0g4SFGWVIw+j0/3IPUOzIGaoruU68g=; b=xyahtdg2/0DmCKzy2WTeKX8xW
	DN61A6jCi/6z+r5Yh2w2GuzxHtIK+zygIvFKDH1VaTU9jlwlyajOlkQNk2AKyrdjZcq3K3VC+Of4k
	Vq44pr0/CnAYJ3nLu97nfJgwDRRR7WCPJWazwnM8xUoqW9wtjr7MUhkU/4WZhkQwyr6qZwhEtZfie
	qHgMsu/tSazyi9J0hsHFsLzm90SPqN9jMFPCN311fg0NoAc3Mn4AQQOTal6e4rjqYXwY3LmJb9the
	lnjco5hhzRTBhHQyOHTD4MT53zAS50J49WJvFXHs/hyleZOkVWq9+N6qMrhl00NFbL+BAUW6hHEzs
	2LsC/OtOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtss-0004ac-Mn; Wed, 23 Dec 2020 02:28:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtnD-0001YM-SH; Wed, 23 Dec 2020 02:22:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDB1A2312E;
 Wed, 23 Dec 2020 02:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690141;
 bh=X9kGNPC/uquO0NuoTTHGigG2uPGOTanUbGBEW4NI0RQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XafFF0MZCVIKw94Jw8h06JqWUoKppNVwItAmNXPpFr1i0cHknoDZzXqhfZMss/LSj
 H4JBwcluspG93oQKqV/dKjDrcjsgzhnpZmjCbLYBur71K5Os/YVJq1MPJE9aJcAg6k
 TMdJL60iRQVzLALAWzgLEIRrL9ylPtqML/dEC7rgAp0LRElsPtNYRZkMM2nICWbKbt
 3APjodKNvT57rnzoPHb6gUTc4R7npBil0kAT0h+xAVx+LMiPoxs3O6vMgChrUBfRO8
 8jo0UqprxgYF10T+LgBex5JRcIyjKsJEjZOol3cL1OlW6IiSusYIhQbHZe+ZLXH6In
 SNSabgTERRNpQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 63/87] cpufreq: mediatek: add missing
 platform_driver_unregister() on error in mtk_cpufreq_driver_init
Date: Tue, 22 Dec 2020 21:20:39 -0500
Message-Id: <20201223022103.2792705-63-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223022103.2792705-1-sashal@kernel.org>
References: <20201223022103.2792705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_212224_125702_42E161FD 
X-CRM114-Status: GOOD (  10.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, linux-pm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qinglang Miao <miaoqinglang@huawei.com>

[ Upstream commit 2f05c19d9ef4f5a42634f83bdb0db596ffc0dd30 ]

Add the missing platform_driver_unregister() before return from
mtk_cpufreq_driver_init in the error handling case when failed
to register mtk-cpufreq platform device

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index eb8920d398181..83c0c078d3048 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -586,6 +586,7 @@ static int __init mtk_cpufreq_driver_init(void)
 	pdev = platform_device_register_simple("mtk-cpufreq", -1, NULL, 0);
 	if (IS_ERR(pdev)) {
 		pr_err("failed to register mtk-cpufreq platform device\n");
+		platform_driver_unregister(&mtk_cpufreq_platdrv);
 		return PTR_ERR(pdev);
 	}
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
