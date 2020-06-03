Return-Path: <SRS0=Qq0i=7Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5A1C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72EC020679
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2020 13:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KGtpmVx8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qMOL6MSH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72EC020679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oFsFZu2nL8ePC5dfiaWj6nQC6tM1y7QxDzitFdv/tNY=; b=KGtpmVx8WwdVKG
	/9W2L4TNZzIBAVT3se67e15ikAuuvBJ8Cq6tptqChm4/bGZvIup9SaGUmGu2+n6cV6H40yB3l0+45
	kcdJ8oGnfvnCLlC8R9bkazKhOAWjGAVYaK0QbFD6QzEpfxqSsqzokWaYXU1jWyilWbq6zaxMwP+bF
	nQ8QO6vFSikU1WtPAVcumgnKQJ+bohzPdGTKUnyxoeqQSEmNQswe4hO6qX+nEi/VWrJ6VsNdxbwgN
	FnrZRmYbV7nY39OJDTzWDRl+V/pKJWtmEHZALLzdWX7ptbNNjOh/BKnp5VHkAV1YDmzoPUF2Vfp2/
	JWFbylnDozJttPpZwXHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgTAH-00039Z-HL; Wed, 03 Jun 2020 13:10:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgT9o-0001lG-7v; Wed, 03 Jun 2020 13:10:17 +0000
X-UUID: 48ed7ddcf0a14121836ca0fcf66da26a-20200603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2OS1Oc6QKgyNEMcqfsLs5jUWJHdxON7zK6mWXvLCPnM=; 
 b=qMOL6MSHSaTVwFjjhcJ+NW3YbFUjF2jBfQIQi/CZyflUFw5Mh0VO3T761w4WOEKrbLUtG7NYWM0aaWXi2wd37T+/92xYm74Pi3aJUJOGhGar3bZFTcJ8VnRW9WuOPMMsY65Vnf1vX82SxmLx/38gVgthPIuJXrDYFj9WaX1CQfQ=;
X-UUID: 48ed7ddcf0a14121836ca0fcf66da26a-20200603
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 919710366; Wed, 03 Jun 2020 05:09:50 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 06:10:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Jun 2020 21:09:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 3 Jun 2020 21:10:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <stable@vger.kernel.org>
Subject: [PATCH v3] usb: host: xhci-mtk: avoid runtime suspend when removing
 hcd
Date: Wed, 3 Jun 2020 21:09:27 +0800
Message-ID: <1591189767-21988-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <ebd32a2b-c4ba-8891-b13e-f6c641a94276@linux.intel.com>
References: <ebd32a2b-c4ba-8891-b13e-f6c641a94276@linux.intel.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 891385B6AA430B1B9CAB903AC4DA341DF9FFE4F9D9796E2CF48A9C88B1AE21CC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_061012_389076_D576C4EB 
X-CRM114-Status: UNSURE (   9.92  )
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
 linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>,
 Macpaul Lin <macpaul.lin@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When runtime suspend was enabled, runtime suspend might happened
when xhci is removing hcd. This might cause kernel panic when hcd
has been freed but runtime pm suspend related handle need to
reference it.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
Changes for v3:
  - Replace better sequence for disabling the pm_runtime suspend.

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
