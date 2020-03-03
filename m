Return-Path: <SRS0=Bv85=4U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88929C3F2CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 12:45:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F9032073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2020 12:45:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="om9YIpPY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="vExT40JA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F9032073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYlFD9s0d3zHpzNIUf9cpeutMxbEoGu+EQI1EUq2HR4=; b=om9YIpPYfSdYN0
	wdliwCLvOJdVmKinkC2JOtrbfGuG3XqOiY6CyfuE4ZO/DSejrej3qq7HQq58jdZFQe/1YvL/WFXS1
	ur0Vda2FATHYluCtx+xHcBOmPlHr12vrm2i6FcxnoqESunOo5db2AGiLdsKhxKYOoFNwW5g2yIRpm
	ytjBmhQSS7v7C+WjRhRR7tjwbdKPD8yiHFCchgLmjpO/72HLfDc6ddT6zCBCJtmeT5wm6S35kr0sv
	TKPDKozrhWOZsJ6MqzFIw+1oBp6TxgfktVJAdzWCLi0fQp0NaSg3lrOtrEVcs+eX/EFyI5aoD0uaT
	pQ5kWCktiEWF8YwJ7m3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j96vW-0008V8-1a; Tue, 03 Mar 2020 12:45:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j96v3-0007BX-E0; Tue, 03 Mar 2020 12:45:07 +0000
X-UUID: 3f55fcde72af4d5e8ff727abbd577c43-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8tqG320za0mW9RIagYkPiOg3CQwLqQXnwr9xDSmqpV8=; 
 b=vExT40JAWHV3pzX+i+Sw10KVWqWfabf6JUolALoaQa5SKBRRSz6O0agfqwlg7GalrLMvbiw1pjeBSAIMyit3x0klPk0q8nssHSnhXVFPCdj2PHUBCOyJCoGnbVmD6UsGsUwVKL1oz8vPsaWc4Uz5+xNx6G33XG9E+QsYS99seB8=;
X-UUID: 3f55fcde72af4d5e8ff727abbd577c43-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2094723658; Tue, 03 Mar 2020 04:45:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 04:35:00 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 20:34:07 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Mar 2020 20:35:39 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v7 03/11] media: platform: Improve s_selection flow for bug
 fixing
Date: Tue, 3 Mar 2020 20:34:38 +0800
Message-ID: <20200303123446.20095-4-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200303123446.20095-1-xia.jiang@mediatek.com>
References: <20200303123446.20095-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_044505_525744_0CA7EC34 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Get correct compose value in mtk_jpeg_s_selection function.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index da0dae4b0fc9..fb2c8d026580 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -492,8 +492,8 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
 	case V4L2_SEL_TGT_COMPOSE:
 		s->r.left = 0;
 		s->r.top = 0;
-		s->r.width = ctx->out_q.w;
-		s->r.height = ctx->out_q.h;
+		ctx->out_q.w = s->r.width;
+		ctx->out_q.h = s->r.height;
 		break;
 	default:
 		return -EINVAL;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
