Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E5FC38142
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 03:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nVBXFg+lOnDLmoTtrhjNFvx9l0GF1e2zXUq38b1bO0A=; b=RAWRfadlXJC6WIOOTi6vudrWWR
	YPbNXiGDu0xx9bngDm+iJBvroIKakESmqIZ8shLrwIyF+vMCtaGdPphG1nhqA/winHjAPdLRw8P1V
	IrZi+QMQPcati7C6WivzyhwyNgaWvVmRPTU7j6MbHIm/fl0KltJD6ckSlKK1I/8nRvaYOUuj9hnb8
	5uf3qzk35WZiw5SzNjE0mWy9jbsaJ9wpJn6aSX90Zx9/KSXpprz6ZaiARP88oQSewoER7pD/4w/cG
	ksiy6vOPzHGkQb+a3iYmBv4zrzOs8WiZwXKZdarzjilCKjq9xrZu6QefEsO8brW502t4K6iYG+FjN
	/hOiY62A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pILgl-003J0N-3F; Thu, 19 Jan 2023 03:34:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pILgk-003J01-12; Thu, 19 Jan 2023 03:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nVBXFg+lOnDLmoTtrhjNFvx9l0GF1e2zXUq38b1bO0A=; b=PLgL13S5kvcK8L1v+Er4/bnr0M
	T1gMEyz0GuvVwqB1/etkjS9VmmSkUi3susaPxGXEkR/ON4o+WL/hXe79fMgZvcIHiBjZejXDJRgVa
	7K6R7T68kUDt5XoqYuILsXXFR0ADfnhJAOalh2H+jbpgKlKcCECETICHUrZMeTw7YwG1rT82Af/wH
	6yA0IXYvD+EZX+n8tuESjlnsC3rx041V4B6WnY5VGTrR/aVnKSvyBIQrM6o/b31uI4UwH8J5KEyPM
	Em0LA7G2zDUfwx8yLoIr4PMaZrtRdRVrk63rZQQs4ljdduar5VYG6JOpmYWkTsTBkDqwIQX432J8i
	WlYdlGig==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pILg9-000Agy-3A;
	Thu, 19 Jan 2023 03:33:35 +0000
X-UUID: 087afaf697aa11eda08d4d6090ec5a5c-20230118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nVBXFg+lOnDLmoTtrhjNFvx9l0GF1e2zXUq38b1bO0A=;
	b=F2y11Nlv/qGTvzpz0RsLiZVfrGSR3z3TpEjkVFz1f7rZoOPdkKPAAqC8GX78h9kd0XGHK8eiq9tXbZZLOBbCWHXaOoy0mLMtDeKMOK1RPJYX17/xWAlNjlmWJwDmm3Zc90o0lt5rJYM50lMOX5wg5H1nGHMU+A1Cp/fYMvDFEHU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:fd046f9e-b05e-4781-a87c-acc92d92b6ad,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:37223cf6-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 087afaf697aa11eda08d4d6090ec5a5c-20230118
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 323319801; Wed, 18 Jan 2023 20:33:26 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 19 Jan 2023 11:33:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 19 Jan 2023 11:33:23 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>, Min Guo
	<min.guo@mediatek.com>
Subject: [PATCH] usb: mtu3: fix the failure of qmu stop
Date: Thu, 19 Jan 2023 11:33:22 +0800
Message-ID: <20230119033322.21426-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_033332_440444_A15691D2 
X-CRM114-Status: GOOD (  15.14  )
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

This happens when do stress test of uvc stream on/off which will
enable/disable endpoints. uvc has four tx requests, and may disable
endpoint between queue tx requests as following:
    enable ep --> start qmu
    queue tx request0
    queue tx request1
    queue tx request2 --> resume qmu
    disable ep --> stop qmu may fail [1]
    queue tx request3 --> will resume qmu, may cause qmu can't work
                          when enable ep next time [2]

[1]: when the tx fifo has some data to transmit, and
    try to stop qmu (stop ep) meanwhile resume qmu (queue tx request),
    it may cause stop qmu timeout, then can be fixed by flushing fifo
    when stop qmu.
[2]: it resumes qmu again, shall stop qmu again.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Reported-by: Min Guo <min.guo@mediatek.com>
---
 drivers/usb/mtu3/mtu3_gadget.c  | 3 +--
 drivers/usb/mtu3/mtu3_hw_regs.h | 1 +
 drivers/usb/mtu3/mtu3_qmu.c     | 7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 80236e7b0895..c0264d5426bf 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -133,10 +133,9 @@ static int mtu3_ep_disable(struct mtu3_ep *mep)
 {
 	struct mtu3 *mtu = mep->mtu;
 
-	mtu3_qmu_stop(mep);
-
 	/* abort all pending requests */
 	nuke(mep, -ESHUTDOWN);
+	mtu3_qmu_stop(mep);
 	mtu3_deconfig_ep(mtu, mep);
 	mtu3_gpd_ring_free(mep);
 
diff --git a/drivers/usb/mtu3/mtu3_hw_regs.h b/drivers/usb/mtu3/mtu3_hw_regs.h
index 519a58301f45..ee30ae0a4b54 100644
--- a/drivers/usb/mtu3/mtu3_hw_regs.h
+++ b/drivers/usb/mtu3/mtu3_hw_regs.h
@@ -128,6 +128,7 @@
 #define TX_FIFOEMPTY		BIT(24)
 #define TX_SENTSTALL		BIT(22)
 #define TX_SENDSTALL		BIT(21)
+#define TX_FLUSHFIFO		BIT(20)
 #define TX_TXPKTRDY		BIT(16)
 #define TX_TXMAXPKTSZ_MSK	GENMASK(10, 0)
 #define TX_TXMAXPKTSZ(x)	((x) & TX_TXMAXPKTSZ_MSK)
diff --git a/drivers/usb/mtu3/mtu3_qmu.c b/drivers/usb/mtu3/mtu3_qmu.c
index 2ea3157ddb6e..a2fdab8b63b2 100644
--- a/drivers/usb/mtu3/mtu3_qmu.c
+++ b/drivers/usb/mtu3/mtu3_qmu.c
@@ -388,6 +388,9 @@ void mtu3_qmu_stop(struct mtu3_ep *mep)
 	}
 	mtu3_writel(mbase, qcsr, QMU_Q_STOP);
 
+	if (mep->is_in)
+		mtu3_setbits(mbase, MU3D_EP_TXCR0(epnum), TX_FLUSHFIFO);
+
 	ret = readl_poll_timeout_atomic(mbase + qcsr, value,
 			!(value & QMU_Q_ACTIVE), 1, 1000);
 	if (ret) {
@@ -395,6 +398,10 @@ void mtu3_qmu_stop(struct mtu3_ep *mep)
 		return;
 	}
 
+	/* flush fifo again to make sure the fifo is empty */
+	if (mep->is_in)
+		mtu3_setbits(mbase, MU3D_EP_TXCR0(epnum), TX_FLUSHFIFO);
+
 	dev_dbg(mtu->dev, "%s's qmu stop now!\n", mep->name);
 }
 
-- 
2.18.0


