Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97816C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 00:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRB/tWvjFHfq8tf+Ca3HB5Ur7VgYw0KTCSxeFidZVCY=; b=B83pzflf+iOY71
	A7JWuEsvP8RXyR3elTcDtxkw5CCRYHDqjjvYic0ZB3lKPeFOpnVAlxXsx2pySEfi3SAYdPkv9Z+0K
	Dlo77O38CKdowCBWKfh4b89pJ1uOoJI/un0ZSrBBBpAs+ubxBkG5mYZRIcxTxZ8VaI6gkei4C6jFd
	nf494UaczqZ83aOspZrpqfoL+HTztMOTiKfiZtJv/BQbPgKTCKljlHHF8KiuFHz0O3R02MN1iXWBK
	Fsp8Gnbc59aHLC02d5g98noqBBbDUZEqLa+PqWGV9kMv1TK7ic1OlDyt/CTFzdEgJX87Mv4WgmcMP
	6wZ2j3K+fO9zg8nXwIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRjxw-006i64-5t; Wed, 09 Mar 2022 00:14:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRjxr-006i4A-PR
 for linux-mediatek@lists.infradead.org; Wed, 09 Mar 2022 00:14:05 +0000
X-UUID: 50fa7f51dfe94470ad2d574f80e9f22b-20220308
X-UUID: 50fa7f51dfe94470ad2d574f80e9f22b-20220308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1796743559; Tue, 08 Mar 2022 17:14:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Mar 2022 16:03:58 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Mar 2022 08:03:57 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 9 Mar 2022 08:03:57 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/3] Bluetooth: btmtkuart: add .set_bdaddr support
Date: Wed, 9 Mar 2022 08:03:53 +0800
Message-ID: <5b4c80f7c7c9731ba6c03c8b8c37c47a6d901b3b.1646783737.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
References: <f0167a9631fd0b392490311825ff0f826c054bc1.1646783737.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_161403_847960_DEC596EF 
X-CRM114-Status: UNSURE (   8.51  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

add .set_bdaddr support

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtkuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btmtkuart.c b/drivers/bluetooth/btmtkuart.c
index 136b901eb6f2..7d405a16f864 100644
--- a/drivers/bluetooth/btmtkuart.c
+++ b/drivers/bluetooth/btmtkuart.c
@@ -878,6 +878,7 @@ static int btmtkuart_probe(struct serdev_device *serdev)
 	hdev->setup    = btmtkuart_setup;
 	hdev->shutdown = btmtkuart_shutdown;
 	hdev->send     = btmtkuart_send_frame;
+	hdev->set_bdaddr = btmtk_set_bdaddr;
 	SET_HCIDEV_DEV(hdev, &serdev->dev);
 
 	hdev->manufacturer = 70;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
