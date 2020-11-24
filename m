Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ED4AC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:51:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CDE2073C
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 08:51:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JY9PpzaK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qpgxeS/y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CDE2073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fMc0RMBt/tvcummnu4HjzcFDnUku4jNQLpAw6A1iwNA=; b=JY9PpzaKSOj89a/pA130BcqViP
	P/HeU/wnKSI9XLST6eEeZNK+nNz2SmMr4oxxFqmzXfdUsn2B36JTUum6UZESI53qJhifMO0oeo+sO
	vMAb0HhokTMEznuF2zDS/kEqbJhj/B2+BtWQS1NMHwYJt2TXVOVRhvQaQ27qeA3v7kWEoNzqxeaRX
	nwAuttSen6Nm2Ts7S9EjBSyEy/8mP9PqdoG21u567BrbRRSD1FLwEDG+8gD8Xx8kEdZAaM1rKoZbG
	Pv4zmX2ujvbSfX3IRCVX3MGqNboDGn7VzdnA/iSnDHYAB/hclAAotgFX8nR5AzVHlxEirvpu+fpOU
	14HjjOig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khU3D-00075s-BK; Tue, 24 Nov 2020 08:51:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khU3A-00074Q-2I; Tue, 24 Nov 2020 08:51:49 +0000
X-UUID: e39d181c10144d2ba22030293f0d0884-20201124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9sIVDJBuEaAOUoPHy/lYogT86NvFz8Vb89tEUjRT4yI=; 
 b=qpgxeS/yPsIUNiyF7wHDmyhcAZPt4q+JYde7b70RHuH+0wWKU3DbR+CaPKG9KjZweOChAIcF0hPwmfukUJOsVcqVMOpDCQzCkQi4jw3iwE6qqlj3Z9GIK/qjsYTNd1Sd6f67sQAXEDmZpHz8rGYyvGkYn8ojqCWbp5lTkU1/YF8=;
X-UUID: e39d181c10144d2ba22030293f0d0884-20201124
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <min.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 40011476; Tue, 24 Nov 2020 00:51:40 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 00:50:02 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Nov 2020 16:49:58 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Nov 2020 16:49:59 +0800
From: <min.guo@mediatek.com>
To: Bin Liu <b-liu@ti.com>
Subject: [PATCH v3] usb: musb: remove unused variable 'devctl'
Date: Tue, 24 Nov 2020 16:49:55 +0800
Message-ID: <20201124084955.30270-1-min.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E15F157744AEC9989CA4857FFB6D99450DE2308CA458A37E137A2127E0005752000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_035148_872404_B530EDA1 
X-CRM114-Status: GOOD (  12.93  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, chunfeng.yun@mediatek.com,
 Alan Stern <stern@rowland.harvard.edu>, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Min Guo <min.guo@mediatek.com>

Remove unused 'devctl' variable to fix compile warnings:

    drivers/usb/musb/musbhsdma.c: In function 'dma_controller_irq':
    drivers/usb/musb/musbhsdma.c:324:8: warning: variable 'devctl' set
    but not used [-Wunused-but-set-variable]

Signed-off-by: Min Guo <min.guo@mediatek.com>
---
changes in v3
suggested by Greg Kroah-Hartman:
Add a comment.

changes in v2
suggested by Alan Stern:
Add void before musb_read to indicate that the register MUSB_DEVCTL
was intended to be read and discarded.
---
 drivers/usb/musb/musbhsdma.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/musb/musbhsdma.c b/drivers/usb/musb/musbhsdma.c
index 0aacfc8be5a1..2a345b4ad015 100644
--- a/drivers/usb/musb/musbhsdma.c
+++ b/drivers/usb/musb/musbhsdma.c
@@ -321,8 +321,6 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 				musb_channel->channel.status =
 					MUSB_DMA_STATUS_BUS_ABORT;
 			} else {
-				u8 devctl;
-
 				addr = musb_read_hsdma_addr(mbase,
 						bchannel);
 				channel->actual_len = addr
@@ -336,7 +334,11 @@ irqreturn_t dma_controller_irq(int irq, void *private_data)
 						< musb_channel->len) ?
 					"=> reconfig 0" : "=> complete");
 
-				devctl = musb_readb(mbase, MUSB_DEVCTL);
+				/*
+				 * Some hardware may need to read the
+				 * MUSB_DEVCTL register once to take effect.
+				 */
+				(void)musb_readb(mbase, MUSB_DEVCTL);
 
 				channel->status = MUSB_DMA_STATUS_FREE;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
