Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8542A606A337
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bfH7gONr;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Ykkvmp7R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y4DVgx/mGlmuhgHDZE1G28E4DY9y8m7qpC3/caUCi4s=; b=bfH7gONrrDEwFWIDR6+KLpQ7mo
	QnnswdGKbE5ZgvWYuVaoc72giWnwGuhLAGYx+Mbx3vSFB1xr/DqW3MXoncaMVDLGXwtpzXrs28C0z
	TnbEmmmNMyulUE478l1fpnz+7KRFyg5p3WSHHIc+8wj5UyLZhgqoDr/xax+l2MOy7LoS3b1MN+jWd
	pWjvbVqncBbQTJhoRgv5FHV6zZabdQKVWeL9ONrVqf6hjnJUoZQ2LFwnRKu+BHFmcHhR9XSC9d5La
	QTCvdaJL32hd41Tyw+qMePZtjKe2tcoS1MlDv9iQAwwhELMjrqYjWZ5ct0BEOl0mBy1/1zDVEvr+R
	N8AAfbdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPfQ-00000008zjS-1338;
	Thu, 12 Nov 2026 07:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPfM-00000008zhA-0vDR
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:56:19 +0000
X-UUID: 81af6240de6e11f1afed4741b24580c9-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y4DVgx/mGlmuhgHDZE1G28E4DY9y8m7qpC3/caUCi4s=;
	b=Ykkvmp7RyBzRhVAvRbX6KRMjj4pC6oSYmA0uUIJV/cS0fzy24aMnsZi/rDWF+OHJ5XPislMka7W/IHF319gXlIjMriyg0Mxouz7Y3Q3yA2cPZLmcDGhMKDP4aQQhjoep5hH6vdtyQG/+3M2/80calI1piRLjwTpXZPM6l3nNEAQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:57078c0d-950d-431f-9497-44d69847ffe6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:e011c030-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 81af6240de6e11f1afed4741b24580c9-20261112
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <michael.shih@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1185413670; Thu, 12 Nov 2026 00:56:02 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:56:00 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:56:00 +0800
From: Michael Shih <michael.shih@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<kun.wu@mediatek.com>, <deren.wu@mediatek.com>, <sean.wang@mediatek.com>,
	<quan.zhou@mediatek.com>, <ryder.lee@mediatek.com>, <leon.yen@mediatek.com>,
	<litien.chang@mediatek.com>, <jb.tsai@mediatek.com>,
	<eason.Lai@mediatek.com>, Michael Shih <michael.shih@mediatek.com>
Subject: [PATCH v5 0/2] wifi: mt76: mt7925: per-channel survey dump during scan
Date: Thu, 12 Nov 2026 15:55:55 +0800
Message-ID: <20261112075558.1813785-1-michael.shih@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260831032832.83338-1-eason.lai@mediatek.com>
References: <20260831032832.83338-1-eason.lai@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_235616_815718_A60419F5 
X-CRM114-Status: GOOD (  10.24  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series improves channel survey reporting for mt7925 so that
"iw <dev> survey dump" shows meaningful per-channel airtime.

Patch 1 adds a stats debugfs infrastructure (shared stats.c/stats.h and
the firmware MIB plumbing) that patch 2 builds on.

Patch 2 wires up two channel survey accounting paths on top of it:
 - the home/operating channel, settled from assign_vif_chanctx() since
   mt7925 is firmware/chanctx managed and never goes through
   __mt76_set_channel(); and
 - the scanned channels, folded in from the per-channel airtime carried
   by the firmware scan-done CHNLINFO event.

After the series, both the connected channel and every channel visited
during a firmware-offloaded scan report non-zero active/busy/rx/tx time.

Changes since v4:
---
v2: (1) Remove redundant code to fix build errors. 
    (2) Move UNI_CMD_MIB_DATA enum definition from 'mt76/mt76_connac_mcu.h' to
        'mt7925/stats.h' to avoid redeclartion with 'mt76/mt7996/mcu.h'
v3: (1) Remove redundant code to fix build errors. 
    (2) Move UNI_CMD_MIB_DATA enum definition from 'mt76/mt76_connac_mcu.h' to
        'mt7925/stats.h' to avoid redeclartion with 'mt76/mt7996/mcu.h'
v4: (1) Fix inconsistent indenting.
    (2) Fix array offset 'band_idx' as to before use, not after use.
v5: Adding the second patch for supporting channel survey command: "iw <dev> survey dump"
---
Michael Shih (2):
  wifi: mt76: mt7928: Add debugfs for stats to provide debug purpose
  wifi: mt76: mt7925: support per-channel survey dump during scan

 drivers/net/wireless/mediatek/mt76/mac80211.c |   3 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   2 +
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  | 173 ++++
 .../wireless/mediatek/mt76/mt7925/Makefile    |   2 +-
 .../wireless/mediatek/mt76/mt7925/debugfs.c   | 344 +++++++
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  12 +
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  30 +
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |   7 +
 .../net/wireless/mediatek/mt76/mt7925/pci.c   |   2 +-
 .../net/wireless/mediatek/mt76/mt7925/stats.c | 884 ++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7925/stats.h | 315 +++++++
 .../net/wireless/mediatek/mt76/mt7925/usb.c   |   2 +-
 drivers/net/wireless/mediatek/mt76/mt792x.h   |   6 +
 13 files changed, 1778 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.c
 create mode 100644 drivers/net/wireless/mediatek/mt76/mt7925/stats.h

-- 
2.45.2


