Return-Path: <SRS0=zHGV=MD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABD1C07E96
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 06:54:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2525561351
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jul 2021 06:54:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2525561351
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypKoOwH1jk1ftrtBP872NVtZAfIK9nPyHa71Sqb86XI=; b=B8N0Y8zsRhsP17
	uZG/wC2jafaK0up3CnwXd1hfcmKfSLawITMPt+5M+ux1johLkDMhYOo7gRmtP03WiFo8ulFUkEi1B
	rJ+Zay89yjBtY1ZopTodiiA2Nu2FlVUDbqjioP6x5Hpimndkta4w+WFgjIJXIw1+db8L1htzKIvZS
	Srzi6Hlq3UnDIaSs1G8tI0llSnVfnvdL+pCK4ELTZ1QhyihTW+L5HcaFP4X824oD1H89FQ0z/dEQq
	uSj2QvfOOFeU4y7UP0kbrXZzV/fIZUZ8LDvg+TLTaSwxxWDFH9R0j4B5+Y2LWlsVXNDSs9nyyD+Em
	pJRB87GKViURWj80WTlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2TMR-004dkG-Bz; Sun, 11 Jul 2021 06:54:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2TM3-004dgn-4q; Sun, 11 Jul 2021 06:54:20 +0000
X-UUID: b1ec71340cfe42b0919493049ed1a5dd-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FHLuUn8pr5ccvXSBtpnj6cDonbz0+4EWK/rTb3pNlyM=; 
 b=DBpsftZRc2K7qeVQc7NhqWRuJG2WB7FrGY+i8aeokF7HYRS/BM2SZCwvemIqq23igkiFq8r7Qam60J6F2MeN68vOErxoq4SJ8Xk08I5iqUE7vhiWWiZhk6xHAU9HLJuPSYpcPFDIKIOJ877ApYUAIOTmzqhf/TJWTr2dkZDORxM=;
X-UUID: b1ec71340cfe42b0919493049ed1a5dd-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1444487156; Sat, 10 Jul 2021 23:54:10 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 23:54:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Jul 2021 14:53:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 11 Jul 2021 14:53:54 +0800
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
Subject: [PATCH v3] drm/mediatek: adjust rdma fifo threshold calculate formula
Date: Sun, 11 Jul 2021 14:53:51 +0800
Message-ID: <1625986431-27399-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1625986431-27399-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1625986431-27399-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_235419_238237_4A040120 
X-CRM114-Status: GOOD (  11.92  )
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

the orginal formula will caused rdma fifo threshold config overflow
and no one could come out a solution for all SoC,
set threshold to 70% of max fifo size to make sure it will
not overflow, and 70% is a empirical vlaue

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index f123fc0..f1f6a2e 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -164,10 +164,10 @@ void mtk_rdma_config(struct device *dev, unsigned int width,
 	/*
 	 * Enable FIFO underflow since DSI and DPI can't be blocked.
 	 * Keep the FIFO pseudo size reset default of 8 KiB. Set the
-	 * output threshold to 6 microseconds with 7/6 overhead to
-	 * account for blanking, and with a pixel depth of 4 bytes:
+	 * output threshold to 70% of max fifo size to make sure the
+	 * threhold will not overflow
 	 */
-	threshold = width * height * vrefresh * 4 * 7 / 1000000;
+	threshold = rdma_fifo_size * 7 / 10;
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
