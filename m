Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF07FC83F01
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 14:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t5o3PX5vLRTzQYBNR5wYW4OBy3PNFlQ+qw2iHnaAIIg=; b=gyG9TCszrnPLA8aCxGI734oGQI
	wc92FtkitwHo+MHs8DUiJlbPaywWJ7wBSVQlp/2VG9T+vX7tqUPdzPnsnixL1G7PYIa+qfHvx4K0v
	CfHkoQ3DNECWrJECwd0PFkPea6ZH+gKIQhEJqPDzzi7RhmtJpFsRS22sT8Ru0fYa99KhtpOcY+uhn
	0b9kJQ3FrnrYcljQGo0kA5dasiGqAi2eydIstkW9rcGKjsCMemnjCZsvRtdUmmaW60pgVxAnNVs0Q
	+Zx7jtHljcr/wYj01qIdgP/hnxj1Et0GAiIz0LI2g4aY3kOsIii7cFMm/3thDFCgyXIcD8z+64CeL
	WlfFE+Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiR8-00FQKi-13;
	Thu, 31 Aug 2023 14:14:18 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiQu-00FQG5-0R;
	Thu, 31 Aug 2023 14:14:05 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Rc35J0JTxz1L9Rm;
	Thu, 31 Aug 2023 22:12:20 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 31 Aug
 2023 22:13:59 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregory.greenman@intel.com>, <kvalo@kernel.org>,
	<briannorris@chromium.org>, <nbd@nbd.name>, <lorenzo@kernel.org>,
	<ryder.lee@mediatek.com>, <shayne.chen@mediatek.com>,
	<sean.wang@mediatek.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <avraham.stern@intel.com>,
	<johannes.berg@intel.com>, <emmanuel.grumbach@intel.com>, <trix@redhat.com>,
	<dmantipov@yandex.ru>, <christophe.jaillet@wanadoo.fr>,
	<yangyang@marvell.com>, <linville@tuxdriver.com>, <rramesh@marvell.com>,
	<akarwar@marvell.com>, <nishants@marvell.com>,
	<linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Yogesh Ashok Powar
	<yogeshp@marvell.com>, Frank Huang <frankh@marvell.com>, Kiran Divekar
	<dkiran@marvell.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net 2/3] mwifiex: debugfs: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()
Date: Thu, 31 Aug 2023 22:13:46 +0800
Message-ID: <20230831141347.3166988-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230831141347.3166988-1-ruanjinjie@huawei.com>
References: <20230831141347.3166988-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_071404_372636_D2505F58 
X-CRM114-Status: UNSURE (   9.48  )
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

Since debugfs_create_dir() returns ERR_PTR and never return NULL, So use
IS_ERR() to check it instead of checking NULL.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/wireless/marvell/mwifiex/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/debugfs.c b/drivers/net/wireless/marvell/mwifiex/debugfs.c
index f9c9fec7c792..a1e074b6d539 100644
--- a/drivers/net/wireless/marvell/mwifiex/debugfs.c
+++ b/drivers/net/wireless/marvell/mwifiex/debugfs.c
@@ -970,7 +970,7 @@ mwifiex_dev_debugfs_init(struct mwifiex_private *priv)
 	priv->dfs_dev_dir = debugfs_create_dir(priv->netdev->name,
 					       mwifiex_dfs_dir);
 
-	if (!priv->dfs_dev_dir)
+	if (IS_ERR(priv->dfs_dev_dir))
 		return;
 
 	MWIFIEX_DFS_ADD_FILE(info);
-- 
2.34.1


