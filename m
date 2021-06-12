Return-Path: <SRS0=FQm5=LG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18AD5C48BE6
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:02:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C15E360724
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jun 2021 03:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C15E360724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FFxb+0fxXHhN+uogKgLmVTan5n9+NeZGEeky3SdNCYo=; b=Ewxkpg+So0XwOE
	vmp08hKTivqp96TM4x+E7tAqIvSevjxOAbLWYGbt7mPlv6J4k/SPGPp/Jx7BU5o+da14mhT+o7/0W
	5BEYLHj+KkvO/Bw/LcrOliCIk8NZDXLljB0hIW2ENTHEYZ+kf1OVy/EwpuCiz2aqSvuJVuJdjv5qp
	ZYPcTXMski2tjJ0ZN0eyYdGzNPPQO2q6mIwqLOTXj17/6iNSYJKpwYd//OBDng0o5MPIEAqZcm4CD
	QKAk4YlTvcrxG2bpniByed312V3vo2CcxXwAWc/bjQi+eMEHAmuRoHO3T1mjfdt3siD/xFFkX89ai
	3m+C8nudbYXGIrOCRWuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrtsJ-007cEv-7T; Sat, 12 Jun 2021 02:59:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrtsD-007cEW-1w
 for linux-mediatek@lists.infradead.org; Sat, 12 Jun 2021 02:59:53 +0000
X-UUID: e2797472e41e47e5933c1530b5c27ec7-20210611
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qtkMDqLfQejP0//w4jAb85I8+9hDRl1a7SumaSXLi30=; 
 b=OdqTGafNaVtRN8Dx31lPrUv+VIFSG5Co8zKZaRX7imihuqRLSH0Ip5OJn4lYuLEkLvGExvuE661nPfeEz9w4LDOWgrULeoca9/qFpffAqM5WrHAeUnqV+zZkby+cF+ZFRD9JrExUhLdH/R6WQolxBehrSqGGNJ7YYiMRsr70ZHI=;
X-UUID: e2797472e41e47e5933c1530b5c27ec7-20210611
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1399832365; Fri, 11 Jun 2021 19:59:45 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 19:59:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Jun 2021 10:59:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 12 Jun 2021 10:59:29 +0800
From: Deren Wu <Deren.Wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>, 
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>, "Eric-SY
 Chang" <Eric-SY.Chang@mediatek.com>, Deren Wu <Deren.Wu@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 <jemele@google.com>, <yenlinlai@google.com>, linux-wireless
 <linux-wireless@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH] mt76: mt7921: introduce PCIe ASPM support (L0s/L1/L1ss)
Date: Sat, 12 Jun 2021 10:59:26 +0800
Message-ID: <eb6e8c6b45f3a8a71e9cff95108aff64d560cdc0.1623465371.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_195949_827185_76E9BA7E 
X-CRM114-Status: GOOD (  10.86  )
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

From: Deren Wu <deren.wu@mediatek.com>

for better power consumption, default enable PCIe ASPM

Tested-by: Leon Yen <Leon.Yen@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7921/pci.c   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 13263f50dc00..5358836bb00e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -88,6 +88,72 @@ static void mt7921_irq_tasklet(unsigned long data)
 		napi_schedule(&dev->mt76.napi[MT_RXQ_MAIN]);
 }
 
+static void mt7921_pci_config_L1(struct pci_dev *pdev, u8 enable)
+{
+	u32 reg32;
+	int pos;
+
+	if (!pdev)
+		return;
+
+	/* capability check */
+	pos = pdev->pcie_cap;
+	pci_read_config_dword(pdev, pos + PCI_EXP_LNKCAP, &reg32);
+	if (!(reg32 & PCI_EXP_LNKCAP_ASPMS)) {
+		dev_info(&pdev->dev, "ASPM L1: Invalid cap 0x%X\n", reg32);
+		return;
+	}
+
+	/* set config */
+	pci_read_config_dword(pdev, pos + PCI_EXP_LNKCTL, &reg32);
+	if (enable)
+		reg32 |= (PCI_EXP_LNKCTL_ASPMC);
+	else
+		reg32 &= ~(PCI_EXP_LNKCTL_ASPMC);
+	dev_dbg(&pdev->dev, "%s ASPM L1\n", (enable) ? "enable" : "disable");
+
+	pci_write_config_dword(pdev, pos + PCI_EXP_LNKCTL, reg32);
+}
+
+static void mt7921_pci_config_L1ss(struct pci_dev *pdev, u8 enable)
+{
+#define  PCIE_L1SS_CAP_CHK \
+		(PCI_L1SS_CAP_ASPM_L1_1 | PCI_L1SS_CAP_ASPM_L1_2)
+#define  PCIE_L1SS_CTL_CHK \
+		(PCI_L1SS_CTL1_ASPM_L1_1 | PCI_L1SS_CTL1_ASPM_L1_2)
+
+	int pos;
+	u32 reg32;
+
+	if (!pdev)
+		return;
+
+	/* capability check */
+	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_L1SS);
+	pci_read_config_dword(pdev, pos + PCI_L1SS_CAP, &reg32);
+	if (!(reg32 & (PCIE_L1SS_CAP_CHK))) {
+		dev_info(&pdev->dev, "ASPM L1SS: Invalid cap 0x%X\n", reg32);
+		return;
+	}
+
+	/* set config */
+	pci_read_config_dword(pdev, pos + PCI_L1SS_CTL1, &reg32);
+	if (enable)
+		reg32 |= (PCIE_L1SS_CTL_CHK);
+	else
+		reg32 &= ~(PCIE_L1SS_CTL_CHK);
+
+	dev_dbg(&pdev->dev, "%s ASPM L1SS\n", (enable) ? "enable" : "disable");
+
+	pci_write_config_dword(pdev, pos + PCI_L1SS_CTL1, reg32);
+}
+
+void mt7921_pci_enable_aspm(struct pci_dev *pdev)
+{
+	mt7921_pci_config_L1ss(pdev, true);
+	mt7921_pci_config_L1(pdev, true);
+}
+
 static int mt7921_pci_probe(struct pci_dev *pdev,
 			    const struct pci_device_id *id)
 {
@@ -131,7 +197,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free_pci_vec;
 
-	mt76_pci_disable_aspm(pdev);
+	mt7921_pci_enable_aspm(pdev);
 
 	mdev = mt76_alloc_device(&pdev->dev, sizeof(*dev), &mt7921_ops,
 				 &drv_ops);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
