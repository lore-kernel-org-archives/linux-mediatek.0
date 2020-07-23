Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D38C433F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E63AA22B40
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L6k6U9ih";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HvkZqQN6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E63AA22B40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q+od/1zBMIHXqR682JpUABfmwh29u4svhYDM2tEzY5w=; b=L6k6U9ihEw1oMfzCSRfETf/l5
	BG2Oh8NxUnya3ZFGGMUxdQ21yyus0Xd1LsbSlsGdBZ5YwKBOPPW2bLSXX4hwoajnWx2cwwHCVQjQm
	vd+4nBCR/IUAg6rjl2xpTNiRO5z2obZoOQjrTGi7lrPMzakrifrmanY6QMcUc0v5xZ0QBOFtR6JWY
	qz3y22AOSGjV5p8NrGcqIm+PkNVYqUPUIicRq77m6eNIoyCth4RT7Yfw8ewqxFx1skL/kPs5d0k0G
	73fR8DXS3/G4gqoitvlfG0aGDg9yL4fPzZSIYclqpAG9LvDMNwjBt6u1TWV7XHXfW94XLAbbEG0GS
	n3AB2MqGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyRZb-0001hu-1L; Thu, 23 Jul 2020 03:07:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyRYl-0001EP-6S; Thu, 23 Jul 2020 03:06:20 +0000
X-UUID: 68c1bccbd16e4683b7594a19ff38bda8-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2HC8KSULeKnTQu8TU3nMZXcQFZT55+m/f0oQcHcZGA8=; 
 b=HvkZqQN6wGKi2Ye7wjtH6wr9wVkgm9eMK9zUI9S7MUSMF0b5aTOAZ+AWidBH5p0Yqv/wc8ldyqejGfeJkOa6+03CtBOPIgpN5j1YL6mJlex817z45hhpZk50YtbtJHA6wmCaS0rlFsOJhAzAPX6wuuT8exxC/53AVZS0eDLPKoo=;
X-UUID: 68c1bccbd16e4683b7594a19ff38bda8-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1155456794; Wed, 22 Jul 2020 19:06:13 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:06:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:06:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 11:06:07 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v10 07/28] media: platform: Improve the implementation of the
 system PM ops
Date: Thu, 23 Jul 2020 11:04:30 +0800
Message-ID: <20200723030451.5616-8-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200723030451.5616-1-xia.jiang@mediatek.com>
References: <20200723030451.5616-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_230615_445945_341338FE 
X-CRM114-Status: GOOD (  12.67  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add v4l2_m2m_suspend() function call in mtk_jpeg_suspend() to make sure
that the current frame is processed completely before suspend.
Add v4l2_m2m_resume() function call in mtk_jpeg_resume() to unblock the
driver from scheduling next frame.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v10: use pm_runtime_force_* helpers
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c    | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 7f74597262fc..ee4aaf618551 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1207,24 +1207,22 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
 
 static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
 {
-	int ret;
-
-	if (pm_runtime_suspended(dev))
-		return 0;
+	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
 
-	ret = mtk_jpeg_pm_suspend(dev);
-	return ret;
+	v4l2_m2m_suspend(jpeg->m2m_dev);
+	return pm_runtime_force_suspend(dev);
 }
 
 static __maybe_unused int mtk_jpeg_resume(struct device *dev)
 {
+	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
 	int ret;
 
-	if (pm_runtime_suspended(dev))
-		return 0;
-
-	ret = mtk_jpeg_pm_resume(dev);
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
 
+	v4l2_m2m_resume(jpeg->m2m_dev);
 	return ret;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
