Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE3FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:05:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D2126198C
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 07:05:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D2126198C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EgYI/GK6Jdey27bkZj328HrN1DrAOqhMxHEyxNYl29I=; b=HbaWrO587IizA4FfSKGaydcr0
	1zoD645NOknDVRrD0R0bd88822fqbyu8bA7/Sbq+RZSjpJ7NZbNl9QgZBgl2MAFj4pg8cj0e+v+VT
	guzVGEEjZtEXkXbe+Ela6ia0+9huEBPj7mAa154GPRXgVVEX0IOjLY5wOBnXBrvb3pXfvF1IJFyK3
	XLCzzlAMAG1w96mCmKrJuMYI1rhMj9j2EmsxcBqjiY9e2KPD3UItM/ZUmNHXmjCyXtt2imceIcr4s
	ifEvQJAJXKJdFm9pPbJ3zlmJOmwXRyUjGdRm4OM0UIpQC8lEmvUnvIRoARFQ/63/GgESrIV4WVbfn
	uTmKbYAlQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOb5p-00E3ES-46; Tue, 23 Mar 2021 07:04:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOb4g-00E2jA-AT; Tue, 23 Mar 2021 07:03:36 +0000
X-UUID: 11b7c1237ccb4d5895f32e886e85bb09-20210322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=sshDb7k+nmzg1Qa6SkywW+3mzG3tRba1OA8k8ay5xyE=; 
 b=uTW5w7CfayIIar3nnU9RW+zI/q5mwV1jIEl2UT3c/GIkMiGwcHjQtSU9JkslTXQC8gVtw5tE8e397qd7M8QsApYk77jpig5+94p49zwE/qq1mbToyUCa/27nVsXeEuKSLvumMvfgJJhbOuF0EkPlAbOBj0Hm+xEhDSRvhNWF7LQ=;
X-UUID: 11b7c1237ccb4d5895f32e886e85bb09-20210322
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1332267807; Mon, 22 Mar 2021 23:03:21 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 00:03:19 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 23 Mar 2021 15:03:19 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Mar 2021 15:03:18 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>, "Nicolas
 Boichat" <drinkcat@chromium.org>
Subject: [PATCH v2 12/13] usb: mtu3: drop CONFIG_OF
Date: Tue, 23 Mar 2021 15:02:54 +0800
Message-ID: <1616482975-17841-12-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1616482975-17841-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_070335_009958_66FC1CE2 
X-CRM114-Status: GOOD (  13.77  )
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
