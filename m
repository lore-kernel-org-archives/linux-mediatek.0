Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1836C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FEDB61285
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 08:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FEDB61285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6puj8RUm+T1H1Q8Z+8ysF7vJhPG0YIKIC5+IQeUdfiU=; b=kVozDCCzVGpcfx
	zC5fG+srZBkbYMU7rjSCjCu7DoGxAEZZm9cvRm/uDHilV++8RNAOhpdp4I1AHHkcScs0Qjg3BQqe1
	lON/hSD4PK3uv54pNJ5jsqw+yIak6zgKuX59Q51XlrL6oTUomRClAl7rcaR41N7bVg0FHqXsg0SVG
	E2jPdk4jR4+JvVzHM5ZUysUJ4DXBhFQSdXmRqDLdSbQ2XxAe0CG5p4bvDQNO7/utGFbborzEWE4xL
	in609u5l3On5BiwahubFxN7cNi7UujzoM0wWFIm1PkDuuisfaEuKPMej1qG+glkcOqHq8h21e+xyJ
	xf5OZC0AoQt8sR15plvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqWtZ-00727B-5Q; Tue, 08 Jun 2021 08:15:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqWmR-006xiH-Oh; Tue, 08 Jun 2021 08:08:13 +0000
X-UUID: 73f4c579ec074bcd80b42c696db10923-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=MooS145CCd1thmQP763GmtpglQX7NybcxNoZ87d4ROI=; 
 b=oWuBW0j2wQNId8TKppQ93sJP5gaG7EogtP6BVzLgiKN7X+4hkH7RuGR8x/gSv5/dBZhSzYkDpt4jd5uAEVOx/BiG9HFiAzVWn5MzIMTODZBIJhW018vlwyQA3I0KG8ISChNW+q17A3AEEFRAp3guTfVfesLgOaYtVvbbDPQRmdY=;
X-UUID: 73f4c579ec074bcd80b42c696db10923-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 480892743; Tue, 08 Jun 2021 01:08:04 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 00:58:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 15:58:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 15:58:00 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Yuwen Ng <yuwen.ng@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>
Subject: [PATCH 05/23] usb: mtu3: power down device IP by default
Date: Tue, 8 Jun 2021 15:57:31 +0800
Message-ID: <1623139069-8173-6-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1623139069-8173-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_010811_873772_C594EC34 
X-CRM114-Status: GOOD (  10.28  )
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

Power down device IP by default until @udc_start is called.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/mtu3/mtu3_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 6b5da98de648..e306b93c007d 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -921,16 +921,15 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 
 	device_init_wakeup(dev, true);
 
+	/* power down device IP for power saving by default */
+	mtu3_stop(mtu);
+
 	ret = mtu3_gadget_setup(mtu);
 	if (ret) {
 		dev_err(dev, "mtu3 gadget init failed:%d\n", ret);
 		goto gadget_err;
 	}
 
-	/* init as host mode, power down device IP for power saving */
-	if (mtu->ssusb->dr_mode == USB_DR_MODE_OTG)
-		mtu3_stop(mtu);
-
 	ssusb_dev_debugfs_init(ssusb);
 
 	dev_dbg(dev, " %s() done...\n", __func__);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
