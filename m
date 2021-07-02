Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C32AC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 099DA613CD
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 08:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 099DA613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qYZ0d8hZwpVkdIw5k8566B3L97A7ETRbGAG9+t575J8=; b=IYd8WlTNshPRbU
	H13jEef9pxA6MdtldXRdFmrocYtGHkTNnCmseTwwtFlWNK+Xch+0GFkcLnDClVLnWUOf/XBI7AsBL
	t5DO2u09zl3h0YrY8qbsvIEthKm6fl0BXodxg9DGXNiD+Bwd4JuAvNgvFQK4yhki+OYCchRL0/eYY
	EalYvVV4/oS+mMRuvB2g1ymZDq4U6eIjwUrA4+xVGvVoYNV6WBMkza61OkKmWQTM/rpfwrkk9wunz
	YHE8oQ6COFxpxnvEPtOdjypU7eB/7NApuw9rDiwsup9iqD02FogN7k6Dy6PWYzqP/qLkwRYuQl7Vp
	c6Wv1v+qZIPDckJ+Icog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzEqx-002W4k-PT; Fri, 02 Jul 2021 08:48:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzEqu-002W3w-27; Fri, 02 Jul 2021 08:48:49 +0000
X-UUID: 08e6761b92d64af9a6c0571fdf9d5bbf-20210702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jyp9iRWhXXvWz7h9W5VUYsFtGtPGx7zCFekZIW4V61Y=; 
 b=axPtKCwZUcsXivptNmF0nmsGf49AyUGdpVUYZs2gLTXaBNCGkMsLC2aA3WqpfYxT03dt/uCrA1WFYkPFBqSFwGHp73xgEFITBNhyLCAEITKl9M/vmGsc+TIVAv7A9q/QkGEtqZPlqS9+VMCwr/5QO5Av2wjM9j/wowkOWRPDyaQ=;
X-UUID: 08e6761b92d64af9a6c0571fdf9d5bbf-20210702
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 154869473; Fri, 02 Jul 2021 01:48:40 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 01:48:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 2 Jul 2021 16:48:37 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 2 Jul 2021 16:48:37 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, <nicholas.Tang@mediatek.com>,
 <Kuan-Ying.lee@mediatek.com>, <chinwen.chang@mediatek.com>, Yee Lee
 <yee.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 0/2] kasan: solve redzone overwritten issue at debug
Date: Fri, 2 Jul 2021 16:45:31 +0800
Message-ID: <20210702084538.9436-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_014848_153443_CC3D4FE0 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yee Lee <yee.lee@mediatek.com>

Issue: In SLUB debug, hwtag kasan_unpoison() would overwrite the redzone
 in those objects with unaligned size.

The first patch Introduces slub_debug_enable_unlikely() to check 
the state of debug mode. 

The second patch Adds memzero_explict() to separate the initialization for
such condition. The new code path is executed about 1.1% during nromal
booting process. The penalty is acceptable since it only works in debug mode.


=============
Exp: QEMUv5.2(+mte)/SLUB_debug mode
code path exec : 941/80854 (1.1%)
---
Changed since v4:
 - Introduce slub_debug_enable_unlikly() to check the debug state.
 - Include "slab.h" and Add slub_debug_enable_unlikly() to lead 
   the condition statement.
 - Add comment block about this new code path in source code.

---
Changed since v3:
 - Apply IS_ENABLED to wrap codes under SLUB debug mode.
 - Replace memset() by memzero_explict().

---

Yee Lee (2):
  mm: introduce helper to check slub_debug_enabled
  kasan: Add memzero int for unaligned size at DEBUG

 mm/kasan/kasan.h | 12 ++++++++++++
 mm/slab.h        | 15 +++++++++++----
 2 files changed, 23 insertions(+), 4 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
