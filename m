Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEAFC001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sQqMGlFvgvQ3yvXEv1c3TG8Zu+eyY93FF0SWidKY8Dg=; b=dAEh8rCKFQaVUrWd+jezo92Gok
	xls+YIlEmV8RBdWVVWY8sy1APuwk2+SmcNrFCUBKynaSBeDvM/vWgx15mfDK8I41pTvJTHTxLWMXS
	ce92bzBzzRHvLzh/UZwGM3/lfer1KsFyOq4+QR1VCM9g07j5q9rcaNwyzS+Gobcv1wRtYHUEnwKTM
	z71OOwTI1q2dPp+50Ppmy27Ty7nhNABobuaKXJ8MPnIHRVTIpOWN5JXH9m6Q7t0Unou39AZ2xqgyd
	keU7Jpdj4Ci6QDhY7WWTOEjJczxe4sFPWeO0Qg2mguTEYlrpGv2zcqJbwEdxeZOGzqjKyyrZzYt5h
	0FcBToRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzax-003ayU-2r;
	Wed, 02 Aug 2023 00:20:07 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzav-003awv-18
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 00:20:06 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d087ffcc43cso6395900276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690935604; x=1691540404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQqMGlFvgvQ3yvXEv1c3TG8Zu+eyY93FF0SWidKY8Dg=;
        b=sjS9Sd/96ChnfQYaR1cO5sk2N9oknVX/qJB2yXG052CqPpTjyq29z2og4PvyAUfuFb
         BbtTttNXygAAyEGj4VDc+gc5Tv/jJm9VVufAhbVnxD9d2fZv9SEDE3pJ6CmBfTmsJ7/M
         30pcgTpZEa5b5WZTWX8yFJI4winvc57m0RSu8uswlhLrD88MgHDJlMnwkJUHOUbaDiEX
         XFB8o/mR1Hsb5CgE+Zf1jutf81sOk0xLQ2PlXcTmJRipNCPc6eQScIC9DvSTQlXma76v
         y6rPEG/+3EoY9yWeyWMpqj6nc4br7aYthBDJY27Nv4jLmE5k9Zm7VQi5fBGYNijEtZwE
         qVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690935604; x=1691540404;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQqMGlFvgvQ3yvXEv1c3TG8Zu+eyY93FF0SWidKY8Dg=;
        b=iAjzryBNWWKT0eQ9ndQW+CdOyXTf5mL4T2VJtMAapj6gXhhtwcthiKbGHoPutaGGQs
         jmeH1mrXrHCf7GGJD/sxxYlwUDm2H9XUGd0qF9BHf80lYavcU7bwZN/24UNezC9gqsYG
         Xtp+e8MQqtX2yiQxqmDf40TqwrMyKDwbuRpWIBEIwnSfF4jw6NhskCF9VAkMdbQUl1nu
         A8x9ac6D1OBUZP2neo3fU+5OrD2Arc3fhX3tBjKiOJpGqaRw3AQyrnmub9srAQouikfi
         p0taltg4L9oHorkZD4sllkMcSKVHSBth8R6qKDcGaNpRcuzf6hwY15SKOmvz69zv7w+w
         sxKw==
X-Gm-Message-State: ABy/qLZW1Mp4jpeV3WVUZlSPxa9KxHNk7IQDfFh0jO0eGC0VWckKEyoO
	yQV2WLByL0XpfU/dWlDvAxhJIiUXQyswsjgCqw==
X-Google-Smtp-Source: APBJJlEf7/u2/Z616hvXFPIg4IjabnaZmfD7pavvMQxNa0+Yi7QX2OhFnd4BlpzLjlUWlOxu9nZ4P/MXGt70cu1ftA==
X-Received: from kalesh.mtv.corp.google.com ([2620:15c:211:201:aa5f:ff75:318:255])
 (user=kaleshsingh job=sendgmr) by 2002:a25:48a:0:b0:d37:353:b7eb with SMTP id
 132-20020a25048a000000b00d370353b7ebmr33827ybe.11.1690935603866; Tue, 01 Aug
 2023 17:20:03 -0700 (PDT)
Date: Tue,  1 Aug 2023 17:19:37 -0700
In-Reply-To: <20230802001938.3913174-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20230802001938.3913174-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230802001938.3913174-3-kaleshsingh@google.com>
Subject: [PATCH 3/3] mm-unstable: Multi-gen LRU: Fix can_swap in lru_gen_look_around()
From: Kalesh Singh <kaleshsingh@google.com>
To: yuzhao@google.com, akpm@linux-foundation.org
Cc: surenb@google.com, android-mm@google.com, kernel-team@android.com, 
	Kalesh Singh <kaleshsingh@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_172005_393031_F539B93C 
X-CRM114-Status: GOOD (  11.43  )
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

walk->can_swap might be invalid since it's not guaranteed to be
initialized for the particular lruvec. Instead deduce it from the folio
type (anon/file).

Cc: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/vmscan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6eecd291756c..b4329f93a682 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4656,6 +4656,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 	pte_t *pte = pvmw->pte;
 	unsigned long addr = pvmw->address;
 	struct folio *folio = pfn_folio(pvmw->pfn);
+	bool can_swap = !folio_is_file_lru(folio);
 	struct mem_cgroup *memcg = folio_memcg(folio);
 	struct pglist_data *pgdat = folio_pgdat(folio);
 	struct lruvec *lruvec = mem_cgroup_lruvec(memcg, pgdat);
@@ -4704,7 +4705,7 @@ void lru_gen_look_around(struct page_vma_mapped_walk *pvmw)
 		if (!pte_young(ptent))
 			continue;
 
-		folio = get_pfn_folio(pfn, memcg, pgdat, !walk || walk->can_swap);
+		folio = get_pfn_folio(pfn, memcg, pgdat, can_swap);
 		if (!folio)
 			continue;
 
-- 
2.41.0.255.g8b1d071c50-goog


