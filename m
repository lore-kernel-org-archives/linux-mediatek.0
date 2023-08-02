Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23508C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 00:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oILqqqD951CZa6vFO5lwCGBJV16jZziGq+aTih9CvRM=; b=QJl5FQYKsdBpItOpYgRVvZhYZ0
	XWTaYcwn1XrSeHx64VJaUKTRCtE4B4APSQyhtIQc0ymdwJQoch0lH1MHm+/i0H/ZAfg18bIjD0qgw
	ZuMgFDYCbkAWBBFCAShGiwh0z7bUT3UYizy+5PR8CSw+qbPD4BNX56OxPljl0PDOpXWZHc+KkloPw
	ZrJMhrWFRxa+OV+3WdFLAaGM0dDVqQ6hs782D/oajM3EhzCkrvjpu66WXEURKj13HRGapyO87gQOo
	PyaYtP2zJOYYKJ4IPmpZss3fXPzKS7PA7b2oM4bUWGaJmnj5+To0Fwcnmk7XXXTQsHYQQDJTbvClt
	Y58v/ziQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzat-003awi-33;
	Wed, 02 Aug 2023 00:20:03 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzaq-003atW-0U
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 00:20:01 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58667d06607so7558337b3.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 17:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690935595; x=1691540395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oILqqqD951CZa6vFO5lwCGBJV16jZziGq+aTih9CvRM=;
        b=liEq2TRJ6uphA1n1WRctdr12b14csuDNelgmOB3P8uUfovqp001PwMVQtOenzPkHJi
         whIzAspyWYUBqUAPEv0+bxGp/kCYHZiDZCj4aPoXHdFKRGOuA0OAPUxh2lZcKRB9DmY4
         +sVvZ4qnTj42uetZgk1spG0aKDlJUYjhXZPRCghRJr5QNKGlAn8bEhwP4JK0KqRABLaT
         fhKrvbkr8HehDdLCVM2/wiJlQ2zpWgZOa9ODGSx5g36gQV2AuKOzP/RpJ1d7pqrnbT8W
         MmvhG/Y18dFWO4yMQQmXypjHnDfl+eqfjiVHy0xIyI41FCe/pW+Xv7cf+eIVYSkn4fkR
         1ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690935595; x=1691540395;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oILqqqD951CZa6vFO5lwCGBJV16jZziGq+aTih9CvRM=;
        b=Lt7Lb9OWH9okzdHnbBKcplZ2rYY1YUuu91pIsAve3Y9G/OqLjxdOKdDxmJCuJtfyuR
         NuQVbCv4KY1qv0IRYprAWPPd9609TX8G6RO79TFX5TyHJ4AHVQgZWQiYwwdatWTR9sng
         yPIr5HoO8EzqTuERHWchTs1a9oMU0NXF+jFoWu1ch+O2zYvegqpf202gYHYnGT3dmHN/
         KqU16zgUx1R4sN9TQWEh4XbKSu0UQKVhGxbeotPTbdeQs+rVOjig/15iFEhmONAicZiV
         ouKbENhnMxsPI6lgmVUVbB038KnAU3Zb1t4mel0IUqJmP0UiSfgaq+oSXsLjyOnFtMEp
         3E3g==
X-Gm-Message-State: ABy/qLbEzCC2cl8l5CXrzYdqsBduIwY/y2jrLvDEMM0Z8RZP3klgtFnf
	8wRrhE5H6wOZIUauOf2lDdM/7FJvaJSzYU/tDA==
X-Google-Smtp-Source: APBJJlGVSXTcSf5HWtAwgVhVMNFG4pScdB5810WzB/3elwhK2y7pd9aNX9CzOkX3wIMvukUfcHZ5QeIzWXNdnmzMyw==
X-Received: from kalesh.mtv.corp.google.com ([2620:15c:211:201:aa5f:ff75:318:255])
 (user=kaleshsingh job=sendgmr) by 2002:a81:b301:0:b0:576:fdbe:76b2 with SMTP
 id r1-20020a81b301000000b00576fdbe76b2mr121491ywh.3.1690935595421; Tue, 01
 Aug 2023 17:19:55 -0700 (PDT)
Date: Tue,  1 Aug 2023 17:19:36 -0700
In-Reply-To: <20230802001938.3913174-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20230802001938.3913174-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230802001938.3913174-2-kaleshsingh@google.com>
Subject: [PATCH 2/3] mm-unstable: Multi-gen LRU: Avoid race in inc_min_seq()
From: Kalesh Singh <kaleshsingh@google.com>
To: yuzhao@google.com, akpm@linux-foundation.org
Cc: surenb@google.com, android-mm@google.com, kernel-team@android.com, 
	Kalesh Singh <kaleshsingh@google.com>, Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_172000_186922_E46C1807 
X-CRM114-Status: GOOD (  14.86  )
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

inc_max_seq() will try to inc_min_seq() if nr_gens == MAX_NR_GENS. This
is because the generations are reused (the last oldest now empty
generation will become the next youngest generation).

inc_min_seq() is retried until successful, dropping the lru_lock
and yielding the CPU on each failure, and retaking the lock before
trying again:

        while (!inc_min_seq(lruvec, type, can_swap)) {
                spin_unlock_irq(&lruvec->lru_lock);
                cond_resched();
                spin_lock_irq(&lruvec->lru_lock);
        }

However, the initial condition that required incrementing the min_seq
(nr_gens == MAX_NR_GENS) is not retested. This can change by another
call to inc_max_seq() from run_aging() with force_scan=true from the
debugfs interface.

Since the eviction stalls when the nr_gens == MIN_NR_GENS, avoid
unnecessarily incrementing the min_seq by rechecking the number of
generations before each attempt.

This issue was uncovered in previous discussion on the list by Yu Zhao
and Aneesh Kumar [1].

[1] https://lore.kernel.org/linux-mm/CAOUHufbO7CaVm=xjEb1avDhHVvnC8pJmGyKcFf2iY_dpf+zR3w@mail.gmail.com/

Cc: Yu Zhao <yuzhao@google.com>
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/vmscan.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 489a4fc7d9b1..6eecd291756c 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4439,7 +4439,7 @@ static void inc_max_seq(struct lruvec *lruvec, bool can_swap, bool force_scan)
 	int prev, next;
 	int type, zone;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
-
+restart:
 	spin_lock_irq(&lruvec->lru_lock);
 
 	VM_WARN_ON_ONCE(!seq_is_valid(lruvec));
@@ -4450,11 +4450,12 @@ static void inc_max_seq(struct lruvec *lruvec, bool can_swap, bool force_scan)
 
 		VM_WARN_ON_ONCE(!force_scan && (type == LRU_GEN_FILE || can_swap));
 
-		while (!inc_min_seq(lruvec, type, can_swap)) {
-			spin_unlock_irq(&lruvec->lru_lock);
-			cond_resched();
-			spin_lock_irq(&lruvec->lru_lock);
-		}
+		if (inc_min_seq(lruvec, type, can_swap))
+			continue;
+
+		spin_unlock_irq(&lruvec->lru_lock);
+		cond_resched();
+		goto restart;
 	}
 
 	/*
-- 
2.41.0.255.g8b1d071c50-goog


