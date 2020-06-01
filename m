Return-Path: <SRS0=JxEE=7O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC88C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 10:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCA9120772
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2020 10:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIZyNbgg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MS6FVG0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCA9120772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pw0xPtYLOAJMqfGmNG9RCs3pF6XfnrZ9eYMnizzeCZc=; b=RIZyNbgg0sVGuj
	2wHkTOnkliM2wdAnLmdr++x+Zl1XEsd/+CT9zacBMhHPw92K41OmEczsxAy518M+rj9m0dn6iQoKd
	b9IZmcEnPKIM5sGCJ47BSD46kw/fzFE/eOOFhJjEZ+Uk3RI3ioRIeUxOtTSDMKqBsKTSKUu9C0nt3
	bcD3c1BYZEfOH0gJy15aYNMXhMfVqyF3l8kPFF5WbM3G0lCmrtwb7A3/hghwibKwmlw6FEfD3X7ok
	We0PS6SdzSwzKrwz9t9AQrsg2RssjWGwsWR5cNNEvo8SYl7zOYYEn3T+RG1Qh+UW6c/K/1yn++8Tl
	dj6/MQxtxcXb3wu2nRnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfhy7-0008Qn-V8; Mon, 01 Jun 2020 10:46:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfhy1-0008Ja-9x; Mon, 01 Jun 2020 10:46:54 +0000
X-UUID: 33c10c9899ea461b8e12452b15f3cd83-20200601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HC7R/RfYWhRRX5sUAj43TCGykJv8IzBjx5dQ0drVC1Y=; 
 b=MS6FVG0CJMlklXSkKrq2E05G3ez5TpsEAyO679RfNqQGsAwokG/E82vZhBK3xwx0aKapkgVKvmXcU6SENIRmCKz+eM7RPg7sCapjhLlQJAb1ZI2Lk7DvoqGwonUEc+czAQyd3Xj4/BcWIV4qsQkiftTrIsjPtOd0dpVzQnG5qLs=;
X-UUID: 33c10c9899ea461b8e12452b15f3cd83-20200601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2071583030; Mon, 01 Jun 2020 02:46:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 03:46:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Jun 2020 18:46:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 1 Jun 2020 18:46:46 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 5/5] scsi: ufs-mediatek: Allow unbound mphy
Date: Mon, 1 Jun 2020 18:46:46 +0800
Message-ID: <20200601104646.15436-6-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200601104646.15436-1-stanley.chu@mediatek.com>
References: <20200601104646.15436-1-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_034653_482918_6534DD9D 
X-CRM114-Status: UNSURE (   7.62  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, cc.chou@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allow unbound MPHY module since not every MediaTek UFS platform
needs specific MPHY control.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/scsi/ufs/ufs-mediatek.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/scsi/ufs/ufs-mediatek.c b/drivers/scsi/ufs/ufs-mediatek.c
index 1cc7bea1468b..9a4432c9f7dc 100644
--- a/drivers/scsi/ufs/ufs-mediatek.c
+++ b/drivers/scsi/ufs/ufs-mediatek.c
@@ -113,6 +113,12 @@ static int ufs_mtk_bind_mphy(struct ufs_hba *hba)
 
 	if (err)
 		host->mphy = NULL;
+	/*
+	 * Allow unbound mphy because not every platform needs specific
+	 * mphy control.
+	 */
+	if (err == -ENODEV)
+		err = 0;
 
 	return err;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
