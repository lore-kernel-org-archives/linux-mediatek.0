Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCE0C001E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 00:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXVsJSb9QIFOr/Cp0N+IT34pRw+slorysgAR9VBW/lM=; b=d/qByCsMj1UDe1gkBq4/0BUHzn
	o5WDSqAPuCNcxDDxib59Me6SoVILanLijijXNNAZYuF/EMCjusz9Y/fNcmOs+ulLG2frcMuM5jN7+
	GYkBGlJgVG7/NxbEPjpKvu8qr2cQzVSKv4GWqv2eQcSQxQ/mxYjfmBxRIT9wDozdFAKwZEZ3quFN9
	xpFgOhpHG4+uOaFKwH/F+CrzD5KREabiVOXS23DncaaucrqXT4xxV4KJZoGt71pddzm1qC2SaCl+H
	uuRfAmlPkTlJ0w1U17wyi+GkWl5M/5E6kquJz25WtOlZWthTrV9LB+xaKV5/A7UN0cskjPoWzHgVE
	96c+MkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzao-003au0-2X;
	Wed, 02 Aug 2023 00:19:58 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQzak-003arU-2J
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Aug 2023 00:19:56 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-585fb08172bso44287977b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Aug 2023 17:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690935588; x=1691540388;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DXVsJSb9QIFOr/Cp0N+IT34pRw+slorysgAR9VBW/lM=;
        b=cm4Hai0RZYcjkOHwUMqYM8wK0SfBbq6tE/k3HPH9GmV1zBmvkpZFMcYL+r+O5/fJbr
         yVq3tNLgKEwKoly7oloPtCW9d6iQlb7bYEeqwEpyCEWI2sHa/uqdKA7oUbAlOw9+D+33
         M61tOUgNo8fyyGNNXnxgduT41K+3pcW/oHczkSpQIGsd/5fEuI7YxntjfIFiICf3vyWk
         ViI9qV2uesdgd1VSF3s2Yl584bAMuwZjnbv8NIkoqTZnJcemCyasU28fzTMYmIe37CrO
         2DtipcERam4z0HdG/CPTBtBJiKPAvtwqUVxtyD00zOgHXb6Rmfr2KoGteO8WsS1p37hY
         Y3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690935588; x=1691540388;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXVsJSb9QIFOr/Cp0N+IT34pRw+slorysgAR9VBW/lM=;
        b=G2WZABI08WRB1RPCYbae8dD7MCMRIOHN59ee2x5PYACxtDdGdU5eVYhePlyt2QLxvR
         xBx3iGWUeJ4VGF2NqzPaSdDqRPs/i42MGj0JM4Kk/+uErSCIIC3zpKNE0VI5yEQDmtKa
         PLbnsEXssY1YFDxA5QvVzh1TGcekni+blCCqsODYp3Bys82ZFk09c2IdTOQc6+RFMQE4
         ZpnlTOxumYB6WkYAmLcwhTCoDWf0Z+1HgDDSgoNm/ZspfKAPbVvR0V7CU8+wnU3iwzqJ
         SaOZpi9pSFZsG9eteLjYatUlCveJAMvnPQ9EV2am9JurUGa3one2ym/uw8Al0ucQWr4/
         Z6bA==
X-Gm-Message-State: ABy/qLZBtRXNoS+cQNQkIc4mTzRymVjTulap5OiEGd50MyFKOJjxxHgv
	aaSzictOkwab0gbZT0TTePXyFWDEgxE2M1XI1g==
X-Google-Smtp-Source: APBJJlFOYOnPjUqct44iRohOnc0mUP9ReqoYJeBrA5AVDrjW9wn0H6QdpajsQPU0LLHzoebktFORyvnYqlxBKUc5/Q==
X-Received: from kalesh.mtv.corp.google.com ([2620:15c:211:201:aa5f:ff75:318:255])
 (user=kaleshsingh job=sendgmr) by 2002:a25:ab86:0:b0:d0d:a7bc:4040 with SMTP
 id v6-20020a25ab86000000b00d0da7bc4040mr103482ybi.0.1690935587776; Tue, 01
 Aug 2023 17:19:47 -0700 (PDT)
Date: Tue,  1 Aug 2023 17:19:35 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230802001938.3913174-1-kaleshsingh@google.com>
Subject: [PATCH 1/3] mm-unstable: Multi-gen LRU: Fix per-zone reclaim
From: Kalesh Singh <kaleshsingh@google.com>
To: yuzhao@google.com, akpm@linux-foundation.org
Cc: surenb@google.com, android-mm@google.com, kernel-team@android.com, 
	Kalesh Singh <kaleshsingh@google.com>, Charan Teja Kalla <quic_charante@quicinc.com>, 
	Lecopzer Chen <lecopzer.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_171954_759955_3996E037 
