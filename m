Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC992C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 05:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mvqUev+LB1UXQZD1396CqidyMB4qHv2xJiLBDXujia0=; b=AUXGQIgjVZjI56NkO8lwgfSVDl
	usx5NMCuETn58z0We78u+kP+zN01p/lcEZGid7GZCb5Uo4D44bNEeTmjvOQviT/p/nMPgFRoqR1Kg
	cFk4LXg5YmmVBuSTL20PR7fzMKN9i5qUTAGsnooZPd/yCDbo0NXcoaH+QkNcdfKyNvXDj02EToRQE
	P/bPWnCe8U3SfqhBLDrXMNkjC1k5DBLfGxK/oRHIwdF2C1EEqKIfFna7ychKptzWoQbtyxS7ilUhK
	p0tlYgPhJxu5lQtzchYkd9+Zxi9XIOPrBU7jZGoikkMVFy21rNabotF/PtcM1dLmR14dmJvjXnryn
	rQ7QPLTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPBU-000WNT-No; Thu, 21 Jul 2022 05:57:16 +0000
Received: from mail-m973.mail.163.com ([123.126.97.3])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEPBJ-000WDs-E4; Thu, 21 Jul 2022 05:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=mvqUe
	v+LB1UXQZD1396CqidyMB4qHv2xJiLBDXujia0=; b=G/qj66sUfiy82sPKmLmpI
	28DFFtuyQjTcPWYdvEVkIEJpLPtNwDl/IpVLWCEqsJN0SiIF/XKlqVK93SgSYDMV
	/GsD4s5/mr2QVpbiQYvBMVtoc8vZ0nGlHg9apKS3VK/8LhFfMc8dhQqKaD46Te65
	eFdWhOUFPwnKwt2kWG8bPM=
Received: from localhost.localdomain (unknown [112.97.57.47])
	by smtp3 (Coremail) with SMTP id G9xpCgBnQIqh6thi2SSvQQ--.1748S2;
	Thu, 21 Jul 2022 13:56:52 +0800 (CST)
From: Slark Xiao <slark_xiao@163.com>
To: sean.wang@mediatek.com,
	vkoul@kernel.org,
	matthias.bgg@gmail.com
Cc: dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Slark Xiao <slark_xiao@163.com>
Subject: [PATCH] dmaengine: mediatek: mtk-hsdma: Fix typo 'the the' in comment
Date: Thu, 21 Jul 2022 13:56:47 +0800
Message-Id: <20220721055647.46085-1-slark_xiao@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: G9xpCgBnQIqh6thi2SSvQQ--.1748S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWUWr1rCr4rCr4ftr4ruFg_yoW3XFg_Wa
	1vqr4xW3WDtFsYyr10kF1Ykry8ta1kur1SqF1ftrWaq34rZF43Zr4vvFZ3GFs8XrZFva47
	AF90q3W8CFsxujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRGNt3UUUUUU==
X-Originating-IP: [112.97.57.47]
X-CM-SenderInfo: xvod2y5b0lt0i6rwjhhfrp/1tbiGQRFZFyPdl2hegAAsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_225705_897127_588F4120 
X-CRM114-Status: GOOD (  10.31  )
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

Replace 'the the' with 'the' in the comment.

Signed-off-by: Slark Xiao <slark_xiao@163.com>
---
 drivers/dma/mediatek/mtk-hsdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a72e5a096c5c..f7717c44b887 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -138,7 +138,7 @@ struct mtk_hsdma_vdesc {
 
 /**
  * struct mtk_hsdma_cb - This is the struct holding extra info required for RX
- *			 ring to know what relevant VD the the PD is being
+ *			 ring to know what relevant VD the PD is being
  *			 mapped to.
  * @vd:			 Pointer to the relevant VD.
  * @flag:		 Flag indicating what action should be taken when VD
-- 
2.25.1


