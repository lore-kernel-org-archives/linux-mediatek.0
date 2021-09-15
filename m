Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92169C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 22:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A99461178
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 22:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A99461178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwPY+ba27L5f0Yt8Uy/+gCTsMIJFFynIBmG52Mrnd0M=; b=273rRUb6WT44Cm
	eSHqipW56NMt+9xX9zU84dypvg1sQbbs4tEbp4ARU0JGoX6yxwBeqE+HyFn1QDLtX/CQ4ZCWF8++7
	K7jfxOhVXTaUmt7Bx5GJ3Oysxn9KyB/rm4zxAaM8XsNJfuTSLug+2MU70sEXB+OmtKkXbMopUOEtB
	4egbMR2QKyS5EiPLqjVekhDffZHkq4SbZCWgHJCkqfIvkDV+rZwVp0Y+QlrSaweY5TEYeNNItyvY6
	Rhf73Sz9+AEtq3fHvaThTvc5EXgA9ga8mcsGIX/c0xvMarHfjIBAY7cdQV2cnOp3ftXEHhri8wL0Z
	9FR/gyWj0P5zokYRolyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQdRl-00A0a5-CQ; Wed, 15 Sep 2021 22:32:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQdRM-00A0WH-IJ; Wed, 15 Sep 2021 22:31:42 +0000
X-UUID: ca1f964c6f2c41d885dfb45de711d234-20210915
X-UUID: ca1f964c6f2c41d885dfb45de711d234-20210915
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1904553866; Wed, 15 Sep 2021 15:31:33 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Sep 2021 15:31:31 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 16 Sep 2021 06:31:27 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 16 Sep 2021 06:31:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <shuijing.li@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v7 3/3] drm/bridge: anx7625: config hs packets end aligned to
 avoid screen shift
Date: Thu, 16 Sep 2021 06:31:17 +0800
Message-ID: <20210915223117.7857-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915223117.7857-1-jitao.shi@mediatek.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1CBBB7F95158FC69DBD6EFE178D63E5FD6817AF989C525D5C38CD30A0E8D35B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_153140_648847_7CE886DE 
X-CRM114-Status: UNSURE (   8.86  )
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

This device requires the packets on lanes aligned at the end to fix
screen shift or scroll.

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 14d73fb1dd15..d76fb63fa9f7 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1327,6 +1327,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
 		MIPI_DSI_MODE_NO_EOT_PACKET	|
 		MIPI_DSI_MODE_VIDEO_HSE;
+	dsi->hs_packet_end_aligned = true;
 
 	if (mipi_dsi_attach(dsi) < 0) {
 		DRM_DEV_ERROR(dev, "fail to attach dsi to host.\n");
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
