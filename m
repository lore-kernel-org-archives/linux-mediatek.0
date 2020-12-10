Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1B1C4361B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 09:08:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A6C23B99
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 09:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A6C23B99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zoowUgDZcS69Z5Kk4qlqfYIri4sEbjLKZXCrCjEoSAA=; b=SwtCvjaHQzHyE71pw0ZFZ/NfD
	sqGxUOC/mi1s45B6mQ9d0Vv1OLCu0LjdTA/O+JRIZEVjYTojRCfgUpLWuHqBlRcWSqJj1CzOnXbhU
	Le2RQUtG3hVN+Fyf/HEA1ppY4AIbHhhEd54hEZGGkaWdffw6sqUNiVAnx15GEcB5JYhXqpc/63gEL
	NpX3GKzbPAGp/IMzbWvR0rUR6GP/MkvoYXT4GlXNoNDqLE4PbdlHyTzH5nnvN/j53Uzym8HXLkm9X
	h4rENZaAKRcP8zxlqjs5U3H0a04VMR+O9PO/urWPy39Sas6eJviGouhLBzf4fHyFm/HaeNLhB2zNT
	TIvmu0ANw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knHvi-0003sx-NW; Thu, 10 Dec 2020 09:08:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knHvY-0003o5-Bt; Thu, 10 Dec 2020 09:07:59 +0000
X-UUID: 778113f5cdbf4d3c92e23faa60f87c3c-20201210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RHG0c+1/ml8fnqbhSc+4Png8PrnbrqYtEpHy3j5iuH4=; 
 b=NDGneduXfsBqZuHNQEO4bDw47Nk5OTBFoqNVwFDKt4Hy0xufxHAhV6W4oXqlLcLEtsJfK6briXHE/JixUtHTSnBnRS5pzxWmk7LThlEmk3JzKo3cS14gN3/yRBiH7yDm7YvrsBAcN6bLgUZMSkVj6fmtRTH1/4auiPZqfHN+qnA=;
X-UUID: 778113f5cdbf4d3c92e23faa60f87c3c-20201210
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1984265575; Thu, 10 Dec 2020 01:07:51 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 01:07:49 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Dec 2020 17:07:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Dec 2020 17:07:47 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
Date: Thu, 10 Dec 2020 17:07:41 +0800
Message-ID: <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_040756_604414_4B95C787 
X-CRM114-Status: GOOD (  13.49  )
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

This patch add RDMA fifo size error handle
rdma fifo size will not always bigger than the calculated threshold
if that case happened, we need set fifo size as the threshold

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 794acc5..0508392 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -151,6 +151,10 @@ static void mtk_rdma_config(struct mtk_ddp_comp *comp, unsigned int width,
 	 * account for blanking, and with a pixel depth of 4 bytes:
 	 */
 	threshold = width * height * vrefresh * 4 * 7 / 1000000;
+
+	if (threshold > rdma_fifo_size)
+		threshold = rdma_fifo_size;
+
 	reg = RDMA_FIFO_UNDERFLOW_EN |
 	      RDMA_FIFO_PSEUDO_SIZE(rdma_fifo_size) |
 	      RDMA_OUTPUT_VALID_FIFO_THRESHOLD(threshold);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
