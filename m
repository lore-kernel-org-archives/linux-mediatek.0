Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198EAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:26:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0B76192C
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:26:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD0B76192C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wip0hcTpmUdSyf9WGuE4QwtD2sptzb8t1OYQ5u6wH1c=; b=C36AWBJTl3vbBOs4ZVJafom5x
	/lDsEpwErFHqCebRrz6mlO4atwNIVyY9ozOJ5XY5asXufp3OuyEfeYu32kZk7tTF3vzVABvbOgewn
	OpM/ges+B8QB6YLa8MttzSuQtgUUvJ1d1l44wp/A5Bbpbjzgfom0E7FBx5VX5d6yUd8gX4mt+q2DO
	w4G3iqVE4BCH3MfxPbg76b5cVpm33R0ZEUhieMZ4tNER9UrfmemG7nb6a8F2OutmZ71BqAbTj0gYI
	0bpJXG/1i18nQuMq2l2f7JYZPSG9rHe6DfCbqlV6Svph8faHkgdEcLsAdNEW3AkR6iKrMKvMmyZ06
	n5fVULrow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOBCU-00AmPx-TO; Mon, 22 Mar 2021 03:25:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOBAr-00Alyy-4h; Mon, 22 Mar 2021 03:24:31 +0000
X-UUID: c116819262954a988140554b1215c855-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jCvODiagQU5RQrcFmwurF6qcuEIkuaTz6crPnhmimUw=; 
 b=s+o4INNBHSXZxqLrANAY4SZBlSNL9igluuyjXu/1u099Euf1d3covAPJl4Grwz0qvlMfUscINe7j96rW8NYRG/QMAMQJa221Up4jgg9Bea80kk93iajNb6l28AcJDLqY/yWr6G83iQ30mQDmT3XCSCYtgCCpzLgb1pw31+CnDZk=;
X-UUID: c116819262954a988140554b1215c855-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 467519639; Sun, 21 Mar 2021 19:24:00 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 20:13:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 11:13:57 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 11:13:56 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 05/13] usb: xhci-mtk: support quirk to disable usb2 lpm
Date: Mon, 22 Mar 2021 11:13:44 +0800
Message-ID: <1616382832-28450-5-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2CB57E9ACFCCB4B097C478130F42E0491A86FC2A697D0352FA5832B486FFF1E22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_032418_884768_C0F693D6 
X-CRM114-Status: GOOD (  12.78  )
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
 drivers/usb/host/xhci-mtk.c | 3 +++
 drivers/usb/host/xhci-mtk.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 1b9f10048fe0..09f2ddbfe8b9 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -388,6 +388,8 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	if (mtk->u2_lpm_disable)
+		xhci->quirks |= XHCI_HW_LPM_DISABLE;
 
 	/*
 	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
@@ -470,6 +472,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
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
