Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30953C88CB2
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Sep 2023 03:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cM4IStufA0BLNJ/UhR94eCNXVQgunVRIYKEJ0giS/g=; b=grfzHSWypZ7f1f3qD90y7SEB2H
	E0ZDRB9b4wSvY3pKfYC/gjqK037jJOANMaV/UjHoinZ1EwE5dGkUoc/+7zn93j7hzNmnkbMUZS4vm
	Paw8bTobLY1r054x8nEvMplG1GUVaQoVN1QBeSY+paUkd5hsmTYRMCq3bSvwgV8ndQ/vNFXHCst4Q
	CoiX9qM1SLOsNRKsWv1cklJdNLonK01wdpNa2ftVoESJpeITU5EXTn10IXWgpQ8Wz1f/wjExalqNI
	RNOPIND5EqmGfll6ZD0c4+LaRwch+rzdWhUaA6zFDgGrLFpJjZ3gxfi2A+3p0qz3VY/wHrRfzk6Vq
	dLl1qsDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNy-0021Q0-0O;
	Sun, 03 Sep 2023 03:02:50 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNt-0021N1-2Y;
	Sun, 03 Sep 2023 03:02:47 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Rdc0y55tHzNmWG;
	Sun,  3 Sep 2023 10:58:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sun, 3 Sep
 2023 11:02:36 +0800
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
Subject: [PATCH wireless-next v2 3/3] wifi: mt76: Drop unnecessary error check for debugfs_create_dir()
Date: Sun, 3 Sep 2023 11:02:16 +0800
Message-ID: <20230903030216.1509013-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230903030216.1509013-1-ruanjinjie@huawei.com>
References: <20230903030216.1509013-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_200246_022890_5F7D2433 
X-CRM114-Status: UNSURE (   9.28  )
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

debugfs_create_dir() returns ERR_PTR and never return NULL.

As Russell suggested, this patch removes the error checking for
debugfs_create_dir(). This is because the DebugFS kernel API is developed
in a way that the caller can safely ignore the errors that occur during
the creation of DebugFS nodes. The debugfs APIs have a IS_ERR() judge in
start_creating() which can handle it gracefully. So these checks are
unnecessary.

Fixes: 17f1de56df05 ("mt76: add common code shared between multiple chipsets")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Update the commit message and title.
---
 drivers/net/wireless/mediatek/mt76/debugfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index 57fbcc83e074..ae83be572b94 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -109,8 +109,6 @@ mt76_register_debugfs_fops(struct mt76_phy *phy,
 	struct dentry *dir;
 
 	dir = debugfs_create_dir("mt76", phy->hw->wiphy->debugfsdir);
-	if (!dir)
-		return NULL;
 
 	debugfs_create_u8("led_pin", 0600, dir, &phy->leds.pin);
 	debugfs_create_u32("regidx", 0600, dir, &dev->debugfs_reg);
-- 
2.34.1


