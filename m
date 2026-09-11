Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499ADC88E4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 10:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+chzdE/1S/BzIaN/qocSSODG0oKFICuJeWiAt1OqGY=; b=PpDhm0VLrdoPK/Kaq9HvIFJ3LR
	IBGoDRqYZ3i5GPuyDRDNWyR3owh8OyKwSjLpB2QVBxngCapjCrahJBPdl7ey+/UJ1eRFsg/FX1+mx
	KADok0PoKzRko0zqppQ5ceEEPy4e5W+GGupC0xhrXtGKvhFSc+S/AKMTPN+N1kbifS9mVPWbhVeOu
	kUU0hImgM6S+95jnM7GIKBAbcxqccJinwpRs2YY757Y2pf4rnTORlHwR7725YC45OKWXVu1WejPse
	voDhUmg5ffS1o9A4phYXaIW2K2+fDdOjOzF7tPYhpf0FnVjI93El2t2utsHI9bPg+jUNrHy5CG++i
	dol+jzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yii-0000000GPYc-3Op0;
	Fri, 11 Sep 2026 10:43:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4yie-0000000GPY1-2riO
	for linux-mediatek@bombadil.infradead.org;
	Fri, 11 Sep 2026 10:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=r+chzdE/1S/BzIaN/qocSSODG0oKFICuJeWiAt1OqGY=; b=etb3sFl/9bqhu8E8LTcVSW8hlt
	rcGLFZkFjst42IT8vocckt6yBU5Jrb7N2foPDNANJSkhQGK2h2BTWGG1anBqd4lxI3H3qdIyD9lOe
	E1QZwwlRHEgHjIhVQxNSjZm37+VqTeBYcqbDO0EeTL/hmfMsPMv7U6Ps9Ike6+qepRtxzP8Nd2z0y
	7RJ1ATkkuhBHVPv+2YgDvj/79mpdZuGNP4bGruMDSlqicBY+eYXtmgf1J820xoQqGtVlgyXR6ZBL0
	rSyr0AS/5QeUBi47CwjVarDI0ll+IDWar+MGByTx3rVEXaE9/P9hflYW2BdYdfFHsX3xX6vntpSJV
	XsDq69dA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4yia-00000003TxM-26dO
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 10:42:55 +0000
X-UUID: 82a84c6aadcd11f1afed4741b24580c9-20260911
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r+chzdE/1S/BzIaN/qocSSODG0oKFICuJeWiAt1OqGY=;
	b=Esfr6rOYvH7yzpKZPv1kPycCgNBjiRtuIYtpP2P0iNqr8Lr+16HyhsEG3kDARqDQCitdEdFsxqdcDcvlnoJkH1VVkcAbd2HBaYcQSHZqdtBspgYt3YuXlffU5djQjKuapd/KEMnXBt4r6X/lF+mSw8zF8splRfaO7bfjfbW34Jk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:2f6706f0-0ebf-4a30-9f98-ea14241aede3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:865964e3-ea51-4dda-a022-9ba6608a11d1,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 82a84c6aadcd11f1afed4741b24580c9-20260911
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <chris.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2037016105; Fri, 11 Sep 2026 03:42:39 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 11 Sep 2026 18:42:37 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 11 Sep 2026 18:42:37 +0800
From: Chris Lu <chris.lu@mediatek.com>
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg
	<johan.hedberg@gmail.com>, Luiz Von Dentz <luiz.dentz@gmail.com>
CC: Sean Wang <sean.wang@mediatek.com>, Will Lee <will-cy.Lee@mediatek.com>,
	SS Wu <ss.wu@mediatek.com>, linux-bluetooth
	<linux-bluetooth@vger.kernel.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Chris Lu <chris.lu@mediatek.com>
Subject: [PATCH 1/3] Bluetooth: btmtk: Route firmware debug event to the diag channel
Date: Fri, 11 Sep 2026 18:42:32 +0800
Message-ID: <20260911104234.2276126-2-chris.lu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260911104234.2276126-1-chris.lu@mediatek.com>
References: <20260911104234.2276126-1-chris.lu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_114253_337575_7CE5B34C 
X-CRM114-Status: GOOD (  11.39  )
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

MediaTek controllers may emit a firmware debug event on the ACL channel
using the reserved handle 0x0efd, which shows up in the ACL header as
0x2efd once the start fragment flag is included.

Neither btmtk_usb_recv_acl() nor btmtksdio_recv_acl() recognizes it, so
the packet is passed to the HCI core, which has no connection with that
handle and complains:

  Bluetooth: hci0: ACL packet for unknown connection handle 3837

Handle it the same way as the existing firmware debug logging packets and
forward it to the diagnostic channel instead.

Verified on MT7922: under the condition that triggers this firmware
debug event, it is now routed to the diag channel instead of reaching
the host as an unknown ACL packet.

Signed-off-by: Chris Lu <chris.lu@mediatek.com>
---
 drivers/bluetooth/btmtk.c     | 1 +
 drivers/bluetooth/btmtksdio.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index 660ed5b02841..5b0a131bc9d2 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1076,6 +1076,7 @@ int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:		/* Firmware debug logging 1 */
 	case 0x05fe:		/* Firmware debug logging 2 */
+	case 0x2efd:		/* Firmware debug event */
 		return hci_recv_diag(hdev, skb);
 	}

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index fe4ca9395aa3..9a1b6f9b0872 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -460,6 +460,7 @@ static int btmtksdio_recv_acl(struct hci_dev *hdev, struct sk_buff *skb)
 		fallthrough;
 	case 0x05ff:
 	case 0x05fe:
+	case 0x2efd:		/* Firmware debug event */
 		/* Firmware debug logging */
 		return hci_recv_diag(hdev, skb);
 	}
--
2.45.2

