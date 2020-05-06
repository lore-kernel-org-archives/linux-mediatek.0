Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F34C4724C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:30:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED0420714
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 05:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJ6oEU1O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FbLP9Zbn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DED0420714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RmuSMWgXpumhTsi1ybPv4jloHgPuQPAHTQFmYlOl2PI=; b=RJ6oEU1OliqCYO
	3Dk/4kkRjHx8lPU61UiPbR4CFL86nqrP6bQE8zrkkvm1oAeR0BQOSgjganOoXLxGXWJcWJ0mFIMmP
	hIyZc8kYBCHzTWNJW/j4F2k7sr3L59k796wzI/rKRBJxD9oV/e3T/wItzaCZvvErRdM1fZl/SX/4H
	+U+YQ8YnFM4i0Ozm5IuWM3WsiWSUjrxFmSFZ0d5VGzukB+0004yuE6iiOPC6viU+OOSgdJLBE4LsM
	/AJDjoplmLU8uFFdnLGvIf6vGzSEZXEsgxvJcKm533iMw4ctFoL2bj0KSrz+ZtsKdZyLichojgl3f
	jGkEA8a/1T6lZTw5rzfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWCd3-0006qm-Bd; Wed, 06 May 2020 05:29:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWCcw-0006j7-1O; Wed, 06 May 2020 05:29:51 +0000
X-UUID: bbbe335e92a74f5cbb8e5be17b1e14db-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GyIzn8Fjf5emeqtXboCK49Lm5jVHGDGdEVCXXCPcZZs=; 
 b=FbLP9ZbngPwnOOUdKh6Z69BnqWzSsgwIvZNO1sTYwqcb78j+xhVGJNEKPNZoTv/yjnQrcSWcfknd/L7eIyWsFqqzzjJulMKcevO779Z5q+caOk9lKjnETPfKXgQdKtJKnzPUmXo1og3IfjK4pCjdpQF/6FG6EgWFgREwdIITtKk=;
X-UUID: bbbe335e92a74f5cbb8e5be17b1e14db-20200505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 494662919; Tue, 05 May 2020 21:29:46 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 May 2020 22:27:03 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 13:26:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 May 2020 13:26:55 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko
 <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet
 <corbet@lwn.net>
Subject: [PATCH 3/3] kasan: add KASAN_RCU_STACK_RECORD documentation
Date: Wed, 6 May 2020 13:26:55 +0800
Message-ID: <20200506052655.14639-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_222950_092680_50DFE0F7 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds the documentation for the KASAN_RCU_STACK_RECORD config option.

Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Alexander Potapenko <glider@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/dev-tools/kasan.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index c652d740735d..368ff0dad0d7 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -281,3 +281,24 @@ unmapped. This will require changes in arch-specific code.
 
 This allows ``VMAP_STACK`` support on x86, and can simplify support of
 architectures that do not have a fixed module region.
+
+CONFIG_KASAN_RCU_STACK_RECORD
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+With CONFIG_KASAN_RCU_STACK_RECORD, when call_rcu() is called, it will
+store the call_rcu() call stack into slub alloc meta-data. The goal
+is to print call_rcu() information in KASAN report. It is helpful for
+use-after-free or double free memory issue.
+
+Record first and last call_rcu() call stack and print two call_rcu()
+call stack in KASAN report.
+
+This option doesn't increase the cost of memory consumption, we add two
+call_rcu() call stack into struct kasan_alloc_meta and size is 8 bytes.
+Remove the free track from struct kasan_alloc_meta and size is 8 bytes.
+So we don't enlarge the slub meta-data size.
+
+This option is only suitable for generic KASAN. Because the free track
+is stored in freed object. so free track is valid information only when
+it exists in the quarantine. If the slub object is in-use state, then
+KASAN report doesn't print call_rcu() free track information.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
