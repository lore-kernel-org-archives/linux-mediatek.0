Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFE8C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 23:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h866RBXFCMLKcrUkIoDHPm5Ogjyr1puf86hy9aoUroI=; b=1Kf54CGEnUBUU9
	2zm3eUNhlukUOBdqH6ywvm+lSqGTlU3sK+/4NrBWkJq+etmfcWWnkil/Ioz6nmkLB21RGLM6lfAAD
	SXn8xD61Vfdusr0sZDYRpxXa8/vyPMd9RHmmt1vR6MXVV7ahC3kiUnbFTrUTA5LhVMWVI8AmRv687
	q5OKK26Ry0iJG8CKageg3zNye3GT2d15rivZIwukbbZUsMmwzR+r85Li0l7ZlM8z6DNRxXOcM1nBP
	TUarAeGzBOa4d31bMvRLkuIFAR27pUBlbGIMSZSL7gMDKY3qw1iICaL9OzRaZwCzgnVJwSZx+Qvv4
	ZHf2HajTuTP8cIHJcK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUdSd-00EWci-Eh; Wed, 16 Mar 2022 23:53:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUdRX-00EW0A-PK; Wed, 16 Mar 2022 23:52:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 479B01476;
 Wed, 16 Mar 2022 16:52:39 -0700 (PDT)
Received: from e123648.arm.com (unknown [10.57.19.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 662E33F766;
 Wed, 16 Mar 2022 16:52:36 -0700 (PDT)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org
Cc: lukasz.luba@arm.com, dietmar.eggemann@arm.com, Pierre.Gondois@arm.com,
 ionela.voinescu@arm.com, viresh.kumar@linaro.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, mka@chromium.org,
 nm@ti.com, sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, cristian.marussi@arm.com,
 sudeep.holla@arm.com, matthias.bgg@gmail.com
Subject: [[PATCH 5/8] PM: EM: Remove old debugfs files and print all 'flags'
Date: Wed, 16 Mar 2022 23:52:08 +0000
Message-Id: <20220316235211.29370-6-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220316235211.29370-1-lukasz.luba@arm.com>
References: <20220316235211.29370-1-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_165239_894677_DE61A381 
X-CRM114-Status: UNSURE (   9.48  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The Energy Model gets more bits used in 'flags'. Avoid adding another
debugfs file just to print what is the status of a new flag. Simply
remove old debugfs files and add one generic which prints all flags
as a hex value.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
 kernel/power/energy_model.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/kernel/power/energy_model.c b/kernel/power/energy_model.c
index babefc72085d..092513575e4e 100644
--- a/kernel/power/energy_model.c
+++ b/kernel/power/energy_model.c
@@ -54,28 +54,15 @@ static int em_debug_cpus_show(struct seq_file *s, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(em_debug_cpus);
 
-static int em_debug_units_show(struct seq_file *s, void *unused)
+static int em_debug_flags_show(struct seq_file *s, void *unused)
 {
 	struct em_perf_domain *pd = s->private;
-	char *units = (pd->flags & EM_PERF_DOMAIN_MILLIWATTS) ?
-		"milliWatts" : "bogoWatts";
 
-	seq_printf(s, "%s\n", units);
+	seq_printf(s, "%#lx\n", pd->flags);
 
 	return 0;
 }
-DEFINE_SHOW_ATTRIBUTE(em_debug_units);
-
-static int em_debug_skip_inefficiencies_show(struct seq_file *s, void *unused)
-{
-	struct em_perf_domain *pd = s->private;
-	int enabled = (pd->flags & EM_PERF_DOMAIN_SKIP_INEFFICIENCIES) ? 1 : 0;
-
-	seq_printf(s, "%d\n", enabled);
-
-	return 0;
-}
-DEFINE_SHOW_ATTRIBUTE(em_debug_skip_inefficiencies);
+DEFINE_SHOW_ATTRIBUTE(em_debug_flags);
 
 static void em_debug_create_pd(struct device *dev)
 {
@@ -89,9 +76,8 @@ static void em_debug_create_pd(struct device *dev)
 		debugfs_create_file("cpus", 0444, d, dev->em_pd->cpus,
 				    &em_debug_cpus_fops);
 
-	debugfs_create_file("units", 0444, d, dev->em_pd, &em_debug_units_fops);
-	debugfs_create_file("skip-inefficiencies", 0444, d, dev->em_pd,
-			    &em_debug_skip_inefficiencies_fops);
+	debugfs_create_file("flags", 0444, d, dev->em_pd,
+			    &em_debug_flags_fops);
 
 	/* Create a sub-directory for each performance state */
 	for (i = 0; i < dev->em_pd->nr_perf_states; i++)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
