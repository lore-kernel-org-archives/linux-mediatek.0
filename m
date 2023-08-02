Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBFFC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 02:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hIR85jBvXabpNDlh2e7xtBRwmCRiojtCshBAYjOX1Y=; b=aFGw5281iDGZLskK8F5GIzFrkf
	u2vMVwnrkWOlGX8iuV1bijQ67fjilhh8OhAwQfflShlmsu36oDYwKd4ndWgq3gKwvkW/pSoUo6APg
	fc1eB2gkD3V0d09tOc9LlJvB1Pn58dn7u6QYnX2ylqYq8oSKKqiGT8dCEYYbwHVnIrEepdiAsR3x5
	oCP0EIdQj4+/wuhG7DaOdno4ec+Gi7UjJ0QmNZbKUhJkqB6qUNCNcMN369jkCcjJiPmrOfFGuwk0j
	8z+ADDbh6iO1FXYhnf7EjJVrJnIP4VOEOwcweef2zokUrsAsNrJRpdwIEFf1gfwSWxm9Mia+x65tp
	LvLle4IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR22H-003pCn-1x;
	Wed, 02 Aug 2023 02:56:29 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR22E-003p9m-1l
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 02:56:27 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-564fb1018bcso74364167b3.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 19:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690944984; x=1691549784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hIR85jBvXabpNDlh2e7xtBRwmCRiojtCshBAYjOX1Y=;
        b=NaC24ZANDfp+9XAVYJ2zthvJ8rUBTQ6l5oOsseG6mfA3cvF+arl71fQG1qHAhLbqJ9
         9qeh16JOmABIOlkWmOSbROyLEpFlmq9EQUA6/uFoeGgx/95B08yoDHueOaoh/i5155mY
         XVuhu3IiHZBf1PozmtFvavLXWlrDny3HMWCrGbcbi3wm/Avg9RqMK4JG4u4VTr67QtHd
         KbHI/PNLuqrNbAwO5JvECyVMzM5KsSmQk2W4uE2b/bpTqBDpICou5hRnR2Ky2iDO0WiX
         xNEzbL/OrqT3RifP1ne+1qALr+MKSfhXAnsSEvF0phJYNv0q7iAwZlhSP5UEXbHyOUib
         Cf7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690944984; x=1691549784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/hIR85jBvXabpNDlh2e7xtBRwmCRiojtCshBAYjOX1Y=;
        b=lUjdVeysTILgu8f9U8rE+t9RgicuWKbb8IibaaCnoCiWCna6jGkXHR16EWnbDsz7lm
         thnuhDeVDEgOy7fH8yhEdxP/meO6kK/OgqtkJC5XDpujg5+EClvR1fbCnL5/UbbpC7bh
         QrpTSQ6LbdRh6EAXArVn+TATiAAs1aQoumqcO9S/jo0S1+gcBNs4M9OEkUKFSTb37dpa
         baOSrOfYM8tH/XW0kcznmgg3FbCNEouxXRpSydT6B3IO3lU6Eh3/CPuOBTKFGWJW1f7q
         0zwrnZHHY3tFE2XsdwvbffdgEqxCr2MCN/WJ5/6TwtbD8JZ0F939Eru0evrV5c1MFzP1
         TBxg==
X-Gm-Message-State: ABy/qLZbDkhudMoDK3fJQAljDdrWjxWQ64vjmJSyRqYInZ7QRy4o/jR7
	1a1Q5ZZUn8dkUOUKjgksQhHNBJZY+mqOI2TE3g==
X-Google-Smtp-Source: APBJJlHj0tBKgoeUZ7ci0leYLXMuHGiQZrYMbH4Cl/uWTIvoLc5trBzIvMofv2F1eZ7phbcd71NDee6Wx5e539GPkA==
X-Received: from kalesh.mtv.corp.google.com ([2620:15c:211:201:aa5f:ff75:318:255])
 (user=kaleshsingh job=sendgmr) by 2002:a81:a706:0:b0:583:4f82:b9d9 with SMTP
 id e6-20020a81a706000000b005834f82b9d9mr120587ywh.5.1690944984182; Tue, 01
 Aug 2023 19:56:24 -0700 (PDT)
Date: Tue,  1 Aug 2023 19:56:04 -0700
In-Reply-To: <20230802025606.346758-1-kaleshsingh@google.com>
Mime-Version: 1.0
References: <20230802025606.346758-1-kaleshsingh@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230802025606.346758-3-kaleshsingh@google.com>
Subject: [PATCH v2 3/3] mm-unstable: Multi-gen LRU: Fix can_swap in lru_gen_look_around()
From: Kalesh Singh <kaleshsingh@google.com>
To: yuzhao@google.com, akpm@linux-foundation.org
Cc: surenb@google.com, android-mm@google.com, kernel-team@android.com, 
	Kalesh Singh <kaleshsingh@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Suleiman Souhlal <suleiman@google.com>, Steven Barrett <steven@liquorix.net>, 
	Oleksandr Natalenko <oleksandr@natalenko.name>, 
	"Jan Alexander Steffens (heftig)" <heftig@archlinux.org>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Brian Geffon <bgeffon@google.com>, Barry Song <baohua@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_195626_582700_55667614 
X-CRM114-Status: GOOD (  12.00  )
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

Fixes: 018ee47f1489 ("mm: multi-gen LRU: exploit locality in rmap")
Cc: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---

Changes in v2:
  - Add Fixes tag

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


