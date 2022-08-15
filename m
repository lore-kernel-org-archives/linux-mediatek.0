Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21AFC00140
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 03:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qNdD3chj2kYZpz62oAkZWWNj2GtmwS9LzVNRd/CmfQE=; b=CZ303ddHuZeS644J5Xi0PBoPlT
	VF0t0Ouw9CcYhMzrZIrkbuHyXpnTr6uLgQ0xMWZCMtI/EdeyL9J8CZgBgXEij3doaq6SGEvY6M1Ty
	6yUClaNtWiI1nAJWlIpAa3Zd9exfYT5JxsgaGldrKGxmVE2QBqyLSxq1zONrfVfDqcVcr7ei6/pQh
	qRuLkofMR3BEP1FrMLA9HApwKOL+3ckupUJIlnyaqOd9Nyi8ZHXavg9wJm5N3RM8SAH5x8Oh1QpZV
	7FtaKkmpHD3vodcVsdxawAspra2SPaHQn6Xdvu80UrY+cXZBhzgx5pZZR3IyXLRINCmiWIQL2O/f5
	hkyQfjhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQw3-00AuAI-AE; Mon, 15 Aug 2022 03:38:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNQw0-00Au5A-0N; Mon, 15 Aug 2022 03:38:37 +0000
X-UUID: 172e49aa69214fe299f4e7f364a86f86-20220814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=qNdD3chj2kYZpz62oAkZWWNj2GtmwS9LzVNRd/CmfQE=;
	b=nZ7YivC59D5miUycSO691Dwknon05Aaif9pPFKF71gBMCGovwi/fmPaWk3EbemoR0l8te2mUCG/7hVwB/CDYNrHCoLbaPzhsU195KqjgJtFOq49vMrgTwwv25M0IGdNm3KARJFXzJhob2c73Ms3xnV+BrMVE0VxF5z4hoLjMQhg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9,REQID:033d7fa6-2118-4c09-92af-29c6d07c5ebd,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:100,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:100
X-CID-META: VersionHash:3d8acc9,CLOUDID:61eacdae-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:801,TC:nil,Content:3,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 172e49aa69214fe299f4e7f364a86f86-20220814
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yongqiang.niu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 666700252; Sun, 14 Aug 2022 20:38:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Aug 2022 11:07:46 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 15 Aug 2022 11:07:45 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: [PATCH v1, 0/1] fix gce timeout issue
Date: Mon, 15 Aug 2022 11:07:39 +0800
Message-ID: <20220815030740.28899-1-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_203836_148030_237DBD84 
X-CRM114-Status: UNSURE (   4.82  )
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

base linux v5.17-rc1

Yongqiang Niu (1):
  mailbox: mtk-cmdq: fix gce timeout issue

 drivers/mailbox/mtk-cmdq-mailbox.c | 57 ++++++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 6 deletions(-)

-- 
2.25.1


