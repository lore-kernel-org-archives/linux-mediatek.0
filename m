Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CB6C54E55
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Mar 2024 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ex3URhGJ25sIwQtcELaXnntnV6MtlBieKBk9AFSMU4=; b=GPq5PTijYGS6deWU8/my33rzxM
	ABQnCagjkJz0qfytqfxbO5Z8w1Xty6cfX4JGUdXrWw0w5PvjjYY7t67wHy6E72y1kFdKNGhcIuMu8
	ngPrYdyYeyXGD0SocPgn5Azhnq8XafoWRr8lNPjmy3r70sP4zF8JquO2NYNpRbDBIpLvPFNcdpj7K
	kyGPofOOtanOHOdeBEFVOyv3OG/YAznBoASKi3gHgHwc3t8lB9Q7K9LaEGwMVF/AmSnu1qF03srUA
	u9/cybVcIdxWKJFM2LbgewtO7PINuGMEe5XCq0epRaP8D31yz5OitgtvBUYbzjrVCLiUFvelUDzcq
	YwYE4Kng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9co-00000009QzQ-1RhZ;
	Mon, 04 Mar 2024 14:49:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh9ci-00000009QxW-2UDk
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Mar 2024 14:49:05 +0000
X-UUID: 51040d74da3611eebd831584b064e983-20240304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2ex3URhGJ25sIwQtcELaXnntnV6MtlBieKBk9AFSMU4=;
	b=TQ0KfnnoD/09XKNFRC/lBVhXABRz9vciAjkOOyofpDekXeXThM0DIWx9fk0+oEQ718l6c6lRqZlFfMzcpb11BPi8B6qvcuC8vXkjYZX31fdgkbVuAIXyJ0/3xMa5Hu8CvqLz1vEZ+LqqC5iFPzq6uy0LwwTzRbrdB9AeJeAuw1A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:303dffbf-dfa5-4c6c-9d1e-34d297e3727a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:e76d9884-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 51040d74da3611eebd831584b064e983-20240304
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <peter.tsao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1384268154; Mon, 04 Mar 2024 07:48:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 4 Mar 2024 22:48:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 4 Mar 2024 22:48:48 +0800
From: Peter Tsao <peter.tsao@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Chris Lu <chris.lu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Tsao <peter.tsao@mediatek.com>
Subject: [PATCH] [PATCH] Bluetooth: btusb: Add support Mediatek MT7920
Date: Mon, 4 Mar 2024 22:48:44 +0800
Message-ID: <20240304144844.2042-1-peter.tsao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.048000-8.000000
X-TMASE-MatchedRID: AIneCDrHljXpHzzvfxlA9bCvlllU7Dl1jzwigoyOACR+YesuCgkiXFrN
	q+deGHNNEBd8LlX7xQH+drDB7ysG20fr6WG4Th9ah6L+ZkJhXC5CX8V1FiRRkt9RlPzeVuQQj3Q
	bFpHxze0b2iLBDKNZzdwU8VHXGipCHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWa2+sArfqKRjsrr
	DlOva601p4ExCflAw3kxMpQp+e7bKo+jfN2htJCEMMprcbiest
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.048000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3B0F0103528A15B8EFAAF9D0E9492880D9625E15880BF383EDB174C927AE17392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_064902_929556_75BB1167 
X-CRM114-Status: GOOD (  12.85  )
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

This patch is added support Mediatek MT7920
The firmware location of MT7920 will set to
/lib/firmware/mediatek/

The information in /sys/kernel/debug/usb/devices about MT7920U
Bluetooth device is listed as the below

T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#= 12 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=0e8d ProdID=7920 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Signed-off-by: Peter Tsao <peter.tsao@mediatek.com>
---
 drivers/bluetooth/btusb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index edfb49bbaa28..ba6ac853110b 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3088,7 +3088,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	int err, status;
 	u32 dev_id = 0;
 	char fw_bin_name[64];
-	u32 fw_version = 0;
+	u32 fw_version = 0, fw_flavor = 0;
 	u8 param;
 	struct btmediatek_data *mediatek;
 
@@ -3111,6 +3111,11 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			bt_dev_err(hdev, "Failed to get fw version (%d)", err);
 			return err;
 		}
+		err = btusb_mtk_id_get(data, 0x70010020, &fw_flavor);
+		if (err < 0) {
+			bt_dev_err(hdev, "Failed to get fw flavor (%d)", err);
+			return err;
+		}
 	}
 
 	mediatek = hci_get_priv(hdev);
@@ -3135,6 +3140,10 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 			snprintf(fw_bin_name, sizeof(fw_bin_name),
 				 "mediatek/mt%04x/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
 				 dev_id & 0xffff, dev_id & 0xffff, (fw_version & 0xff) + 1);
+		else if (dev_id == 0x7961 && fw_flavor)
+			snprintf(fw_bin_name, sizeof(fw_bin_name),
+				 "mediatek/BT_RAM_CODE_MT%04x_1a_%x_hdr.bin",
+				 dev_id & 0xffff, (fw_version & 0xff) + 1);
 		else
 			snprintf(fw_bin_name, sizeof(fw_bin_name),
 				 "mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-- 
2.18.0


