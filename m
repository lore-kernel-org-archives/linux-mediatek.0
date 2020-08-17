Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE959C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:58:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3EB20748
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2xf84Kin";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mailerdienst.de header.i=@mailerdienst.de header.b="ADVwlWEX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3EB20748
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yTFo3SfXsvpTBSUw5/iME6OBXwZ7pFx2L8B4a6ikkd8=; b=2xf84KinOCftpW6gg3vC3GZnoS
	UMvID5LGS4NAFmqQeeAVRKXZ82jSA+uiEdguot7gCJCJ1cy2GsgmMfxKcdHQ93dkopB9hIMLJrEmZ
	zlAZlyT5Sy7KhisHjwrZ31Y2ITNoc+56lkR18KuB7FF0qbyox1QqH6VBkaltln3+zho4dbInqYycv
	g6F/4RztZzLWuns+3khOZy5xnrhb+yG3cVrDIg5Gtq9yz9a+iICQ+eCJ1UwbNwi1GZtkNtVWsDw7j
	gjDXm8LE1KYBhAifb6opmt3+TKQoM9T2kT5N6TDMpXnpT4rB0KWgjoQSJV7qS9ukZQnCpEkYmD8Xp
	BcifAxpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7gaP-00025l-Sl; Mon, 17 Aug 2020 14:58:09 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gaL-00023f-SV; Mon, 17 Aug 2020 14:58:07 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id ED0345FC27;
 Mon, 17 Aug 2020 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1597676275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=JxtKGSfzAAilxUKwLtaxmOttaDPpQe5ywMco1swezzI=;
 b=ADVwlWEXLFA/o5NoLJkNMKH50lW4l8zhhbBqa6obXkkT6OkBY6qqFrw0sZiuGEWYVRghnI
 3OWFLA8qEnzT2yalBF6sGWtccH+flROqPm7T/woCEeXuvmZr5djc8d1OGZ/LMflVamSoPq
 vkF1UyjGwpFzL4B0dGOKPDPKtsdRacM=
Received: from localhost.localdomain (fttx-pool-217.61.148.252.bambit.de
 [217.61.148.252])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4ACA2100474;
 Mon, 17 Aug 2020 14:57:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] Revert "irqchip/mtk-sysirq: Convert to a platform driver"
Date: Mon, 17 Aug 2020 16:57:38 +0200
Message-Id: <20200817145738.986999-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_105806_386601_0BD07B96 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Frank Wunderlich <frank-w@public-files.de>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This reverts commit f97dbf48ca43009e8b8bcdf07f47fc9f06149b36 which
breaks bootup of arm/arm64 devices like bananapi-r2/mt7623 and
bananapi-r64/mt7622

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/irqchip/irq-mtk-sysirq.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 7299c5ab4d10..6ff98b87e5c0 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -231,6 +231,4 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	kfree(chip_data);
 	return ret;
 }
-IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
-IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
-IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)
+IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
