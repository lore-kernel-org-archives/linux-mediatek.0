Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04F2C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 02:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6cxPzKelBRogs1RcqlDIpKMeY4RfiCOB4MpGgBN/Dg=; b=YKyISITF1SQN30AQFMoZcwgFx/
	X32I7xeKHVvEQCidIQanOG8MIB6AIZM8gMZIu9lximjDC60Izv2zkfCQFYDTmcdHQK0xt+FAKEYaX
	YmAvs9TGdefY1MfewzPnxwj9Wbp08EQt1axBByyFSga+DrjoGpcHCsX0rZJv7WRNkQTs4gSV63D3y
	pPUS7h1aJIn/ZQ5DlqfJuOXzz5rN+BHfNR4SGP99LgqRFWkSmo1HDwCXmPDckTMP2KpmIT3DqXib6
	vwhU4k+uPZEqXXRBT0TZBlhppseQeQnNlHCvlNxlAkChGdekOlP4ffe7A6WGTm5iVqJo143igDerb
	Eg28Rhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR22C-003p9n-25;
	Wed, 02 Aug 2023 02:56:24 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR229-003p7g-1L
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 02:56:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d0d27cd9db9so875801276.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 19:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690944980; x=1691549780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6cxPzKelBRogs1RcqlDIpKMeY4RfiCOB4MpGgBN/Dg=;
        b=Jrr8nzKXxGfH9rZ05coei/Z5XkXPQKYffsRvq0JJPMkpPWKSPML6OO06eZDIof3ZxE
         FqR3adURv8HbiY0CSWCrzORDmomvxAk0WLRY9cf18uCIkdSyJjl/VvbdCY4q9Wy7Oc4w
         +pskRXdmBEFfcC42q/5pqN3PxM0TzWr4gK4sE9xc5wu50UZc34qQkFTahmwhRGZJVytQ
         iQt96NsYT5jF6oFb+S9xqxKcAjWxbIwls+nZQCaZUiFG50rjkxYUVoWP/KSzWH+XfZJr
         RVj4ctwi+migEpHkjEJI3k5GUHjwOtKhv4c0gSFmtgVSST9QuZmYcyIVrwx+qWlaHlyG
         UnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690944980; x=1691549780;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6cxPzKelBRogs1RcqlDIpKMeY4RfiCOB4MpGgBN/Dg=;
        b=HKSGwstHbIgUbQaA6a40dw6qHDg3Xuf1zBdRZIX26xKWoHR/c6cELsg6BH05IJB3/l
         zj2XXna3KFeZiaNBT613pjw95UvlpmcUejhEc7xkDzFn4CKvZ9Wyo9TH1+pWCeVc4rVg
         wEYmV7Aa83l6kcW6hukEsFtH8mRNetYNqLvCtk5xf5PzzlKt+put3us6l5TEmbyJMcs4
         +sd+MaCXcyN9syYx5OsPJPJ9wAykynI7p/GpL5mkjH0tVuU5AMfR5bKaR15f2YCASnOW
         E9srd84epUfRv1Ek9AqOfTMgfFnbSs1P7xV/NUgeC6NBD+bAIz3BCXWGvRSQN2iK0KAM
         CkBw==
X-Gm-Message-State: ABy/qLYl68uDohSyL6JnF4Ch4P6Qy1001hROFaBuBQ4nLo4SdaZScgm1
	UVV5UiMUnd8Xx7r+wek6ikn8w2CwGNxcVqyBJA==
X-Google-Smtp-Source: APBJJlHvG4mc4jsYVOJYfZ7h42Tv/EwdyD/HOeVXUVvtcmr8y48s75g7rEDYvVAnOWGuPl5UYIq68sSDD86PJyMPYA==
X-Received: from kalesh.mtv.corp.google.com ([2620:15c:211:201:aa5f:ff75:318:255])
 (user=kaleshsingh job=sendgmr) by 2002:a25:b084:0:b0:bd5:dc2d:9d7f with SMTP
 id f4-20020a25b084000000b00bd5dc2d9d7fmr167401ybj.4.1690944980290; Tue, 01
 Aug 2023 19:56:20 -0700 (PDT)
Date: Tue,  1 Aug 2023 19:56:03 -0700
In-Reply-To: <20230802025606.346758-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20230802025606.346758-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230802025606.346758-2-kaleshsingh@google.com>
Subject: [PATCH v2 2/3] mm-unstable: Multi-gen LRU: Avoid race in inc_min_seq()
From: Kalesh Singh <kaleshsingh@google.com>
To: yuzhao@google.com, akpm@linux-foundation.org
Cc: surenb@google.com, android-mm@google.com, kernel-team@android.com, 
	Kalesh Singh <kaleshsingh@google.com>, stable@vger.kernel.org, 
	Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, Oleksandr Natalenko <oleksandr@natalenko.name>, 
	Brian Geffon <bgeffon@google.com>, Steven Barrett <steven@liquorix.net>, 
	Suleiman Souhlal <suleiman@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_195621_451392_14DF2E32 
X-CRM114-Status: GOOD (  15.34  )
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

Fixes: d6c3af7d8a2b ("mm: multi-gen LRU: debugfs interface")
Cc: stable@vger.kernel.org
Cc: Yu Zhao <yuzhao@google.com>
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Add Fixes tag and cc stable

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


