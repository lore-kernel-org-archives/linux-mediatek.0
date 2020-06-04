Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D532EC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:18:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0082065C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 09:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vBAzq3kt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="coeefiW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0082065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hDolrxu4ZSXi5wU7ePwZxC/aSWGPqLhlqLtWxoj3ZME=; b=vBAzq3kt6RXgV3
	hwFeE/mmGPpRns4/1rq8o9OEJ2VIArGUL+PE/B0JXu2urJDA/CHOwz8VMBV1nJIOvDnPMAxJiFvJX
	ETu54mSemyXb7zfHwbbgNozwDC2tnj6YYGE9LJnP4kyvKAOXVZ2okAJC975rZZjawkrRGUtrHujFe
	KQggTP+SGetCPmUhlT9n6AhTeDFYAYwd5Ll+T7H0gSjpGaZl1juNricKWzOWwl3Y9BELfEwD/rSAc
	JOMZsccIsHTXa+uHh0c7k4Lje9dSlhsb1vdckIq1Epvkd+h28hvCjSNDPKHsNwlkzDLhgEYmjrkqG
	2/ivahgXCWADZ/RWnqug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgm0u-0001FL-6i; Thu, 04 Jun 2020 09:18:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgm0r-0001EA-SN; Thu, 04 Jun 2020 09:18:15 +0000
X-UUID: 4143fe2019a54624afb19e48f6ee5ca6-20200604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZTXG1swxMq+6u0sp84wMTHDYveVRdbBvoRAsf7UsS68=; 
 b=coeefiW2Btjwkk+Y84kOk7fgGbmtV5UupC7fKfviG4+VHGr/jRZd3OUhL/FRacHr1+EFE1BYFr6mmjpPrLjUn0RLqfjVS1QzI/iAt1rYdeH2j7gzP88Hsyr3QDrj5v04APqEC58B1bx3BKYuQiHYpjtE4x/16vcbDXZ973QxQRQ=;
X-UUID: 4143fe2019a54624afb19e48f6ee5ca6-20200604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 753726284; Thu, 04 Jun 2020 01:18:07 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 02:08:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 17:08:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Jun 2020 17:08:07 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH RESEND v9 07/18] media: platform: Improve the implementation
 of the system PM ops
Date: Thu, 4 Jun 2020 17:05:42 +0800
Message-ID: <20200604090553.10861-9-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200604090553.10861-1-xia.jiang@mediatek.com>
References: <20200604090553.10861-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200604_021813_922373_48837BF3 
X-CRM114-Status: GOOD (  10.19  )
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
 senozhatsky@chromium.org, sj.huang@mediatek.com, drinkcat@chromium.org,
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
v9: use v4l2_m2m_suspend() and v4l2_m2m_resume() to improve the
    implemention of the system PM ops
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 7f74597262fc..49bdbf1c435f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -1208,10 +1208,13 @@ static __maybe_unused int mtk_jpeg_pm_resume(struct device *dev)
 static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
 {
 	int ret;
+	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
 
 	if (pm_runtime_suspended(dev))
 		return 0;
 
+	v4l2_m2m_suspend(jpeg->m2m_dev);
+
 	ret = mtk_jpeg_pm_suspend(dev);
 	return ret;
 }
@@ -1219,12 +1222,15 @@ static __maybe_unused int mtk_jpeg_suspend(struct device *dev)
 static __maybe_unused int mtk_jpeg_resume(struct device *dev)
 {
 	int ret;
+	struct mtk_jpeg_dev *jpeg = dev_get_drvdata(dev);
 
 	if (pm_runtime_suspended(dev))
 		return 0;
 
 	ret = mtk_jpeg_pm_resume(dev);
 
+	v4l2_m2m_resume(jpeg->m2m_dev);
+
 	return ret;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
