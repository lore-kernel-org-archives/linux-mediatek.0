Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C21C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:46:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BC6D610A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 13:46:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BC6D610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q0vzzDTkuhW0lvMJr9RUZXlc7Lewp8Lz/NIeN6Yf8k0=; b=QVNR4eZXxvwPdJ
	pa2FZtcuD7GT03xiSQBZyOAIdBExNPUHJkTld68zfeTqOtTFM5aZ0L0SYAgOUAt26HqWVgrdPFmL5
	1ghroveJ4NaZb982uREPNbVZmqSyBiIg1j0SHKt5RaKcRD0jMTwnWSwByGs2valE3fjjAJOAmPVnO
	FeB9ScoddoMwc4BgFPxSRLxuMb3ABOhC8wVfdVjMSd4dEPlsuUjsqR5w/MEyVearAC3YZ4u+gkJ2q
	xL+nFeN5ffr5ha5lazdMT9c9WPrctwjcldOe2k3/QJc7SFzzT1YWBrZ0AvFgDksZ32pHX0CUDSEU2
	U4c7zFp83hsiUFbX1qHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lw3Ce-00Ar1t-W4; Wed, 23 Jun 2021 13:46:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lw3CS-00Ar0Y-QA; Wed, 23 Jun 2021 13:45:54 +0000
X-UUID: 18e9d0243d7449b8a9fd2a71fa720a5c-20210623
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=v/jFtkJ8aEoFT8G1HMLSxQNlUMuLBHBTeZjP77aKpK8=; 
 b=X8mV7QldVqZzuSK0FWho+m4kWW7iDe1x/HOwLHWH1KdFr5w3pHBjdUxOHWcHW2zk6KJnOOABAkun0wAKyz7gte6BWL+Ex62uU1Fw/jOfF3BfvoyjYMG1grb1cJ8FGjRky3xmn8D1uRR9z2raaW82k9LWaZuCy6Qe2tsTu4E5pLI=;
X-UUID: 18e9d0243d7449b8a9fd2a71fa720a5c-20210623
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1332751171; Wed, 23 Jun 2021 06:45:49 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 06:35:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Jun 2021 21:35:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Jun 2021 21:35:39 +0800
From: <yee.lee@mediatek.com>
To: <andreyknvl@gmail.com>
CC: <wsd_upstream@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/1] kasan: fix redzone overwritten issue under SLUB debug
Date: Wed, 23 Jun 2021 21:35:31 +0800
Message-ID: <20210623133533.2246-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_064552_896692_C56E8852 
X-CRM114-Status: UNSURE (   8.24  )
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

Issue: hwtag kasan_unpoison() would overwrite the redzone in those object with unaligned object size. This patch Adds memzero_explict() to separate the initialization for such condition. The new code path is executed about 1.1% during nromal booting process. 

=============
Exp: QEMUv5.2(+mte)/SLUB_debug
code path exec : 941/80854 (1.1%) 

---
Changed since v1:
 - Apply IS_ENABLED to wrap codes under SLUB debug mode. 
 - Replace memset() by memzero_explict().

---
Yee Lee (1):
  kasan: Add memzero init for unaligned size under SLUB debug

 mm/kasan/kasan.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
