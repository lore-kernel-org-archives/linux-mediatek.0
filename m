Return-Path: <SRS0=aF3H=7R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CDAAC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:12:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD2C20772
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2020 03:12:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eq9OCPAx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l4b8g311"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD2C20772
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vBN3HHo5RWmwp+rMn7lZ88L79ISIJcnHyShWFdxU7E0=; b=eq9OCPAxDAUhnU
	hMqKDU1XUcinWSyaK5/RwCjBVh/rS/xOGEH7eOV3uIKcEJhWrEjvtvz3SpXgnwOQ90LglCpG6s42/
	oUVxVV8pTeXv7BqefXTqKobfb0LvW1MaNIzPfVgaJzyDcZLJvbHN3+PqSkN8OhTRmu579T9kxeX+0
	cdHu2zyZXdgcbtaNIB+RVltzsYUNCINt0K5ubOLUeEk6pjxooigCE+HxyXcuhf6oVIp3hgr+5nfga
	PYHqfS/v2AubdKBCiop/n2JP2cmZ0vifLvpbRzH9+ALu4Gdy9OXkk9hCyUIxYKopDZmC8MJ7NiTfX
	m+y1l4aUfWRz+juaMdzw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jggIh-0008Vi-Tt; Thu, 04 Jun 2020 03:12:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jggIa-0008PQ-90; Thu, 04 Jun 2020 03:12:09 +0000
X-UUID: f33abf2c36c047abb7825b103d9c9158-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UrOXbDNOnHiFKXtwaHVgzKiUKHi9PYwsXdkt9BWMTQ0=; 
 b=l4b8g311ij1osd5rrSxatQoejISeR2FIM9I2BLjH5Z/lF5w8CdMBFRPcBp84q2OS4CxL9M56MOPd2wPBOp9D/552vfvJTfOKfHr0KlZa+rg9vZY3kxhFE+KCSJJutYqimi5pgAKHP6lUDwhjwveUlVkudm8n9bE0Ve4NyvBLQJA=;
X-UUID: f33abf2c36c047abb7825b103d9c9158-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 917430256; Wed, 03 Jun 2020 19:12:05 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 20:02:06 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Jun 2020 11:02:03 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 4 Jun 2020 11:02:03 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4] usb: host: xhci-mtk: avoid runtime suspend when removing
 hcd
Date: Thu, 4 Jun 2020 11:01:53 +0800
Message-ID: <1591239713-5081-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1591189767-21988-1-git-send-email-macpaul.lin@mediatek.com>
References: <1591189767-21988-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6818B62397C1B7303376C105A3A0368FFDDA6D0DA11CA08A9A0942B6D3722342000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_201208_326564_E68B086B 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul.lin@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When runtime suspend was enabled, runtime suspend might happen
when xhci is removing hcd. This might cause kernel panic when hcd
has been freed but runtime pm suspend related handle need to
reference it.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: stable@vger.kernel.org
---
Changes for v3:
  - Replace better sequence for disabling the pm_runtime suspend.
Changes for v4:
  - Thanks for Sergei's review, typo in commit description has been corrected.

 drivers/usb/host/xhci-mtk.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index bfbdb3c..641d24e 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -587,6 +587,9 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
 	struct usb_hcd  *shared_hcd = xhci->shared_hcd;
 
+	pm_runtime_put_noidle(&dev->dev);
+	pm_runtime_disable(&dev->dev);
+
 	usb_remove_hcd(shared_hcd);
 	xhci->shared_hcd = NULL;
 	device_init_wakeup(&dev->dev, false);
@@ -597,8 +600,6 @@ static int xhci_mtk_remove(struct platform_device *dev)
 	xhci_mtk_sch_exit(mtk);
 	xhci_mtk_clks_disable(mtk);
 	xhci_mtk_ldos_disable(mtk);
-	pm_runtime_put_sync(&dev->dev);
-	pm_runtime_disable(&dev->dev);
 
 	return 0;
 }
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
