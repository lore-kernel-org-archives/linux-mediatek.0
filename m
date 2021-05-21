Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7D0C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:46:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B0B61132
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 08:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46B0B61132
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT/9ctCYtrv5SiZ1Y12ojuPryNI1SsTVuS/tLDee7LY=; b=nS/TcUVxsvIXLXvhKa/Ctzh05f
	eN5fmqgGeJx3vuDYH1QiylaE1as081vbjPXYweSZVsWTnRFuGw7mrCgIuZm1n0USKYSxMt2lk8LYG
	GF2qHfqlFT9tio19Z2vHmaFQ6C9RiJgeh5M8rALGb6mpbpz1jw0Iinfl06XxEPNC3cuYCKRd6vrDv
	04Ku60+5EK5HLLslsOptYD8rZOB9dtsfe+jd4kPOouQ0Tdwp2kb5p90d6sg6ZDjQ38MTUTq/PgKGp
	sRAs3wngZLKXe3Hth3kcAundrV1nzgYhDqEQ6A66cYj/zrvcK0m0fRA71sXbue0dqRArochj6wFoO
	HHBPC1Qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk0nI-004VFl-Ku; Fri, 21 May 2021 08:46:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk0mh-004V6R-TZ; Fri, 21 May 2021 08:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=d2NRHblndJP67p32XPJ4/BDZ/uZudWQLIOcx3bibWTk=; b=x8sn/rhU3RKvugvw7y7U3NIJT2
 OF6nS2E5br0NsfuBVWPiiIiQm4AZUo4qxA841HyGzSV9Nu8D5xznILVa8TDEwuHI9dq/Gh5f0vb8r
 LPi2Nm2bok1E2GFB+e+/Tk1LtZLrzWsDscio7fe1wC9MxJGcT9J79i429xlUqY3Ot03epHIGJRLZk
 1KHQmDnP9FkaYOJ0AcId4hme2/5dw4v5Tes3GF4snKlINv4QZj/7S5mxxC06CtMwO6j5LxNnwpdeN
 LYmBKN9E7KQJYwWZNJJ1HQxZDhnu+SqAkfg/h3BDyETmW65lJdczpaUFMF2J9WiVfwQznLEyTywPw
 TSMkyQlg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk0mf-00GxRt-FJ; Fri, 21 May 2021 08:45:30 +0000
X-UUID: 377ffd5f7da7452799db344ce1f3d797-20210521
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=d2NRHblndJP67p32XPJ4/BDZ/uZudWQLIOcx3bibWTk=; 
 b=ZEbDwnGDmnk4RZSbCZZTqd8v9BCcjyFjIJoMaQ8wCJEnrgEWL7lQkRvNksQfneThx62XAyph8v9xOxgdOH8kkpHRAakT9/eo7HoJtFErlIDOwrg1NCK3eMi5rIB2jn8wsOsX62gHfjB7nkZZO7f0zeZSNaYIV1l2OPhxyYq8WyE=;
X-UUID: 377ffd5f7da7452799db344ce1f3d797-20210521
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1513105778; Fri, 21 May 2021 00:02:15 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 00:02:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 21 May 2021 15:02:00 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 21 May 2021 15:01:59 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Fritz Koenig
 <frkoenig@chromium.org>, Tzung-Bi Shih <tzungbi@chromium.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4,
 3/6] media: mtk-vcodec: Support 4GB~8GB range iova space for venc
Date: Fri, 21 May 2021 15:01:36 +0800
Message-ID: <20210521070139.20644-4-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210521070139.20644-1-irui.wang@mediatek.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_014529_548188_539575E7 
X-CRM114-Status: GOOD (  13.35  )
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

Use the dma_set_mask_and_coherent helper to set venc
DMA bit mask to support 4GB~8GB range iova space.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
index 7d7b8cfc2cc5..26b089e81213 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
@@ -361,6 +361,9 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_event_workq;
 	}
 
+	if (of_get_property(pdev->dev.of_node, "dma-ranges", NULL))
+		dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));
+
 	ret = video_register_device(vfd_enc, VFL_TYPE_VIDEO, 1);
 	if (ret) {
 		mtk_v4l2_err("Failed to register video device");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
