Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0780BE83057
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=95EAtHNCfW3joYN6/vrJZUu1+v1Xt2a63nk/beT1mfI=; b=uLvUIFvPET95Jrk2rYJegaMRuZ
	tpRjWGX6NYQI6aEEmNrsT9jE/1yZ7wa6t5x8iz2JGf97LpwnPQu5U0MbXb8HbzgS4zkes3d2nDg82
	90h4hhGrfvBmQ+X49vV6eVM9UqDJvfLFu0YgBK/SqEYBfkjb0EOVpCI34lCAYZUTjTRS9ox2KD6j4
	ZDMXmMDH/kDCukx4uUeSdK5urg9no2SAMmvAbl9O0K35v1Pfyt8/BZSolTmHhW8VyoMay5X1NqEsm
	g8R4kmR+QCWFCq7Zxw5k3PsKxh7taD9gRBAMpwDpEmymb3jW7B71WWSfJu8iZiGcP8K2FXDxbQ7Wu
	efdL7SPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qm-00000006BMj-2yKl;
	Tue, 03 Feb 2026 06:25:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qk-00000006BKd-1DId
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 06:25:23 +0000
X-UUID: 1a11b96800c911f1a16f0188aa809bee-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=95EAtHNCfW3joYN6/vrJZUu1+v1Xt2a63nk/beT1mfI=;
	b=EAosnp7y/4EPp3oyTat8GjYvpZjTuyz2XGYeChHlGAleTIJJgaYFcPZB1G10QdkemPDfNNL9SW7HKJtphriDVrT8c9+bq4niAJvbco2FLQ7oVhDwTBOylTwEGeLYXtLmuCGFTj57QYyjF9F1yWGwaMlITsL8K0PNGlJptjwIHeM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:4f705737-4be5-4613-8eda-4a7da18677a6,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:89c9d04,CLOUDID:fd82867a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1a11b96800c911f1a16f0188aa809bee-20260202
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1076779020; Mon, 02 Feb 2026 23:25:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 3 Feb 2026 14:25:12 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 3 Feb 2026 14:25:12 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
	linux-bluetooth <linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v1 2/3] Bluetooth: btmtk: add status check in mt79xx firmware setup
Date: Tue, 3 Feb 2026 14:25:09 +0800
Message-ID: <20260203062510.848761-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260203062510.848761-1-chris.lu@mediatek.com>
References: <20260203062510.848761-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222522_334229_A64778B5 
X-CRM114-Status: GOOD (  13.64  )
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

To prevent abnormal controller states, it is necessary to check
status in another part of the mt79xx firmware setup. During this
process, receiving the 'BTMTK_WMT_PATCH_PROGRESS' status is unexpected.
If this occurs, it should be treated as an error, and driver must be
prevented from continuing execution.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index b0f87b04046e..67db5a48c3e4 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -213,7 +213,6 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 
 			fw_ptr += section_offset;
 			wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
-			wmt_params.status = NULL;
 
 			while (dl_size > 0) {
 				dlen = min_t(int, 250, dl_size);
@@ -231,7 +230,14 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 				wmt_params.data = fw_ptr;
 
 				err = wmt_cmd_sync(hdev, &wmt_params);
-				if (err < 0) {
+				/* Status BTMTK_WMT_PATCH_PROGRESS indicates firmware is
+				 * in process of being downloaded, which is not expected to
+				 * occur here.
+				 */
+				if (status == BTMTK_WMT_PATCH_PROGRESS) {
+					err = -EIO;
+					goto err_release_fw;
+				} else if (err < 0) {
 					bt_dev_err(hdev, "Failed to send wmt patch dwnld (%d)",
 						   err);
 					goto err_release_fw;
-- 
2.45.2


