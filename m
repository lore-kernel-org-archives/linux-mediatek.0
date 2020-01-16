Return-Path: <SRS0=rC0f=3F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839A9C33CAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 04:36:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5656F2073A
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jan 2020 04:36:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IhqY4Qqh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="fN56Jr4n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5656F2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cSPrNaF6WRgIiID5LIczjXpCOwr25Ugp5dVsO4t3x6I=; b=IhqY4QqhEn03Np
	L4O3WaNvCNQJN+V8hw2VXb7wxKy9mufh90eUPQtAURc4XiUNeUgvkRYl5cj/c9aoo7Bpp2kOAtmkD
	xmJd1+Cc/TvNbo32GODSoR/qEWcvPCa5GLc6UFGofRvK4sEUftre1BH7flojckGMp3ds3qmDygjOt
	34iC1Q90n7qkb12rBlmjciWiIzcPeaAJG/p6fxILVobYRyrUpeAW+s3AFDf5ZA3/+GPxkwxTIJuYi
	apWfYCdCI5BkeQ+sAF3IDLJ6cIzsy4Ozx4S52R5nKal6vUcOYYihXk7/tUY6pQ5QymHGdwdg9cHYQ
	Eh5K9Zk+eK0nBNBcD2qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irwtI-0000Gy-OQ; Thu, 16 Jan 2020 04:36:20 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irwtG-0000GA-5C
 for linux-mediatek@lists.infradead.org; Thu, 16 Jan 2020 04:36:19 +0000
Received: by mail-pl1-x649.google.com with SMTP id f10so8096604plr.21
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Jan 2020 20:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=iNg4g6cNRZYUNuBsTO74IwcH6tuAcaZ/nzmuUCgI7YQ=;
 b=fN56Jr4nvW06HTQ13RJneqj6X8lflgmq6jlCoKsIPmknMl26RPKWCz8YEw1tHa1jYz
 2FHoKNebeuIlL6IVX9VRKW/oUm9eaZqm+8btqLQ+Nlcd1VZiHbmg/BoKSpmF3FoJIoqo
 6288KMRzjyYttljMBr1z60uAlr8s/UoWzpL6nPgZWUat7AqhnKexYi5cfsk+npyXYqtZ
 3A+h/dAOOUB0LJrFQh2qEQP/OiXhnOm9Q9/zvYNeu8l66371mJxlH2QimcYGjNM3gCyf
 QWaNg/ehOECHaLWi6uhhJ/vhW8Z0wBC8Td+0KrpsYSt+KrXhE1CCQbHvIvlrocKve+JL
 vPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=iNg4g6cNRZYUNuBsTO74IwcH6tuAcaZ/nzmuUCgI7YQ=;
 b=U92V1hH0JIAU47G3r5zBa3pTVZ3nHNCHPbIX/NVkUFzLPy04dBvC8f0zd84xELcHSy
 ODE1xIgt4HnKTGrGDRPTIAlz4VAw0ASe/VzuatklFg+bGi1w1pUVB8Y7AlkdY37rUGA+
 KlHA2lfQ/FuZJt++HB2lQMPUfdSqmDofQyf4HTlK/a3E5Mkp0ztp7EAocmvIGOeS9pZr
 f6puf/fbM0UYNAUzJK28NBO16kWXaTIrubuaaqvuJrzIAN1N65w/uK57iw2xwi/dEeXs
 wMmTJKqSLjqvslh9Vf9AidvVSwHkiqFgiX7N8AfIFYVk97rhxzzKewXJWX5RAXwLxK/c
 iMkg==
X-Gm-Message-State: APjAAAVIgsTRBbUFwYIvCPAncnWPrZcJH4aq25KEqmgHiq3OCEiim4LO
 21ZbilzULpjGCcpYnAmVw/wJHrRDh/I=
X-Google-Smtp-Source: APXvYqzkI7+HJc2DBEcUiBL1OG8evclCeD08SK626xi0qNNGMKZfjols95ySgh76BxNKtrvJ3r6rUEDzoXM=
X-Received: by 2002:a63:f202:: with SMTP id v2mr36549471pgh.420.1579149376256; 
 Wed, 15 Jan 2020 20:36:16 -0800 (PST)
Date: Wed, 15 Jan 2020 20:36:11 -0800
Message-Id: <20200116043612.52782-1-surenb@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
Subject: [PATCH 1/2] cgroup: allow deletion of cgroups containing only dying
 processes
From: Suren Baghdasaryan <surenb@google.com>
To: surenb@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_203618_227268_42FC40BA 
X-CRM114-Status: GOOD (  16.59  )
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
Cc: mkoutny@suse.com, linger.lee@mediatek.com, kernel-team@android.com,
 linux-kernel@vger.kernel.org, tomcherry@google.com, matthias.bgg@gmail.com,
 lizefan@huawei.com, linux-mediatek@lists.infradead.org,
 linux-kselftest@vger.kernel.org, hannes@cmpxchg.org, tj@kernel.org,
 cgroups@vger.kernel.org, alex.shi@linux.alibaba.com, shuah@kernel.org,
 guro@fb.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A cgroup containing only dying tasks will be seen as empty when a userspace
