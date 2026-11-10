Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15422606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k3XgvDQt;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=gORRkX6f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w/eXjAMoSt68fyDM2nHRizh1dd533oPQwuSg5wzA7sQ=; b=k3XgvDQttr6kOXSrVw+V6yHEg8
	HQ1twYYiVHloXfwwGq8iuB/Y29zuVohWOjO+ccPrmKSWZJoFt0g1Pp0zzeo1Noan1F8x9g2gW0jE1
	NgZn1J6NBWspyAgP7c4hBbpWjjxTUk889SnGfrGq2Yj/kXp8TbpEqnyKCvcu0Nxn5fqQyYcWd5K4K
	8y5sVP8tdiMwh5tsDoOJwaqdkhfDZiF9JY8xjw+0NfVYB4tw/3P89d52nU672u79eWVhAXm4DTTwp
	0VrcI84EPDV/zxIeS3hA55owLI2PnsI82p1BqsduhcDJbinOzdH2vhdvlLnN5CBs0O5DB4l8ysV0J
	o9JvZsyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcDC-00000002EBb-3Ok2;
	Tue, 10 Nov 2026 03:07:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQcDA-00000002EBA-47oK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 03:07:54 +0000
X-UUID: e7159bc0dcb311f1acbe4559397dec65-20261109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=w/eXjAMoSt68fyDM2nHRizh1dd533oPQwuSg5wzA7sQ=;
	b=gORRkX6f23ehHYYkQlykwmw0UDF/iQoM8sVxEGsXW9bRg0Jmf7NSgRaaOuP1hcAU4JvqvQtd3IUFdJpcMDbK30qQD0PMJ4W8UG4Rkol9KPeZuJN/Vu+gvfiHlRWUv3YvAafB71wPQW6gYjmSNWyDNnbffLYk8julMkML0UknOaE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f756a5d3-8442-43fb-8ca7-a26e21bf69d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:2f9c878d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e7159bc0dcb311f1acbe4559397dec65-20261109
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <emery.hsin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2070317695; Mon, 09 Nov 2026 20:07:45 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 11:07:43 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 11:07:43 +0800
From: Emery Hsin <emery.hsin@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <jb.tsai@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Emery Hsin <emery.hsin@mediatek.com>
Subject: [PATCH] wifi: mt76: mt792x: drop redundant MCU restart before firmware download
Date: Tue, 10 Nov 2026 11:07:37 +0800
Message-ID: <20261110030737.367177-1-emery.hsin@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_190753_041991_CB8D0669 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

Resetting the MCU state before firmware download is the legacy approach
and causes problems on MT7928. The wfsys reset at probe already leaves
the chip in a clean state, so drop the MCU restart and FW_PWR_ON poll.

Fixes: 9eef868b86db ("wifi: mt76: mt792x: ensure MCU ready before ROM patch download")
Signed-off-by: Emery Hsin <emery.hsin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_core.c b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
index 80756aa8d99d..1965e9de7099 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_core.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_core.c
@@ -1135,13 +1135,6 @@ int mt792x_load_firmware(struct mt792x_dev *dev)
 {
 	int ret;
 
-	mt76_connac_mcu_restart(&dev->mt76);
-
-	if (!mt76_poll_msec(dev, MT_CONN_ON_MISC, MT_TOP_MISC_FW_STATE,
-			    MT_TOP_MISC2_FW_PWR_ON, 1000))
-		dev_warn(dev->mt76.dev,
-			 "MCU is not ready for firmware download\n");
-
 	if (is_mt7928(&dev->mt76)) {
 		dev_info(dev->mt76.dev, "Loading CB firmware patch: %s\n",
 			 mt792x_cb_patch_name(dev));
-- 
2.45.2


