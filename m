Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85D3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:30:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7957961027
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 21:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7957961027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=it6GmNuiKzkFe310lDc5Fbn/yNxxddhZTvVS34uWbPE=; b=wgdiU9fAbiVeEU
	UeV7/pCAdUKoL74OCEkn5SETxVM3F2U4tZt00Dt9g99k5DsiTzoIUyFru9/VydpQrkz4mWp9m1RZk
	+1nGsPPLlUe8BTAe/TT/MVD+Eml2x09dGmPhA1H/hTrbAIIgCk5XiMVjVP9lK4Nw5GobFEu+o+tt6
	K15L75NwSSjpz19pKL62AVlnQAdhOOXvpN8g67r8CLtbhpsL/MrFTcXmdRdG69f040wBYgAY61Bff
	qZ0dqM5XlUptde/8fIAJdMk9OSyK6TgjiutRYEH5oT5KrDsLH4+XVsJRWWptni+d8IHRZVCy33yoc
	ZRF1GcHf7Xbp5ofyZiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcaDY-00HKgS-B6; Mon, 18 Oct 2021 21:30:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcaDV-00HKdz-7a
 for linux-mediatek@lists.infradead.org; Mon, 18 Oct 2021 21:30:46 +0000
X-UUID: f156c4d5e73948eabad0fc2491edcd8c-20211018
X-UUID: f156c4d5e73948eabad0fc2491edcd8c-20211018
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 804614603; Mon, 18 Oct 2021 14:30:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 14:30:40 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 Oct 2021 05:30:39 +0800
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
 <linux-kernel@vger.kernel.org>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 04/10] Bluetooth: btmtksdio: explicitly set WHISR as
 write-1-clear
Date: Tue, 19 Oct 2021 05:30:15 +0800
Message-ID: <2c1c5888c5c42f969a116563d03599efd2b6792d.1634592181.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1634592181.git.objelf@gmail.com>
References: <cover.1634592181.git.objelf@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_143045_308233_4EFA95EF 
X-CRM114-Status: GOOD (  11.83  )
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

That is a preliminary patch to introduce mt7921s support.

Explicitly set WHISR as write-1-clear method to all devices that is
the expected behavior the driver rely on.

Co-developed-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Mark-yw Chen <mark-yw.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/bluetooth/btmtksdio.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 77d1c4ac582d..57126a95e292 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -487,8 +487,8 @@ static void btmtksdio_interrupt(struct sdio_func *func)
 static int btmtksdio_open(struct hci_dev *hdev)
 {
 	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
+	u32 status, val;
 	int err;
-	u32 status;
 
 	sdio_claim_host(bdev->func);
 
@@ -533,8 +533,13 @@ static int btmtksdio_open(struct hci_dev *hdev)
 	if (err < 0)
 		goto err_release_irq;
 
-	/* Setup write-1-clear for CHISR register */
-	sdio_writel(bdev->func, C_INT_CLR_CTRL, MTK_REG_CHCR, &err);
+	/* Explitly set write-1-clear method */
+	val = sdio_readl(bdev->func, MTK_REG_CHCR, &err);
+	if (err < 0)
+		goto err_release_irq;
+
+	val |= C_INT_CLR_CTRL;
+	sdio_writel(bdev->func, val, MTK_REG_CHCR, &err);
 	if (err < 0)
 		goto err_release_irq;
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
