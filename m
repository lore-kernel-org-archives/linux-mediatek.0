Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F046CE8D5E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 07:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O4TdeVTUr7HCvk3t4yV7pe/FuldFzTHqn08P93ET+3E=; b=yyI2u1dBt2tKurIl3km554wB5s
	CTdgTqRhcckeRoZuyayKiek8xGw8CmPZv44wb/rgas1UAufpWon9lkSdWLhvV9PrUveLujNPmM54r
	V9iKbJ5lTOaQbpOW48RIaeqk57yxSH6pyu88XtDV14/nRiB9KS4IAfC664ZB336NCXSoL3gYoNWCc
	9A01Kk48m8FqePiNs4Nw2kjGiDnjdfCnZUud32baSw/YrqN1kyvafcD5mItM10HdCfLD8JKzkCuBy
	Ty3v+UQSwTQ0ecfDay4PtLnrH3UxlVXnzmOitppssJtU8PqaxBLShCDiBXy3XQNwvQ1iyixaKO2dY
	ikUbToZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srC1C-00000009izD-3kCZ;
	Thu, 19 Sep 2024 07:56:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srBuz-00000009hbx-0Eco
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 07:49:39 +0000
X-UUID: b4587ea2765b11efba0aef63c0775dbf-20240919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=O4TdeVTUr7HCvk3t4yV7pe/FuldFzTHqn08P93ET+3E=;
	b=h55JzmvB48JKLJT9CQV9OZCqus8PB7KxukOmptQkVSQCNnMEkLTxOoEUoRTtbY0DFkVm9emcrxuiw45zWVSKBAEY1eOtcJC60tKqMtKuarKdD9y08OpM5vuqBlDtfX1YBYTGgVAB6OHvDBS2Rc9/ZsaANZJ/WMwdlS2tVZQm/DE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:41ba95df-2678-467a-b2e9-d616b237831a,IP:0,U
	RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:99db3a9e-8e9a-4ac1-b510-390a86b53c0a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:1,IP:nil,UR
	L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
	PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b4587ea2765b11efba0aef63c0775dbf-20240919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 186258591; Thu, 19 Sep 2024 00:49:31 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Sep 2024 15:49:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Sep 2024 15:49:27 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
	Steve Lee <steve.lee@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH v2 0/4] Bluetooth: btusb: Mediatek ISO interface claim/release adjustment
Date: Thu, 19 Sep 2024 15:49:21 +0800
Message-ID: <20240919074925.22860-1-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.751400-8.000000
X-TMASE-MatchedRID: 6FmBHFM7d0n1c76/u1t0kEj2sPWKvtn0KFFZAe4nyZ77efdnqtsaE1UR
	GqiTsOWOCPoQvKo1bz0e8agj4OvcJXnYsjCinlm9cfsdX+Y7hRMrHkgIan9a0VO5j251EiYgMH1
	xx17eFtSpB8l8zTGMcnPdr6zR5iwi+uobhwVz9gBPuMJi/ZAk8e+aBTJJYa54wA2tjhGpvsYzvr
	CMQwONiqqs7oCmmNfOgDLqnrRlXrZ8nn9tnqel2LI7zVffJqTzvWUyOoXuNL+SJhCgyxh1ZWUif
	23WVRfSzqgzstWZKO+czQmXJSxDGH7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.751400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 07C2037D0F73455F3A943E6A55D24A843399C1CAA9788BDA70181087A5A186532000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_004937_205608_0A08D802 
X-CRM114-Status: UNSURE (   8.66  )
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
---

Chris Lu (4):
  Bluetooth: btusb: mediatek: move Bluetooth power off command position
  Bluetooth: btusb: mediatek: add callback function in btusb_disconnect
  Bluetooth: btusb: mediatek: add intf release flow when usb disconnect
  Bluetooth: btusb: mediatek: change the conditions for ISO interface

 drivers/bluetooth/btusb.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

-- 
2.18.0


