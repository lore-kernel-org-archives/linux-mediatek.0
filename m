Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B83C07E9B
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA6E613FC
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 10:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA6E613FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ckazGH549EYq+oa5Y4L/GD24aXXjrnhio6jfctpqGk=; b=SsAIxudqn7dhWv
	5oBCRI6EvaNjVAM7z1Nt86r11pEjbmQq2xK19o0BQCkxehQXYYpojxoLXg5nUqkrh2yr8XvJ7OD26
	ZwJJQbN8O+wjnCjjoscljkLzzgYd7A6wxNSUBLGHPZOP+FaUHeCrk0GJKjW10YOeteZXKYq42xAWP
	Fe/Qfm5X/52wha2d6cOfSoW326LfZ/WTacgDzO7uAQpO5ywknL0Z2y7PH69I4Z+qPgOlqdMhk4bmp
	3Qb/G57foIo+E2imvOV1UX034PlmwdXHmQ48hGtD9ykqm4uXraQb5xjjNn3msZA3Gkany69zTFO8F
	EWrUQmWtIi84j49O5CCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0LvI-008aSO-Of; Mon, 05 Jul 2021 10:33:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Lv6-008aOA-1g; Mon, 05 Jul 2021 10:33:45 +0000
X-UUID: 65ae7165130f40ae8acb0cdb9bb75c56-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kZzhr18LbCr2wKTe8h+zt4bHEDxlV7HexM1GYxoxHqE=; 
 b=iA3sMLVyRmP9AuEzBzgpxj05J8rgkH66o1d5lSIdf5t3vnKZ98b9iG5is1+T1s+TBO5sJJNzJiMJbxk+f476kKAIOy+Dq3Bltb6pxAOTkzs5QHxL82Nn6Dp+Z32M8cFfofXBbUdyNbOnSJaiQ+99PapVfJcjfsje8XuoBVYjepg=;
X-UUID: 65ae7165130f40ae8acb0cdb9bb75c56-20210705
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1257810607; Mon, 05 Jul 2021 03:33:40 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 03:33:38 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 18:33:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 18:33:24 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 0/2]  kasan: solve redzone overwritten issue at debug
Date: Mon, 5 Jul 2021 18:32:25 +0800
Message-ID: <20210705103229.8505-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_033344_136364_3FEF7D1F 
X-CRM114-Status: UNSURE (   8.94  )
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

Changed since v6:
 - Move helper instead of introducing a new one.

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
  mm: move helper to check slub_debug_enabled

Yee Lee (1):
  kasan: Add memzero int for unaligned size at DEBUG

 mm/kasan/kasan.h | 12 ++++++++++++
 mm/slab.h        | 15 +++++++++++----
 mm/slub.c        | 14 --------------
 3 files changed, 23 insertions(+), 18 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
