Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1553FCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FzLvhQcWZsQvjaoIgoAliOI/aIPhR/X+B9IVKKAWhVI=; b=3yGaQU6NmDQO77YZm+a3hsDNva
	wan/1Tj1E1sTRoIQohtV5m/FJAVE8M/SriDzvoEgAtlw6ew5/VnCe4WFuxNkYx0MSMjYOa4ZtoeFf
	d2U1peqNaq6vVomxs4NvnRtOPEry3JJN+eoopzJOOzzrI5F6LfA5LtprWLbOBXsWPgwJwUPYkj9V+
	VL/Ugee9eADWZgeZ7kmXs8ojVx/rieR+dkl+RN/AXRuQymWTMhXRPjXJNi9/+qA+/Qv9zzya5mwnD
	HsEqKKRRgTG38u/+j44KXh3tgo9QBZbfNoDHhz7+PmBqANg7SnWewgfmqGc4Zz/Tm1UYsmFkaRhZr
	XzYdU+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseiz-0000000GiqB-429A;
	Mon, 23 Sep 2024 08:47:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseiv-0000000GinS-3HmE
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:47:16 +0000
X-UUID: 6c0d0e94798811efba0aef63c0775dbf-20240923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FzLvhQcWZsQvjaoIgoAliOI/aIPhR/X+B9IVKKAWhVI=;
	b=gBAR75iPR01t38eeefwFVzIybCrZ01ooVXKarT+fJKRsccUPrp8+9KsWDUDnZHL86RphuwQ5/UbJaHYRLS+yDyj6Y+t0nJDIUYBu+BRbZi3GsY2UK3jDUo1lfxbSbZPckYJjELpOm1p5n+dUWHXgpIhVwpq++3sBYP4oFOxUxH8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:7a9db162-40d9-4cf0-b0a9-a855fbe74c67,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:acd31a18-b42d-49a6-94d2-a75fa0df01d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6c0d0e94798811efba0aef63c0775dbf-20240923
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 707085307; Mon, 23 Sep 2024 01:47:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Sep 2024 16:47:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Sep 2024 16:47:08 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v3 0/4] Bluetooth: btusb: Mediatek ISO interface claim/release adjustment
Date: Mon, 23 Sep 2024 16:47:01 +0800
Message-ID: <20240923084705.14123-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_014713_886999_39EC7286 
X-CRM114-Status: UNSURE (   7.96  )
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

MediaTek performs some test on the platform which can support LE audio and
ISO data transmission with kernel driver. We found the additional interface
claim and release flow issue need some adjustment.

These patches mainly add a callback function within the usb_disconnect
function to prevent a kernel panic caused by interfaces not being released
when the BT USB dongle is physically removed. Additionally, the condition
for claiming/releasing ISO usb interface have also been adjusted to make
driver works as expected.

---
v2: fix commit message typo and over maximum chars per line warning.
v3: [patch 3/4] add new function btusb_mtk_disconnect for releasing MediaTek
                ISO interface
    [patch 4/4] remove redundant condition statements
---

Chris Lu (4):
  Bluetooth: btusb: mediatek: move Bluetooth power off command position
  Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
  Bluetooth: btusb: mediatek: add intf release flow when usb disconnect
  Bluetooth: btusb: mediatek: change the conditions for ISO interface

 drivers/bluetooth/btusb.c | 41 +++++++++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 12 deletions(-)

-- 
2.18.0


