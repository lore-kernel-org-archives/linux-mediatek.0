Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46621C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:06:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4EB7619AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:06:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4EB7619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t6g6v5qXCybvGvtWcGuPEOjg2B2uBir4OVQ+3efZUvQ=; b=dZ9M9OuHo7OAETrHyqVZQVrUu
	6Wyv8G+NkpeUsZiqp3sY/uDQ9wqYxXTJaBuEaPPRy0qrvVFv+b4M+cumZ3A/TsRRioYglLyART8wq
	yUXGqHR/DPjt9glyqyRilNUE7WhufdzWHnf06kUr6/cEX4SNkDnISbKlLEj2ai2tvfUuoS3tKZRZ6
	Pu8+kjsRMj3+6LM7AdmKFnMca5wlqiHMlJZT8BDt/5NgqJI7Vs0KaqZreMPjVS+4KLrGqSA5lWvsZ
	q0QvuDM1cT1NApL7nWDJ/Lljs0zDrPAOahh5UbZoiavt6iDzRoGkpKf1p7ceWtCDu0SQ7gkWZCwes
	vNyi+e82w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOb74-00E3vf-QL; Tue, 23 Mar 2021 07:06:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOb6j-00E3ig-Os; Tue, 23 Mar 2021 07:05:44 +0000
X-UUID: b3850319d2414fe794119965f92a3841-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=s4ZddC2S+dlliGCnvHoikIrc+TPN23rnYvceuM8Qq8U=; 
 b=SdcZqQaCl+gkAaAMcfwUnEGdNndmaEzJzBdGgUoy5ftaindVYsCzymF2S/k/S4tp9vEnKLN5/NjihB2BrvVL3MkbcK6naorsM75YNQG4aBYuRlam6yvyfNxdoDuK+XsRHVbOCNlmrfc1ftakO155EJeAyikCzxseVecRiYGhbFk=;
X-UUID: b3850319d2414fe794119965f92a3841-20210322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 248481818; Mon, 22 Mar 2021 23:05:38 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 00:03:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 15:03:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 15:03:14 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>
Subject: [PATCH v2 08/13] usb: xhci-mtk: drop CONFIG_OF
Date: Tue, 23 Mar 2021 15:02:50 +0800
Message-ID: <1616482975-17841-8-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_070543_346406_B64690B8 
X-CRM114-Status: GOOD (  14.48  )
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

The driver can match only the devices created by the OF core
via the DT table, so the table should be always used.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: no changes
---
 drivers/usb/host/xhci-mtk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 24342112cd1d..832c5b8bb8a8 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -689,14 +689,12 @@ static const struct dev_pm_ops xhci_mtk_pm_ops = {
 };
 #define DEV_PM_OPS IS_ENABLED(CONFIG_PM) ? &xhci_mtk_pm_ops : NULL
 
-#ifdef CONFIG_OF
 static const struct of_device_id mtk_xhci_of_match[] = {
 	{ .compatible = "mediatek,mt8173-xhci"},
 	{ .compatible = "mediatek,mtk-xhci"},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_xhci_of_match);
-#endif
 
 static struct platform_driver mtk_xhci_driver = {
 	.probe	= xhci_mtk_probe,
@@ -704,7 +702,7 @@ static struct platform_driver mtk_xhci_driver = {
 	.driver	= {
 		.name = "xhci-mtk",
 		.pm = DEV_PM_OPS,
-		.of_match_table = of_match_ptr(mtk_xhci_of_match),
+		.of_match_table = mtk_xhci_of_match,
 	},
 };
 MODULE_ALIAS("platform:xhci-mtk");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
