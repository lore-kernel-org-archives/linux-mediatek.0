Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDB0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:39:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B68520829
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 03:39:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qMVVKh2h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YM3g9zUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B68520829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IQWLouMdh9sQT7p/2+Kvnbc+nDVSAllM6uvQS+xkGzA=; b=qMVVKh2h6Thm2P6pyx8h+3c0y
	wWYwh7GTlTMOHAPxQA2qq917O/zpuKR8hTcTnn1T1+nH1I+AR0aHdftmOKFsH4cgVhGX+6raJrS6R
	AmPSg6uZ5i7DuzPIAvOPiqwcgwrFaq8PZKwjFbpqiT0xYHXiYW/K8/QM9Z04FYT+LLpW429lOHw6l
	3NfcrdsDZ+++8buB9h2h4W9veaL/WJXL7diVYToCUNx79EiVYErNhgi1EDSyC+oewDtn4rSIQozDG
	5Srne5lWidAt/8LOp0sBsGAJbQoTuAP2jAnnR/Ag3JDpPsr5LW0cRlsn9EZLNX9PeaF/+Yc2zgDhG
	yP805F3cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1LtC-0006q1-FA; Fri, 31 Jul 2020 03:39:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Lt9-0006pG-RB; Fri, 31 Jul 2020 03:39:21 +0000
X-UUID: c4f12213d85a481bbfedb79e1ebc25f9-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=1ERRm3aXwOnbFAuF3CGICnm9rLGKEtIUDiGMxxFg0OM=; 
 b=YM3g9zUhNE4RO4twTYyzLRvTU/yLXrKX82OY6uk5FyK3tNtzp0YKC5b9c4KEOEsTMQj6J2gsRsRjyf2ZWL0S1onBr08e1UN5VtOTBGn0aGpXvFhsD7iCFWsk/E58zse21Sssboaj2JHdLJdyJ8XuIB5WKn4TqRdkU6vWV2Fzlwk=;
X-UUID: c4f12213d85a481bbfedb79e1ebc25f9-20200730
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2084070453; Thu, 30 Jul 2020 19:39:21 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 20:39:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 11:39:04 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 31 Jul 2020 11:39:06 +0800
From: Neal Liu <neal.liu@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Jacob Pan
 <jacob.jun.pan@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH] acpi: fix 'return' with no value build warning
Date: Fri, 31 Jul 2020 11:39:04 +0800
Message-ID: <1596166744-2954-2-git-send-email-neal.liu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1596166744-2954-1-git-send-email-neal.liu@mediatek.com>
References: <1596166744-2954-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_233920_048188_4E5096AD 
X-CRM114-Status: GOOD (  15.84  )
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
Cc: wsd_upstream@mediatek.com, linux-pm@vger.kernel.org,
 lkml <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 Neal Liu <neal.liu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixing CFI issue which introduced by commit efe9711214e6 is
incomplete.
Add return value to fix return-type build warning.

Signed-off-by: Neal Liu <neal.liu@mediatek.com>
---
 drivers/acpi/processor_idle.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/processor_idle.c b/drivers/acpi/processor_idle.c
index 6ffb6c9..6870020 100644
--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -664,11 +664,11 @@ static int acpi_idle_enter_s2idle(struct cpuidle_device *dev,
 		struct acpi_processor *pr = __this_cpu_read(processors);
 
 		if (unlikely(!pr))
-			return;
+			return -EFAULT;
 
 		if (pr->flags.bm_check) {
 			acpi_idle_enter_bm(pr, cx, false);
-			return;
+			return 0;
 		} else {
 			ACPI_FLUSH_CPU_CACHE();
 		}
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
