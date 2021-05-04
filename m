Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48397C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 07:11:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2583611AC
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 07:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2583611AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wSlKjC3GOP9F161ZGmhVzZ0nbIpDNAuIWI0hSBc8Ts=; b=hsaX0cBGV7OD3vATTP7usEJRLX
	IkZ69v9XneJM6BbU6hsAKW/ew2Laoy3TcFEXFtc5qKvjNYEfZ9K26R9i54v3e0tP+obv4JxbGsLd1
	XRLt61A+wifY+BUZbqxSJjRdzUhBKGddE/rPq2RfD/4KGUP9rzN8Id/nawUJkHFQjvU/Zj+Vh3txx
	eWjYI0Ei/0BblOS6hQd3oVjZrdLRpr/0/7T04oO076OrZO1ONNx0N4wnBNG3DHh3mMrv+zkgbgvRH
	t0h2WsdTfR656aqc3JsBZEUY/9fXZDMywHiN08t0u2E4vAafY9BenX0W9xP0uU1bEKZeRFHe/NMxQ
	Gc6+x24Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldpDR-00FbQf-1b; Tue, 04 May 2021 07:11:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpDO-00FbPo-Uq
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 07:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=VdGiarZXX9MUOcXne40/szuZZtfrLueUUhnRFK4ClYc=; b=cjEtAp7sCNafsziEzO0iktmvPm
 lqo+QRJ/cRQpbZiWfWVybBYqHITLKlUIl6CTCtwo3l2OG5HXTlUYDyFes0SPTig0oBAATU6r4QtX9
 fiK9V2LodbvfOqYHphlr3zbjfX2tXhqm8w7aZ7M+3ATM0vyFyzf5M22gClOOoVTaS4OgxSwWuUtVq
 0s1KiSKDi8UQSaANsVpBAis9DbDAPXS/VT6ZWQxOVLF0Yb2mCp6yL7mAg3AtY510uj4d3CYNhYVcm
 F9srUzhKSnyy/Ooe6gXKg2EeHvZqwnaJwOpz6pI9MS4wc+BGPjhC2Z5HSB6G06E1TOiKPxywRQBDN
 TxgW+5AQ==;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldpDM-003kom-0u
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 07:11:29 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FZ9tM3QQMzCqjG;
 Tue,  4 May 2021 15:08:43 +0800 (CST)
Received: from huawei.com (10.175.100.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 4 May 2021
 15:11:08 +0800
From: Tang Yizhou <tangyizhou@huawei.com>
To: <jianjun.wang@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <ryder.lee@mediatek.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <tangyizhou@huawei.com>, Hulk Robot
 <hulkci@huawei.com>
Subject: [PATCH -next] PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
Date: Tue, 4 May 2021 15:28:38 +0800
Message-ID: <20210504072838.20093-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.100.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_001128_253697_3246B4FA 
X-CRM114-Status: UNSURE (   8.53  )
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

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3c5b97716d40..f3aeb8d4eaca 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1012,6 +1012,7 @@ static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
 	{},
 };
+MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
 
 static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
-- 
2.22.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
