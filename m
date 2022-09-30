Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF3AC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 16:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pS1tSPwDLFBpsZ2scl3Ajd4uBs6KM7lPcLsxN3BMnR8=; b=qjWLq64636YlHIIhgTIHud96wk
	W49thmUBaWi7wRAX/+zRnPGtqXk9hOho8ntQDbTm9yqEL9LFR5QbKzsk8bf6tzJcGWnv4BDB2Z9hI
	8o+k9J7S1/Pgx7sk461Pq7Fw8CVZUdt7WN5yULm+rovFKocHwubsSpGTPVCp2NQv1dI4TYh32JgIy
	OUf/U9Ab4Z+7kliTPmCup7YgbhGOqyvdzRZhpdoenUdSS3dTzqOviobu+QUnc8eyOl2fdrr78EIVi
	DnjynFHZ/d/LgX0Om50VumffQxHvG/aShBeMZGzdKZZS9G1MRj3bh4RX/fHWvSQwd3JFFhgfm+OpH
	DXPo7GBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIXP-00ATEK-OO; Fri, 30 Sep 2022 16:06:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeIXJ-00ATDh-NK; Fri, 30 Sep 2022 16:06:51 +0000
X-UUID: 79dbc312be13467fb71c4ffb16a76757-20220930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pS1tSPwDLFBpsZ2scl3Ajd4uBs6KM7lPcLsxN3BMnR8=;
	b=pRBvc9Fmd0HZltVY61TQycjWzs3JuN+8JISKBxjI+UgRxaAtvbZrXGg0U9+CzTwajWCwQByrcCRKJ2U0dpnjw1NcXUWkM58/8pQjoA8/C/FX49POWbYDFg/vmsgyv7vWRiPRykfxe+74Wwz1dKUKe43wQ7Bvyy9t25RsA0Jz96g=;
X-CID-P-RULE: Spam_GS6885AD
X-CID-O-INFO: VERSION:1.1.11,REQID:ff5086a4-0f5d-4b8b-a629-d9a6d8679d65,IP:0,U
	RL:0,TC:0,Content:73,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS6885AD,AC
	TION:quarantine,TS:173
X-CID-INFO: VERSION:1.1.11,REQID:ff5086a4-0f5d-4b8b-a629-d9a6d8679d65,IP:0,URL
	:0,TC:0,Content:73,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_US65DF41,ACTI
	ON:quarantine,TS:173
X-CID-META: VersionHash:39a5ff1,CLOUDID:cc69a7a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:2210010006441LQM4NSW,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|801,
	TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0
X-UUID: 79dbc312be13467fb71c4ffb16a76757-20220930
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 576372213; Fri, 30 Sep 2022 09:06:43 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Sat, 1 Oct 2022 00:06:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Sat, 1 Oct 2022 00:06:39 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v8, 0/4] mailbox: mtk-cmdq: add MT8186 support
Date: Sat, 1 Oct 2022 00:06:34 +0800
Message-ID: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_090649_782279_1DB0D400 
X-CRM114-Status: UNSURE (   5.93  )
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

base linux-next/master
change since v7:
1. instead magic number with marco define
2. adjust gce ddr enable control flow


Yongqiang Niu (4):
  mailbox: mtk-cmdq: add gce software ddr enable private data
  mailbox: mtk-cmdq: instead magic number with GCE_CTRL_BY_SW
  mailbox: mtk-cmdq: add gce ddr enable support flow
  mailbox: mtk-cmdq: add MT8186 support

 drivers/mailbox/mtk-cmdq-mailbox.c | 42 +++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

-- 
2.25.1


