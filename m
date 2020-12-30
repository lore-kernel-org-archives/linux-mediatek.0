Return-Path: <SRS0=HztP=GC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA98C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 13:05:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A82822473
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Dec 2020 13:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A82822473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R1yn8V2MLoPameLzp9tf//CG5+wCVW67gZbpSshR4FA=; b=bNxCDPY9wkfgz50XojzutbjXQ
	RUeYdZD8x6ScUulQyvrIExlyO5dBnRGoma6e9Lf4+3wEAflX69B5hOuUjo9CijJkQIcoxwRXxI2CW
	VXCYgiZjT8TjQp4SjDQgxUMOAkrh69EWWMeclHROVvIRmX0sEkwoLvN1S6lKMttIuRmw3dyTfQDdT
	PdQieVccxAEjnECFRFNxpuYlEOftm2nKVdJaHXNhdw9cOBnWX/zUtWJl/rTheZiQw7mGDrAmT/Ylv
	ABrJynJuwMcKwjmdcIFIqacRy2YGXd5+XvgijhrbDEw2VqzgJdexukZ5707zG4HmayiWydwh9Stsh
	R+Ljn/ayA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kub9k-00005Q-0i; Wed, 30 Dec 2020 13:04:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kub9B-0008J5-8Y; Wed, 30 Dec 2020 13:04:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 411A52251E;
 Wed, 30 Dec 2020 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333452;
 bh=W+Vc45MUrKdrvxQ64QJS/mCrmgrrq1KOiiAdgNhRAcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NPqqq1WFf/qF18zLCVdiBVl7iIdw8qAMcUqwZHqBAiHqjnsaat33W9YHb4PHHuNIU
 jgArdsb4GHgerWDBftT7UcL4bLjjWDTC5NvPEJoA62zFqrkWAL5dlwXvHFrlOVac7z
 KAhyKiHaTWOMCWjMp68KDgpbMJqDte6pyObtN7dMSiS4Qk8cJqhlC99YM3ktBDzaNf
 wEaaNVa4SmVXJWaARPbXWuKwPx0aa2+P/RFnMHO5un7c/jkOuGNEp2YY6qw/w15C/T
 27injA5OdfgUYBMCptJV4JoNLGupafHx1snmFWacpFXByMWJGs6kDInMrZcBz3ruy4
 MZEeycs5pzNiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/17] f2fs: avoid race condition for shrinker
 count
Date: Wed, 30 Dec 2020 08:03:50 -0500
Message-Id: <20201230130357.3637261-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130357.3637261-1-sashal@kernel.org>
References: <20201230130357.3637261-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_080413_448191_6E585F19 
X-CRM114-Status: GOOD (  18.54  )
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
Cc: Sasha Levin <sashal@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Light Hsieh <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-mediatek@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit a95ba66ac1457b76fe472c8e092ab1006271f16c ]

Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
wrong do_shinker work. Let's avoid to return insane overflowed value by adding
single tracking value.

Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c |  2 +-
 fs/f2fs/debug.c      | 11 ++++++-----
 fs/f2fs/f2fs.h       | 10 ++++++++--
 fs/f2fs/node.c       | 29 ++++++++++++++++++-----------
 fs/f2fs/node.h       |  4 ++--
 fs/f2fs/shrinker.c   |  4 +---
 6 files changed, 36 insertions(+), 24 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index c966ccc44c157..a57219c51c01a 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1596,7 +1596,7 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 			goto out;
 		}
 
