Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65091C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:26:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF696192C
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 03:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FF696192C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=esxdduFjLDTfmFK+0o7l2Ip7KuGPVOb+dRy22s2Xbw0=; b=HyPAmpZagOl9tEDRRO/Hz2aDw
	slgmtvsFYbJ209qtb/5MYMWQrp/U46XVrhEMnHyR5gZ8kWU604lS/UTR+uWNxAcvuRmuOXOqu1n07
	zqCy6S6h9xrtf4XUkGdBVrAcS9FP42vomSh3SlifnlYZ50YWy9Mnf0dSj29cSqaSFZSwO0fhpoQgs
	i6/TAWXjSNYpx/ejbSRJKBIyHHyQUficWPA9ZK8QNtEUexzf/VHGGbMQFOTEK9kS6NwFlpS4IM/oz
	WHAtvBC9kZgXvmQAzeDvCzVDrR/lRNqog1AG7IPTJVdqoM1VyDVP+hLHRcHvxkBO/mhueesVIxoEr
	ukyvmW3oA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOBDE-00AmeS-HH; Mon, 22 Mar 2021 03:26:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOBBA-00Alyv-Uq; Mon, 22 Mar 2021 03:24:39 +0000
X-UUID: 9bf9d7b46330469dabadefd4a1f5a9e7-20210321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wfpry3RoprOcumT+/rolt3us/tuNcAts4K4Gu7Uk1C4=; 
 b=RsdEFFzoh2stSod6mo4VKgdF4WnF8YsHTbnjggFJot+2AtxB56kFgNu6Nn7F13yDdPzWvdxWOSWv1MmgvyKnw3LS98H8ns3NMsPlIzCatKGVgWYT8WR+nJDrDCkiJ7+QI0qOTdV4Xs/DCTygngu2EmP/RKLvPKkwlcolWN3wrMc=;
X-UUID: 9bf9d7b46330469dabadefd4a1f5a9e7-20210321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1135685297; Sun, 21 Mar 2021 19:24:00 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 21 Mar 2021 20:14:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Mar 2021 11:14:03 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 22 Mar 2021 11:14:02 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eddie Hung
 <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 12/13] usb: mtu3: drop CONFIG_OF
Date: Mon, 22 Mar 2021 11:13:51 +0800
Message-ID: <1616382832-28450-12-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_032433_505118_FC60C187 
X-CRM114-Status: GOOD (  13.23  )
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
 drivers/usb/mtu3/mtu3_plat.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index d44d5417438d..7786a95a874e 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -502,25 +502,20 @@ static const struct dev_pm_ops mtu3_pm_ops = {
 
 #define DEV_PM_OPS (IS_ENABLED(CONFIG_PM) ? &mtu3_pm_ops : NULL)
 
-#ifdef CONFIG_OF
-
 static const struct of_device_id mtu3_of_match[] = {
 	{.compatible = "mediatek,mt8173-mtu3",},
 	{.compatible = "mediatek,mtu3",},
 	{},
 };
-
 MODULE_DEVICE_TABLE(of, mtu3_of_match);
 
-#endif
-
 static struct platform_driver mtu3_driver = {
 	.probe = mtu3_probe,
 	.remove = mtu3_remove,
 	.driver = {
 		.name = MTU3_DRIVER_NAME,
 		.pm = DEV_PM_OPS,
-		.of_match_table = of_match_ptr(mtu3_of_match),
+		.of_match_table = mtu3_of_match,
 	},
 };
 module_platform_driver(mtu3_driver);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
