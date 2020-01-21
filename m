Return-Path: <SRS0=O6hk=3K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4A1C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 10:48:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B9F622522
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2020 10:48:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t19GHSKM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NKSCsxDy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B9F622522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8QyfHqE8mrZOFriwa2q7K3FqH8qqYpOo0OI3Z0wLHis=; b=t19GHSKMg+0Quv
	4Ux/+zHQApAU49cHwZU8wfPa8Aan/fry09n9jjZNcrRyi++wHiwnclsRdl4NbDZtZN9R+KtuXT6u7
	SnlVMYQSOs1TB+8SLmHmm6/OlpWbMBsA+3CzHFOFPxPcPyjZ6uqIF+KtOXimA95CvaRuJZPnQaUAk
	b+WXre4+rSu9D/w9rd4H2zbJHHNlvObdjs+4N6pFRhCm2AMK0JF8/JNDyv9NjxjgCbC2hQuclh4Ba
	VS3TJE3KAkBmiZ1tZnDFuXpee5nQT2uxZBwD+7XRFiSMKB0DIrsXd72rGUm136VD26PItBmSHgOM0
	WQK8klM9sqzJqlrr2G2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itr5F-0006SC-GR; Tue, 21 Jan 2020 10:48:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itr52-0006JQ-Vz; Tue, 21 Jan 2020 10:48:22 +0000
X-UUID: 9576e7342f854e55aa45ea100020b9be-20200121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nrD/+39k4zqN28HCQYUHnInVNtyVGduO5k2QMQrSOxw=; 
 b=NKSCsxDy5MGyyxduMGB+olbe8/Rdjgb14wWL1dVqazsDql7+x5fRZih0udfkd/mlB3JDPqhSvBm2s8onF40uWloI9AgtFu8dXhFJcKdDCT53hymlA0Ge0CzO+J3sUdJqnso8LvAfMydueyXCStdV7bD1KYJ8kTVCBzvpTrnkGtQ=;
X-UUID: 9576e7342f854e55aa45ea100020b9be-20200121
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 311389966; Tue, 21 Jan 2020 02:48:14 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 02:48:13 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 21 Jan 2020 18:48:50 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 21 Jan 2020 18:46:44 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <Min.Guo@mediatek.com>, <Chunfeng.Yun@mediatek.com>
Subject: [PATCH] usb: musb: tusb6010: fix a possible missing data type
 replacement
Date: Tue, 21 Jan 2020 18:47:50 +0800
Message-ID: <1579603670-10970-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_024821_036446_68302106 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace "unsigned" to "u32" for checkpatch fix to tusb_writeb().

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 drivers/usb/musb/tusb6010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 5d449089e3ad..99890d1bbfcb 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -156,7 +156,7 @@ static u8 tusb_readb(void __iomem *addr, u32 offset)
 	return val;
 }
 
-static void tusb_writeb(void __iomem *addr, unsigned offset, u8 data)
+static void tusb_writeb(void __iomem *addr, u32 offset, u8 data)
 {
 	u16 tmp;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
