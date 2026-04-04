Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1E7E88D7F
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Apr 2026 03:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LLCelElUCTB19XQkGzzpT0GMsPo+QB2ZHRYtZRjh2Es=; b=wRhIZSGjWGgOxMYwgIjGr60gft
	y5YzUtphtyCgWmN5GVQB0dNoB8NkpzA9/qh6+38TAdzGxiyYn8ldnipMfCMqtWb5ip7IKtjxwOk3+
	NnCXK66fdPd1DOr8Sn7urhfo0Oa0MQ+MXSi9BLlYWJlWIHMP/MIS5Rqp+hptRwnEYL87Ebbeg9QhS
	jhT7x73QP+aLF5Qf3YuhKjSxtJVUsmBQHfIeiVD6l5JzyWsw1PtTTT/rn4ELMUyzC6To5xSW14LWM
	guR7E4fAdPsHjI239G8R/sggvU1f48CHCKL8H8w6vd6hgTF0mKBhNZ1l1QnZ2a+MqbWEixPuzRxmB
	BeNZd2og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rwn-000000035ao-3ns4;
	Sat, 04 Apr 2026 03:45:21 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8rwk-000000035Yj-16bP
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Apr 2026 03:45:20 +0000
X-UUID: ab9c82ee2fd811f1aa26b74ffac11d73-20260404
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:ef55d49b-016d-40d0-a057-beccc8a42ac2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:47061a859de56c0b9a49db5e62739cfa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab9c82ee2fd811f1aa26b74ffac11d73-20260404
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 429297759; Sat, 04 Apr 2026 11:45:06 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	gch981213@gmail.com,
	linux-spi@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 4/4] spi: ch341: Correct vendor name
Date: Sat,  4 Apr 2026 11:45:01 +0800
Message-Id: <9d86466a5b14bdb42cdbf66ded9fbff700e86b6e.1775273351.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1775273351.git.xiaopei01@kylinos.cn>
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_204518_614405_2E0B1CD4 
X-CRM114-Status: UNSURE (   8.22  )
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

The usb2spi ch341a is manufactured by QinHeng Electronics, not QiHeng.
Update the driver description and the initial comment to reflect the
correct vendor name.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-ch341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-ch341.c b/drivers/spi/spi-ch341.c
index 3eaa8f176f63..396c17274187 100644
--- a/drivers/spi/spi-ch341.c
+++ b/drivers/spi/spi-ch341.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 //
-// QiHeng Electronics ch341a USB-to-SPI adapter driver
+// QinHeng Electronics ch341a USB-to-SPI adapter driver
 //
 // Copyright (C) 2024 Johannes Thumshirn <jth@kernel.org>
 //
@@ -250,5 +250,5 @@ static struct usb_driver ch341a_usb_driver = {
 module_usb_driver(ch341a_usb_driver);
 
 MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
-MODULE_DESCRIPTION("QiHeng Electronics ch341 USB2SPI");
+MODULE_DESCRIPTION("QinHeng Electronics ch341 USB2SPI");
 MODULE_LICENSE("GPL v2");
-- 
2.25.1


