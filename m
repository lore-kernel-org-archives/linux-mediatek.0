Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AF5EE0204
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 03:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FFbZhKvtZxP/gqFO7T9Vq00ul+JdlHXoelqdWHdocUU=; b=fC2NPb1DIDWH4055M+3gbOGKHC
	lvdddjFmmm+K1b2U0PVx0rWFXdsXR1JMvBu6Xpv7ItVQn4ct7aP1tw1NKITnheFi9VeOhFyYhsT1d
	Emm1bHVNuFJEQEbidwwTsrEIwlAW5XsFSwBnsfdZHHnsYBDY0HdYEBwNi70/8maURmyZhn/2R7fSV
	XVHnHwGL9IRCYDYikEV5/NL0kamHcGLJo61cvJX9n/LSIkJLom8ZaCZOxT9Yxm9HiM1PJ8tB7LZN5
	MbbY2LaehrkisXrVtPclm/YQhJO11wm99qjVrjSN620TVlDUQLWwaCSO6oOUiWfbpTw7vuSZW/uSo
	+AW/rN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soDzg-00000007v2J-05Er;
	Wed, 11 Sep 2024 03:26:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soDzZ-00000007v0P-29Uh;
	Wed, 11 Sep 2024 03:26:09 +0000
X-UUID: 8fac69f26fed11efba0aef63c0775dbf-20240910
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FFbZhKvtZxP/gqFO7T9Vq00ul+JdlHXoelqdWHdocUU=;
	b=IF0xk09uPGLJWZRN0cXPW3w0VXXbJfUN7ElB0bxq//p/km24PNpQ+UK0gjgdKVTs7j/zDvrSl9LLuYPn/QJx1dcwHdEqnDYDjFUzNerREw78z4cLIiCLyCSITPk0JxqyII2kQ89ByU0AIbE2r5e3SJzGBOTBnbICiLNNHDInMxo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4cea054d-5137-4479-b4f1-794f70d20827,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:18d8c5bf-d7af-4351-93aa-42531abf0c7b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 8fac69f26fed11efba0aef63c0775dbf-20240910
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunhui.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2100310433; Tue, 10 Sep 2024 20:25:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 11 Sep 2024 11:25:55 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 11 Sep 2024 11:25:54 +0800
From: Chunhui Li <chunhui.li@mediatek.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-modules@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wsd_upstream@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>
Subject: [PATCH v4 0/1] fix sysfs patch build warning and add fixes
Date: Wed, 11 Sep 2024 11:28:01 +0800
Message-ID: <20240911032802.22413-1-chunhui.li@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_202605_585342_32F17792 
X-CRM114-Status: UNSURE (   8.29  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Maintainer,

V4:
-Fix build warning when CONFIG_KALLSYMS is not enabled;
-Add Fixes tag;

I can't find add_sect_attrs and add_notes_attrs commit in linux.next git log,
and Petr Pavlu show /sys/module patch link when review,
so I label Fixes as below, If incorrect please notify me. 

Fixes: db939b519bea ("Module section offsets in /sys/module")
Fixes: 6d76013381ed ("Add /sys/module/name/notes")

https://github.com/mpe/linux-fullhistory/commit/db939b519bea9b88ae1c95c3b479c0b07145f2a0
[PATCH] Module section offsets in /sys/module

https://github.com/torvalds/linux/commit/6d76013381ed28979cd122eb4b249a88b5e384fa
Add /sys/module/name/notes

Thanks for your patience.

Chunhui Li (1):
  module: abort module loading when sysfs setup suffer errors

 kernel/module/sysfs.c | 63 ++++++++++++++++++++++++++++---------------
 1 file changed, 42 insertions(+), 21 deletions(-)

-- 
2.45.2


