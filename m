Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CD4C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:26:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BF861883
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 08:26:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BF861883
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eyigJwoPoSAyGreRrYDAkLkT0QCRz6UZ94F7up5+qgY=; b=QuKr28bTRcyqGGXe9J0o1sOYs
	ZKaswFIEgI34dBqgxSxqOXWWtZAid5lBdsKUJozLrDrR9V0o2Tb1FN8HCGIgRf2bgKsry7JeSW9z/
	Nc7Z2L6BspaZIPu4+avaXfuXXPiuYOb5ZuB+quZV0R1t4oM434br//UKE+XVLphuy271FX1f+nMV7
	bi3/078ZQon8tI7Bw2hI6AwWYpwDLBIXg+7aErXGa7HDnq3IRbhPvDg1t5VSv1LJ7JsL44JbNNAII
	djDvhwkbkZpnNewYCvLymqZA8hxg/JeVMvGi/+mRAhq8s35iaI9QCSQ0oAZSAeqsbDfhw0XFx2T+6
	4zV1M6ydA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWB3-005wSm-Ab; Wed, 31 Mar 2021 08:26:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWAp-005wQe-Mk; Wed, 31 Mar 2021 08:26:02 +0000
X-UUID: abf2852f263a4512b77b6fc3f46dede9-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MGTdfl/Sb29l1k6pIHgVyFGsaumJ7urnhgE5FRhofCg=; 
 b=kNsdezDOH5kzWvNdzRJ4Z08B9EvX0t5vMf6HdvPj0i35wTjKWWYguVYjdoWg7knykpAaTI7wocERRHdtLNaDjHAtzxSpywLyREgkRPx8JBNJfJ1g2s06SDd0LeBRhpAPWPztpP3kGxGyXE4Gx0fyy9mXiC2vCi1Jaz41OhBLMYE=;
X-UUID: abf2852f263a4512b77b6fc3f46dede9-20210331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 913887981; Wed, 31 Mar 2021 01:25:51 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 01:25:49 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 16:25:46 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 16:25:45 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH next 2/2] usb: xhci-mtk: fix oops when unbind driver
Date: Wed, 31 Mar 2021 16:25:42 +0800
Message-ID: <1617179142-2681-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617179142-2681-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617179142-2681-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 614E4DE8A8471C2F373F0B87E228EECE78C7633A0599EF5262D0A24C1DDFC49F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_092600_225539_8EA231B2 
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

The oops happens when unbind driver through sysfs as following,
because xhci_mtk_drop_ep() try to drop the endpoint of root hub
which is not added by xhci_add_endpoint() and the virtual device
is not allocated, in fact also needn't drop it, so should skip it.

Call trace:
 xhci_mtk_drop_ep+0x1b8/0x298
 usb_hcd_alloc_bandwidth+0x1d8/0x380
 usb_disable_device_endpoints+0x8c/0xe0
 usb_disable_device+0x128/0x168
 usb_disconnect+0xbc/0x2c8
 usb_remove_hcd+0xd8/0x210
 xhci_mtk_remove+0x98/0x108
 platform_remove+0x28/0x60
 device_release_driver_internal+0x110/0x1e8
 device_driver_detach+0x18/0x28
 unbind_store+0xd4/0x108
 drv_attr_store+0x24/0x38

Fixes: 14295a150050 ("usb: xhci-mtk: support to build xhci-mtk-hcd.ko")
Reported-by: Eddie Hung <eddie.hung@mediatek.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 7ac76ae28998..8b90da5a6ed1 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -872,6 +872,8 @@ int xhci_mtk_drop_ep(struct usb_hcd *hcd, struct usb_device *udev,
 	if (ret)
 		return ret;
 
-	drop_ep_quirk(hcd, udev, ep);
+	if (ep->hcpriv)
+		drop_ep_quirk(hcd, udev, ep);
+
 	return 0;
 }
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
