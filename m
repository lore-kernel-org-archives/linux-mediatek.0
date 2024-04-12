Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89BE3C00A94
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Apr 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jHEqw9CX7F4B20BaWp50RaqOd08fKHGUHPcZwH22cL8=; b=jEifNkkYlN7+98FaCbGlysKmIP
	vskp1JgeudT0qFaKyJ5ntYnfM2TnP4DyesRuFNNGtAC2rJLItKCOFgNHLOjzFnKm490TLE8HG6Q8Q
	AW5xgHL8j6Ll+C5e2C5Q+9iKK4eo8I7NyEb0wDs83Kfxvc5wxtuRcT8EzEh7njBy0IyPx+2Luwyfc
	DPvI1/NKSDP9op3d7kCMaqRJNN4F1VYRXa9zXxDYq+DT3lPlTE516qN+Cx4MwkguBknQ/cjhte6qa
	0gvUEjb5OG86694V518vgNp9KCV5RudXQ7752WaK7R9WKLBDudVBBD8nUfbQVL4qvovEiw5OzdO+8
	xo3OWxIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCWu-0000000G94H-1Vlp;
	Fri, 12 Apr 2024 08:45:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCVa-0000000G7yr-0FxM
	for linux-mediatek@bombadil.infradead.org;
	Fri, 12 Apr 2024 08:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=jHEqw9CX7F4B20BaWp50RaqOd08fKHGUHPcZwH22cL8=; b=lGm9dsz0IRmqQ+4LRPcJtxcLyY
	0ETbGTHIUSfSuqr0wTOdhkkxY3ZMZ3E7Pa/gFgCdJkkBTxM+4PAHSLaV/61SgUN5Xtt1X72AtP+ai
	KMdvJzMSRSQHtnI0qFH1U0dThj8FwKIBbdBezayX2yT0NV1vto56W6gZXB9y9BR42pKpQoAAEsbYT
	+5LkjrgXwpriyLRSyQQliTCymu7yYpHvzL1G6AV6f0I7scMVtI/Rr29VVEzapHqnW3dFDCMjaoNWh
	7xSx+ZDbyQs0q430kVAqYYkzTlx7S+qVc4zQuVOFCJsWj0TlSfacvB5e1BRtjy5BucAipCicOVuzq
	iFGiYYBA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCVV-000000093F4-0VRy
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Apr 2024 08:43:40 +0000
X-UUID: b88b4f26f8a811ee96d5dfc950b7243d-20240412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=jHEqw9CX7F4B20BaWp50RaqOd08fKHGUHPcZwH22cL8=;
	b=BMi3DoLcJ/kuscBxIPQw9KOF5egJ8YYAZ8tMNCmJrICpYwdid7AG46Dm8ECrQrdW5mVBVLBb5/ZSiOhY/DJX2fJQa7rdghzUffRE3lKB2iavtw3lBV+awPYV6kRd7NW83bTNk4vgwQQ84VR3E6CNK2ZUDLWG57E06tq1Dm9LB+g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:523a862a-1c2c-4b0a-ad2c-917d95eeb3dd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:cd92d5fa-ed05-4274-9204-014369d201e8,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b88b4f26f8a811ee96d5dfc950b7243d-20240412
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <hao.qin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 268675062; Fri, 12 Apr 2024 01:43:22 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 12 Apr 2024 16:43:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 12 Apr 2024 16:43:18 +0800
From: Hao Qin <hao.qin@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.Wu@mediatek.com>,
	Aaron Hou <aaron.hou@mediatek.com>, Chris Lu <chris.lu@mediatek.com>, "Steve
 Lee" <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Hao Qin <hao.qin@mediatek.com>
Subject: [PATCH] Bluetooth: btusb: mediatek: Add usb reset for firmware setup failure
Date: Fri, 12 Apr 2024 16:41:28 +0800
Message-ID: <20240412084128.24452-1-hao.qin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.461600-8.000000
X-TMASE-MatchedRID: k8Cd32tj8sGpk9YSiEd5IhWCVBr+Ay98DCe/LOiZlC3fUZT83lbkENPi
	u9NSfhOYea+2R4F2ox/m2sRd5hAfQvm9WstcRwZxngIgpj8eDcBpkajQR5gb3savT21DsLD/UEh
	Wy9W70AHCttcwYNipX6hYR7f40RGparKy8U17xnr71TnEQ1lbWMAvK1rVMcxdDBtPVrlqt3BWXG
	vUUmKP2w==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.461600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: DEEDB11A550F2C3488F2A62C3699A130331335E8C69700B5B9B735E150EFFC022000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_094338_176790_DCA3B2A1 
X-CRM114-Status: UNSURE (   8.82  )
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

Add usb reset to recover BT device from a firmware setup failure,
it will restore the device to its original state and attempt setup
firmware again.

Signed-off-by: Hao Qin <hao.qin@mediatek.com>
---
 drivers/bluetooth/btusb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 4c0cc13adb47..c5aab361795e 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -3160,6 +3160,9 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 						btusb_mtk_hci_wmt_sync);
 		if (err < 0) {
 			bt_dev_err(hdev, "Failed to set up firmware (%d)", err);
+			btusb_stop_traffic(data);
+			usb_kill_anchored_urbs(&data->tx_anchor);
+			usb_queue_reset_device(data->intf);
 			return err;
 		}
 
-- 
2.18.0


