Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3417C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Oct 2022 09:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KAEWH1mvWeRA+bGGZ5ropbf6/lqEXlk59Hd4IejnxFk=; b=el4fWHXZqwhDrWLDsOnQyJ1u8a
	/6VyXpVoOjjdPMZtCeYptNHq9xdbuqsyHkpoNh9byoybG7BpErs/0wmrCz4n3nZsSNMWe/p/u+7Jr
	SZE+I+q5XLAWXwmLEdiJ3GfgOTT0aadz5nurrnqm2zdkVVUnKwMOw8MzXuTcjgenT2DhsWdsxYJH5
	cnUb+Idb9ckuIrsLlCxc+BIJSs66bcTzvt6tfi5F/k7Bllu3pIf2np/LLlz+/TA1cBELKYtACt1GD
	vCcJtTOgxmcSSUNlxK6pbHYD+JctZYqAgValeLSYJ/1fjgj1KOTCFP2dPWOI9M2FRzc7WblSHh5OJ
	fKGHlNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogk2f-008QxA-GA; Fri, 07 Oct 2022 09:53:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogk2c-008Qwn-6T
	for linux-mediatek@lists.infradead.org; Fri, 07 Oct 2022 09:53:15 +0000
X-UUID: 6b9905de72604f05af389249ea40970c-20221007
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=KAEWH1mvWeRA+bGGZ5ropbf6/lqEXlk59Hd4IejnxFk=;
	b=QWgWWc3dBx1tD4PjsBTgzKylJi8AsPdskU226qKpy0XdQFbN6FH86RxaE4CiwF/3HQUpgu8D+5Y9vRfbssvOXtXAQc2+hY8OluZ/SltOMAvrigZZXvusoa6cgSBCebJTdbhi+H/qfTa0eNW24r0zqhhewfZnvqo+r8ruroMcbnc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bf6cd414-d356-448c-9eaf-f1e7c4c32fca,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:897b91fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6b9905de72604f05af389249ea40970c-20221007
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 550224677; Fri, 07 Oct 2022 02:53:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 7 Oct 2022 17:22:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 Oct 2022 17:22:31 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, <linux-media@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v1 0/2] Extend MDP3 data structure
Date: Fri, 7 Oct 2022 17:22:28 +0800
Message-ID: <20221007092230.11893-1-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_025314_278729_409DD63F 
X-CRM114-Status: UNSURE (   6.14  )
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

Hi,

This series is used to extend the MDP3 data structures regarding
MDP3 internal color formats and shared memory headers.

The MDP3 interal color format is defined in file "mtk-mdp3-regs.h".

Shared memory data structures for communication between the
MDP3 kernel and SCP are defined in "mtk-img-ipi.h".

Moudy Ho (2):
  media: platform: mtk-mdp3: extend mdp_color format for compressed mode
  media: platform: mtk-mdp3: extend shared memory structure to 4-byte
    aligned

 .../platform/mediatek/mdp3/mtk-img-ipi.h      |  76 +++----
 .../platform/mediatek/mdp3/mtk-mdp3-regs.h    | 193 +++++++++---------
 2 files changed, 135 insertions(+), 134 deletions(-)

-- 
2.18.0


