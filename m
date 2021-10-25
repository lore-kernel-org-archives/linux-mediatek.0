Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D174C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 07:02:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C897600D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 07:02:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C897600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckJ91xGXh7YsbONDZZzQPgwh2PSl2tBvNbSDekcyb4U=; b=qGnZ5KBUM+Lf/k
	UpO4CMq3IpU/KIGpxE0l7X8nFhkMmChpqOYy1pbH5Sgq+i0Hgd8LhIzpQcnF1TH1ZvDbOVqSB1mVp
	uKWGLKiPaixHUR+LGPH16lntTbeTyVnKv3jQcqN1mbXEVdFVI4BS2nIyNecwecAWqf6kM+sOWFnWV
	7mos++43nrEl68O55GEPAO82v83uexHy2uhT9+if4dECgKI88ZsUAKX48wTA3o3hZOvtlVyieRiDe
	Sdd5G5+0+o5s6770SsPT89+snpfWovkt5d17Ow4fUe6jimAium2IOmxa+Zkf3FJU+o4PmAXdkxQqd
	AzcrQ+YsQD7fkplz5R0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meu09-00FTHa-3W; Mon, 25 Oct 2021 07:02:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1metzj-00FTAu-AI; Mon, 25 Oct 2021 07:02:10 +0000
X-UUID: 1898a65dd5744b96b8d7ef03eeeafcde-20211025
X-UUID: 1898a65dd5744b96b8d7ef03eeeafcde-20211025
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 8616366; Mon, 25 Oct 2021 00:02:01 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 Oct 2021 00:02:01 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 25 Oct 2021 15:01:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Oct 2021 15:01:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 3/3] usb: mtu3: enable wake-up interrupt after
 runtime_suspend called
Date: Mon, 25 Oct 2021 15:01:55 +0800
Message-ID: <20211025070155.2995-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025070155.2995-1-chunfeng.yun@mediatek.com>
References: <20211025070155.2995-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_000207_383011_E77C9DC0 
X-CRM114-Status: GOOD (  11.98  )
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

Use the new API dev_pm_set_dedicated_wake_irq_reverse() to request
dedicated wake-up interrupt, due to we want to enable the wake IRQ
after running ->runtime_suspend().

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: new patch
---
 drivers/usb/mtu3/mtu3_plat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index f13531022f4a..4309ed939178 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -337,7 +337,7 @@ static int mtu3_probe(struct platform_device *pdev)
 		goto comm_init_err;
 
 	if (ssusb->wakeup_irq > 0) {
-		ret = dev_pm_set_dedicated_wake_irq(dev, ssusb->wakeup_irq);
+		ret = dev_pm_set_dedicated_wake_irq_reverse(dev, ssusb->wakeup_irq);
 		if (ret) {
 			dev_err(dev, "failed to set wakeup irq %d\n", ssusb->wakeup_irq);
 			goto comm_exit;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
