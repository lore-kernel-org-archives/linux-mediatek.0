Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2C1C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:26:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0369C613C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0369C613C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MzBxYaO0PoaadC15HfFWkbxvJ4pi4VlaMaWVHQt8F0I=; b=DkEDvgigcvfBk1LmuFfR7DtHoP
	WTcmNq47DGp8tuA1jLgaEwqjZriAB21byQV1ZfJ/DJvw4WPuo3D18PaabEdtIu9/qnjXVQH/SvjjY
	QYBEil1CvFXEoE08bSFBi84PBTrUZnNFS+GddMHODP2MiZ55475LO3Xw4yvUpSDqy5DMnOWaGmnF6
	yxgeQLF04Ctlqnvk7QhX+10p3vyaqEg1jH7KYjMkfDwVG7MzegufEmSiG87LdzUwhSxaZoecfBgfa
	dcfLYFyjUjHaB+b/m9hclydtM0msThyQvjPqaaEno5kBQU0cS6BFsfXmX1Ae5erl69w/UmODdY3NZ
	2IVLTqwQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNWx-007QI6-Cm; Fri, 30 Apr 2021 07:25:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNWu-007QHt-VJ; Fri, 30 Apr 2021 07:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Q6kkVaO0Suo0QcWoZWChfLM6oJRhCi0AbJsj0Xs2rRw=; b=4iyjRkreZZTk2nquj4qfssRlOs
 NYGmq+Z1hZ2QGeos23lWS5Re4bIgDsSHWckpEk47gqcNBeZ1ipx0HeRntHlCejQ6SVNbZ+cpm+Q3W
 j88QUJCDCf3KKl39UQDBVU8YrqafybfxhYbTVMdEB6Ti+xucvZPiMRpN7L3nSWHr+5C3xsUmAuOLN
 7cdHExFrlKRUKeEfw1ZMdKo16da1Je+qSxXqfYJ9XUXwFZsDVhrJLdgRmygQz6HKEGAIlmEIOT1/Y
 Art1jKSwmSwsx/AAn9uTzI0NGL8gtKpT/cVe1ss36lT5nCYpl+dbng4mw2tUGtlQCRCKbG+wlueU3
 9hzyByYQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNWr-001CIr-Vq; Fri, 30 Apr 2021 07:25:39 +0000
X-UUID: 1c9ae189a70347949c4a0144aaece030-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Q6kkVaO0Suo0QcWoZWChfLM6oJRhCi0AbJsj0Xs2rRw=; 
 b=rAVqdm3LKCNUV7Qp2Sd73uro6nVoA7gRY4U8GtIuJd+II4uqVDCnvaK9vidmafW8tqYv36/rb2FvTbxOx9VdB8EKwifz6kqP3y3tIyIcxnr1BhhzuRIqeye7RsYUfYgyOdMM3FhAJ/i998JmlpaHUoVEBOSiomUgC0bysARH1QU=;
X-UUID: 1c9ae189a70347949c4a0144aaece030-20210430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1837405656; Fri, 30 Apr 2021 00:25:37 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 00:15:34 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 15:15:33 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:15:33 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 1/3] usb: xhci-mtk: use bitfield instead of bool
Date: Fri, 30 Apr 2021 15:15:30 +0800
Message-ID: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_002538_053337_6F96DACF 
X-CRM114-Status: GOOD (  12.94  )
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

Use bitfield instead of bool in struct

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk.c | 2 --
 drivers/usb/host/xhci-mtk.h | 8 ++++----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b2058b3bc834..2548976bcf05 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 			goto put_usb2_hcd;
 		}
 		mtk->has_ippc = true;
-	} else {
-		mtk->has_ippc = false;
 	}
 
 	device_init_wakeup(dev, true);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index cd3a37bb73e6..94a59b3d178f 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -138,17 +138,17 @@ struct xhci_hcd_mtk {
 	struct mu3h_sch_bw_info *sch_array;
 	struct list_head bw_ep_chk_list;
 	struct mu3c_ippc_regs __iomem *ippc_regs;
-	bool has_ippc;
 	int num_u2_ports;
 	int num_u3_ports;
 	int u3p_dis_msk;
 	struct regulator *vusb33;
 	struct regulator *vbus;
 	struct clk_bulk_data clks[BULK_CLKS_NUM];
-	bool lpm_support;
-	bool u2_lpm_disable;
+	unsigned int has_ippc:1;
+	unsigned int lpm_support:1;
+	unsigned int u2_lpm_disable:1;
 	/* usb remote wakeup */
-	bool uwk_en;
+	unsigned int uwk_en:1;
 	struct regmap *uwk;
 	u32 uwk_reg_base;
 	u32 uwk_vers;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
