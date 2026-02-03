Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF76E83056
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Feb 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hjdk4iVxARg9zIQBT0R8ldlsHzy0JD+kypYvSqzMChk=; b=gqZo1vAzksa49Chfn4q4QkLPW/
	ORc7zewpdv2hnUw+m1l4aav6RWQzurRTuwMT30YNFyRO8s8f8zU7X938DM3QVGknE6Y019P7ANgE0
	hu0doL11gwMIwVi03Tw0xvRH3L+ioXF9zBxvOTvrN09+WF3bhLKKPGQHK0Lz7OgVecbBT6NNsmksG
	xD+WEtdLdpnR2A6e19d2FMOYcXPQ3kMXvUrPNaUedPD1asEjhRzrDAQqmA7pTyg5vcV7Jf9y2vwE4
	2DY4pdY1jNbNltBsbCy5oAHovhiLijic06xx42izvYJ5WyjSY33FK/k+vfFJK0/baogwsuSv8K8VK
	AOv0FZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qm-00000006BMT-1sJY;
	Tue, 03 Feb 2026 06:25:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9qk-00000006BKq-0qZ0
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Feb 2026 06:25:23 +0000
X-UUID: 19f6fe5200c911f1ad39f32c34db0b1c-20260202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Hjdk4iVxARg9zIQBT0R8ldlsHzy0JD+kypYvSqzMChk=;
	b=V+0YIWwjx84ZhY0XvIbHPXO5A3zo9zRUYYhEDWF9gOQjctWoUZWxrWOS9wINbwA8q/b5yDfeY+Pr++ukRa9D0368jbnRvBueRpag75xBVYJNmZ/0N5Kwj0AttCCLARArdmPwFOGyUcEGp8QFlGFojgvsJo7C2d7SkbX0HYtBIAI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:fa2a6d05-cf27-4632-9926-2687ec2df8a7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:89c9d04,CLOUDID:fc82867a-8c8a-4fc4-88c0-3556e7711556,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 19f6fe5200c911f1ad39f32c34db0b1c-20260202
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1465207036; Mon, 02 Feb 2026 23:25:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
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
Subject: [PATCH v1 1/3] Bluetooth: btmtk: improve mt79xx firmware setup retry flow
Date: Tue, 3 Feb 2026 14:25:08 +0800
Message-ID: <20260203062510.848761-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260203062510.848761-1-chris.lu@mediatek.com>
References: <20260203062510.848761-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_222522_264087_50B27869 
X-CRM114-Status: UNSURE (   9.80  )
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

If retries are exhausted, driver should not do futher operation.
During mt79xx firmware download process, if the retry count reaches0,
driver will return an -EIO error and release the firmware resources.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index a8c520dc09e1..b0f87b04046e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -205,6 +205,12 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 				}
 			}
 
+			/* If retry exhausted goto err_release_fw */
+			if (retry == 0) {
+				err = -EIO;
+				goto err_release_fw;
+			}
+
 			fw_ptr += section_offset;
 			wmt_params.op = BTMTK_WMT_PATCH_DWNLD;
 			wmt_params.status = NULL;
-- 
2.45.2


