Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6ABAC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 02:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F24610C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 02:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84F24610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4BD3vuj/wPiAdzelKRIe5Z6OekCRgbnPEF5zKB5zQRg=; b=kTlB0b3Xflo3VQ
	mUGuOsFjZZpb/05iBG5aVyVUZi9WHdou/kvELJ3ThdVV5uvMHAL+tl/Ng0DrstoD3SAGqAP4U+bfu
	Dt8Xg86uoHzMT8ZsPUM0Z1ppFGqy4Cz4x2XgKP1GIq8WLxlyiI9x4YapK/EZep0XlEkrARFX6Tva8
	7yAACn1JQCgCMYhks20IqbaYaYhw0ocx2bcJxZwP0Wg9Fqm+9WNOYgMp8kt/UAKVJq8v8Ngja99NR
	/ueB2IMPfChlpsGq2CIY7eDcdPrLJMj96WDd8Y949xywqAVvqJ7HzeECodg1/ucuetUVcFPs8ghXx
	hu3L/wAEF7ACrtEliC+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTb9F-00CvWN-Eu; Fri, 24 Sep 2021 02:41:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTb9C-00CvVe-EU; Fri, 24 Sep 2021 02:41:13 +0000
X-UUID: d29fa2b737be4c5ab9a6060f916132b7-20210923
X-UUID: d29fa2b737be4c5ab9a6060f916132b7-20210923
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 809957674; Thu, 23 Sep 2021 19:41:06 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Sep 2021 19:37:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Sep 2021 10:37:49 +0800
Received: from localhost.localdomain (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Sep 2021 10:37:48 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH RESEND v3 2/2] usb: xhci-mtk: enable wake-up interrupt after
 runtime_suspend called
Date: Fri, 24 Sep 2021 10:37:46 +0800
Message-ID: <20210924023746.22423-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924023746.22423-1-chunfeng.yun@mediatek.com>
References: <20210924023746.22423-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_194110_515920_491EF232 
X-CRM114-Status: GOOD (  10.42  )
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

Use new function dev_pm_wake_irq_set_late_enabled_status() to enable
dedicated wake-up interrupt after xhci_mtk_runtime_suspend() is called.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: new patch
---
 drivers/usb/host/xhci-mtk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index c53f6f276d5c..6c1d898986f2 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -607,6 +607,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 			dev_err(dev, "set wakeup irq %d failed\n", wakeup_irq);
 			goto dealloc_usb3_hcd;
 		}
+		dev_pm_wake_irq_set_late_enabled_status(dev);
 		dev_info(dev, "wakeup irq %d\n", wakeup_irq);
 	}
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
