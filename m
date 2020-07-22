Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C0BC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:00:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCAF220792
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 08:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nl+3WqNV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="B0xiaxc6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCAF220792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ux7HSGYSuiTTU7TruwY4Pkcf+eXYJ/hOOxBtfjTiz4=; b=nl+3WqNVSW/ghunB8NXJmAbfZ
	+6rrErb0n3yg3IP2tieN6nhNo4yZOgTemGiz9p0OGFaNE+MC68x/riQCxZm1lUln21BWCERZ+PHI9
	KAyf+VE4VR0ToKBeyxIR8kuJAd2XhSKrDARjQ2NZBXKnhNAlil5MluWur4a0GzXlNFRLE4QZ9VqOS
	S0uuXY9MQ8sEdnAytKThdYAUg8XDaHI4wRoXx/y55x4Rtm4jtP5RYpywp4gm1AluUCV5im3TUbwMx
	rGZqap9Xxf38BK6OyGsGqp1X6gGIGhs/m6KNhTDhrkBnkxcVfMkV02nZDwFOhNj9YoDbvvBJm8QWo
	VwG9/mHFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9fT-0006PX-Bq; Wed, 22 Jul 2020 07:59:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9fL-0006Ms-PK; Wed, 22 Jul 2020 07:59:52 +0000
X-UUID: f2b39a04c8694291a199381bc6b0150d-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qwTImn/8K9LJnphZrWhb4BjXDRmrvFi/Lz39VCoRDJc=; 
 b=B0xiaxc6mxBUfm3hNd6geXRbRag79XZcTwiKFaxtiBYE2z2AUwGkqVwj2a+Xyy/ngtY0l6of9H9FOcSO3lHDmIqRjDMTEH98ozygU0J1lVIoOmFYiy4kb2xLssz7iNho4q3oizJDnSKe4mjVpE+jZPJFg3Z+oynjx5/K9EXgWG8=;
X-UUID: f2b39a04c8694291a199381bc6b0150d-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1452322778; Tue, 21 Jul 2020 23:59:53 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 00:52:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 15:52:40 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 15:52:39 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 6/7] usb: gadget: tegra-xudc: convert to
 devm_platform_ioremap_resource_byname
Date: Wed, 22 Jul 2020 15:51:14 +0800
Message-ID: <1595404275-8449-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40B6B90EE131EFAFFE5849A03C43ADD0B35715D3D998C073E94E47EE4221B35E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_035952_029922_937137A7 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nagarjuna Kristam <nkristam@nvidia.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource_byname() to simplify code

Cc: Nagarjuna Kristam <nkristam@nvidia.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index bbe1a04..5a7c5cf 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3750,15 +3750,12 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 		return PTR_ERR(xudc->base);
 	xudc->phys_base = res->start;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "fpci");
-	xudc->fpci = devm_ioremap_resource(&pdev->dev, res);
+	xudc->fpci = devm_platform_ioremap_resource_byname(pdev, "fpci");
 	if (IS_ERR(xudc->fpci))
 		return PTR_ERR(xudc->fpci);
 
 	if (xudc->soc->has_ipfs) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   "ipfs");
-		xudc->ipfs = devm_ioremap_resource(&pdev->dev, res);
+		xudc->ipfs = devm_platform_ioremap_resource_byname(pdev, "ipfs");
 		if (IS_ERR(xudc->ipfs))
 			return PTR_ERR(xudc->ipfs);
 	}
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
