Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0109FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688C961928
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 06:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 688C961928
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qXf5DR2L9dQXipYj9PB9bsydR7bXMEPJxo5vqiR7kzs=; b=Bezj9xXIQNPIW63RAQ7bJwQ/y
	DRPGUx2VNpka8e61237vFri085ML4XiaLzJgMc7Mp9jIGRIYk5z/H7YHN1FBTVSEgIX4S/gIbN+Em
	f3qly7qwoZFiyoCMGrGldtj5uFwuKG9irbqJ6ZPq3FnK/EaH6lGicf9pXrhRKHbAcABlnQdJfk5Wh
	tYk+bBISZNMjvoVT3TtgO3DJvFV3DsJPMQCdj9TlQdXRrcX1KoWEHMJ6Ub39Lnqhe5n2XwwKujuis
	YiBAaHJZEENms1Op/F5PBwlUMsO1yIbgHaobGFxVH7FF5dahFoReGE/onVtISbyfg5p0vvXG52L4x
	9aUkbnh/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR7TE-002oG7-DG; Tue, 30 Mar 2021 06:03:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR7T3-002oDJ-A0
 for linux-mediatek@lists.infradead.org; Tue, 30 Mar 2021 06:03:11 +0000
X-UUID: 89f6e6c02cd0479d85714d20f60ec514-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=b6ehJU7sLmRUzXupaRmOCK1ur0uQexcfYpSXyJmxa7s=; 
 b=ujUnSGdT/ivl177oO//vY/t6+jBUlgryUig4bmQ7MoPPwmR9utEPiooElWABG/MkDJYFN3Gl5xpf3n8nqHYC+3UurUohctMuSzUnbbwqufyMniZ8RCaOkr1CJP4EwajOaL57tTaZGxxk+or02IwazI6cgByVrDDr7FgK6Er9Cf4=;
X-UUID: 89f6e6c02cd0479d85714d20f60ec514-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1173915737; Mon, 29 Mar 2021 22:02:59 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 23:02:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Mar 2021 14:02:50 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Mar 2021 14:02:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
CC: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v3 4/4] usb: xhci-mtk: support quirk to disable usb2 lpm
Date: Tue, 30 Mar 2021 14:02:37 +0800
Message-ID: <1617084157-18652-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617084157-18652-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A6DC4B6C02585F389AC9B819CBC602F8255584451B38B091A97F71AAAA35F76F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_070309_833828_720F111F 
X-CRM114-Status: GOOD (  11.22  )
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

The xHCI driver support usb2 HW LPM by default, here add support
XHCI_HW_LPM_DISABLE quirk, then we can disable usb2 lpm when
need it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~3: no changes
---
 drivers/usb/host/xhci-mtk.c | 3 +++
 drivers/usb/host/xhci-mtk.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 4e3d53cc24f4..744639d23fa8 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -411,6 +411,8 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	if (mtk->u2_lpm_disable)
+		xhci->quirks |= XHCI_HW_LPM_DISABLE;
 
 	/*
 	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
@@ -493,6 +495,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
+	mtk->u2_lpm_disable = of_property_read_bool(node, "usb2-lpm-disable");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 621ec1a85009..4ccd08e20a15 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -149,6 +149,7 @@ struct xhci_hcd_mtk {
 	struct phy **phys;
 	int num_phys;
 	bool lpm_support;
+	bool u2_lpm_disable;
 	/* usb remote wakeup */
 	bool uwk_en;
 	struct regmap *uwk;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
