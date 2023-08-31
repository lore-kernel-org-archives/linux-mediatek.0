Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7720DC83F10
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Aug 2023 14:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G7SEKop7AZcwW/MpyjkOjnqeOzqAva3DVMV8Ep8Cjy8=; b=yj+WXQoSwNhpNokDRe2ywFz5tS
	Dc1v7DrReTL4aE8hEJc30umCE1QEszNrvWVr6JESVbZ3yBc2xxmuCD7BVNfRDNr+UHiH2VKWErT5N
	FKfQJfEMIdBdxR3G/RD6P2QL1OzHweo3nh0XWqOiLRz8Hgtj1w8J5gKwTZpjSwk9KH6iuAJEkaEya
	BqagvnMFcdDNhNDj2ThfNNkM29wqMhSaZ/HQ+X+bRvld/aT1Du5o7hjRxcAVzp56oi4mdTWit3Wz8
	Xng3fgXQwth5h8qXXvEE3a8kRL+By5pdKLJAgcxpBy1AIuulHEJ0m9jsOL9akXgcv+j1UZlLalBxw
	3QLiutqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiQu-00FQHb-2u;
	Thu, 31 Aug 2023 14:14:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbiQr-00FQG3-0j;
	Thu, 31 Aug 2023 14:14:02 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rc32y5KCGzNn4G;
	Thu, 31 Aug 2023 22:10:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 31 Aug
 2023 22:13:55 +0800
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
	<linux-mediatek@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH net 0/3] wifi: Fix the NULL vs IS_ERR() bugs for debugfs_create_dir()
Date: Thu, 31 Aug 2023 22:13:44 +0800
Message-ID: <20230831141347.3166988-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_071401_436211_77CDFDB2 
X-CRM114-Status: UNSURE (   6.21  )
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

Jinjie Ruan (3):
  wifi: iwlwifi: mei: Fix the NULL vs IS_ERR() bug for
    debugfs_create_dir()
  mwifiex: debugfs: Fix the NULL vs IS_ERR() bug for
    debugfs_create_dir()
  wifi: mt76: Fix the NULL vs IS_ERR() bug for debugfs_create_dir()

 drivers/net/wireless/intel/iwlwifi/mei/main.c  | 2 +-
 drivers/net/wireless/marvell/mwifiex/debugfs.c | 2 +-
 drivers/net/wireless/mediatek/mt76/debugfs.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.34.1


