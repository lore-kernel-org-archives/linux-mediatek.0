Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F80C48BD1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52D3613E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 18:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52D3613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ekVGwQpijTNVNeptW1CBfeOAr41WPaW5zpJWjZoFbcc=; b=p5WrJUa3ZZnpsr
	KR3I4Dnaip/ssRMJyRjMLn/Ni0DIPyDiRoXpnphj5wv/x65xDRTpiQJYOlWT6VNPaEFss+5ZVDQyY
	SrSXGfBfR4vvhPd84DWy2YnCB7vyjd2zBgmpDxIPWEhh0VIKFQVVOEIrPPgjDvLbzzakJV9AEbqOI
	z6FOAcvyqsyrHbeW/Zqe3VKGj0Fz8pzNV0mI4n6r2vTyYTrquoKq4RXEcQHg9HcuCvSuSuM3PMcRy
	Sr1eohVuUeT6e2dJLmamZQJ7Wl6mvfQWdycRI3dZAQcXwLf4f0UJq1uqIk9Li696NiDIR6LeUDrJJ
	lwDB+KzUfLhJFpJlEtag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrPnC-002Clh-Va; Thu, 10 Jun 2021 18:52:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrPnA-002CkU-FX
 for linux-mediatek@lists.infradead.org; Thu, 10 Jun 2021 18:52:38 +0000
X-UUID: 9da643a364af4127b4342717939445e7-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=prBZ6euxoh5tODRTG9q3qN1mGoZXf/VvMX3HG6W08co=; 
 b=TeyEKf1rISQcIN2Mul64asDfKwqtqZ9TvpBE7L4VrbmfWAmMnGdp0e0L/8zd+ld5hijlZq69iTjamLssSehVFEVyB50we3P4HdbJD54XJRgxN4keohvz9TtpZ8pdb+EEIUrD1J9PiwRAesthYsxJlMitkhmAzCEIuEinxZwv5ik=;
X-UUID: 9da643a364af4127b4342717939445e7-20210610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 136974726; Thu, 10 Jun 2021 11:52:30 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 11:43:58 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 02:43:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 11 Jun 2021 02:43:51 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/4] mt76: mt7622: use devm_platform_ioremap_resource()
Date: Fri, 11 Jun 2021 02:43:44 +0800
Message-ID: <245a3745aea487793e40fbf82172c5367649bab3.1623347029.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_115236_546021_DC6F0B17 
X-CRM114-Status: UNSURE (   9.77  )
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

Simplify probing code.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
index be9a69fe1b38..ac2c27aa7701 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
@@ -31,7 +31,6 @@ int mt7622_wmac_init(struct mt7615_dev *dev)
 
 static int mt7622_wmac_probe(struct platform_device *pdev)
 {
-	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	void __iomem *mem_base;
 	int irq;
 
@@ -39,7 +38,7 @@ static int mt7622_wmac_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	mem_base = devm_ioremap_resource(&pdev->dev, res);
+	mem_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mem_base))
 		return PTR_ERR(mem_base);
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
