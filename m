Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856E3C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:57:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FD4760725
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:57:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FD4760725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RW6rFzf9dNOvNkfyev2nJkWgjEGSl+A2lzEbIzof4M0=; b=YMAMm2E85kMhUQ
	Jkf7ZjBDDYTPaMF6LyewxiD/eWpN6zeLr/L3bslnwc8AmxGjsHeGlwk7YXPfnpbtC097eEtzytSIz
	KYCAtLSRGgaiUxTGaMz2ekTslezRjyQ2M3JJsHHSXa5FU2HvkK2VXwG5om1R8ISJB8MC1da0enLcq
	1HgRTXs4c0Y4yo5MxPSn1XcH3AvmOyW6T9kckptYxs4OnXM6IbakIJ6AUf4+dy4WMJ4hY8loH2kdf
	zNCWBGws5TYe1N4TnC/F2Q9Bnqk4oVbECu1YB3uwErJEwXXqNApOzQTZHSft5rPviv7TcUCa1eUGy
	ZQyRkPPO3H89TQc0jdyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5O9m-008hkK-Mb; Mon, 19 Jul 2021 07:57:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5O9X-008hgz-RF; Mon, 19 Jul 2021 07:57:29 +0000
X-UUID: de64a3a6a01c4f3b85c63448858ffc09-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sPvLiYoV1fKMrZRgRsuRva+n5d65wLuqtmJYyPzDcow=; 
 b=JX912ioeCdI0SwO/ZI00DGd/9vkrAeGbRfO8zNl77PhSsOScsXlScwwyHbWzPMMmmLiqV7gUHy5dPYG7TebUMRBfUqbyoj0zdbMr2GPLsZBUPstbaT/Qz+MkiPNnQm0u7cDGlQY83qnE9P2pOBUPxJTj6R6PTUliUy3DxTMFjuA=;
X-UUID: de64a3a6a01c4f3b85c63448858ffc09-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1790322121; Mon, 19 Jul 2021 00:57:22 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 00:52:17 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 15:52:09 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 15:52:08 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Jassi Brar
 <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Dennis YC Hsieh
 <dennis-yc.hsieh@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>
Subject: [PATCH v1] drm/mediatek: add dither 6 setting
Date: Mon, 19 Jul 2021 15:52:06 +0800
Message-ID: <1626681126-29270-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1626681126-29270-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1626681126-29270-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_005727_926431_CF03A725 
X-CRM114-Status: GOOD (  12.35  )
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

in the first version dither patch
https://patchwork.kernel.org/project/linux-mediatek/patch/1553667561-25447-13-git-send-email-yongqiang.niu@mediatek.com/
dither 6 setting is included in that patch
bit 1 is lfsr_en( "Enables LFSR-type dithering"), need enable
bit 2 is rdither_en(Enables running order dithering), need disable
in this issue
https://partnerissuetracker.corp.google.com/issues/190643544

dither 6 setting missed in set dither common patch
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c?h=next-20210430&id=a6b7c98afdcad0f149010ae028b24f2d0dc24cdb

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 ++
 1 file changed, 2 insertions(+)
 mode change 100644 => 100755 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
old mode 100644
new mode 100755
index 99cbf44..7dd8e05
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -26,6 +26,7 @@
 #define DISP_OD_CFG				0x0020
 #define DISP_OD_SIZE				0x0030
 #define DISP_DITHER_5				0x0114
+#define DISP_DITHER_6				0x0118
 #define DISP_DITHER_7				0x011c
 #define DISP_DITHER_15				0x013c
 #define DISP_DITHER_16				0x0140
@@ -135,6 +136,7 @@ void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
 
 	if (bpc >= MTK_MIN_BPC) {
 		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
+		mtk_ddp_write(cmdq_pkt, 0x3002, cmdq_reg, regs, DISP_DITHER_6);
 		mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
 		mtk_ddp_write(cmdq_pkt,
 			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
