Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A9FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 14:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H+SS6lfeWpWo2fZcJknMvka571dOGDvz57dChhn0FlM=; b=fmbu8SYgBet83OShSa7YFfraVr
	7RGqAAmkVSc+tqLAl+10SdBWYLkJYLlrKPGotvHIAwTR9g0v9DFMb6wlkUSMAfNZjHPcvdkyIzFKQ
	adycPmIKBejpjCiVcZpglSN97AX+vpAhNB1SfU4o2E+RJUkbObXp2iejbwOa2NODq2PisJS/zEpjt
	Xbp2f56q5aagM/B4GN76Kaev/49OHgltoySaN0DknCmDoUhNTA2hgbBbPnaV2r45zmW3H6vjDaaDP
	xStYYy8rYZqq5VxYdiOH7V+YoT0nUToq17DNKux4hyL144lrLeqTlAL+3MlJMS/yiEUjzswYLBTKr
	Stb6RcQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC1O-00Dz1e-4F; Fri, 16 Sep 2022 14:08:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC1C-00Dywh-8t; Fri, 16 Sep 2022 14:08:35 +0000
X-UUID: d438d9a375204b089d7ce0a10c574fac-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=H+SS6lfeWpWo2fZcJknMvka571dOGDvz57dChhn0FlM=;
	b=HJ/Jg7P+/tqVHRImDqsRCC0Sc9tPXQWDn31mNSYEDhkA6iQS3fFemQtAfXWNm9MQyrTSaUO8iAXlH9Xg1Pn79iC9qmgt9Va4FJFi35f0wO3EOam9c6nowC6SMhi0B3SHRXUVx/6/BYlpERVcjGhxMIeg+EUXVBLLRVdIdIXul3g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:adde18de-6eaf-4370-b7be-808569254d20,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:30c67e8a-35ad-4537-90e7-b56a69d5f8a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d438d9a375204b089d7ce0a10c574fac-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1677367839; Fri, 16 Sep 2022 07:08:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 21:38:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 21:38:22 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>
CC: <matthias.bgg@gmail.com>, <granquet@baylibre.com>, <daniel@ffwll.ch>,
	<jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <liangxu.xu@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v2 0/3] Refactor MediaTek DP drivers
Date: Fri, 16 Sep 2022 21:38:18 +0800
Message-ID: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_070834_331151_B69D7BE6 
X-CRM114-Status: UNSURE (   6.77  )
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

For this series, we do some clean-up and fix a build warning.
This series is based on linux-next-20220915.

Changes for v2:
1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()".
2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()".

Bo-Chen Chen (3):
  drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()
  drm/mediatek: dp: Remove unused register definitions
  drm/mediatek: dp: Fix warning in mtk_dp_video_mute()

 drivers/gpu/drm/mediatek/mtk_dp.c     | 70 ++++++++++++++-------------
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  6 ---
 2 files changed, 36 insertions(+), 40 deletions(-)

-- 
2.18.0


