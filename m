Return-Path: <SRS0=00t5=3T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DF97C33C9E
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 06:55:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2A6E206F0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jan 2020 06:55:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7gXmOZB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bvCPjljz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2A6E206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qVSSdd+xrOqPe6laYrWmW91TCBsZ4d3bFhRm3gX7fnc=; b=n7gXmOZBprzurm
	3nwWiRtoCRx9cY6xmlj3uc5CVZ6xU6UPTUk4nXrYfyW1fgYcW08mHD3FY6oz9F30F0jJnN8m396Bm
	b6Or28y2BcLpIbXjNKpQFywNPodweI9adudLNNK1rFp/jTocGaXeP76lLncgfh/kIgEWw44QQH4AG
	2nFgQLG0Eqk37T0fQnPzIne6IeIs8zsheEcb/l0jdpoZjnEA6P4lY55OMiH45YQ4v2Fdfj/D5RP88
	VPoR4WbybaI6+I3MX4jthqPQfg5CL7IzB/iRdtRpb7nXkns5mT0cpeGT/7q9nW2MLXxNa17vFhtz2
	OIODlNHPBflwImUbU/6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ix3jm-0000d6-GG; Thu, 30 Jan 2020 06:55:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix3is-0006v2-13; Thu, 30 Jan 2020 06:54:43 +0000
X-UUID: a92aa108a944468384a247f7a86f6134-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nT9JMqdZL40d6DpIqTDz/AwubrwRPPy0W7SQItA5Q+w=; 
 b=bvCPjljzGWgWhxaHBpAEAwLoBNL0M/XBXFDOuYs9dwX9R7Mzz27QgkmpWPa/ufJdtzi78/cHh2h5fCwFpMZ/Guwjgu1g3ONybeWWG7Iqi8YsNugJw9VCLvlGTdFmSU5L7OXFhmAva8lMJAxZOj/lY42RLOJyHvU+d91nqB/zfks=;
X-UUID: a92aa108a944468384a247f7a86f6134-20200129
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 389337364; Wed, 29 Jan 2020 22:54:35 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 22:44:57 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 Jan 2020 14:44:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 30 Jan 2020 14:43:35 +0800
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, "Alexander
 Potapenko" <glider@google.com>, Josh Poimboeuf <jpoimboe@redhat.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Kate Stewart
 <kstewart@linuxfoundation.org>
Subject: [PATCH v3] lib/stackdepot: Fix global out-of-bounds in stackdepot
Date: Thu, 30 Jan 2020 14:44:30 +0800
Message-ID: <20200130064430.17198-1-walter-zh.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_225442_241252_B0D10B67 
X-CRM114-Status: GOOD (  10.72  )
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
Cc: Walter Wu <walter-zh.wu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 wsd_upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If the depot_index = STACK_ALLOC_MAX_SLABS - 2 and next_slab_inited = 0,
then it will cause array out-of-bounds access, so that we should modify
the detection to avoid this array out-of-bounds bug.

Assume depot_index = STACK_ALLOC_MAX_SLABS - 3
Consider following call flow sequence:

stack_depot_save()
   depot_alloc_stack()
      if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
      depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 2
      if (depot_index + 1 < STACK_ALLOC_MAX_SLABS) //enter
         smp_store_release(&next_slab_inited, 0); //next_slab_inited = 0
      init_stack_slab()
         if (stack_slabs[depot_index] == NULL) //enter and exit

stack_depot_save()
   depot_alloc_stack()
      if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) //pass
      depot_index++  //depot_index = STACK_ALLOC_MAX_SLABS - 1
      init_stack_slab(&prealloc)
         stack_slabs[depot_index + 1]  //here get global out-of-bounds

Cc: Dmitry Vyukov <dvyukov@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Potapenko <glider@google.com>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>
Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
---
changes in v2:
modify call flow sequence and preconditon

changes in v3:
add some reviewers
---
 lib/stackdepot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/stackdepot.c b/lib/stackdepot.c
index ed717dd08ff3..7e8a15e41600 100644
--- a/lib/stackdepot.c
+++ b/lib/stackdepot.c
@@ -106,7 +106,7 @@ static struct stack_record *depot_alloc_stack(unsigned long *entries, int size,
 	required_size = ALIGN(required_size, 1 << STACK_ALLOC_ALIGN);
 
 	if (unlikely(depot_offset + required_size > STACK_ALLOC_SIZE)) {
-		if (unlikely(depot_index + 1 >= STACK_ALLOC_MAX_SLABS)) {
+		if (unlikely(depot_index + 2 >= STACK_ALLOC_MAX_SLABS)) {
 			WARN_ONCE(1, "Stack depot reached limit capacity");
 			return NULL;
 		}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
