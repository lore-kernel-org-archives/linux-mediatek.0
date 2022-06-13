Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C59EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 12:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4xIWoAhyqQHmVZ95oBXR/qjygfQVFePJL+XnEfkGvVM=; b=XDRjS59IVFS0bY
	FAhBpT08Kst1PqtT1Xml+8ZmtMQA1QDoBEDu/npF59hkDJqb7S3ck3i3+San0jLuSoIkEo+t8IZPp
	+c73lqZeI3mdoxQyuY6RA4xyMdIKq8dR3khlTt9RkHxWqqxNtJJxEa13CYsJkcRv1KDWznXbdivc0
	4h71ONm6B18PRO9f3ph5fXVfmWdmqSgxR1WBT/r6+DVeXUIAOBsNp1PcZkhtFEWaJrw/gidz6refd
	5ZY95PEuQ4VNwShWBwbjZOCWI9gumRftmpeWAr4l9L3LWpaVrdbB1hPY7cPO9jb98ctUgYT42fSt1
	saU4IiYMQdIBTnokgxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iyR-003SQ0-7r; Mon, 13 Jun 2022 12:15:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0iy5-003SKR-AG; Mon, 13 Jun 2022 12:14:59 +0000
X-UUID: ea5a1fd6c5184d64ae955e00fa46b727-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:46e255ba-8293-4038-9bec-3b15f9eb6e94,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:cbec8c37-84c0-4f9a-9fbd-acd4a0e9ad0f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ea5a1fd6c5184d64ae955e00fa46b727-20220613
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1905218112; Mon, 13 Jun 2022 05:14:44 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 05:08:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 20:08:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 13 Jun 2022 20:08:06 +0800
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
Subject: [PATCH v1] PM-runtime: Check supplier_preactivated before release supplier
Date: Mon, 13 Jun 2022 20:07:55 +0800
Message-ID: <20220613120755.14306-1-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_051453_402918_9B40BC23 
X-CRM114-Status: GOOD (  15.86  )
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

From: Peter Wang <peter.wang@mediatek.com>

With divice link of DL_FLAG_PM_RUNTIME, if consumer call pm_runtime_get_suppliers
to prevent supplier enter suspend, pm_runtime_release_supplier should
check supplier_preactivated before let supplier enter suspend.

If the link is drop or release, bypass check supplier_preactivated.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/base/core.c          |  2 +-
 drivers/base/power/runtime.c | 15 ++++++++++++---
 include/linux/pm_runtime.h   |  5 +++--
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7cd789c4985d..3b9cc559928f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -486,7 +486,7 @@ static void device_link_release_fn(struct work_struct *work)
 	/* Ensure that all references to the link object have been dropped. */
 	device_link_synchronize_removal();
 
-	pm_runtime_release_supplier(link, true);
+	pm_runtime_release_supplier(link, true, true);
 
 	put_device(link->consumer);
 	put_device(link->supplier);
diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 676dc72d912d..3c4f425937a1 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -314,10 +314,19 @@ static int rpm_get_suppliers(struct device *dev)
  * and if @check_idle is set, check if that device is idle (and so it can be
  * suspended).
  */
-void pm_runtime_release_supplier(struct device_link *link, bool check_idle)
+void pm_runtime_release_supplier(struct device_link *link, bool check_idle,
+	bool drop)
 {
 	struct device *supplier = link->supplier;
 
+	/*
+	 * When consumer hold supplier, supplier cannot enter suspend.
+	 * Driect release supplier and let supplier enter suspend is not allow.
+	 * Unless the link is drop, direct relsease supplier should be okay.
+	 */
+	if (link->supplier_preactivated && !drop)
+		return;
+
 	/*
 	 * The additional power.usage_count check is a safety net in case
 	 * the rpm_active refcount becomes saturated, in which case
@@ -338,7 +347,7 @@ static void __rpm_put_suppliers(struct device *dev, bool try_to_suspend)
 
 	list_for_each_entry_rcu(link, &dev->links.suppliers, c_node,
 				device_links_read_lock_held())
-		pm_runtime_release_supplier(link, try_to_suspend);
+		pm_runtime_release_supplier(link, try_to_suspend, false);
 }
 
 static void rpm_put_suppliers(struct device *dev)
@@ -1838,7 +1847,7 @@ void pm_runtime_drop_link(struct device_link *link)
 		return;
 
 	pm_runtime_drop_link_count(link->consumer);
-	pm_runtime_release_supplier(link, true);
+	pm_runtime_release_supplier(link, true, true);
 }
 
 static bool pm_runtime_need_not_resume(struct device *dev)
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index 9e4d056967c6..354ffb1eaec0 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -88,7 +88,8 @@ extern void pm_runtime_get_suppliers(struct device *dev);
 extern void pm_runtime_put_suppliers(struct device *dev);
 extern void pm_runtime_new_link(struct device *dev);
 extern void pm_runtime_drop_link(struct device_link *link);
-extern void pm_runtime_release_supplier(struct device_link *link, bool check_idle);
+extern void pm_runtime_release_supplier(struct device_link *link,
+	bool check_idle, bool drop);
 
 extern int devm_pm_runtime_enable(struct device *dev);
 
@@ -315,7 +316,7 @@ static inline void pm_runtime_put_suppliers(struct device *dev) {}
 static inline void pm_runtime_new_link(struct device *dev) {}
 static inline void pm_runtime_drop_link(struct device_link *link) {}
 static inline void pm_runtime_release_supplier(struct device_link *link,
-					       bool check_idle) {}
+					       bool check_idle, bool drop) {}
 
 #endif /* !CONFIG_PM */
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
