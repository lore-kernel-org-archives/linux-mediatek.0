Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 220F5C11F66
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 00:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA14561424
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 00:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA14561424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o9dxt4M7+ZnukNPpiHSY7X/xEhzbSIFhgXK8FaAGFcY=; b=DcWnkRFwNolWkx
	kgTRH0GDtkEssdHWgFVyT+wMeK2ix3a7FLHeVcMRVHUs9MBUNhwN9puK1BUYnN7pYbH27FRNKJO6r
	UrLinyXpehz2BBkrFdmIPFxk/b8sWCCRox7RHE9Lp67W0GUFw+kJz87LT+DIcfzDs6XkZ1/m+Fv9F
	hHoY0h1aqICogcVGt+72t3G3W9O0rFYcCtp3Lc0Wjr7zcF3itkyLpN/O4TabSBTCEKHOyvXz96EqQ
	LoS3ZYfZgQHXguRUdWcuoZuE2Gl3ol1cpeZrwLE26bVwJTcQw6YTCMzAPv3w0fefqZI/vs8F7QaFK
	fU341EpbViZCPfWdtYNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lykq9-00FjNU-3S; Thu, 01 Jul 2021 00:46:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lykq2-00FjKp-Ev; Thu, 01 Jul 2021 00:45:59 +0000
X-UUID: d8496d988c704639a07d1485eb57862d-20210630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cxL25SiFe7iV7Ujc9MXeaq6WJZVFk1mTNtOtkoz4IYY=; 
 b=D4Ll/SfWjUFumewNytVGe56hCz3C+nJc9oInu9vs3zP/OG8VhKWmpgxr0w7t81p6MZm9YjDzEpiZYW/tMMcjdsH5zEiBxjlg0NqjsA/eK0nFuZtfy31DaG/y91ZgHRiYwuZozLm03ZutGK0bk7iLZ/kbtMZbfsEae6Fe2gTcHAM=;
X-UUID: d8496d988c704639a07d1485eb57862d-20210630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912528803; Wed, 30 Jun 2021 17:45:49 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 17:45:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 08:45:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 1 Jul 2021 08:45:40 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <gregkh@linuxfoundation.org>
CC: <matthias.bgg@gmail.com>, <rjw@rjwysocki.net>, <pavel@ucw.cz>,
 <len.brown@intel.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <mark-pk.tsai@mediatek.com>,
 <yj.chiang@mediatek.com>
Subject: [PATCH] PM: sleep: use ktime_us_delta in initcall_debug_report()
Date: Thu, 1 Jul 2021 08:45:38 +0800
Message-ID: <20210701004538.23483-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_174557_186345_A2D4E601 
X-CRM114-Status: UNSURE (   9.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

usecs is no more used after trace_device_pm_report_time replaced
by device_pm_callback_start/end in the below change.

commit e8bca479c3f2 ("PM / sleep: trace events for device PM callbacks")

Use ktime_us_delta to make the debug log more precise instead of
nsecs >> 10.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/base/power/main.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index f893c3c5af07..d568772152c2 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -220,16 +220,13 @@ static void initcall_debug_report(struct device *dev, ktime_t calltime,
 				  void *cb, int error)
 {
 	ktime_t rettime;
-	s64 nsecs;
 
 	if (!pm_print_times_enabled)
 		return;
 
 	rettime = ktime_get();
-	nsecs = (s64) ktime_to_ns(ktime_sub(rettime, calltime));
-
 	dev_info(dev, "%pS returned %d after %Ld usecs\n", cb, error,
-		 (unsigned long long)nsecs >> 10);
+		 (unsigned long long)ktime_us_delta(rettime, calltime));
 }
 
 /**
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
