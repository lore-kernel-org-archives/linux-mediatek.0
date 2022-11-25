Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761FFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 02:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TGvrOC7mZxFPNDWdJ6v/0FaTOe0ceJN2iCS/JV3YD0Y=; b=hDVqf8BqaVztClMG1h/82IRoJ1
	lZj14gGYYQKzz1nI2zUgPGnm+uOvaX4IxB6rTcMmIhIyH+OxpSe9BFP2y+lKfZTnO0LikkGiE7ZpT
	gClVAZ5UZj1WwipamhLMEJ7ACr0SVrqZZmexAFWkqUJuE53q5GZ5Vxee1VqkqRXUIeY++TJwvpJk5
	4evDut0oFPS+CXdWL4v8bXzPxAGadUpStQyIm7CIKZ3GQVV32bwXcoJMJKi9L6TDpFOr5dIZ/BO1C
	MvVvRCf9RiUE1Ngce95L5oSe+jHi/YtMx/w9jLpp1pggRR0wzo+bUBclmWFAXDUNyLxdNlUbawX4c
	KcqMSjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyOeG-00CGJE-Sn; Fri, 25 Nov 2022 02:41:04 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyOe5-00CGG3-Ev; Fri, 25 Nov 2022 02:40:55 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NJJtJ2LyjzJnsp;
	Fri, 25 Nov 2022 10:37:28 +0800 (CST)
Received: from dggpemm500002.china.huawei.com (7.185.36.229) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 10:40:46 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500002.china.huawei.com (7.185.36.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 25 Nov 2022 10:40:45 +0800
From: Xiongfeng Wang <wangxiongfeng2@huawei.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>, <ryder.lee@mediatek.com>,
	<shayne.chen@mediatek.com>, <sean.wang@mediatek.com>, <kvalo@kernel.org>,
	<davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <matthias.bgg@gmail.com>, <sujuan.chen@mediatek.com>,
	<Bo.Jiao@mediatek.com>
CC: <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<yangyingliang@huawei.com>, <wangxiongfeng2@huawei.com>
Subject: [PATCH] mt76: mt7915: Fix PCI device refcount leak in mt7915_pci_init_hif2()
Date: Fri, 25 Nov 2022 10:58:31 +0800
Message-ID: <20221125025831.177595-1-wangxiongfeng2@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500002.china.huawei.com (7.185.36.229)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_184053_708142_5B5ED497 
X-CRM114-Status: UNSURE (   9.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As comment of pci_get_device() says, it returns a pci_device with its
refcount increased. We need to call pci_dev_put() to decrease the
refcount. Save the return value of pci_get_device() and call
pci_dev_put() to decrease the refcount.

Fixes: 9093cfff72e3 ("mt76: mt7915: add support for using a secondary PCIe link for gen1")
Fixes: 2e30db0dde61 ("mt76: mt7915: add device id for mt7916")
Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/pci.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
index 728a879c3b00..3808ce1647d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/pci.c
@@ -65,10 +65,17 @@ static void mt7915_put_hif2(struct mt7915_hif *hif)
 
 static struct mt7915_hif *mt7915_pci_init_hif2(struct pci_dev *pdev)
 {
+	struct pci_dev *tmp_pdev;
+
 	hif_idx++;
-	if (!pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7916, NULL) &&
-	    !pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x790a, NULL))
-		return NULL;
+
+	tmp_pdev = pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x7916, NULL);
+	if (!tmp_pdev) {
+		tmp_pdev = pci_get_device(PCI_VENDOR_ID_MEDIATEK, 0x790a, NULL);
+		if (!tmp_pdev)
+			return NULL;
+	}
+	pci_dev_put(tmp_pdev);
 
 	writel(hif_idx | MT_PCIE_RECOG_ID_SEM,
 	       pcim_iomap_table(pdev)[0] + MT_PCIE_RECOG_ID);
-- 
2.20.1


