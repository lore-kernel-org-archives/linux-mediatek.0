Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CEEC433F8
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:53:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B4B2077D
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:53:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JlgBBH2F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LkDOlyLS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20B4B2077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mczLTSuEZwtOPOrqsfpgGKzf2H/ShQeL5g/4FstR95A=; b=JlgBBH2FF+Qa23BjufOXy2vNz
	wUT0xerCWm9Ii9gZ8S4rONz4zNrRtNhpJOq8PlsoAl41SJX3uzBkKShgUcCxyNzciXlDVJuIKiG+u
	05JWN3kxSCKmMde3UFmyXeU5+B5ARNCG0rTnCBioUU114Ne4bK2Z1XqYVCUnRsBsA6hWJ+kypYaXk
	l3FEhh92ryMPS8H1T5Xu08dzpq+jTzP8minLfyIe+SxpikoqLGuchaeaCfhX8Lc4fwO6MMRYb4bEJ
	cVoaucGC1NpOScbT19HiuUAd4wq67+wgIoIUnNB5kfmYtdIS5plhxOTjp5KnrOcVDC+qR8GJkO/Fb
	ybA/3gauw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9Yt-0005B4-69; Wed, 22 Jul 2020 07:53:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9Yg-00055r-Tt; Wed, 22 Jul 2020 07:53:00 +0000
X-UUID: 9fad0e6a6cc84bad9b15dc429d065a52-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=bsR4oIGCIYaOleiklZSpqTGoJRJab0JcJpe1Y+wzSDc=; 
 b=LkDOlyLSWi+7ZU9UhdFQ9j8xni92/9uUfhAfXtTT2PfPS/fuoVUuX/e6rKPibFmya0scX5n3gWkNZgvG78qpAzdGsuYw36a+Yf/TFSayU6PBpQ2CZwiXA/N/aQx2/rNK1/Av2FUis8V+pfqUuZjEtV6ni7XXk6tpv9ljw49u9qs=;
X-UUID: 9fad0e6a6cc84bad9b15dc429d065a52-20200721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1526752606; Tue, 21 Jul 2020 23:52:48 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 00:52:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 15:52:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 15:52:35 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 2/7] usb: phy: am335x: convert to
 devm_platform_ioremap_resource_byname
Date: Wed, 22 Jul 2020 15:51:10 +0800
Message-ID: <1595404275-8449-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9DB988DD4C58F5E8BA918A198B50C04108DA7A734B2DAD79509251980A3C6FA22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_035259_160698_88BC1673 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource_byname() to simplify code

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/phy/phy-am335x-control.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-am335x-control.c b/drivers/usb/phy/phy-am335x-control.c
index d16dfc3..97e6603 100644
--- a/drivers/usb/phy/phy-am335x-control.c
+++ b/drivers/usb/phy/phy-am335x-control.c
@@ -149,7 +149,6 @@ struct phy_control *am335x_get_phy_control(struct device *dev)
 
 static int am335x_control_usb_probe(struct platform_device *pdev)
 {
-	struct resource	*res;
 	struct am335x_control_usb *ctrl_usb;
 	const struct of_device_id *of_id;
 	const struct phy_control *phy_ctrl;
@@ -166,13 +165,11 @@ static int am335x_control_usb_probe(struct platform_device *pdev)
 
 	ctrl_usb->dev = &pdev->dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy_ctrl");
-	ctrl_usb->phy_reg = devm_ioremap_resource(&pdev->dev, res);
+	ctrl_usb->phy_reg = devm_platform_ioremap_resource_byname(pdev, "phy_ctrl");
 	if (IS_ERR(ctrl_usb->phy_reg))
 		return PTR_ERR(ctrl_usb->phy_reg);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "wakeup");
-	ctrl_usb->wkup = devm_ioremap_resource(&pdev->dev, res);
+	ctrl_usb->wkup = devm_platform_ioremap_resource_byname(pdev, "wakeup");
 	if (IS_ERR(ctrl_usb->wkup))
 		return PTR_ERR(ctrl_usb->wkup);
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
