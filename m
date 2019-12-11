Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067D4C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 19:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD5BE21556
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 19:00:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LSCpADIB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1YmR+VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD5BE21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IuURES5lGpLP0N9a+6/66/joYQhAqcTLmkpovtLfe1w=; b=LSCpADIBa2Gv5b
	w0HIUlNU+Qh6DUaG3AnHiRfl1dFu5POBcz0yv2s7nefYXErq8LI7TjSj8cydqKBvx7T1xrvLhVAta
	ZzgrsOBoIIj2VBW80LFcjruSYP+LNoy8H9MGAn6Q/qT+5l884a3DvQP9hAMd+D9GzWVE4RkD7Uy+t
	Mjor+tqiIFgi0dJx7nI+3xaW3yvSxWxu1GJyKzNkL2owgEy/YvBdXQRbxZyLH4vy1OK7xNOW+NfMS
	HNb1bs0OLAgq8M5TirGbpQCn8C3Div4mgB995JzZk/ZgCFqVRLUO0fuysG/H30hsivavMaG7ryD7M
	rGwEvOdsK2yg1IxtqK6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if7Dd-0007XQ-UE; Wed, 11 Dec 2019 19:00:17 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if7DL-0006BD-RS; Wed, 11 Dec 2019 19:00:01 +0000
Received: from ziggy.de (unknown [37.223.145.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B1E021556;
 Wed, 11 Dec 2019 18:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576090798;
 bh=hqq+Okvmhd0TylWeXh60gyJ3vSjlTdLelZ7PE8Ug21k=;
 h=From:To:Cc:Subject:Date:From;
 b=b1YmR+VDIE7YYArcIxAzAR0HGn13WHEBHaF490Eb7/vrsXP6IW/G/PqEYwnUc+Nwm
 J5bKaUosGKX6uhBNPo7PAYKaMmvQ1xSTfliaLcS2uIshpig3f45gqEimnSWr4gj1ax
 OPXAhGspktCmVPbgjEKxDa/P5qp3jZl+z4TBRTIA=
From: matthias.bgg@kernel.org
To: bibby.hsieh@mediatek.com,
	matthias.bgg@kernel.org
Subject: [PATCH] soc: mediatek: cmdq: delete not used define
Date: Wed, 11 Dec 2019 19:59:50 +0100
Message-Id: <20191211185950.31358-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_105959_904259_F67EBB82 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Define CMDQ_EOC_CMD was actually never used. Delete it.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

 drivers/soc/mediatek/mtk-cmdq-helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 3c82de5f9417..1127c19c4e91 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -12,8 +12,6 @@
 #define CMDQ_ARG_A_WRITE_MASK	0xffff
 #define CMDQ_WRITE_ENABLE_MASK	BIT(0)
 #define CMDQ_EOC_IRQ_EN		BIT(0)
-#define CMDQ_EOC_CMD		((u64)((CMDQ_CODE_EOC << CMDQ_OP_CODE_SHIFT)) \
-				<< 32 | CMDQ_EOC_IRQ_EN)
 
 static void cmdq_client_timeout(struct timer_list *t)
 {
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
