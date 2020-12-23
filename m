Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417B5C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:21:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D28322285
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 02:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D28322285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BHczceSrH/0ux4Vlhw/Wrj5MU3/T7Q6lyIs+1LBB60U=; b=s0yGe/F0iApoLyyCDTfdJgfSN
	7ComKjxcc6kmv5I6CA84ae7doXifH9Lo6ZLmoV5/5iHjITSDG8YBGyTfHzC7qbbxWJ73oUJONchoa
	mdmrHHirH1VatNwzTcMU+295nDAUeLN5uSZZeAhEtkT/PnPiqiBs2zgeLvR7P3W0PV7cYCoJlJCo3
	dhvyDBCtINKGhBDJ0d2Irf0zdy+AHOeo4nB1sdRUFZJcZk4M9m0Id4nsAFos0+vvdKfBZFalpIdyA
	uI66pJfA4VUJhasCiaKiNvPo8Zgyq7uuW/H8d9Q7SKAoEKNMqY0+jkXNoHLSg8PFzu7LpbEb2CfYK
	S04dAA06g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krtm7-0000ra-9X; Wed, 23 Dec 2020 02:21:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krtl3-0000B4-NJ; Wed, 23 Dec 2020 02:20:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 077F522248;
 Wed, 23 Dec 2020 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608690008;
 bh=xsujZuYTs+rWJSomwqtj1+QjlAWeKURknxZUciyVNgA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l6XBe4mduqBK00a1a7zanvF8249zMoP+WG2gZeWECiQPjHl/nH6LaVmuT/2fDQQW3
 ar4U4X4rCPi2IHGILlD4ZFpUteovCHgwZmOdAP4mbHFiENX3wC0Kc1k6XNr4wf9o6R
 Y2/IgabiRidxO7H78xZ6XBG8z5/LKfeIkV+jqmKF3ZO2AmICqVZVCDMdk25X7Kghxi
 F1Rq/gQruMgOTIz8+4M0asoylK6nzu3I64snYwBqeLhvPWiEm54LxfIC8wCOhund7E
 A/rP2cpNRWJLDKciU+2e6nXXO7EC+DznSI9902ncMN/FSRQq7CEhTX3P/ewrg9NDPE
 91wSotopK9YbA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 089/130] cpufreq: mediatek: add missing
 platform_driver_unregister() on error in mtk_cpufreq_driver_init
Date: Tue, 22 Dec 2020 21:17:32 -0500
Message-Id: <20201223021813.2791612-89-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021813.2791612-1-sashal@kernel.org>
References: <20201223021813.2791612-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_212009_927846_B6DD2CCF 
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
index 0c98dd08273d0..253eece49148c 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -572,6 +572,7 @@ static int __init mtk_cpufreq_driver_init(void)
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
