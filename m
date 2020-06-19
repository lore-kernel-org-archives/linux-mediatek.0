Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503ACC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 17:52:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21B1121531
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 17:52:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cCnHx785";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P3vPznNb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21B1121531
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tOi7d5oXp5xz2pwvB9hbzneRs3oKCnOKH8tP+qCulY=; b=cCnHx785g2sbOg
	OPhdSY6BaRTHdw/md1B1OOmtVBOs6UwmgRO5u6dnikN4PK2BsPLSCPSVGzGzTvvSQbD3kl1CR/ZfM
	HuDV6LyjJMV7Dz949z3V5fBflB7FBxRmCsivqxGyqN+Moqx/bt6xIgkSl+SnPz2uSfxAIeT9Dq0l1
	tyZTgbsorar8BXgygRWrqpDPnM/9WZUK8ej4XLO/mbX/rrxIy5WoXJpWCkoWT2f0adi31hWSdumEb
	vb0kzCcZ/tt7Uk86vcea6SaMWzWcT+jj0qmfmxmYLtHuJoABxaR+djpG3kX0ArxqgkHEzwE5goubT
	Ao+SGRaolVd94jSIemGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmLBg-0001wD-7C; Fri, 19 Jun 2020 17:52:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmLBa-0001tr-QV
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 17:52:22 +0000
X-UUID: 7f6d8a588d24420ab7443fb62a69dd5e-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sIDH8EdAE4qcmj93nhKlzx7c6UAV1dzXbtm0oufG89w=; 
 b=P3vPznNbBFt87BddjbeK4q1uarTDy5M62LRiA60qFwjamgD6+S/0/pXdGMxxKeHEZuKtFb8AAqQ2+jC7qp6Y1sWZdOePsSSRpV3ueXiW0dPCVpDqYopHUHo5lPTbuLmWXcjd0NYTQgmEbaRgfKZY/hmtFuGp/5lKZF8Ja/Y+nqA=;
X-UUID: 7f6d8a588d24420ab7443fb62a69dd5e-20200619
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1879623861; Fri, 19 Jun 2020 09:51:43 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 10:52:10 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 20 Jun 2020 01:52:02 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 20 Jun 2020 01:52:01 +0800
From: <sean.wang@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
Subject: [PATCH v2 2/2] Bluetooth: btmtksdio: fix up firmware download sequence
Date: Sat, 20 Jun 2020 01:52:02 +0800
Message-ID: <8ed6746c7d2ce6a38eb88c78c81593c0cbd4451f.1592588740.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <7d835850c16e07d1346c763900cc8c880182f497.1592588740.git.sean.wang@mediatek.com>
References: <7d835850c16e07d1346c763900cc8c880182f497.1592588740.git.sean.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_105218_862731_F05D1C73 
X-CRM114-Status: GOOD (  11.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-bluetooth@vger.kernel.org, Mark Chen <Mark-YW.Chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Data RAM on the device have to be powered on before starting to download
the firmware.

v1->v2:
	rebased to bluetooth-next

Fixes: 9aebfd4a2200 ("Bluetooth: mediatek: add support for MediaTek MT7663S and MT7668S SDIO devices")
Co-developed-by: Mark Chen <Mark-YW.Chen@mediatek.com>
Signed-off-by: Mark Chen <Mark-YW.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 519788c442ca..11494cd2a982 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -685,7 +685,7 @@ static int mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 	const u8 *fw_ptr;
 	size_t fw_size;
 	int err, dlen;
-	u8 flag;
+	u8 flag, param;
 
 	err = request_firmware(&fw, fwname, &hdev->dev);
 	if (err < 0) {
@@ -693,6 +693,20 @@ static int mtk_setup_firmware(struct hci_dev *hdev, const char *fwname)
 		return err;
 	}
 
+	/* Power on data RAM the firmware relies on. */
+	param = 1;
+	wmt_params.op = MTK_WMT_FUNC_CTRL;
+	wmt_params.flag = 3;
+	wmt_params.dlen = sizeof(param);
+	wmt_params.data = &param;
+	wmt_params.status = NULL;
+
+	err = mtk_hci_wmt_sync(hdev, &wmt_params);
+	if (err < 0) {
+		bt_dev_err(hdev, "Failed to power on data RAM (%d)", err);
+		return err;
+	}
+
 	fw_ptr = fw->data;
 	fw_size = fw->size;
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
