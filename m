Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352D8606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dNgKNCLD;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=krKg5/lh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TSNkfDZSFX0Fhs1s5+DAx+uvvgXFKQImTTEzVGUsFSM=; b=dNgKNCLDjl1KBPeMeEF+wTP17M
	LpTKOOZ9nVfsEfAQ3hWPSjhq5cLH2Thm+PPcq9RadgdbYDk4CCuzx8BuV4TjQEiSWMYu1gKUJ55kZ
	XmxN1JPivBOoZrk7ncrEtEvPqKe7MeMonTA98Zj7zUhObX52LyliyWsm0dOJoLoXhy5MRIpN/lD+U
	7ATDzP65BC6GIj32RQnFRH2o0NzSqbCpsWyerOKp7lcOHABRZx5oREEpHW4yAl4+ZR+MhCdLXC2fS
	hx90YIJUbcxadNI0Q1jUKhIUMIT/4B7KtNWyU1IwX5D6C3wlXvRQ0DPwGAJ4zlYrdSkxyUwzg+Naj
	d5raOQqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPIM-00000008wLA-3uji;
	Thu, 12 Nov 2026 07:32:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPI8-00000008wK6-2nhW
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:32:29 +0000
X-UUID: 2ccafb34de6b11f1acbe4559397dec65-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=TSNkfDZSFX0Fhs1s5+DAx+uvvgXFKQImTTEzVGUsFSM=;
	b=krKg5/lhFtgkcQFiOYsIgV0pTFVS14fazZlp7mPiv5wDGb8QSAZX8BLDyOY+fEZD6yCutf5xmOrB3icxoD78pocOewwa4Ll0ztshXb2tia1GrmSanA+vW3S+Bw/ppaySB+UK9RIPzcmQzgmnmlTHTAJ/iignLsGdyeHWFYqlOi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ec9167c5-b014-425b-a907-0401f0f0d65d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:feeea48d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2ccafb34de6b11f1acbe4559397dec65-20261112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877659490; Thu, 12 Nov 2026 00:32:11 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:32:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:32:09 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7925: hold mt76 mutex when setting CLC on regd change
Date: Thu, 12 Nov 2026 15:32:08 +0800
Message-ID: <20261112073208.1799206-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_233216_733390_F4123B10 
X-CRM114-Status: GOOD (  10.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

When neither MT7925_REGD_SUPPORTED nor MT792x_CHIP_CAP_11D_EN is set,
mt7925_regd_change() calls mt7925_mcu_set_clc() directly. Its callers,
mt7925_scan_work() and mt7925_mac_reset_work(), do not hold
mt76.mutex, so __mt7925_mcu_set_clc() reads phy.power_type_user
(written under the mutex from debugfs) and writes phy.clc_chan_conf
without the lock, and sends MCU commands without waking the device.
A concurrent 6G power mode change from debugfs can leave the CLC
request and the 6G power tables sent to the firmware inconsistent.

Wrap the fallback mt7925_mcu_set_clc() call with
mt792x_mutex_acquire()/mt792x_mutex_release(). Neither caller holds
the mutex already.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/regd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
index fac910406aa9..3060a9d93fe1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/regd.c
@@ -564,7 +564,14 @@ int mt7925_regd_change(struct mt792x_phy *phy, char *alpha2)
 	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN) {
 		return regulatory_hint(wiphy, alpha2);
 	} else {
-		return mt7925_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR, false);
+		int ret;
+
+		/* callers (scan_work, reset_work) do not hold mt76.mutex */
+		mt792x_mutex_acquire(dev);
+		ret = mt7925_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR, false);
+		mt792x_mutex_release(dev);
+
+		return ret;
 	}
 }
 EXPORT_SYMBOL_GPL(mt7925_regd_change);
-- 
2.18.0


