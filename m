Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0BDC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:25:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6144360F92
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 02:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6144360F92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubDoCU5wfcv2v8G0wbmsOO+2XtW8snITqY968e+T+vc=; b=lG4Iw/74M+DT/B
	erXKRFTrf9YxNAXM3MjW5Ixy0QM+A0IRDO4Dq/QHR1RPLEDw5ZNhpWgz8j6eBWIJc2iOEC6Fzhn1F
	b3+qC3u+8SUsZ4wOboYWLZYLf7p+dg7x3n3n9cPNvy8lllC4XySwvO3W0O5E3mW9AO9lLxi3Qnp5O
	CHXZBSb6QzyK+GKfsEDN3d7cjLK296vsjO69dJEXhM/qfQVu9n8x/y/TZ8OlNkuvS/44PnWcxyx2P
	ozFRfzRxUVcPZW2xHjf7uFHV9xDOhbIht1IPZ+xchPW1flrz2WngeTP2NjTzekIsZmbZm7YHQ7npX
	PrfwgE8At0cFomnBsSMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfYdN-003ahQ-1b; Wed, 27 Oct 2021 02:25:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfYcy-003acQ-SK; Wed, 27 Oct 2021 02:25:23 +0000
X-UUID: a2d35569926945e4967cf35897416314-20211026
X-UUID: a2d35569926945e4967cf35897416314-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 109290151; Tue, 26 Oct 2021 19:25:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 19:19:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 27 Oct 2021 10:19:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Oct 2021 10:19:00 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v5 5/6] drm/mediatek: Add mbox_free_channel in
 mtk_drm_crtc_destroy
Date: Wed, 27 Oct 2021 10:18:56 +0800
Message-ID: <20211027021857.20816-6-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_192520_926913_1EAF00A2 
X-CRM114-Status: UNSURE (   9.61  )
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

Add mbox_free_channel in mtk_drm_crtc_destroy.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ffa54b416ca7..31f05efc1bc0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -156,6 +156,10 @@ static void mtk_drm_crtc_destroy(struct drm_crtc *crtc)
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_drm_cmdq_pkt_destroy(&mtk_crtc->cmdq_handle);
+
+	if (mtk_crtc->cmdq_client.chan)
+		mbox_free_channel(mtk_crtc->cmdq_client.chan);
+				  mtk_crtc->cmdq_client.chan = NULL;
 #endif
 	drm_crtc_cleanup(crtc);
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
