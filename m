Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9169C43638
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 12:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3PVKUMutfyhwALw0LBzphl2Z8HlsYxmiR2zI3GKJVo=; b=zkGBQgLt6Z+jfOb6uKXi6f15HV
	dKT/Np3kmF3uFCjgwrM/YzwPz0c4ovzSvhh7rbdtNMJlJFA16NVWNfxW16St5Ch3/cMQ+tnA9ySei
	xrSExQarAcWbNcyZ0j0k6WF4ZnKh8mCQzTcUNxylVspb5ZqaD8tO3bmTx6h2JtLHgEntelvPf/RL7
	yXjHmvjH7+Q6C6Qlo2wCX8t4u2nuvYU168RZsuuDamzi2x3PEIUUqw417x9MwCHH9GHyCYWs8IcfM
	Fn8UWVBEQuG5mX3bn+1BM5i7ZQO4Gt06ABcVt3VCD/pQi+fmI6Id9NdIBq2r+hGI09WfeoGx400x9
	f93B2N2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXh0-0000000H08u-1Wzv;
	Tue, 30 Jun 2026 12:35:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXgt-0000000H04T-0ZFB
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 12:35:53 +0000
X-UUID: 36cfafda748011f1acbe4559397dec65-20260630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=L3PVKUMutfyhwALw0LBzphl2Z8HlsYxmiR2zI3GKJVo=;
	b=ortttoi+ya6fibYoFwy1anJDK/c30zwWE1uFyMtjdH0q7umXP94t9DiYV7N9ZMBpgxrHwWY9D8DVrp0lrcor3v3VDhHeO8/wZf3TQCZ7kTwG5bL6hRrewdQxjUAqQi6vhU8mxkt4+Ws+LgjQaDSukYN3Z2VVzdlp2ECsJn74KQk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:bf6bf96a-297d-4ee1-a5f3-1d8999851896,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:b8749114-ea64-44d4-98db-4e1fb89955a3,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99|200|213,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 36cfafda748011f1acbe4559397dec65-20260630
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 388188937; Tue, 30 Jun 2026 05:35:44 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 30 Jun 2026 20:35:42 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 30 Jun 2026 20:35:42 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
	Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v6 1/3] Bluetooth: btmtk: Replace magic numbers with WMT packet flag enum
Date: Tue, 30 Jun 2026 20:35:37 +0800
Message-ID: <20260630123539.668776-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260630123539.668776-1-chris.lu@mediatek.com>
References: <20260630123539.668776-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_053552_303745_806A6956 
X-CRM114-Status: GOOD (  10.29  )
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

Add BTMTK_WMT_PKT_* enum to represent WMT download packet sequence flags,
improving code readability. Replace magic numbers (1, 2, 3) in
btmtk_setup_firmware_79xx() with descriptive enum values:

- BTMTK_WMT_PKT_START (1): First packet of a sequence
- BTMTK_WMT_PKT_CONTINUE (2): Continuation packet
- BTMTK_WMT_PKT_END (3): Final packet of a sequence

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
 drivers/bluetooth/btmtk.c | 6 +++---
 drivers/bluetooth/btmtk.h | 6 ++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 02a96342e964..21c08ee1cdbf 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -230,12 +230,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 			while (dl_size > 0) {
 				dlen = min_t(int, 250, dl_size);
 				if (first_block == 1) {
-					flag = 1;
+					flag = BTMTK_WMT_PKT_START;
 					first_block = 0;
 				} else if (dl_size - dlen <= 0) {
-					flag = 3;
+					flag = BTMTK_WMT_PKT_END;
 				} else {
-					flag = 2;
+					flag = BTMTK_WMT_PKT_CONTINUE;
 				}
 
 				wmt_params.flag = flag;
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..51c18dde0a80 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -66,6 +66,12 @@ enum {
 	BTMTK_WMT_ON_PROGRESS,
 };
 
+enum {
+	BTMTK_WMT_PKT_START = 1,
+	BTMTK_WMT_PKT_CONTINUE = 2,
+	BTMTK_WMT_PKT_END = 3,
+};
+
 struct btmtk_wmt_hdr {
 	u8	dir;
 	u8	op;
-- 
2.45.2


