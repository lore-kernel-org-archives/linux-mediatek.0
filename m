Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1291C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 15:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTSGIrruD1d50U9WC4l3CyafRHKZ46kIPfzmQSdphiY=; b=D88tAXailkW2bu
	Xfguiuyu6Gu9+mvupIAeZ079CHL1xJBXBtEVLaI3iLRmR6iB+zJlj+ErSwHd7A2TYzlwLrO2AHbPf
	fLwvjtp8KSZzmoP+Cm+3bdRU2+LQB1Pl0gOWZZHPoCFNITnoPRff0NUQx7R/wWfd48cb/z+l6eEUj
	IB52QBG5YQzbKtPARddJIvcJMfb6zv5er2YC2VrZGpnLd2M+T/pPlyQaJwU0muMF74srXuvMsnqS7
	Vc1WpTBt+AEReF52+IVfiauCN6OQG2zmuXFZEYJ8Dp0j77VJ96Uhi8VHDIFCP2/UqI1i/Hc6Bw7Gv
	2wZvGI58VQO/Q33prbiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8O7Z-009U3R-2o; Fri, 14 Jan 2022 15:04:05 +0000
Received: from gofer.mess.org ([2a02:8011:d000:212::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8O7T-009TyL-S7
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 15:04:01 +0000
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 8290C101C30; Fri, 14 Jan 2022 15:03:53 +0000 (UTC)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] media: mtk-cir: remove superfluous ir_raw_event_reset()
Date: Fri, 14 Jan 2022 15:03:53 +0000
Message-Id: <20220114150353.195192-2-sean@mess.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220114150353.195192-1-sean@mess.org>
References: <20220114150353.195192-1-sean@mess.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_070400_111896_14CA4A9B 
X-CRM114-Status: GOOD (  14.20  )
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

This IR receiver has two limitations:

1) Any IR pulse or space longer than 12ms will be truncated 12ms

2) Any pulses/spaces after the first 68 are lost

ir_raw_event_reset() won't help here. If the IR cannot be decoded, any
decoder should reset itself, and if it does not, this is a bug in the
decoder.

Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/mtk-cir.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/rc/mtk-cir.c b/drivers/media/rc/mtk-cir.c
index 746d43fdc17a..255f8a116b59 100644
--- a/drivers/media/rc/mtk-cir.c
+++ b/drivers/media/rc/mtk-cir.c
@@ -209,19 +209,18 @@ static irqreturn_t mtk_ir_irq(int irqno, void *dev_id)
 	struct ir_raw_event rawir = {};
 
 	/*
-	 * Reset decoder state machine explicitly is required
-	 * because 1) the longest duration for space MTK IR hardware
-	 * could record is not safely long. e.g  12ms if rx resolution
-	 * is 46us by default. There is still the risk to satisfying
-	 * every decoder to reset themselves through long enough
-	 * trailing spaces and 2) the IRQ handler guarantees that
-	 * start of IR message is always contained in and starting
-	 * from register mtk_chkdata_reg(ir, i).
+	 * Each pulse and space is encoded as a single byte, each byte
+	 * alternating between pulse and space. If a pulse or space is longer
+	 * than can be encoded in a single byte, it is encoded as the maximum
+	 * value 0xff.
+	 *
+	 * If a space is longer ok_count (about 23ms), the value is encoded
+	 * as zero, and all following values are zero. Any IR that follows
+	 * will be presented in the next interrupt.
+	 *
+	 * If there are more than 68 (=MTK_CHKDATA_SZ * 4) pulses and spaces,
+	 * then the only the first 68 will be presented; the rest is lost.
 	 */
-	ir_raw_event_reset(ir->rc);
-
-	/* First message must be pulse */
-	rawir.pulse = false;
 
 	/* Handle all pulse and space IR controller captures */
 	for (i = 0 ; i < MTK_CHKDATA_SZ ; i++) {
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
