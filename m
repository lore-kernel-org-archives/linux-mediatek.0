Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3ECC07E95
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 02:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5725C6135A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 02:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5725C6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rPAIkS4M5WGfQfYRBouc3JvTS+Y+g+ODzjfSfIUgCf0=; b=iHPEt/20sc605e
	Ktqx9AKzZdJJiPTKn77yxgwjgW1MeRe5fhmtPuAP0zj+2pqeBOnl/FhE4IkWaenSHOHQHPhlQ8KdC
	rRnWtQQrxgqWY3JIF9BJ2KAsXkTJ0PC1x/OIIS7lelwnNQxEft5TxFKB6zaN6DlOdFQPeafQt5Vq8
	p960eABndbjviPPLQbCe1tQc0VVmVR8mDojQVBDXvLpR3wc3wb4teKIFzAAEQC1+mjzTMRB9qMA5z
	dQ40f9O8Ml/VL9Y5cRwbU1cL0AdBu7MD43bJy3E63xtNEslLmS1yltrAPx8cDE76e80Uhq2OpI9j5
	D+0VQynsee8mzDb1n3Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Ehb-007XVT-Dn; Mon, 05 Jul 2021 02:51:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0EhZ-007XUb-8h; Mon, 05 Jul 2021 02:51:18 +0000
X-UUID: dc8a1d17294e4ba8a19e59a0de82c266-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LEvmzsZd7jlxko7gtaAkfgm6/nJMIRQX8Awhr0+CSyg=; 
 b=s4xCy6jlQ5tWfvvAUC3FqCdIRoTa6+x2LvBse7TGlv/jwFfS/gWx3zAqoUfWXitl+BkV7lcEjodR9Y95OPAX5Pr5smSQppBbeSE06VmVatzgJSbslsR/tL/+9LQWQQUGV9IcLvkmsbIbjBzHr7r7SIFszTUbVTWPgu88RM/Yj6A=;
X-UUID: dc8a1d17294e4ba8a19e59a0de82c266-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1952125179; Sun, 04 Jul 2021 19:51:12 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 19:41:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 10:41:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 10:41:08 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <wsd_upstream@mediatek.com>, <nicholas.Tang@mediatek.com>,
 <Kuan-Ying.lee@mediatek.com>, <chinwen.chang@mediatek.com>, Yee Lee
 <yee.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v5 0/2] kasan: solve redzone overwritten issue at debug
Date: Mon, 5 Jul 2021 10:40:56 +0800
Message-ID: <20210705024101.1567-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_195117_362999_1C617DC2 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
booting process. The penalty is acceptable since it only works in debug
mode.


=============
Exp: QEMUv5.2(+mte)/SLUB_debug mode
code path exec : 941/80854 (1.1%)

Changed since v5:
 - Fix format

Changed since v4:
 - Introduce slub_debug_enable_unlikly() to check the debug state.
 - Include "slab.h" and Add slub_debug_enable_unlikly() to lead
   the condition statement.
 - Add comment block about this new code path in source code.

Changed since v3:
 - Apply IS_ENABLED to wrap codes under SLUB debug mode.
 - Replace memset() by memzero_explict().

---

Marco Elver (1):
  mm: introduce helper to check slub_debug_enabled

Yee Lee (1):
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
