Return-Path: <SRS0=0H6n=YK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9EBBECE58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 09:36:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADB4C20663
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2019 09:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVV5e4oB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADB4C20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ECACCLJvepF1UdHowSx2POHhnZ7T6fUljnW+gyvajEQ=; b=NVV5e4oBQHQmuO
	IcgTnFJMHo8+zU9lupe2Ubaf5SqRdPv7O9yzq8TQDUWcqblb6J6PBpWt/Jc8kYnW6/+NrQKoPJhYv
	clAG5oYmUDMbdqYHnS0kRRKabq3UUbuK/RvH4nAptjUNAJffk+cVtdAh60ENyALoltUiMylgdzeyI
	rTdZWDqsy3BBvEadEy8+ejsGbm0i4nVj8AhoJ9HFwT31nkzCqC+SEsiTudPjEB0DaYIqqQv0EcC4N
	SoC9g9C+25qyQecP35mWp4pjwkU3cZoA8FsSpWIyYmdVJ9SPiSMMzeCCZztm1dcm/ZpCsZNGduh1l
	S0amyN5lx+eYWArPkkzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL2CT-0006Zy-BM; Thu, 17 Oct 2019 09:36:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL2CR-0006Yx-3y
 for linux-mediatek@lists.infradead.org; Thu, 17 Oct 2019 09:36:04 +0000
X-UUID: 5ebc90d7ab484c668f529caae7d3c278-20191017
X-UUID: 5ebc90d7ab484c668f529caae7d3c278-20191017
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1497443385; Thu, 17 Oct 2019 01:35:47 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 02:35:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 17 Oct 2019 17:35:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 17 Oct 2019 17:35:53 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] mm: fix outdated comment in page_get_anon_vma()
Date: Thu, 17 Oct 2019 17:35:54 +0800
Message-ID: <20191017093554.22562-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_023603_167155_FBD34F78 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mm@kvack.org, Miles Chen <miles.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace DESTROY_BY_RCU with SLAB_TYPESAFE_BY_RCU because
SLAB_DESTROY_BY_RCU has been renamed to SLAB_TYPESAFE_BY_RCU by
commit 5f0d5a3ae7cf ("mm: Rename SLAB_DESTROY_BY_RCU to
SLAB_TYPESAFE_BY_RCU")

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 mm/rmap.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index d9a23bb773bf..bdb20f2bbe9f 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -457,9 +457,10 @@ void __init anon_vma_init(void)
  * chain and verify that the page in question is indeed mapped in it
  * [ something equivalent to page_mapped_in_vma() ].
  *
- * Since anon_vma's slab is DESTROY_BY_RCU and we know from page_remove_rmap()
- * that the anon_vma pointer from page->mapping is valid if there is a
- * mapcount, we can dereference the anon_vma after observing those.
+ * Since anon_vma's slab is SLAB_TYPESAFE_BY_RCU and we know from
+ * page_remove_rmap() that the anon_vma pointer from page->mapping is valid
+ * if there is a mapcount, we can dereference the anon_vma after observing
+ * those.
  */
 struct anon_vma *page_get_anon_vma(struct page *page)
 {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
