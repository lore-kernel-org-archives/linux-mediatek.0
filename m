Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB2BC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C206023E
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 13C206023E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohkyWyBoIAfuGuMZfu+rt+kSYfLCRJLNlagIZR/fgwA=; b=uQ/iWX1s5CmQE/
	hz6WQgBTDEGJL6JFYYftHn/DIgvqCwQZ3iHgiGDgperTvBFAikyJhomS0RKAc7WIRmysDmI52DoYW
	Qvkk04lmzC2muTB5eD5BxygoaCprrapSgmr5IAyDnN8jPm0ZGYpTErpwqzrA7+O6hoFYHb3YrkDm9
	EKsGWLN1vFtBWwDPw8xwGwaWArbw4v/2sIAXsNPz/v7ODSOjweawCi1drcqu5VFbTZ5RN8oXk09d9
	xTYo1WA+3SPPHP5Sexkc8Rm+/IWtEC2XQBFVuYVzh890HPHZcYHcuae2/p+c0q83nmEgOqTZl4fat
	xIjO7ezT1kqnt1hmpIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDeim-005QhT-Dc; Wed, 11 Aug 2021 03:16:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDeYS-005Loo-3J; Wed, 11 Aug 2021 03:05:23 +0000
X-UUID: f9d23daa12b34877b89bb3c26d48cb6d-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=07yNZ7WLw6gCRD7F6CIsZCAX6VEtK74OjBOyd9U0qR8=; 
 b=mXZuKVXMMavL1FxjwXnlWpii7ssl4MJUVL4a3oiX1FbrekDeR6Co/S9gBtx3q5xo+vC85rMMK5mRqUczn5fLkIgG/c3ow6Txe5MaVMb73iZKVwWaXYYpEXuZs3ALQJ5YwEQRSfD59+GpiGM7ebuyKXtZ68wYWMWDSU0ZwO8iwG0=;
X-UUID: f9d23daa12b34877b89bb3c26d48cb6d-20210810
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290480443; Tue, 10 Aug 2021 20:05:17 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 20:05:15 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 11:05:02 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 11:05:01 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 2/2] usb: xhci-mtk: enable wake-up interrupt after
 runtime_suspend called
Date: Wed, 11 Aug 2021 11:04:29 +0800
Message-ID: <1628651069-22162-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1628651069-22162-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1628651069-22162-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_200520_193194_C8831DF3 
X-CRM114-Status: GOOD (  11.03  )
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
index 7ff0cd707ba1..6fb6f6853129 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -611,6 +611,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 			dev_err(dev, "set wakeup irq %d failed\n", wakeup_irq);
 			goto dealloc_usb3_hcd;
 		}
+		dev_pm_wake_irq_set_late_enabled_status(dev);
 		dev_info(dev, "wakeup irq %d\n", wakeup_irq);
 	}
 
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
