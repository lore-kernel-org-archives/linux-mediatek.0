Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5CEC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE3160F38
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 09:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BE3160F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XpMJX0eAtWkFnLJ+/P0pbFNHeAGw95kM6s4TuqXDJyY=; b=OCFcOaYgIY731n
	PPWFv53y/Wlrp1Vjhd1X/pc8Zbq4fVtv/Hupxl7aB203G8w1D+tB0EUtuNboCaTFlErKFLXa0KDJ+
	j7+4aOfz1R01CED/DSI8g5v4YVkOvWO+GpgTCbvVdhtjZ8z2gS0GWIiBpHvWXycXSu/jsAKcPhkco
	UNRGlE0UHi4DgX4e7mPX81tKcN/u+VS/B/sDL9FPm5fFDzFGv12dbUciJwmV8f/Ywro8ID+pQ86uv
	D/EtsqjrFa7mZCqoIcKIVSG+zCXZsIZ0ND/bihVaUQHh8AFUlQ3hZMqwunpgxllW/ALShoU0B7tvZ
	8G3knsNb5gNugWZ36ZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBD6b-005Omg-Ds; Wed, 04 Aug 2021 09:22:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBCut-005KUS-2r; Wed, 04 Aug 2021 09:10:24 +0000
X-UUID: c9dd70394264400a9f3c8be708d2d07e-20210804
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nbo7vz4RLod6c4i8MJeHJL0Wcz1XEBh5veqoog70Kpg=; 
 b=Ne/f3qv221sdvVTkSEFAnNzIrZPLliB/W0lrCGx78oRnFTBF9Byi8Nxw46RC7b1ubOK5BbSODHd2EGmSU0cxsJQ91jIVHmF6VVJmUdNjzAhya1wqjl98HyGT3yMm6M8yXIBTxJGFK8iMJZTMzXLS5Akwbk7h3SUXyPPFl77dQYo=;
X-UUID: c9dd70394264400a9f3c8be708d2d07e-20210804
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1581526916; Wed, 04 Aug 2021 02:10:18 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 02:10:17 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 17:10:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 4 Aug 2021 17:10:15 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Nicholas Tang <nicholas.tang@mediatek.com>, Andrew Yang
 <andrew.yang@mediatek.com>, Andrey Konovalov <andreyknvl@gmail.com>, "Andrey
 Ryabinin" <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Chinwen Chang <chinwen.chang@mediatek.com>, Andrew Morton
 <akpm@linux-foundation.org>
CC: <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Kuan-Ying Lee
 <Kuan-Ying.Lee@mediatek.com>
Subject: [PATCH v3 0/2] kasan: reset tag when accessing invalid metadata
Date: Wed, 4 Aug 2021 17:09:55 +0800
Message-ID: <20210804090957.12393-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_021023_204124_8E222ED3 
X-CRM114-Status: GOOD (  10.19  )
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

With hardware tag-based kasan enabled, we reset the tag
when we access metadata to avoid from false alarm.

Changes since v3:
 - Remove inappropriate suggested-by

Changes since v2:
 - Refine the commit message in detail.
 - Thanks Andrey's explanation about false alarm
   of kmemleak.

Kuan-Ying Lee (2):
  kasan, kmemleak: reset tags when scanning block
  kasan, slub: reset tag when printing address

 mm/kmemleak.c | 6 +++---
 mm/slub.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
