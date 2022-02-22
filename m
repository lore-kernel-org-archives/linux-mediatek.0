Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10752C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 23:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsMFD8o9U5JH/Gk9ysIMk60TIBT/InSAbuSH5Ki9nzs=; b=VNh8RiHouIHRs6
	ilJx5slWJR3yxhKsuasX0Fh2KpkUDqPhtnAA3E7h7De61nwAtdJBJWfwd4olwRYh/QR1Oy5zVJylF
	Tw9pg8ASFnpuXBIFfeivoRFrM97GdC+vmtFlOim8NIxSTzQcMES8v35UML/k1N1jLq0Xjf0cM+yKo
	lPCxgI3nFX9O2xKb9+kGckTXe1iZ7QuUoqSKLbE97xJU+/hHWGmusacDaLLSOH67Tr6MMCOI+iOrd
	K+7Lq0/sbHR8D4lKMBe8yZKGW3isJaLrCyuFgAlh3/LrGRFxhl6MJ9XpaDOkJ9C2hCL6eN9cdq4JP
	bkmJuFOdrbM3+h8e7ipw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMf0z-00Bxye-7w; Tue, 22 Feb 2022 23:56:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMf0u-00Bxvm-Hs
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 23:56:15 +0000
X-UUID: d69fc5642b174d28875c37aeaa72107f-20220222
X-UUID: d69fc5642b174d28875c37aeaa72107f-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 467949901; Tue, 22 Feb 2022 16:56:07 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 15:56:05 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 23 Feb 2022 07:56:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Feb 2022 07:56:03 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <Mark-YW.Chen@mediatek.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>, 
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <michaelfsun@google.com>,
 <mcchou@chromium.org>, <shawnku@google.com>,
 <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Yake Yang <yake.yang@mediatek.com>
Subject: [PATCH 2/2] Bluetooth: btmtksdio: Fix kernel oops when sdio suspend.
Date: Wed, 23 Feb 2022 07:56:00 +0800
Message-ID: <939606fc0825aa17729ab9a1400f3993043fa2d3.1645573830.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <dba1c05e4bfdf53e631ff134eaa9449e2ad5deef.1645573830.git.objelf@gmail.com>
References: <dba1c05e4bfdf53e631ff134eaa9449e2ad5deef.1645573830.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_155612_618246_D793D807 
X-CRM114-Status: GOOD (  10.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yake Yang <yake.yang@mediatek.com>

Do not kfree the skb when the skb failed to send with __hci_cmd_sync

2435.241210] Call trace:
[ 2435.241224]  kfree_skb+0x20/0x140
[ 2435.241240]  btmtksdio_sdio_wakeup+0x8c/0xcc
[ 2435.241360]  hci_suspend_notifier+0x108/0x184
[ 2435.241377]  notifier_call_chain_robust+0x58/0xd8
[ 2435.241390]  blocking_notifier_call_chain_robust+0x54/0x84
[ 2435.241402]  pm_notifier_call_chain_robust+0x2c/0x4c
[ 2435.241414]  suspend_prepare+0x40/0x238
[ 2435.241425]  enter_state+0xec/0x3a8
[ 2435.241436]  pm_suspend+0x60/0xcc
[ 2435.241446]  state_store+0xb8/0x114
[ 2435.241460]  kobj_attr_store+0x18/0x2c
[ 2435.241473]  sysfs_kf_write+0x44/0x58
[ 2435.241486]  kernfs_fop_write_iter+0xf4/0x190
[ 2435.241500]  vfs_write+0x2b0/0x2e4
[ 2435.241511]  ksys_write+0x80/0xec
[ 2435.241523]  __arm64_sys_write+0x24/0x30
[ 2435.241538]  el0_svc_common+0xf0/0x1d8
[ 2435.241550]  do_el0_svc_compat+0x28/0x54
[ 2435.241564]  el0_svc_compat+0x10/0x1c
[ 2435.241574]  el0_sync_compat_handler+0xa8/0xcc
[ 2435.241586]  el0_sync_compat+0x188/0x1c0
[ 2435.241606] Code: a9014ff4 910003fd b40002c0 aa0003f3 (b84d4c08)
[ 2435.241619] ---[ end trace d496539b850baf14 ]---

Fixes: ce64b3e94919  ("Bluetooth: mt7921s: Support wake on bluetooth")
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Yake Yang <yake.yang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index cbb09e1b823d..df3f9d090529 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1226,8 +1226,8 @@ static bool btmtksdio_sdio_wakeup(struct hci_dev *hdev)
 				      &bt_awake, HCI_CMD_TIMEOUT);
 		if (IS_ERR(skb))
 			may_wakeup = false;
-
-		kfree_skb(skb);
+		else
+			kfree_skb(skb);
 	}
 
 	return may_wakeup;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
