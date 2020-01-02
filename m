Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE167C3276D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B429224649
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:02:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P4D2BYQ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NBR6/bdA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B429224649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WVKjyyyTK80+4doLB6llXewwau60fgZO998YCRF9fE=; b=P4D2BYQ3dj0Vpz
	SdYDnTjSIbpvdI6XoA7W3qJQ3ceNxepfPGslbdvGZLOhPkkc/bppBnmeV9sE8rBoIpGtj8ACAd5tQ
	HoJ4fDqw9B70it72kFyvrP+uJFbvGsfLMXL3IKA1BSsD0EYF7emiG48ltRuzchgMFHlL16NLEzu6k
	2fHlQ+kbg2hPj9NHGR1PLMmFHJWGIppkxT4FBOddhPuf5Znjt1O5hPFA/ywpMJeOpYpQ5/+BU9jST
	qhXtuAuZba1dVuYKhw43ELAj8CE50vonjpxYmcqZHhPfUxNwrvemruV5TXK80oL7o8CFHq3s0ZE0o
	gUnzPW27acce7Yd2FVwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imrgr-0003GS-91; Thu, 02 Jan 2020 04:02:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imrgn-0003ED-GT; Thu, 02 Jan 2020 04:02:26 +0000
X-UUID: ee406544c3064a9a91fe328cc123e992-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IiiRHn3R6Js4Pvfh8uoHNNErfFDcDFJoVtSH9d23T4Y=; 
 b=NBR6/bdArlOPTcS2o7N5zxmI9GM6sbh5THWKRustyaXHTItauYamSCLTVT3aOdfZFjai+tKe2hC3C7y1b59w7+qRYc555PH5GNUkgQ9BDilgVW6TD/to3PKPHWNiFYYjExqWAgI5y4CwfucoobrIbbMnJF4kUICKAv6rmoDm/Xs=;
X-UUID: ee406544c3064a9a91fe328cc123e992-20200101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 941658675; Wed, 01 Jan 2020 20:02:24 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 20:02:26 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:40 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6, 09/14] drm/mediatek: add connection from OVL_2L0 to RDMA0
Date: Thu, 2 Jan 2020 12:00:19 +0800
Message-ID: <1577937624-14313-10-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_200225_549448_9BD3DAE1 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this patch add add connection from OVL_2L0 to RDMA0

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
index bb41594..a6fed7b 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
@@ -33,6 +33,12 @@
 #define DISP_REG_CONFIG_DSI_SEL			0x050
 #define DISP_REG_CONFIG_DPI_SEL			0x064
 
+#define MT8183_DISP_OVL0_2L_MOUT_EN		0xf04
+#define MT8183_DISP_PATH0_SEL_IN		0xf24
+
+#define OVL0_2L_MOUT_EN_DISP_PATH0			BIT(0)
+#define DISP_PATH0_SEL_IN_OVL0_2L			0x1
+
 #define MT2701_DISP_MUTEX0_MOD0			0x2c
 #define MT2701_DISP_MUTEX0_SOF0			0x30
 
@@ -308,6 +314,10 @@ static unsigned int mtk_ddp_mout_en(const struct mtk_mmsys_reg_data *data,
 	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0) {
 		*addr = data->ovl0_mout_en;
 		value = OVL0_MOUT_EN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_OVL_2L0 &&
+		   next == DDP_COMPONENT_RDMA0) {
+		*addr = MT8183_DISP_OVL0_2L_MOUT_EN;
+		value = OVL0_2L_MOUT_EN_DISP_PATH0;
 	} else {
 		value = 0;
 	}
@@ -373,6 +383,10 @@ static unsigned int mtk_ddp_sel_in(const struct mtk_mmsys_reg_data *data,
 	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
 		*addr = DISP_REG_CONFIG_DPI_SEL;
 		value = DPI_SEL_IN_BLS;
+	} else if (cur == DDP_COMPONENT_OVL_2L0 &&
+		     next == DDP_COMPONENT_RDMA0) {
+		*addr = MT8183_DISP_PATH0_SEL_IN;
+		value = DISP_PATH0_SEL_IN_OVL0_2L;
 	} else {
 		value = 0;
 	}
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