X-CRM114-Status: GOOD (  20.60  )
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

MGLRU has a LRU list for each zone for each type (anon/file) in each
generation:

	long nr_pages[MAX_NR_GENS][ANON_AND_FILE][MAX_NR_ZONES];

The min_seq (oldest generation) can progress independently for each
type but the max_seq (youngest generation) is shared for both anon and
file. This is to maintain a common frame of reference.

In order for eviction to advance the min_seq of a type, all the per-zone
lists in the oldest generation of that type must be empty.

The eviction logic only considers pages from eligible zones for
eviction or promotion.

    scan_folios() {
	...
	for (zone = sc->reclaim_idx; zone >= 0; zone--)  {
	    ...
	    sort_folio(); 	// Promote
	    ...
	    isolate_folio(); 	// Evict
	}
	...
    }

Consider the system has the movable zone configured and default 4
generations. The current state of the system is as shown below
(only illustrating one type for simplicity):

Type: ANON

	Zone    DMA32     Normal    Movable    Device

	Gen 0       0          0        4GB         0

	Gen 1       0        1GB        1MB         0

	Gen 2     1MB        4GB        1MB         0

	Gen 3     1MB        1MB        1MB         0

Now consider there is a GFP_KERNEL allocation request (eligible zone
index <= Normal), evict_folios() will return without doing any work
since there are no pages to scan in the eligible zones of the oldest
generation. Reclaim won't make progress until triggered from a ZONE_MOVABLE
allocation request; which may not happen soon if there is a lot of free
memory in the movable zone. This can lead to OOM kills, although there
is 1GB pages in the Normal zone of Gen 1 that we have not yet tried to
reclaim.

This issue is not seen in the conventional active/inactive LRU since
there are no per-zone lists.

If there are no (not enough) folios to scan in the eligible zones, move
folios from ineligible zone (zone_index > reclaim_index) to the next
generation. This allows for the progression of min_seq and reclaiming
from the next generation (Gen 1).

Qualcomm, Mediatek and raspberrypi [1] discovered this issue independently.

[1] https://github.com/raspberrypi/linux/issues/5395

Cc: Yu Zhao <yuzhao@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Reported-by: Charan Teja Kalla <quic_charante@quicinc.com>
Reported-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Kalesh Singh <kaleshsingh@google.com>
---
 mm/vmscan.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 4039620d30fe..489a4fc7d9b1 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4889,7 +4889,8 @@ static int lru_gen_memcg_seg(struct lruvec *lruvec)
  *                          the eviction
  ******************************************************************************/
 
-static bool sort_folio(struct lruvec *lruvec, struct folio *folio, int tier_idx)
+static bool sort_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc,
+		       int tier_idx)
 {
 	bool success;
 	int gen = folio_lru_gen(folio);
@@ -4939,6 +4940,13 @@ static bool sort_folio(struct lruvec *lruvec, struct folio *folio, int tier_idx)
 		return true;
 	}
 
+	/* ineligible */
+	if (zone > sc->reclaim_idx) {
+		gen = folio_inc_gen(lruvec, folio, false);
+		list_move_tail(&folio->lru, &lrugen->folios[gen][type][zone]);
+		return true;
+	}
+
 	/* waiting for writeback */
 	if (folio_test_locked(folio) || folio_test_writeback(folio) ||
 	    (type == LRU_GEN_FILE && folio_test_dirty(folio))) {
@@ -4987,7 +4995,8 @@ static bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct sca
 static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
 		       int type, int tier, struct list_head *list)
 {
-	int gen, zone;
+	int i;
+	int gen;
 	enum vm_event_item item;
 	int sorted = 0;
 	int scanned = 0;
@@ -5003,9 +5012,10 @@ static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
 
 	gen = lru_gen_from_seq(lrugen->min_seq[type]);
 
-	for (zone = sc->reclaim_idx; zone >= 0; zone--) {
+	for (i = MAX_NR_ZONES; i > 0; i--) {
 		LIST_HEAD(moved);
 		int skipped = 0;
+		int zone = (sc->reclaim_idx + i) % MAX_NR_ZONES;
 		struct list_head *head = &lrugen->folios[gen][type][zone];
 
 		while (!list_empty(head)) {
@@ -5019,7 +5029,7 @@ static int scan_folios(struct lruvec *lruvec, struct scan_control *sc,
 
 			scanned += delta;
 
-			if (sort_folio(lruvec, folio, tier))
+			if (sort_folio(lruvec, folio, sc, tier))
 				sorted += delta;
 			else if (isolate_folio(lruvec, folio, sc)) {
 				list_add(&folio->lru, list);
-- 
2.41.0.255.g8b1d071c50-goog


