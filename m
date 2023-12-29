Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB8AC47073
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Dec 2023 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGGC5pOBDPEDthaV7kHlRmsE6IFZQlw9U1xCEMj9Inw=; b=M4ZR9STXEmnvjo6x1z91BBud1m
	wEMOYecwOWUgQKFOP91a9hQPyCkasYFUGnKtCIa/zFu8qUA+oCMeBVWtWNUkLs290wv/A6Gy+o/KP
	J5GKElKzexMj6/2VNSnuPo9s/WDIowsWYWSOCe4m+HarSNmZj9WGPDGwD7xteEiB/tMyXeKlM502/
	9JgpFvrg5gqLrv7E2m3ZKllbhJvAUa4iRZUlEqgbmz7DXRmm/fbkxb9r/jtt3EyBtQSRclMnuFE/N
	MM5YSxW10NQ6XWOeO425s81kv2VSBkBQ3DK57kQy59ud2bWnPTK7p2CBaUWj2PJORu1zqCe2giYty
	UQq36QVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ3GN-0008I5-2l;
	Fri, 29 Dec 2023 03:10:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJ3GL-0008Gb-09
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Dec 2023 03:10:18 +0000
X-UUID: c8d93e3ca5f711ee9a662f17bb45267e-20231228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IGGC5pOBDPEDthaV7kHlRmsE6IFZQlw9U1xCEMj9Inw=;
	b=MSvi+dR2to0AQAn5sE7F9oTJiX+BrJ3fuST2Z0g1sFYwFAOuZNx14FcmNdd4G+mptq7T1rMfK6D/RXD15EjWuWokFYU03FDRD/VygFIWeTwcYwIzOG5VPbviKuK9nhOqq9m1D6rgozi7pJK3/RX0KWAApauuZQJi2/vRGPpnuRc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.35,REQID:dc28b6fa-b963-4b33-8ffe-a35fd64bbdd5,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5d391d7,CLOUDID:c4ecaf8d-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c8d93e3ca5f711ee9a662f17bb45267e-20231228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 939598658; Thu, 28 Dec 2023 20:10:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 29 Dec 2023 11:09:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 29 Dec 2023 11:09:41 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Soul.Huang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Eric-SY.Chang@mediatek.com>, <km.lin@mediatek.com>,
	<robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Quan Zhou <quan.zhou@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Subject: [PATCH v2 08/10] wifi: mt76: mt7925: add flow to avoid chip bt function fail
Date: Fri, 29 Dec 2023 11:09:35 +0800
Message-ID: <20231229030937.22605-9-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231229030937.22605-1-mingyen.hsieh@mediatek.com>
References: <20231229030937.22605-1-mingyen.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.224500-8.000000
X-TMASE-MatchedRID: uyqRcNBN+ubpRzKqh62z7I4V8tCoXo/SjzwigoyOACRTCQL4BWtbpGDb
	UAcMOUZ0MbcpjNXxwebhihMBM8ipLFilxHYfa34UH5YQyOg71ZZMkOX0UoduuQqiCYa6w8tvIub
	j9bOa7Mt5lXU337u2SOWYSIzA/m69DPIzF4wRfrAURSScn+QSXt0H8LFZNFG7doMssNsUwYVpHR
	SnbupUBB1x/By+gvnhaTKhO+lvTeQvZkbHd6W91e0kc/JNjS08EgywJelLOq9HqzOtgqvuRwy2w
	bvlZJdK7IZlhIDgeCWAhOcaQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvA1Aka/KIp/p
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.224500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3BC64EDDF9AEFF503E50CBCCAFCD4DA3910AC5A0458AE190E40EA9D6CC0AFD272000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_191017_093800_295AF05B 
X-CRM114-Status: UNSURE (   9.42  )
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

From: Quan Zhou <quan.zhou@mediatek.com>

A sub-process of Wifi L0.5 reset will make chip common partition
enter low power, and have chance lead to Bluetooth host-to-chip
command timeout, modify the software flow according to the chip's
design to solve the problem.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Quan Zhou <quan.zhou@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c  | 2 ++
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
index 734f31ee40d3..7661098a02b8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/pci.c
@@ -386,6 +386,8 @@ static int mt7925_pci_probe(struct pci_dev *pdev,
 
 	dev_info(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
 
+	mt76_rmw_field(dev, MT_HW_EMI_CTL, MT_HW_EMI_CTL_SLPPROT_EN, 1);
+
 	ret = mt792x_wfsys_reset(dev);
 	if (ret)
 		goto err_free_dev;
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index a99af23e4b56..d7f9b24cd665 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -389,6 +389,9 @@
 #define MT_HW_CHIPID			0x70010200
 #define MT_HW_REV			0x70010204
 
+#define MT_HW_EMI_CTL			0x18011100
+#define MT_HW_EMI_CTL_SLPPROT_EN	BIT(1)
+
 #define MT_PCIE_MAC_BASE		0x10000
 #define MT_PCIE_MAC(ofs)		(MT_PCIE_MAC_BASE + (ofs))
 #define MT_PCIE_MAC_INT_ENABLE		MT_PCIE_MAC(0x188)
-- 
2.18.0


