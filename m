Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02801C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 05:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RR4ey2lK6zQqZzHRXPwkpTEA7UULEXiy4VXvdfThfaY=; b=RvKQsy/zgF7qzo9ZjWvQUmKKNN
	PFxaV4gguRXYj8K7UQasxIZHHsN8ic4S3ZPajJDxFv//lDlcEF5kDZAnS0L+6s/WPTwCmICff4aMw
	KK5QYYmB2EY/Twh3k29GmWHwINsfvpWjOs8EuAeP47nSXYxmRMVuM50t8UgRSdfGCKf2u1/LfAcyp
	zdphV5s4rk0vb1LT4xBzZl3MiPqt+wQRMWPd+KkFOwsfd2w9SjdLk0gacS0PTVY5/CxXojTFiKb+v
	4R9gg8qWALIVkYxjuVI8/ZPf1ERVQD4zawr1eFdPOIDjQFhBcPq16EZze57kqPuHZKvVkQNTrVIIC
	E4c5W6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o649I-004T9F-QE; Tue, 28 Jun 2022 05:52:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o647L-004SG4-4j; Tue, 28 Jun 2022 05:50:32 +0000
X-UUID: b04c7448f0dd4a5b8405c1cb6367e8b7-20220627
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:a7304ccb-c047-4e9c-889b-6a1c9b81ec2f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:12eff485-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b04c7448f0dd4a5b8405c1cb6367e8b7-20220627
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1843666485; Mon, 27 Jun 2022 22:50:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 10:12:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 28 Jun 2022 10:12:46 +0800
From: <peter.wang@mediatek.com>
To: <matthias.bgg@gmail.com>, <len.brown@intel.com>, <pavel@ucw.cz>,
	<rafael@kernel.org>, <gregkh@linuxfoundation.org>,
	<stanley.chu@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<martin.petersen@oracle.com>, <avri.altman@wdc.com>,
	<alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<peter.wang@mediatek.com>, <chun-hung.wu@mediatek.com>,
	<alice.chao@mediatek.com>, <cc.chou@mediatek.com>,
	<chaotian.jing@mediatek.com>, <jiajie.hao@mediatek.com>,
	<powen.kao@mediatek.com>, <qilin.tan@mediatek.com>, <lin.gui@mediatek.com>,
	<tun-yu.yu@mediatek.com>
Subject: [PATCH v2] PM-runtime: Check supplier_preactivated before release supplier
Date: Tue, 28 Jun 2022 10:12:44 +0800
Message-ID: <20220628021244.17281-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225031_244901_9C25C805 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

From: Peter Wang <peter.wang@mediatek.com>

With divice link of DL_FLAG_PM_RUNTIME, if consumer call pm_runtime_get_suppliers
to prevent supplier enter suspend, pm_runtime_release_supplier should
check supplier_preactivated before let supplier enter suspend.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/base/power/runtime.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 676dc72d912d..08bbc4561e60 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -337,8 +337,10 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 	struct device_link *link;
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
-				device_links_read_lock_held())
-		pm_runtime_release_supplier(link, try_to_suspend);
+				device_links_read_lock_held()) {
+		if (!link->supplier_preactivated)
+			pm_runtime_release_supplier(link, try_to_suspend);
+	}
 }
 
 static void rpm_put_suppliers(struct device *dev)
-- 
2.18.0


