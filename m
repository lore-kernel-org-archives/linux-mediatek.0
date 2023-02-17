Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE43C64ED6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 08:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lSXcIVMG2NL2r1KRbSiC1Mth9Nu4sWcvnPNoXff+WB8=; b=HD9s8ehD9Qfzx+uJZpUa3rSODP
	1xz4maK3VCBIS0oLnry0ozy5/kMyePqWu1suqnfAiKgU90wbH1xONffh1LeEgU05gtqH3VT6p9kWI
	q5+aNUSVoBejq/3v18uoiwZpVVKBAsmiKU6/VBehbFn5roZXHcIIY36lZaPgGe4tR5BNtbZkr309c
	wK4ZPh6PyoU7PhDbB04pOqLrTp0nn6TEv5lJ4BNQLMYQ7lMNVyG4eBQJZE9Kt1tc/1d1F4XQd1uxd
	Gc2hn6A23yp+9r3/q+kNFosi/Z8r76SEpV5Xi9Ikwcebx7w/+RCrqTUS3DqcN2ptpM1ippK7KbRFB
	emyDI4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhu-00DCHf-OU; Fri, 17 Feb 2023 08:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSvhY-00DC6p-Hh
	for linux-mediatek@bombadil.infradead.org; Fri, 17 Feb 2023 08:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=lSXcIVMG2NL2r1KRbSiC1Mth9Nu4sWcvnPNoXff+WB8=; b=AF1l6Q8OK6CF/+JUVMZYD4VpdU
	mZnvXvaqDb/IwHSLq+tJ5wQjguOpgTXj6so4DDmSD42KPTRdDSn/Lgc5gNWZ8WE7sBffSVhq7LfhM
	d76ANvyGWjLOFUv8ZES1NCG+5lFvbsQM/aELRu1WGtEevIgOfyYxGQrKqFo8y1r2JUhYhAUmsa5lr
	+hk+IXZTvuhJEJLoU9qUhBc/A9Wzi3KZRQfF3DSSjUy+QEkKwIlC/I/yDj2iAB4fyXMcydfWFfhZx
	L0vVsOydvaD+/ldm9w+JFf4cdb8H1izeGBacxpCudlF02qy/xgPR1ROfBKnhOEoa6vEkDKFxTAiun
	8Lwx+ABg==;
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pSueg-00AY0b-1p
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Feb 2023 06:56:23 +0000
Received: from dggpemm100007.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4PJ2b64rpRz16NlB;
	Fri, 17 Feb 2023 14:53:38 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm100007.china.huawei.com
 (7.185.36.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Fri, 17 Feb
 2023 14:56:01 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: <ryder.lee@mediatek.com>, <howard-yh.hsu@mediatek.com>, <nbd@nbd.name>,
	<yangyingliang@huawei.com>, <liwei391@huawei.com>
Subject: [PATCH -next] wifi: mt76: mt7915: fix missing mutex_unlock() in mt7915_thermal_temp_store()
Date: Fri, 17 Feb 2023 14:55:18 +0800
Message-ID: <20230217065518.176911-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm100007.china.huawei.com (7.185.36.116)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_065621_558381_E765F0E8 
X-CRM114-Status: UNSURE (   5.78  )
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

Add missing mutex_unlock() before return from mt7915_thermal_temp_store()
in the error path.

Fixes: ecaccdae7a7e ("wifi: mt76: mt7915: rework mt7915_thermal_temp_store()")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 1ab768feccaa..728150b35537 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -89,6 +89,7 @@ static ssize_t mt7915_thermal_temp_store(struct device *dev,
 	     val < phy->throttle_temp[MT7915_CRIT_TEMP_IDX])) {
 		dev_err(phy->dev->mt76.dev,
 			"temp1_max shall be greater than temp1_crit.");
+		mutex_unlock(&phy->dev->mt76.mutex);
 		return -EINVAL;
 	}
 
-- 
2.25.1