-		if (NM_I(sbi)->dirty_nat_cnt == 0 &&
+		if (NM_I(sbi)->nat_cnt[DIRTY_NAT] == 0 &&
 				SIT_I(sbi)->dirty_sentries == 0 &&
 				prefree_segments(sbi) == 0) {
 			f2fs_flush_sit_entries(sbi, cpc);
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 9b0bedd82581b..d8d64447bc947 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -107,8 +107,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 		si->node_pages = NODE_MAPPING(sbi)->nrpages;
 	if (sbi->meta_inode)
 		si->meta_pages = META_MAPPING(sbi)->nrpages;
-	si->nats = NM_I(sbi)->nat_cnt;
-	si->dirty_nats = NM_I(sbi)->dirty_nat_cnt;
+	si->nats = NM_I(sbi)->nat_cnt[TOTAL_NAT];
+	si->dirty_nats = NM_I(sbi)->nat_cnt[DIRTY_NAT];
 	si->sits = MAIN_SEGS(sbi);
 	si->dirty_sits = SIT_I(sbi)->dirty_sentries;
 	si->free_nids = NM_I(sbi)->nid_cnt[FREE_NID];
@@ -254,9 +254,10 @@ static void update_mem_info(struct f2fs_sb_info *sbi)
 	si->cache_mem += (NM_I(sbi)->nid_cnt[FREE_NID] +
 				NM_I(sbi)->nid_cnt[PREALLOC_NID]) *
 				sizeof(struct free_nid);
-	si->cache_mem += NM_I(sbi)->nat_cnt * sizeof(struct nat_entry);
-	si->cache_mem += NM_I(sbi)->dirty_nat_cnt *
-					sizeof(struct nat_entry_set);
+	si->cache_mem += NM_I(sbi)->nat_cnt[TOTAL_NAT] *
+				sizeof(struct nat_entry);
+	si->cache_mem += NM_I(sbi)->nat_cnt[DIRTY_NAT] *
+				sizeof(struct nat_entry_set);
 	si->cache_mem += si->inmem_pages * sizeof(struct inmem_pages);
 	for (i = 0; i < MAX_INO_ENTRY; i++)
 		si->cache_mem += sbi->im[i].ino_num * sizeof(struct ino_entry);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 63440abe58c42..604fc2391f9f2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -797,6 +797,13 @@ enum nid_state {
 	MAX_NID_STATE,
 };
 
+enum nat_state {
+	TOTAL_NAT,
+	DIRTY_NAT,
+	RECLAIMABLE_NAT,
+	MAX_NAT_STATE,
+};
+
 struct f2fs_nm_info {
 	block_t nat_blkaddr;		/* base disk address of NAT */
 	nid_t max_nid;			/* maximum possible node ids */
@@ -812,8 +819,7 @@ struct f2fs_nm_info {
 	struct rw_semaphore nat_tree_lock;	/* protect nat_tree_lock */
 	struct list_head nat_entries;	/* cached nat entry list (clean) */
 	spinlock_t nat_list_lock;	/* protect clean nat entry list */
-	unsigned int nat_cnt;		/* the # of cached nat entries */
-	unsigned int dirty_nat_cnt;	/* total num of nat entries in set */
+	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
 	unsigned int nat_blocks;	/* # of nat blocks */
 
 	/* free node ids management */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 2a4a382f28fed..7c34e49363f40 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -62,8 +62,8 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 				sizeof(struct free_nid)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
 	} else if (type == NAT_ENTRIES) {
-		mem_size = (nm_i->nat_cnt * sizeof(struct nat_entry)) >>
-							PAGE_SHIFT;
+		mem_size = (nm_i->nat_cnt[TOTAL_NAT] *
+				sizeof(struct nat_entry)) >> PAGE_SHIFT;
 		res = mem_size < ((avail_ram * nm_i->ram_thresh / 100) >> 2);
 		if (excess_cached_nats(sbi))
 			res = false;
@@ -177,7 +177,8 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
 	list_add_tail(&ne->list, &nm_i->nat_entries);
 	spin_unlock(&nm_i->nat_list_lock);
 
-	nm_i->nat_cnt++;
+	nm_i->nat_cnt[TOTAL_NAT]++;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]++;
 	return ne;
 }
 
@@ -207,7 +208,8 @@ static unsigned int __gang_lookup_nat_cache(struct f2fs_nm_info *nm_i,
 static void __del_from_nat_cache(struct f2fs_nm_info *nm_i, struct nat_entry *e)
 {
 	radix_tree_delete(&nm_i->nat_root, nat_get_nid(e));
-	nm_i->nat_cnt--;
+	nm_i->nat_cnt[TOTAL_NAT]--;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
 	__free_nat_entry(e);
 }
 
@@ -253,7 +255,8 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
 	if (get_nat_flag(ne, IS_DIRTY))
 		goto refresh_list;
 
-	nm_i->dirty_nat_cnt++;
+	nm_i->nat_cnt[DIRTY_NAT]++;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
 	set_nat_flag(ne, IS_DIRTY, true);
 refresh_list:
 	spin_lock(&nm_i->nat_list_lock);
@@ -273,7 +276,8 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
 
 	set_nat_flag(ne, IS_DIRTY, false);
 	set->entry_cnt--;
-	nm_i->dirty_nat_cnt--;
+	nm_i->nat_cnt[DIRTY_NAT]--;
+	nm_i->nat_cnt[RECLAIMABLE_NAT]++;
 }
 
 static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
@@ -2881,14 +2885,17 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	LIST_HEAD(sets);
 	int err = 0;
 
-	/* during unmount, let's flush nat_bits before checking dirty_nat_cnt */
+	/*
+	 * during unmount, let's flush nat_bits before checking
+	 * nat_cnt[DIRTY_NAT].
+	 */
 	if (enabled_nat_bits(sbi, cpc)) {
 		down_write(&nm_i->nat_tree_lock);
 		remove_nats_in_journal(sbi);
 		up_write(&nm_i->nat_tree_lock);
 	}
 
-	if (!nm_i->dirty_nat_cnt)
+	if (!nm_i->nat_cnt[DIRTY_NAT])
 		return 0;
 
 	down_write(&nm_i->nat_tree_lock);
@@ -2899,7 +2906,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	 * into nat entry set.
 	 */
 	if (enabled_nat_bits(sbi, cpc) ||
-		!__has_cursum_space(journal, nm_i->dirty_nat_cnt, NAT_JOURNAL))
+		!__has_cursum_space(journal,
+			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
 		remove_nats_in_journal(sbi);
 
 	while ((found = __gang_lookup_nat_set(nm_i,
@@ -3023,7 +3031,6 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
 						F2FS_RESERVED_NODE_NUM;
 	nm_i->nid_cnt[FREE_NID] = 0;
 	nm_i->nid_cnt[PREALLOC_NID] = 0;
-	nm_i->nat_cnt = 0;
 	nm_i->ram_thresh = DEF_RAM_THRESHOLD;
 	nm_i->ra_nid_pages = DEF_RA_NID_PAGES;
 	nm_i->dirty_nats_ratio = DEF_DIRTY_NAT_RATIO_THRESHOLD;
@@ -3160,7 +3167,7 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
 			__del_from_nat_cache(nm_i, natvec[idx]);
 		}
 	}
-	f2fs_bug_on(sbi, nm_i->nat_cnt);
+	f2fs_bug_on(sbi, nm_i->nat_cnt[TOTAL_NAT]);
 
 	/* destroy nat set cache */
 	nid = 0;
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index e05af5df56485..4a2e7eaf2b028 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -123,13 +123,13 @@ static inline void raw_nat_from_node_info(struct f2fs_nat_entry *raw_ne,
 
 static inline bool excess_dirty_nats(struct f2fs_sb_info *sbi)
 {
-	return NM_I(sbi)->dirty_nat_cnt >= NM_I(sbi)->max_nid *
+	return NM_I(sbi)->nat_cnt[DIRTY_NAT] >= NM_I(sbi)->max_nid *
 					NM_I(sbi)->dirty_nats_ratio / 100;
 }
 
 static inline bool excess_cached_nats(struct f2fs_sb_info *sbi)
 {
-	return NM_I(sbi)->nat_cnt >= DEF_NAT_CACHE_THRESHOLD;
+	return NM_I(sbi)->nat_cnt[TOTAL_NAT] >= DEF_NAT_CACHE_THRESHOLD;
 }
 
 static inline bool excess_dirty_nodes(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index a467aca29cfef..3ceebaaee3840 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -18,9 +18,7 @@ static unsigned int shrinker_run_no;
 
 static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
 {
-	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
-
-	return count > 0 ? count : 0;
+	return NM_I(sbi)->nat_cnt[RECLAIMABLE_NAT];
 }
 
 static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
