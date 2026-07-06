Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBD7C43602
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 02:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aLPjFmMhfpxUPrhhsasDPypp8xXl3OnfF2sTXsA+gTA=; b=fApl56WYpGy9iFX8CBhviIrvZU
	VCRlMPa/FpPbTl5a70HaEpI9RUml3nFDWTEPs0COjjzb82+PIKy2XYNXJbWjYe3VSdLVeJ/LlNPLD
	pccMYvyZGeGAd2Tsnf+mZrCdGBo16j2lWnR2exdcWQACTq0XKtO/S65sDM06JwApz8ppo0jIK0v/t
	TmDDV9Kd+67kT3esjNA3cECJKE/kVufwm0FRu01uATS0EHvFUq4mYryQCQN1iSRbG0rhR9XteLIgA
	hhcO2bpidMzLYkDnjSSMEuaWOMUHSPP1cCQT860G/RtpAEsRxi1m8OMINGv78WRJ+dEI/3bqJ/WwM
	8VCpoVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIb-0000000BPiz-1D0F;
	Mon, 06 Jul 2026 02:43:09 +0000
Received: from [216.200.240.184] (helo=mailgw01.mediatek.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgZIZ-0000000BPiZ-0YFA
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 02:43:08 +0000
X-UUID: 692c4fca78e411f1afed4741b24580c9-20260705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aLPjFmMhfpxUPrhhsasDPypp8xXl3OnfF2sTXsA+gTA=;
	b=nwkHIaSgFOvcJbGiqnAfEs/n41bmH+C+NkvswzDRUq4Mcu272chYq6PFsauNslmfBVZbHBsYPeWKKLs4Y+lxQ6H3BfiQOOuc1kO9NuwLyRBgIi3dk3t6polS5wwF1ga2xGw0Yv1isNn30oB/+CIY9mpXxF7IFJedAOkTt12iXqQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:49762cbe-2ad2-477a-8150-a69759a656e2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:7411c914-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 692c4fca78e411f1afed4741b24580c9-20260705
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1092940536; Sun, 05 Jul 2026 19:43:03 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 6 Jul 2026 10:43:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 6 Jul 2026 10:43:01 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Leon.Yen@mediatek.com>, <litien.chang@mediatek.com>,
	<jeff.hsu@mediatek.com>, <jb.tsai@mediatek.com>, Jeff Hsu
	<Jeff.Hsu@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: Add flag to control if need DMA re-init
Date: Mon, 6 Jul 2026 10:43:00 +0800
Message-ID: <20260706024300.47789-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_194307_182524_C795F77A 
X-CRM114-Status: UNSURE (   7.12  )
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

From: Jeff Hsu <Jeff.Hsu@mediatek.com>

Add flag(skip_wpdma_reinit) to control if need do DMA re-init

Signed-off-by: Jeff Hsu <Jeff.Hsu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index a93cdc1f1c93..c5af9cd3edce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -398,6 +398,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	if (!mt7921_disable_aspm && mt76_pci_aspm_supported(pdev))
 		dev->aspm_supported = true;
 
+	/* MT7921 needs wpdma reinit */
+	dev->skip_wpdma_reinit = false;
+
 	ret = mt792xe_mcu_fw_pmctrl(dev);
 	if (ret)
 		goto err_free_dev;
-- 
2.45.2


