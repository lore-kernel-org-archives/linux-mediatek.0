Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDEDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Z2hN0aO6WLrkIPN/1aAWa4/XNHdEb6pTibWdXJMdBQ=; b=AuUZI+McCiI7GW
	PEiQGAHArB0wgXJU7vlXCO6qwS2BTV3yKH/mMEuxFN00WWJgjnUkT7rNrN1i/zNnuuxHUWnige/Ln
	WLobBhkYK+1L8Z2Boi2xUUIXZ7X8OsTTjDIoFR8Wg+ZN5K9QyJpfNMcnJqRMZKLZhwq+reloXVP3Y
	tryePf7e+952Od81+rQA9HO12wKDz+uLMbjdhv7XD+Nje1m2PlW8f9SX62FfyGoQdPEM6jaogstNU
	p2WkuIWLjzkIDqwKoFqySFl8yodME95gZJsznZ07T1j0bTYCUXeEbUuJse6CPFKJXiWY/MRtVp9uo
	ZvGrkfiagkk7YZ/Vf0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3C4-00FX4e-P8; Thu, 27 Jan 2022 11:44:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3BL-00FWju-WF; Thu, 27 Jan 2022 11:43:17 +0000
X-UUID: 09600a0f7405483691e42f813c1b183f-20220127
X-UUID: 09600a0f7405483691e42f813c1b183f-20220127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1863860231; Thu, 27 Jan 2022 04:43:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 03:43:09 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs10n1.mediatek.inc
 (172.21.101.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.15; Thu, 27 Jan
 2022 19:43:08 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 27 Jan 2022 19:43:07 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <jitao.shi@mediatek.com>, xinlei lee
 <xinlei.lee@mediatek.com>
Subject: [v1,2/3] drm/mediatek: Add mt8186 dsi compatible to mtk_dsi.c
Date: Thu, 27 Jan 2022 19:42:52 +0800
Message-ID: <1643283773-7081-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
References: <1643283773-7081-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_034316_132590_5B18EB5B 
X-CRM114-Status: UNSURE (   8.63  )
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

Add the compatible of mt8186-dsi because we use different cmdq addresses in mt8186.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e91b3ff..62af60d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1151,6 +1151,12 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
 	.has_size_ctl = true,
 };
 
+static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
+	.reg_cmdq_off = 0xd00,
+	.has_shadow_ctl = true,
+	.has_size_ctl = true,
+};
+
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi",
 	  .data = &mt2701_dsi_driver_data },
@@ -1158,6 +1164,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
 	  .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi",
 	  .data = &mt8183_dsi_driver_data },
+	{ .compatible = "mediatek,mt8186-dsi",
+	  .data = &mt8186_dsi_driver_data },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
-- 
2.6.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
