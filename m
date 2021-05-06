Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A575AC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:41:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E88CD613FC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 06:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E88CD613FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bE+7BU+cu0pxPrweZUVf4W7YROydEvmsc4ej5C1rozc=; b=Eawa+PVi+BE/eRMWUNDP2jLcj4
	CtZDhQ9C3k4Y/PLcHxQqWSbUM3FDMXKkaB6mLHS4YqdvgcsblDZZs/Ea0rM0rfKPHpEqvyRSMYPtj
	t+KisD87XAURF0nrF3dLdc1L8R+4swKFeS8y/yu43vs7WJx5OUX8uczuJSooJQsPHk7/yRIgfnRZI
	gzIewytOHWVgNFpnpP+UdBN8pga0Jp+nT2Kfe+tUnkXsZeN6eZKFhWZiWEzAXImvYePH4XEFu5auU
	mHABslIJlynGLiGQn8HwVLD53DXjiRjmx8gkzBHTFuo2lMMQCBGDjfNYObnVxZPG+rMTPL4vbwrsU
	pmtw5VUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXgv-003Ndp-I2; Thu, 06 May 2021 06:40:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXgt-003Nd8-5c; Thu, 06 May 2021 06:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Hc2YI+k0mZJeZmLULqDvLIblaEdxyUoLhtz9yHbho8g=; b=4a34wn1IK25hVg7I4EVJbXtAFJ
 v+vq2FFpvjF7D2mG8nYviqePykiRPAl9biNbwhaSZTnHYe54ou0NJK+lZiTMwDL8LXn7quyZ6914o
 Ps6om2GEjzXGl/9Nr1J9ArXU5s6rADBZ6A62nYx2E0Fhk8YzTAsNzD4lq8EJ/XWt8FQyokxJ9E13K
 3Fm3QmMepBKLHeDAtwXOpeQAj9B+WEAqq8+0xcEdw7v8Z1oD9zNNtuGAuxplkAAi8O14zYo9HxO9v
 VR5VSHJAl6INyxL6ZO9lHEK7E7trOTdZvzycmBDKPkWhcHWluQ4idizB/pkLKMB/CrJwUOT/s5VCM
 VVCV9Y8w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXgp-005dqK-RA; Thu, 06 May 2021 06:40:53 +0000
X-UUID: eca81e1a748749c7b4684edb1d87e9c7-20210505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Hc2YI+k0mZJeZmLULqDvLIblaEdxyUoLhtz9yHbho8g=; 
 b=d6ReaiKfQKqZX2nGvsYBMbbMEbaWFQSLIsStV0CKP3y8S7NFnxGK7aSkmSZI70P11BO8wAaI0kWMtY/6IfK1Vy3Mxe6xpZxYzuTAWpbMzKCjVvXlsenWMnbJXXAv06EQXsNf7vMW09CMkptl8plJ/9lRQnqf4P5FgmaW3OJ4vbc=;
X-UUID: eca81e1a748749c7b4684edb1d87e9c7-20210505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 432064062; Wed, 05 May 2021 23:40:49 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 May 2021 23:31:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 14:31:17 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 May 2021 14:31:17 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH v2 1/3] usb: xhci-mtk: use bitfield instead of bool
Date: Thu, 6 May 2021 14:31:14 +0800
Message-ID: <20210506063116.41757-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_234051_909973_F5072EFD 
X-CRM114-Status: GOOD (  13.75  )
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

Refer to coding-style.rst 17) Using bool:
"If a structure has many true/false values, consider consolidating
them into a bitfield with 1 bit members, or using an appropriate
fixed width type, such as u8."

Due to @has_ippc's default vaule is 0, no need set it again if fail
to get ippc base address

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: add more changelog suggested by Greg
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
