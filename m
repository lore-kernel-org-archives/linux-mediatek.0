Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B212C83F3F
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Sep 2023 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7u5DiSwg0fUIFvf6tzSUls9VYb2mL1xuTYP9dH+5zfQ=; b=LF7elhWwy96/ebVyCn+6184bvK
	1EhUvkLj6ykv6F7wTKhAQ87hKUx3JrnGBmTPpYKNp8YXBIiJeZsQI9j3SJLfOYJ69/RV36Edulaje
	+oqN3R2IerOSTC4zKzIPVU8AD8CalUY/kZHfEBea6jpnp9CHxHxfU6jJn90HwWtRfO4vfyr7K22Lk
	56paxZdI6bqIbkcRkypqeto97BPQDWNMTY62g5bjvu5VIFavcX9+psIgK/HuNsAqQa/X00tKfSi3H
	eUnVj3TP5zHdCshq9Ye8RX63yyHMbq3sfwAdv4uB9XCJCojo/FyefKxZMBDxT6TW8vmjKFTZcYcRL
	yDtxQ2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNx-0021PM-0R;
	Sun, 03 Sep 2023 03:02:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNr-0021MK-1c;
	Sun, 03 Sep 2023 03:02:46 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Rdc0S3z3QztRrs;
	Sun,  3 Sep 2023 10:58:32 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sun, 3 Sep
 2023 11:02:27 +0800
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
Subject: [PATCH wireless-next v2 0/3] wifi: Drop unnecessary error checks for debugfs_create_dir()
Date: Sun, 3 Sep 2023 11:02:13 +0800
Message-ID: <20230903030216.1509013-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_200243_736154_917864CB 
X-CRM114-Status: UNSURE (   8.01  )
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

debugfs_create_dir() returns ERR_PTR and never returns NULL.

As Russell suggested, this patch set removes the error checking for
debugfs_create_dir(). This is because the DebugFS kernel API is developed
in a way that the caller can safely ignore the errors that occur during
the creation of DebugFS nodes. The debugfs APIs have a IS_ERR() judge in
start_creating() which can handle it gracefully. So these checks are
unnecessary.

Changes in v2:
- Update the subject prefix from net to wireless-next as suggested.
- Remove the err check instead of using IS_ERR to replace NULL check.
- Update the commit message and title.

Jinjie Ruan (3):
  wifi: iwlwifi: mei: Drop unnecessary error check for
    debugfs_create_dir()
  mwifiex: debugfs: Drop unnecessary error check for
    debugfs_create_dir()
  wifi: mt76: Drop unnecessary error check for debugfs_create_dir()

 drivers/net/wireless/intel/iwlwifi/mei/main.c  | 3 ---
 drivers/net/wireless/marvell/mwifiex/debugfs.c | 3 ---
 drivers/net/wireless/mediatek/mt76/debugfs.c   | 2 --
 3 files changed, 8 deletions(-)

-- 
2.34.1


