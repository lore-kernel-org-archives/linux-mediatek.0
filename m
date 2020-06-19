Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0124C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 08:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF276207FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 08:06:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ih/cW9dS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VMtoT5tr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF276207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HdghnEBwQdPfz/sZByJtiUzxi5IrFIcdp49F+Z2+q5A=; b=ih/cW9dSvYoZou
	W2OZn0Mi3MxIko2Uu9tr4hxRCCSWAWkqcwcVRK0te88UFvY2n36lurShpQbQx1evQfWqpFawiBcDy
	EPBsFyaxg7O9Xjr3gsObItEfUmVIlN/rNxZ/LCBNOfIqb3h4XMuQsUI8f1mSKfi3tf0T9XJc23B3/
	badUqOjod0xmdh+HwYLcPthpb/ghvL3e3eRtBS3CBSPD6iOHcgE5GBy04tkjVg1hK0TvuZUIxCFFq
	AZno+6wY1wfX+id7AZ1KcsZGZRc04DAm4qFBC4rkA6BSeMeww6OK/V22U2Nk3JLB+KHyit5J6Xono
	xJKftDxunUHlEv1DbC/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmC2X-0000tr-6m; Fri, 19 Jun 2020 08:06:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmC2V-0000t7-Ew; Fri, 19 Jun 2020 08:06:20 +0000
X-UUID: e37bf0512ade482cb2faac0cf2ec107c-20200619
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=W1LOndusl+hI8qr6PnjPnMVG0Xt0LgOh2kjlUuxSIlM=; 
 b=VMtoT5tr4JljExfIqY2eJH5+25Btl9MG9FUYvhtEhuBgPZ8oKVoN8pR1qzbQRvwK9MxB4I1pkv6433pUgRsVpZdqWcKLSvgRWWVPuUiyM5EC9hmVEyy1oVTGcuAoMwZ8PbUYu6rV7CeNi1QI8oTSD/7a61AZLo7m0kdVysoZBDA=;
X-UUID: e37bf0512ade482cb2faac0cf2ec107c-20200619
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 900632201; Fri, 19 Jun 2020 00:06:29 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 01:06:13 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 16:05:08 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 19 Jun 2020 16:05:09 +0800
From: EastL <EastL.Lee@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 4/4] dmaengine: mediatek-cqdma: fix compatible
Date: Fri, 19 Jun 2020 16:05:02 +0800
Message-ID: <1592553902-30592-5-git-send-email-EastL.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1592553902-30592-1-git-send-email-EastL.Lee@mediatek.com>
References: <1592553902-30592-1-git-send-email-EastL.Lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 58ED8B8D4A56CF4C1ECAA6613447FE08CC9F96345E443B1B0F182794823BBC192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_010619_501981_A9DF83D6 
X-CRM114-Status: UNSURE (   8.23  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, EastL <EastL.Lee@mediatek.com>,
 dmaengine@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds common compatible & platform compatiable.

Signed-off-by: EastL <EastL.Lee@mediatek.com>
---
 drivers/dma/mediatek/mtk-cqdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index ed33c64..d701ebf 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -546,7 +546,9 @@ static void mtk_cqdma_hw_deinit(struct mtk_cqdma_device *cqdma)
 }
 
 static const struct of_device_id mtk_cqdma_match[] = {
+	{ .compatible = "mediatek,common-cqdma" },
 	{ .compatible = "mediatek,mt6765-cqdma" },
+	{ .compatible = "mediatek,mt6779-cqdma" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_cqdma_match);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
