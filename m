Return-Path: <SRS0=R22q=EG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4CD4C00A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 01:13:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D6E207DE
	for <linux-mediatek@archiver.kernel.org>; Sat, 31 Oct 2020 01:13:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sUU/Tdgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D6E207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8PQLopQ/s9eqxfPTQfsUvSlRtclkUjT/gadzU6jF4KA=; b=sUU/TdgvlkXbBfRNBzh8UzVWB4
	C87jQgbxVq4Fk6TgpTECo3i7al0J4dQ4z9yftbSoUhNvQ69N2D9x89wzJs3OrKlfMVL1kj3EGLkCG
	Y8t2Qe6KjfEYxGf8IzztFmFeyZrwaVpBKC+7NSEvRUr7TZnE0+3s5Hqth3oeZqaMyjE0RmYzf7MJa
	3qG3mRxj/w7kDOKU+yM3qIjs0yycc/cNtE+47fPljuVWsRwrelpCNdo4a6VgXbHu5iclSXGw8rXt+
	UnNUJZ7vm/Q6Jg9EWnyuFN49N7oD+bX7VwR0w2dIQxg4OkMWm/CV8ISVZuiMDe+fot5Pqo1tdDEPE
	y8FQNNnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYfSe-00079a-CD; Sat, 31 Oct 2020 01:13:40 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYfSY-000786-Lp; Sat, 31 Oct 2020 01:13:36 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CNLlf00YszhdT9;
 Sat, 31 Oct 2020 09:13:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 09:13:07 +0800
From: Qinglang Miao <miaoqinglang@huawei.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] cpufreq: mediatek: add missing platform_driver_unregister()
 on error in mtk_cpufreq_driver_init
Date: Sat, 31 Oct 2020 09:18:54 +0800
Message-ID: <20201031011854.137261-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_211334_962850_DA19BFFD 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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
Cc: Qinglang Miao <miaoqinglang@huawei.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the missing platform_driver_unregister() before return from
mtk_cpufreq_driver_init in the error handling case when failed
to register mtk-cpufreq platform device

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7d1212c9b..c03c76a0c 100644
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
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
