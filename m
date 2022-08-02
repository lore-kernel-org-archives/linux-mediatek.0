Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85906C00140
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Aug 2022 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xENaEcZHhfRIJruDMcHMvUXXoEXBYRPLrMn662o9aAs=; b=D5TmDkyjfdkA49AF4psJnhrFhV
	BEq+GhELK36bxWcexh6xNHnxacOfVYK/K68ZY+FlU+3nwe09aQT4M9DcxhUTZMOK+rBZAP24VLup6
	KL1HrR0gaSO7nKUIOVPILVYC0LgS4Q1xqiIHf/CbnOjuCsVJmVqh/BKb4LByADrDzkKrKfMz8CsiB
	P3d7oz4IYArcz9iPg/pRXwZZGJSBzZeHSzOSClZuGtBPuhuz7EM0mbRU0EF0IoTEh0Xuj0LMOPzmh
	gDPcPnx4tOC99PaWJwkUnLWuwmYZVhcgR7cPSlVmAMHCKj2KHwTBu5liSDME/8xRb7SjfoBvIv2Vy
	dsB8tFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImpA-00BbGK-0U; Tue, 02 Aug 2022 08:00:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImp4-00Bb7K-DK; Tue, 02 Aug 2022 08:00:16 +0000
X-UUID: 3f97f3d491144bfe973ffd8de1df3f4e-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7924c479-619a-4de8-a3a1-5a948e47e1b5,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:0fabfed0-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3f97f3d491144bfe973ffd8de1df3f4e-20220802
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 395884959; Tue, 02 Aug 2022 01:00:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 2 Aug 2022 15:59:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Aug 2022 15:59:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman
	<mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Ikjoon
 Jang" <ikjn@chromium.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] usb: xhci-mtk: fix bandwidth release issue
Date: Tue, 2 Aug 2022 15:59:46 +0800
Message-ID: <20220802075946.18168-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220802075946.18168-1-chunfeng.yun@mediatek.com>
References: <20220802075946.18168-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_010014_693093_E45D97F9 
X-CRM114-Status: GOOD (  12.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This happens when @udev->reset_resume is set to true, when usb resume,
the flow as below:
  - hub_resume
    - usb_disable_interface
      - usb_disable_endpoint
        - usb_hcd_disable_endpoint
          - xhci_endpoint_disable  // it set @ep->hcpriv to NULL

Then when reset usb device, it will drop allocated endpoints,
the flow as below:
  - usb_reset_and_verify_device
    - usb_hcd_alloc_bandwidth
      - xhci_mtk_drop_ep

but @ep->hcpriv is already set to NULL, the bandwidth will be not
released anymore.

Due to the added endponts are stored in hash table, we can drop the check
of @ep->hcpriv.

Fixes: 4ce186665e7c ("usb: xhci-mtk: Do not use xhci's virt_dev in drop_endpoint")
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index a17bc584ee99..b54626732d18 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -764,8 +764,7 @@ int xhci_mtk_drop_ep(struct usb_hcd *hcd, struct usb_device *udev,
 	if (ret)
 		return ret;
 
-	if (ep->hcpriv)
-		drop_ep_quirk(hcd, udev, ep);
+	drop_ep_quirk(hcd, udev, ep);
 
 	return 0;
 }
-- 
2.18.0


