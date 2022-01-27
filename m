Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B34C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4urL39oHUmkkargTYk5gXpBj8e/wBp1AiNPlHjXgWo0=; b=0+/ZM520XlnMvJ
	JOw+m5sXrTz9ZMT/ku0ka3usjuo5WnRUH/sT+wbLyQ9K4u00myu1uSiU9BEaOnc2jG+djtzLGTWBF
	xV/7WK3yhyz2ApCQ7TplLBeDtVSZowH5BDtZDC6hTaibrSaYKQ5VO3gMOqs0tYUlT0Fy0y9NB1WKT
	i6L2/2Nr9+pOeqm5Oiu+pB3V1+JGDvTLYBLoKUOSWICAQVACWTFtl3y9LGOVWNb+1WU8kuDuaaWs2
	9JXVVkS6qHjay6Vb0Ye0KJZ73vcZRCPy/2dy8hv5e21rnaduMnfcpWtVZNtdO0WWKl0NltBK41gMK
	3wQH+XEBmUqqH2AW/XMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3BD-00FWi8-WC; Thu, 27 Jan 2022 11:43:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3B9-00FWfE-Qi; Thu, 27 Jan 2022 11:43:06 +0000
X-UUID: 25287231428c4db2a3abe917da016f24-20220127
X-UUID: 25287231428c4db2a3abe917da016f24-20220127
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 874117037; Thu, 27 Jan 2022 04:43:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 03:42:58 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs10n1.mediatek.inc
 (172.21.101.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.15; Thu, 27 Jan
 2022 19:42:57 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 27 Jan 2022 19:42:55 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>, xinlei lee
 <xinlei.lee@mediatek.com>
Subject: [v1, 0/3] Add mt8186 dsi compatoble & Move the getting bridge node
 function
Date: Thu, 27 Jan 2022 19:42:50 +0800
Message-ID: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_034303_896472_FF07F026 
X-CRM114-Status: UNSURE (   5.96  )
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

From: xinlei lee <xinlei.lee@mediatek.com>

The modification is based on avoiding screen shift:
https://patchwork.kernel.org/project/linux-mediatek/cover/20220114092110.12137-1-rex-bc.chen@mediatek.com/

xinlei lee (3):
  dt-bindings: display: mediatek: dsi: add documentation for MT8186 SoC
  drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c
  drm/mediatek: Move the getting bridge node function to mtk_dsi_bind

 .../bindings/display/mediatek/mediatek,dsi.txt     |  2 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 37 ++++++++++++++--------
 2 files changed, 24 insertions(+), 15 deletions(-)

-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
