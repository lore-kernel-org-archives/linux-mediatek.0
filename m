Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66C55C5475B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 01:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qsVeZY7ariDbPPGgJAwyIB3C+kJL90wnCgmOhDPi0CE=; b=AIo4a7cqsLOwh7NxtlrSGkMS3+
	841aQ4rSWgWNEwb5y1IO5o5K/1KXkVZK5UKen8jV0I04P4qK0njEomL0cbCh/FkfnvThIU6s0DSo0
	TblmIhvyvZvDrJIpIHm/er9TJSo0WW9aQXMTsH0a4vBUBTNlcalKkQNFC+bNMzIzwzUGcULCQKk9l
	2Bj9hDbMBBYPwGT8INB/L6pTUQw3nLyXukafqqUpUzfL7KQLPhkVjj2UV6D1HriicZccUKhy2b/gL
	fiI+VlHmbJKYTVtl46s2lDkmf3HeJIaTm+l7kgnzjlyPL82guQv9sJf0oRcubrDiDxTxUmJzUas9R
	RZHyhsYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2fh-00000002XdI-3ahX;
	Thu, 07 Mar 2024 01:35:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ri2fg-00000002Xav-07Jx;
	Thu, 07 Mar 2024 01:35:45 +0000
X-UUID: ff7dd8c4dc2211eebe6b57d01cc416d2-20240306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qsVeZY7ariDbPPGgJAwyIB3C+kJL90wnCgmOhDPi0CE=;
	b=dxxK26ulPzJVIYey3EwXlO9fT+Tlm/G6xbTaPD7K74x5UxMZW9PlxyDQ6/VmU1FfNJFXp7uxr47DRFvBLSetkEPfyMQ+/0cCVo+Q5ip1Le7dpYsz3V0emZAU3ZieOjwL38mSfgze1UuhjQq6AymwoeYtRW5WHne0H92lA9AcGzM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:c9da434c-810f-4892-b590-0dac80deb059,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:7f7db484-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ff7dd8c4dc2211eebe6b57d01cc416d2-20240306
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 792359797; Wed, 06 Mar 2024 18:35:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 7 Mar 2024 09:35:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 7 Mar 2024 09:35:00 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jason-ch Chen <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-jh Lin
	<jason-jh.lin@mediatek.corp-partner.google.com>
Subject: [PATCH v2 0/4] Add CMDQ API for upcoming ISP feature
Date: Thu, 7 Mar 2024 09:34:54 +0800
Message-ID: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.233100-8.000000
X-TMASE-MatchedRID: pJ+CdhK041Qssufzyd4qvjPDkSOzeDWW87QrIQgH3y3ANHjiWWI+7d96
	V2NgrEHiDoqCl/x+niurnPeXenpUwBaTj8lkRWbAXSKcwPTzq/IhotH7bEpEMlwpnAAvAwaz0gE
	LN9U+w7GDefyXDwaGu/3bv+uBVCY6WvrN47f+AFsflhDI6DvVln0tCKdnhB589yM15V5aWpj6C0
	ePs7A07fk39LXMSri60LeqKkxroARqlYmP1kxHlxV5ziwakIth1e5jJb9JJQc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.233100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 28C47FC7FE85B52C197D796DD901F072AA0166C80A81E406F968B2F69C21CA932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_173544_097094_94735809 
X-CRM114-Status: UNSURE (   7.55  )
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

From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>

In order to support the upcoming ISP functions, some CMDQ APIs
need to be prepared:
1. cmdq_pkt_mem_move():
   For memory or register value from copy src_addr to dst_addr.
2. cmdq_pkt_poll_addr():
   Extending cmdq_pkt_poll() to support polling the register address
   which doesn't have a subsys id.
3. cmdq_pkt_acquire_event():
   To support mutex_lock protection between GCE threads.

Change in v2:
1. Change the return variable from 'err' to 'ret'.
2. Add more comment and commit message.
3. Drop the last PATCH 5/5 in v1.

Change in RESEND v1:
1. Remove Change-Id in commit message.

Jason-JH.Lin (4):
  soc: mediatek: mtk-cmdq: Add specific purpose register definitions for
    GCE
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_mem_move() function
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr() function
  soc: mediatek: mtk-cmdq: Add cmdq_pkt_acquire_event() function

 drivers/soc/mediatek/mtk-cmdq-helper.c | 90 ++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-cmdq.h  | 52 +++++++++++++++
 2 files changed, 142 insertions(+)

-- 
2.18.0


