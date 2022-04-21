Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC8DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 05:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kbjSlk4I1AbIgC6NJZzVSazRT6k4HRSJIvOYitLZP8M=; b=a86k7AUkselYW7
	XVqi7vyhG6vA3QssL3HIkbwAnEWa0IlyY8RKRCOkQTmk5tO9pBB8PkHSSI5kkF9ed41FATvnBCpl1
	mYlEW1MZ0hK8OnVNcoCXvt76M277fwDzY7J8h4jqv2CZxykmFnR9VMSD7pMlvLrDCntEzzYaJdtTf
	XdDVILKhmOSU9PWD8uPogDM1ZDLMRUgpQxnx78M5fB1V6f6uQlch16mY+Jqg+CA8IZNZiqw1qlKdq
	972wDC6LhcPYIfAbzB2y6cyTdGKnKZTBf/C1sI4SgfVtf4otw1We1oaAxiJyOyvOfhhu+ZDQZ+4cZ
	N0G/0Ga+NKpZmAZ8wtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhP7c-00BWkt-2O; Thu, 21 Apr 2022 05:12:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhP7Y-00BWhW-Ss; Thu, 21 Apr 2022 05:12:50 +0000
X-UUID: 52597bcb7f4643ae96f8edd80c17b1c0-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3a48f88b-3e25-4162-90a9-178ea4e4ae32, OB:0,
 LO
 B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:181370f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 52597bcb7f4643ae96f8edd80c17b1c0-20220420
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1534870143; Wed, 20 Apr 2022 22:12:42 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 22:12:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 21 Apr 2022 13:12:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Apr 2022 13:12:27 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <yongqiang.niu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v11 0/1] add display support for MediaTek SoC MT8186
Date: Thu, 21 Apr 2022 13:12:17 +0800
Message-ID: <20220421051218.8652-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_221248_963893_740940E2 
X-CRM114-Status: UNSURE (   6.05  )
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

v11:
1. Drop accepted patches.
2. Rebase to chunkuang.hu/linux.git mediatek-drm-next.
3. Drop DSI compatible in mtk_drm_drv.c because of depenency.
4. Drop DPI compatible in mtk_drm_drv.c because we will use compatible of
   MT8192 for MT8186.

v10:
1. Rebase to 5.18-rc1
2. Drop "dt-bindings: display: mediatek: add aal binding for MT8183".
   I will move it to another series.

v9:
1. Revise [1/5] dt-bindings: display: mediatek: add aal binding for MT8183.

v8:
1. Revise [1/5] dt-bindings: display: mediatek: add aal binding for MT8183.

Yongqiang Niu (1):
  drm/mediatek: add display support for MT8186

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 29 ++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
