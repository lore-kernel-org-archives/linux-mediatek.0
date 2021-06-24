Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FAC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 11:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E9E613C5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 11:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E9E613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=voiiuvLh1Vsge0o/BYVcaUEFuSUYIad6aB84e40hFZE=; b=qiBVIaDGg41IiV
	HWOAIG81CVHtt2FhC3jIarpAmhU95O0j/DPU3m1Vbdbjp+IAjtyHmBv1QtDS/K59DSStkPVki1AQk
	OczIHCQv0esUvck9wKazofDugc+THr5inYZAjP5WO3edYwsljBW+FFx9TrG2x1ZG7RW5pSkc02pZY
	NNTE0H1n6fgJjax9AyLE3nEsVqZsb9lKKUZZ4gCKVdIObQtAGELJjVilVG/UJI1jFDJ/frUS6dTlT
	8XwUGylmPVSAKOdokgfhyGKysgJ9Vj9nwo2tiqkAbGZNOPnilNljSKyV0VYClUzsRnMoFB8BdEyej
	Q8oPCI8sRvpCh9TAMzsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwNVp-00ENuL-VU; Thu, 24 Jun 2021 11:27:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwNVc-00ENsc-45; Thu, 24 Jun 2021 11:27:03 +0000
X-UUID: 31d2531ec02c430d86893bf9c9a06bf3-20210624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=EE6jIiMIW+LrjkcW9vjdnHCu3L8oYbeDufFrm+vj6l0=; 
 b=Vn/zENjqW5qqsRHblp6CWYWO3yG4wTQRMyCgRlYxjG0Sq/CE4rvRiUiZMviChG5SqLf28O5NOg3Ay80xWp1lCHClzTa+gdMgw3n/Fo6yi6xw354R4dbWCqneUB5TNeqPz8DS79cjrMs0/zzaFhzUGH8tXOKqZViLZZ3OjLStjFI=;
X-UUID: 31d2531ec02c430d86893bf9c9a06bf3-20210624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 889612987; Thu, 24 Jun 2021 04:26:55 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 04:26:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Jun 2021 19:26:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Jun 2021 19:26:52 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] kasan: fix redzone overwritten issue under SLUB debug
Date: Thu, 24 Jun 2021 19:26:20 +0800
Message-ID: <20210624112624.31215-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_042701_643204_FD436D16 
X-CRM114-Status: UNSURE (   6.38  )
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

This patch Adds memzero_explict() to separate the initialization for
such condition. The new code path is executed about 1.1% during nromal
booting process.

=============
Exp: QEMUv5.2(+mte)/SLUB_debug mode
code path exec : 941/80854 (1.1%)

---
Changed since v1:
 - Apply IS_ENABLED to wrap codes under SLUB debug mode.
 - Replace memset() by memzero_explict().

---

Yee Lee (1):
  kasan: Add memzero init for unaligned size under SLUB debug

 mm/kasan/kasan.h | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
