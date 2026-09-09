Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C630C79FAD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 12:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3sWiPK0zH7UV16WLArJdnwaVECFlFqbwrSICItQElM=; b=SXpCFyXTQEduDoDk3rTp6na1Yd
	MIMVm5Ua3bVoWsRgRDWZyd9wWjuMDEgq7s7/0NXECgprHGWduDzu0gGrDvDxhtvrGId+AT/Gd8hoD
	lS0JJDktgVB63R0XBydzibKiklJz+RAX3ImbIQNhgiZPZ4jXZzSR68ACQ+Gj2s3CfaeFMaY0gaB/B
	4VYoop8YbgLkx3YSJWeboR+TPccT2XOL0HcmOGwdm6ET+vNaBfKERfu6o9lvMrhp3faiG31Ec4ulN
	JHHSYQlkmQqCag23dCsX+E85fANVIoWT2E90PgbDtxJHGELM0rCgeLPKd5yNI+VTl6318cLrtz/A1
	aOjxcAhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gys-0000000BdNU-3gYw;
	Wed, 09 Sep 2026 12:00:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Gyq-0000000BdLf-1Vd6
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 12:00:45 +0000
X-UUID: 0c1eeceeac4611f1acbe4559397dec65-20260909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=m3sWiPK0zH7UV16WLArJdnwaVECFlFqbwrSICItQElM=;
	b=Pw5if9JhboXfr5Hb7Jt2TwJ9v7RjDW+rw75TE+ZvA4CXgigMt0fCx4kWjtiGOPe00j7v5dKeLdJ7yKtv20ktz7/LnxKhv7/jiwJ8IInJwI1gbE6pAWTVFX9CKTws4wQYvRLuHPJ2YOV7/xoCD1YwKc105fJO3ygBVzPS50H/uqE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:47158bd5-9005-4e8c-b427-a22d062d7a37,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:62a191dc-e2a3-4c41-83fa-4adacd638ae3,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0c1eeceeac4611f1acbe4559397dec65-20260909
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 999767471; Wed, 09 Sep 2026 05:00:27 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 20:00:25 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 20:00:25 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 2/3] Bluetooth: btmtk: Improve BT firmware logging
Date: Wed, 9 Sep 2026 20:00:10 +0800
Message-ID: <20260909120011.1198001-3-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260909120011.1198001-1-chris.lu@mediatek.com>
References: <20260909120011.1198001-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_050044_416595_D7AE7F5E 
X-CRM114-Status: GOOD (  13.27  )
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

The firmware log line in btmtk_setup_firmware_79xx() never says which
file was requested, which matters because btmtk_fw_get_filename() derives
the name from the device id and firmware version at runtime. It reports
the firmware's own hwver field as the HW version, when the device id the
driver read from the chip is the more useful value and is already
available as dev_id. And it prints datetime, a u8[16] with no guaranteed
NUL terminator, with %s.

Log the filename before the image is parsed, so a file that fails
validation still says which file it was, report dev_id as the HW version,
and bound datetime with %.16s.

The datetime change is hardening rather than a fix, hence no Fixes: tag:
every file in linux-firmware terminates the field, and provoking the
over-read needs a malformed file in /lib/firmware.

Log output on MT7922 after the change:

  [  365.245951] Bluetooth: hci0: Loading BT firmware: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
  [  365.245956] Bluetooth: hci0: BT HW ver: 0x7922, SW ver: 0x008a, Build Time: 20260605203811

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/bluetooth/btmtk.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 07a7a7a3656a..cf4f40349afa 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -214,6 +214,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 		return err;
 	}
 
+	bt_dev_info(hdev, "Loading BT firmware: %s", fwname);
+
 	err = btmtk_fw_validate_layout(hdev, fw, &section_num);
 	if (err < 0)
 		goto err_release_fw;
@@ -222,8 +224,8 @@ int btmtk_setup_firmware_79xx(struct hci_dev *hdev, const char *fwname,
 	fw_bin_ptr = fw_ptr;
 	hdr = (struct btmtk_patch_header *)fw_ptr;
 
-	bt_dev_info(hdev, "HW/SW Version: 0x%04x%04x, Build Time: %s",
-		    le16_to_cpu(hdr->hwver), le16_to_cpu(hdr->swver), hdr->datetime);
+	bt_dev_info(hdev, "BT HW ver: 0x%04x, SW ver: 0x%04x, Build Time: %.16s",
+		    dev_id & 0xffff, le16_to_cpu(hdr->swver), hdr->datetime);
 
 	for (i = 0; i < section_num; i++) {
 		first_block = 1;
-- 
2.45.2