process reads its cgroup.procs or cgroup.tasks files. It should be safe to
delete such a cgroup as it is considered empty. However if one of the dying
tasks did not reach cgroup_exit then an attempt to delete the cgroup will
fail with EBUSY because cgroup_is_populated() will not consider it empty
until all tasks reach cgroup_exit. Such a condition can be triggered when
a task consumes large amounts of memory and spends enough time in exit_mm
to create delay between the moment it is flagged as PF_EXITING and the
moment it reaches cgroup_exit.
Fix this by detecting cgroups containing only dying tasks during cgroup
destruction and proceeding with it while postponing the final step of
releasing the last reference until the last task reaches cgroup_exit.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Reported-by: JeiFeng Lee <linger.lee@mediatek.com>
Fixes: c03cd7738a83 ("cgroup: Include dying leaders with live threads in PROCS iterations")
---
 include/linux/cgroup-defs.h |  3 ++
 kernel/cgroup/cgroup.c      | 65 +++++++++++++++++++++++++++++++++----
 2 files changed, 61 insertions(+), 7 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 63097cb243cb..f9bcccbac8dd 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -71,6 +71,9 @@ enum {
 
 	/* Cgroup is frozen. */
 	CGRP_FROZEN,
+
+	/* Cgroup is dead. */
+	CGRP_DEAD,
 };
 
 /* cgroup_root->flags */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 735af8f15f95..a99ebddd37d9 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -795,10 +795,11 @@ static bool css_set_populated(struct css_set *cset)
  * that the content of the interface file has changed.  This can be used to
  * detect when @cgrp and its descendants become populated or empty.
  */
-static void cgroup_update_populated(struct cgroup *cgrp, bool populated)
+static bool cgroup_update_populated(struct cgroup *cgrp, bool populated)
 {
 	struct cgroup *child = NULL;
 	int adj = populated ? 1 : -1;
+	bool state_change = false;
 
 	lockdep_assert_held(&css_set_lock);
 
@@ -817,6 +818,7 @@ static void cgroup_update_populated(struct cgroup *cgrp, bool populated)
 		if (was_populated == cgroup_is_populated(cgrp))
 			break;
 
+		state_change = true;
 		cgroup1_check_for_release(cgrp);
 		TRACE_CGROUP_PATH(notify_populated, cgrp,
 				  cgroup_is_populated(cgrp));
@@ -825,6 +827,21 @@ static void cgroup_update_populated(struct cgroup *cgrp, bool populated)
 		child = cgrp;
 		cgrp = cgroup_parent(cgrp);
 	} while (cgrp);
+
+	return state_change;
+}
+
+static void cgroup_prune_dead(struct cgroup *cgrp)
+{
+	lockdep_assert_held(&css_set_lock);
+
+	do {
+		/* put the base reference if cgroup was already destroyed */
+		if (!cgroup_is_populated(cgrp) &&
+		    test_bit(CGRP_DEAD, &cgrp->flags))
+			percpu_ref_kill(&cgrp->self.refcnt);
+		cgrp = cgroup_parent(cgrp);
+	} while (cgrp);
 }
 
 /**
@@ -838,11 +855,15 @@ static void cgroup_update_populated(struct cgroup *cgrp, bool populated)
 static void css_set_update_populated(struct css_set *cset, bool populated)
 {
 	struct cgrp_cset_link *link;
+	bool state_change;
 
 	lockdep_assert_held(&css_set_lock);
 
-	list_for_each_entry(link, &cset->cgrp_links, cgrp_link)
-		cgroup_update_populated(link->cgrp, populated);
+	list_for_each_entry(link, &cset->cgrp_links, cgrp_link) {
+		state_change = cgroup_update_populated(link->cgrp, populated);
+		if (state_change && !populated)
+			cgroup_prune_dead(link->cgrp);
+	}
 }
 
 /*
@@ -5458,8 +5479,26 @@ static int cgroup_destroy_locked(struct cgroup *cgrp)
 	 * Only migration can raise populated from zero and we're already
 	 * holding cgroup_mutex.
 	 */
-	if (cgroup_is_populated(cgrp))
-		return -EBUSY;
+	if (cgroup_is_populated(cgrp)) {
+		struct css_task_iter it;
+		struct task_struct *task;
+
+		/*
+		 * cgroup_is_populated does not account for exiting tasks
+		 * that did not reach cgroup_exit yet. Check if all the tasks
+		 * in this cgroup are exiting.
+		 */
+		css_task_iter_start(&cgrp->self, 0, &it);
+		do {
+			task = css_task_iter_next(&it);
+		} while (task && (task->flags & PF_EXITING));
+		css_task_iter_end(&it);
+
+		if (task) {
+			/* cgroup is indeed populated */
+			return -EBUSY;
+		}
+	}
 
 	/*
 	 * Make sure there's no live children.  We can't test emptiness of
@@ -5510,8 +5549,20 @@ static int cgroup_destroy_locked(struct cgroup *cgrp)
 
 	cgroup_bpf_offline(cgrp);
 
-	/* put the base reference */
-	percpu_ref_kill(&cgrp->self.refcnt);
+	/*
+	 * Take css_set_lock because of the possible race with
+	 * cgroup_update_populated.
+	 */
+	spin_lock_irq(&css_set_lock);
+	/* The last task might have died since we last checked */
+	if (cgroup_is_populated(cgrp)) {
+		/* mark cgroup for future destruction */
+		set_bit(CGRP_DEAD, &cgrp->flags);
+	} else {
+		/* put the base reference */
+		percpu_ref_kill(&cgrp->self.refcnt);
+	}
+	spin_unlock_irq(&css_set_lock);
 
 	return 0;
 };
-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
