Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04ACAC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCDBF60F6B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 08:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCDBF60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMqPt1IlFeIfnDwwLiyHjn4Vp45z7UFKn/YgGFut23Q=; b=Z6NhXLi/p45ldm
	5ke+/1Dyp6FCUdzAivSraCaK2HQYCg2zf5l7Gcv0HP8McyKQAOtD1WBemY4XMQYKTmxj8QEzOkmjR
	1JRP9JZGG3cJdKq29jRFVeqIeAJaU4lXUXwMdRwR3pICDmPKjJKScaWXvmduDXexiqf0B7dxZXi1f
	zfMnNzNdcbg6rsM0VI0PyjMPhiin2izX71sPcAXj5N9JPz07a71ytrOYhlEA757j0Ws+QgQ6QS3RA
	+aorpzzh3POs06jusDXZDfCN9Uwqxq7eSyxqLFPL6/I+WJla5i+1gXBSZ2b80ECxMgQJxfcSgkc5f
	T1C7uoPdO0764YicfeKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9OFN-007is8-Iz; Fri, 30 Jul 2021 08:52:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9OEC-007iPg-96; Fri, 30 Jul 2021 08:50:49 +0000
X-UUID: 3daaf70904e341a28b118c87743ff6a1-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XR3dt9TEmdfEa7L1xMgu6F2s/uc36M02eLCu7kE+T2I=; 
 b=b0pweoaH6tXUgnwJ3AqwMEw1O0QQ4kDAww7sPd6Mrx1XrIp37SWT7WDOFt3oKFLYix/lA/fNFIQd81V8tLTGAZPyRRDkDeEJLcq0Wd08qk9CGMpXwydCBtLCb9r7gCCSY9624R3jAwlRs1Kktxo1VQkAt3PyzzmLy3/nVrZXfmE=;
X-UUID: 3daaf70904e341a28b118c87743ff6a1-20210730
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1476628562; Fri, 30 Jul 2021 01:50:44 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 01:50:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 16:50:41 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 16:50:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 06/11] usb: xhci-mtk: support option to disable usb2 ports
Date: Fri, 30 Jul 2021 16:49:57 +0800
Message-ID: <1627635002-24521-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_015048_358606_6E8E41DE 
X-CRM114-Status: GOOD (  16.84  )
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
