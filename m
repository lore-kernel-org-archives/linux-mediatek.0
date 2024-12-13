Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDEAE77180
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 09:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LrfMJ3h3u1jnLMa7N2XZu8l1yWiNNUJSdAbw5NA1lr0=; b=31y4f53JV6m9Q0Ww9vYm8U2UOJ
	w8y0NkK4GkudemZqT/SrLK/+ZwVwe9HozUPc1+bCygX/ObLurzDW9DAxnwZ5qU4q4lGOYgYDYCe0i
	rm3PxWqOeuXSNO9AFKhhctfqLj9dmakBRTV6IQzTOD9iRrhZLPEOfkLA15Gl1U0DSMjnHXcArgafZ
	wtMp2ZDMV2zBOJWWi5fTlwsoegely7M98arq4ptDpX8nU/yVY8umcbgSmAmnfqqR2XlfglQOWkEp9
	xgPwDm3y4i2/nX9FfEpmB9naoSTZajDWlXT/GXWoF3PJYhNQPlKkw7YZ5QoIAJV/ydUJWdc/7VwnZ
	BeonOT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Ay-00000003IHW-3l4x;
	Fri, 13 Dec 2024 09:41:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2Aw-00000003IGd-3CHr
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 09:41:35 +0000
X-UUID: 6d3a366eb93611ef9048ed6ed365623b-20241213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=LrfMJ3h3u1jnLMa7N2XZu8l1yWiNNUJSdAbw5NA1lr0=;
	b=ProEbuOsj8K154YQtZb9p2clWWXNhER+iRpQX4XuPB8Ak8X+Ec7lJ/dkhcLt5D/slJ7O1H+UP1hEfxV0uvGWaQFrFS2VD6lzknVWlM9vuWPMSi7gkQKPvJZ0BFxj3UEKXgz07KLSi1/D7vJu3n2al+7IANptlUDHWBwt+HmKDs4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:408d109b-9516-4423-b92b-24dcaa0f7afe,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:b773eb3b-e809-4df3-83cd-88f012b9e9ba,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 6d3a366eb93611ef9048ed6ed365623b-20241213
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 355151387; Fri, 13 Dec 2024 02:41:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 13 Dec 2024 17:41:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 13 Dec 2024 17:41:22 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Hao Qin <hao.qin@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH] Bluetooth: btmtk: add quirk to support HCI_QUIRK_SIMULTANEOUS_DISCOVERY
Date: Fri, 13 Dec 2024 17:41:18 +0800
Message-ID: <20241213094118.23647-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--1.642100-8.000000
X-TMASE-MatchedRID: tiRXYRqWr+tocr5vRHCIaibMb0f5D0uqTJDl9FKHbrmtwWMX5hmdv6PF
	jJEFr+olKE0Je8DR/D4NXwNUB3oA790H8LFZNFG7MGpgBNI6BaPvMA9WW7X2a/mHADpWjR4Nxll
	YNXARfpWxz8p0BoLSI+B+R4NVzQv5shljvamtnvY1mT6tqJoFqKL8uYddyDmU+IfoVuvrGMeAhO
	caQrQ0U1GyRcoeF18qmKP0zzpTAeGwod8xOMKmvMCBO+zxAW5pftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.642100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: CEC39923689531D895F816C4BA509C57F9BD1D15EBDF4B59EB11286153AEA5682000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_014134_802874_E44EB805 
X-CRM114-Status: UNSURE (   7.01  )
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

Add quirk to support HCI_QUIRK_SIMULTANEOUS_DISCOVERY feature for MT79xx
series chipset.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 8a3f7c3fcfec..562d6ecf0b71 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1367,6 +1367,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
 			return err;
 		}
 
+		/* Apply common HCI quirks for MediaTek chipset */
+		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
+
 		hci_set_msft_opcode(hdev, 0xFD30);
 		hci_set_aosp_capable(hdev);
 
-- 
2.18.0


