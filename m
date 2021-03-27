Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA886C433C1
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 09:57:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 965B761976
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 09:57:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 965B761976
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qdUg3COSgwR7I2Berd69cpjl0KqWsjO49X8cS+Avr6g=; b=pga6S6+ffn94B6WAtxZWdKj0Fy
	34ttaIr4qvk0vknYlg8VccVsjUdmBjr18IzTJQoVnYNAoXyoJf8luS7R0fhtFEjqbSpW6lRrvFRIY
	mlA9GpgCIDbDKBf8rE8vAeBPkWP3Xrv32DIO+OUDhDztJRiUIIcTf3x56dEECazKd66WuiQMR881i
	P7b9CLqlG746iK4JH8TgotGMt95wiJnNEnGmYc2RKU3PWRTIcOnsxcsjSxYH5UFmSg+B2MbHclWF9
	tQ0u2ze6goyXkIUDEcFi9uMzc+VDCk1URgUEzBIvyiKRpjXiZutiM91Fwa/7D+w623cA/DMNJRJCx
	vxsbuJMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ5gb-004yv8-6S; Sat, 27 Mar 2021 09:56:53 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ5gR-004yty-0q; Sat, 27 Mar 2021 09:56:44 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F6vMJ4QHWz1BH6C;
 Sat, 27 Mar 2021 17:54:36 +0800 (CST)
Received: from mdc.localdomain (10.175.104.57) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 17:56:28 +0800
From: Huang Guobin <huangguobin4@huawei.com>
To: <huangguobin4@huawei.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi83@gmail.com>, Kalle Valo <kvalo@codeaurora.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Markus Elfring" <elfring@users.sourceforge.net>, "David S. Miller"
 <davem@davemloft.net>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <kernel-janitors@vger.kernel.org>
Subject: [PATCH net-next] mt76: mt7615: remove redundant dev_err call in
 mt7622_wmac_probe()
Date: Sat, 27 Mar 2021 17:56:18 +0800
Message-ID: <1616838978-6420-1-git-send-email-huangguobin4@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_095643_374320_69C8C8A9 
X-CRM114-Status: UNSURE (   8.36  )
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

From: Guobin Huang <huangguobin4@huawei.com>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Guobin Huang <huangguobin4@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/soc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
index 9aa5183c7a56..be9a69fe1b38 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/soc.c
@@ -40,10 +40,8 @@ static int mt7622_wmac_probe(struct platform_device *pdev)
 		return irq;
 
 	mem_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(mem_base)) {
-		dev_err(&pdev->dev, "Failed to get memory resource\n");
+	if (IS_ERR(mem_base))
 		return PTR_ERR(mem_base);
-	}
 
 	return mt7615_mmio_probe(&pdev->dev, mem_base, irq, mt7615e_reg_map);
 }


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
