Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC38C25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ORM6sl5194E0I4ytj2g+FRhv8tYC54a1lBFdsDfzRCM=; b=k37vrulbTsElBbpmMDTeAAkw/j
	8jap+ndehRPmYQS1XynjgwTQwjbwMG5ETVA/Y5a48fYeR8O5XzHyHXdcckWBTuVRyyI6cjflY2MuI
	QYl2OJQItCZsRLrbprwn6neqdtdbTAKBVfJ9yvcxbLK5xbb4BPKIRu/sjQHPIiBlZuwtRGYKOMojk
	DcBr/xKRJRymVvpKKa4rVl/71C2ZWvUiqz3NxLt3Xskqk22npwKdxRcmAb5rIb+hbCVHThbbLS8eK
	vhcHFtPDwi9egPQgAGn6soGtnuvMQDvp27M/BZpYvOihIPbs3DtYcU2w5ACUG7Q8qDurPF61cF2GC
	HMGUCYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxVW-004BqS-1X; Fri, 19 Aug 2022 08:37:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOxVS-004BaJ-Cg; Fri, 19 Aug 2022 08:37:31 +0000
X-UUID: f6b921c38b414f05ba066c2b431d84c5-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ORM6sl5194E0I4ytj2g+FRhv8tYC54a1lBFdsDfzRCM=;
	b=cvj4ug/Q4mXC52uF5AGR9gu88RbQdW31S8B3/g7gCVvY1Ic0sajJUAbt/wmYEwBUS0Ujf4bLvqUn/aqkb1T4R35k0lDmbV7SU7ESFSSwyo3X4dZzbrrQiF8BWkmBy/Bx9E5kQnbj6qXOKoatVMd+nhrJyL5xfBu29VL3GCoZ6gw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:9179c982-2abe-40dd-a9be-5ddbc1126a93,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:57c102cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f6b921c38b414f05ba066c2b431d84c5-20220819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 341986926; Fri, 19 Aug 2022 01:37:22 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 16:05:58 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 16:05:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Mathias Nyman <mathias.nyman@intel.com>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Eddie
 Hung" <eddie.hung@mediatek.com>
Subject: [PATCH RESEND v2 2/2] usb: xhci-mtk: fix bandwidth release issue
Date: Fri, 19 Aug 2022 16:05:56 +0800
Message-ID: <20220819080556.32215-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220819080556.32215-1-chunfeng.yun@mediatek.com>
References: <20220819080556.32215-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_013730_621758_55164E10 
X-CRM114-Status: GOOD (  13.50  )
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
v2: add comment
---
 drivers/usb/host/xhci-mtk-sch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index a17bc584ee99..579899eb24c1 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -764,8 +764,8 @@ int xhci_mtk_drop_ep(struct usb_hcd *hcd, struct usb_device *udev,
 	if (ret)
 		return ret;
 
-	if (ep->hcpriv)
-		drop_ep_quirk(hcd, udev, ep);
+	/* needn't check @ep->hcpriv, xhci_endpoint_disable set it NULL */
+	drop_ep_quirk(hcd, udev, ep);
 
 	return 0;
 }
-- 
2.18.0


