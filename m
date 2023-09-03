Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F0DC83F33
	for <linux-mediatek@archiver.kernel.org>; Sun,  3 Sep 2023 03:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rw3r9+g/WKHWW1wvTQcopBqUB/kdAIeJk9jWEWz0hME=; b=nmy8OY4qrhzfwk8NoB6kztg3nr
	ApsnEWJmIVCS7kvFLCTxOzltndoouWht0yCQTsqYr96uVT4r6P12ZMFwm5syKbFy1NsKBeH0c+xlj
	b4YNfm+kh6zigBvZq26kREe+prmZgBzzw79443yrH7b5m+OkO2t2T1x4bt/Oat5qSbD4CI2x4gPdN
	jwW9pAhMdQr837GOL5KLe1yu6wIAeSk0ZOssL4EZED08z659TWDI7B9LHdJUKnbKQaYgJG71m1NCj
	I7sqAa4pk3w7WWid6nW+zUx/K6yQZi9KT8yxEzqqlnU02MaoDE9vygpWNU/5ziDLnWng9x1KQ1urm
	5U1JsKTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNw-0021Oe-11;
	Sun, 03 Sep 2023 03:02:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcdNr-0021MN-1N;
	Sun, 03 Sep 2023 03:02:45 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Rdc346M7BzrS4M;
	Sun,  3 Sep 2023 11:00:48 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Sun, 3 Sep
 2023 11:02:32 +0800
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
Subject: [PATCH wireless-next v2 1/3] wifi: iwlwifi: mei: Drop unnecessary error check for debugfs_create_dir()
Date: Sun, 3 Sep 2023 11:02:14 +0800
Message-ID: <20230903030216.1509013-2-ruanjinjie@huawei.com>
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
X-CRM114-CacheID: sfid-20230902_200243_657239_95BE7E09 
X-CRM114-Status: UNSURE (   9.43  )
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

Fixes: 4ea7da5fad43 ("iwlwifi: mei: add debugfs hooks")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
---
v2:
- Remove the err check instead of using IS_ERR to replace NULL check.
- Update the commit message and title.
---
 drivers/net/wireless/intel/iwlwifi/mei/main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mei/main.c b/drivers/net/wireless/intel/iwlwifi/mei/main.c
index 1dd9106c6513..3e25c78a8d58 100644
--- a/drivers/net/wireless/intel/iwlwifi/mei/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/mei/main.c
@@ -1894,9 +1894,6 @@ static void iwl_mei_dbgfs_register(struct iwl_mei *mei)
 {
 	mei->dbgfs_dir = debugfs_create_dir(KBUILD_MODNAME, NULL);
 
-	if (!mei->dbgfs_dir)
-		return;
-
 	debugfs_create_ulong("status", S_IRUSR,
 			     mei->dbgfs_dir, &iwl_mei_status);
 	debugfs_create_file("send_start_message", S_IWUSR, mei->dbgfs_dir,
-- 
2.34.1


