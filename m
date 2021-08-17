Return-Path: <SRS0=tEpm=NI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9358AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:38:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B9A360FBF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Aug 2021 08:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B9A360FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMqPt1IlFeIfnDwwLiyHjn4Vp45z7UFKn/YgGFut23Q=; b=OYD4fqWnaeG13U
	JGY5jVLGFFO/eD6VhgvnGbxRRKMp/x5Ej7jOo9dWfNmhnR1dr3S+dNfPbW5TjouK3vecxodHdQ1i5
	cU1McxptNioEPgLILp41CksmFBG+Fg4mDReqjiAGPib9XT9wwnor5gPzCWdJd1HP+H9kygJtQ1Xcd
	yZFAMliQrepTpCOKIyr224dkyRWLDesWyZEkOjNFla4EnOXIn2fNkn0mrZlLUZ+ajqsmNcDpLWmec
	Q9UvAWqcVf04K7mqL9EqcHcNw1WiL0FePdabLqd/pG8ahOnkT+ARU48iqwHuyCdiBuWh3ehnZL4hK
	xQBSIE15OsClv4dIMCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFucO-001eW6-3C; Tue, 17 Aug 2021 08:38:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFuai-001dbg-T8; Tue, 17 Aug 2021 08:37:02 +0000
X-UUID: fbf2302b69d04b9f9be623732fa1083b-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XR3dt9TEmdfEa7L1xMgu6F2s/uc36M02eLCu7kE+T2I=; 
 b=e8+dtfUkJ8bVFzOHIGFabjBZ9RFCghBF1J3TqMQ5YNkMpBDQ7Uuw96J5aulSwlz5ntkFgkYV0YjDhdHUTAVPpsTYr8ixzw1qdTf0Lhsmq1aQMepPBKNobWBQMwVWYuJwNDC5j05diKAcgrBiybcOr+4t1nCC8NcOF7VdQsktqSc=;
X-UUID: fbf2302b69d04b9f9be623732fa1083b-20210817
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 648289054; Tue, 17 Aug 2021 01:36:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 01:36:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 17 Aug 2021 16:36:47 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 17 Aug 2021 16:36:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH RESEND 4/9] usb: xhci-mtk: support option to disable usb2 ports
Date: Tue, 17 Aug 2021 16:36:24 +0800
Message-ID: <1629189389-18779-4-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1629189389-18779-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_013701_006747_1B0DE05E 
X-CRM114-Status: GOOD (  16.81  )
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

Add support to disable specific usb2 host ports, it's useful when
a usb2 port is disabled on some platforms, but enabled on others
for the same SoC.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 12 ++++++++++--
 drivers/usb/host/xhci-mtk.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index f6d161670c4e..12b691547438 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -116,8 +116,11 @@ static int xhci_mtk_host_enable(struct xhci_hcd_mtk *mtk)
 		writel(value, &ippc->u3_ctrl_p[i]);
 	}
 
-	/* power on and enable all u2 ports */
+	/* power on and enable all u2 ports except skipped ones */
 	for (i = 0; i < mtk->num_u2_ports; i++) {
+		if (BIT(i) & mtk->u2p_dis_msk)
+			continue;
+
 		value = readl(&ippc->u2_ctrl_p[i]);
 		value &= ~(CTRL_U2_PORT_PDN | CTRL_U2_PORT_DIS);
 		value |= CTRL_U2_PORT_HOST_SEL;
@@ -164,8 +167,11 @@ static int xhci_mtk_host_disable(struct xhci_hcd_mtk *mtk)
 		writel(value, &ippc->u3_ctrl_p[i]);
 	}
 
-	/* power down all u2 ports */
+	/* power down all u2 ports except skipped ones */
 	for (i = 0; i < mtk->num_u2_ports; i++) {
+		if (BIT(i) & mtk->u2p_dis_msk)
+			continue;
+
 		value = readl(&ippc->u2_ctrl_p[i]);
 		value |= CTRL_U2_PORT_PDN;
 		writel(value, &ippc->u2_ctrl_p[i]);
@@ -445,6 +451,8 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
+	of_property_read_u32(node, "mediatek,u2p-dis-msk",
+			     &mtk->u2p_dis_msk);
 
 	ret = usb_wakeup_of_property_parse(mtk, node);
 	if (ret) {
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index ace432356c41..0466bc8f7500 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -138,6 +138,7 @@ struct xhci_hcd_mtk {
 	struct mu3c_ippc_regs __iomem *ippc_regs;
 	int num_u2_ports;
 	int num_u3_ports;
+	int u2p_dis_msk;
 	int u3p_dis_msk;
 	struct regulator *vusb33;
 	struct regulator *vbus;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
