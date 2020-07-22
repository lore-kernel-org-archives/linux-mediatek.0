Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D09BDC433F1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:53:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DE33207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 07:53:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmA3tGT+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cYgEm/dz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DE33207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdmdQgKvKvhNssyC8zWeB2u4l3hkqhVjJ7X+6VxSmWY=; b=UmA3tGT+IEO7sQWlXt2aNTgKt1
	7mOxooSiWsFHmzHxFf9xGHbZ5EuzlRsS1mbfmRi1jx6oHcVKdOzubV6P/KG90kgxNF3lofPtv9Egu
	RAt/0UPWWsjjtZf0tLT7V4zDJ5lTZdB2V1XWCW4j7YhblUuuUk9iasw9z/d92xJhNtyE4X+jHqHd8
	LjscUW0Va5suxBPJ0psw6QMPM5RcnXZfQo7e5hazIVIVLjj7RrQzHOnBeYLVr3qNtKRJVtPjaazmo
	x7K1SYnpLtETVuwShA13MR7lK9d8wP5WyLH8VS71YqGCfNOUAzb5DX+ovUT8qcyChjDHUZZL4KTYe
	FsabwrNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy9Yd-00055Z-Sc; Wed, 22 Jul 2020 07:52:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy9YW-00052x-Mv; Wed, 22 Jul 2020 07:52:50 +0000
X-UUID: 2b453721bfd64f01b6f8552761b7d32e-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=N12xt2Ho95K/5t9BUmiiTcsZXRkp+alJpZRZ6ri1tVs=; 
 b=cYgEm/dz84dfE+Hrt4CMHh7NZJVt4g1dVajgdZidn1fuVihNtlUh/DXfniavf6VOwU27PbmNgfqctAeIpQEWoZH5sCJTvu4TstM+L51bFvTvbamIdcISxgBd9TsDQDjTZmSMBuFYnBZxX1GK0IFBjPI8+DOeQxZ9SZlhAyDpk3M=;
X-UUID: 2b453721bfd64f01b6f8552761b7d32e-20200721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 538752271; Tue, 21 Jul 2020 23:52:50 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 00:52:41 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 15:52:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 15:52:34 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: [PATCH 1/7] usb: mtu3: convert to
 devm_platform_ioremap_resource_byname
Date: Wed, 22 Jul 2020 15:51:09 +0800
Message-ID: <1595404275-8449-1-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5EF873A7262642D7730EE5F21BCAD020E82C724D4756E7F4B20C7F02D98FE49B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_035248_893773_B0D8364A 
X-CRM114-Status: GOOD (  11.30  )
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
 drivers/usb/mtu3/mtu3_core.c | 4 +---
 drivers/usb/mtu3/mtu3_plat.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 9dd0216..ca48089 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -828,7 +828,6 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 	struct device *dev = ssusb->dev;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct mtu3 *mtu = NULL;
-	struct resource *res;
 	int ret = -ENOMEM;
 
 	mtu = devm_kzalloc(dev, sizeof(struct mtu3), GFP_KERNEL);
@@ -840,8 +839,7 @@ int ssusb_gadget_init(struct ssusb_mtk *ssusb)
 		return mtu->irq;
 	dev_info(dev, "irq %d\n", mtu->irq);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mac");
-	mtu->mac_base = devm_ioremap_resource(dev, res);
+	mtu->mac_base = devm_platform_ioremap_resource_byname(pdev, "mac");
 	if (IS_ERR(mtu->mac_base)) {
 		dev_err(dev, "error mapping memory for dev mac\n");
 		return PTR_ERR(mtu->mac_base);
diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 9c256ea..d44d541 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -216,7 +216,6 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 	struct device_node *node = pdev->dev.of_node;
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int i;
 	int ret;
 
@@ -263,8 +262,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
 		}
 	}
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ippc");
-	ssusb->ippc_base = devm_ioremap_resource(dev, res);
+	ssusb->ippc_base = devm_platform_ioremap_resource_byname(pdev, "ippc");
 	if (IS_ERR(ssusb->ippc_base))
 		return PTR_ERR(ssusb->ippc_base);
 
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
