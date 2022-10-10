Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19AD0C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Oct 2022 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOsjH3QIu/JDOFUBFj4IgVqtXxwMYvOUKoxYzUNQD+U=; b=dKZ/e0ZL6+dBqE15LB3MA8DmAj
	pkO98N2GN4oPPIFIwTu95Wpyr1iy0f0REQgDJ4TlXA22YotQIjuXD59wimtlAn6FxnlclgcLbt/jj
	ALyaYxGf9+qqkQ0sL15IsYHndqMA85tZiRNonMDosn2PIbh436+a3YPMHENgV26JuOHGF4gjnHlpg
	wp6SPuo4PvX01gjAeWkguvnANlldXvRZpIBIY6scPyedy1KjTrJ5l1h0T5GPlwDb/aA68nQHvYYBs
	LvDKRsRw3ZlaFlJIlkXsNEhZQBkmU5XvH7+LlrE/cpiIjHZr3zVryRp+ezurNfjyoXrhlcNtBSJDm
	CiXXzzVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrCK-000faM-W7; Mon, 10 Oct 2022 11:43:53 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohrCI-000fZB-DW
	for linux-mediatek@lists.infradead.org; Mon, 10 Oct 2022 11:43:52 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MmH4n4CWbzVj02;
	Mon, 10 Oct 2022 19:39:21 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 10 Oct 2022 19:43:45 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 10 Oct
 2022 19:43:44 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>,
	<ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>,
	<ckeepax@opensource.cirrus.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<patches@opensource.cirrus.com>
Subject: [PATCH v2 -next 0/3] ASoC: wmxxxx: Revert old "ASoC: wmxxxx: Fix PM disable depth imbalance in wmxxxx_probe"
Date: Mon, 10 Oct 2022 19:48:49 +0800
Message-ID: <20221010114852.88127-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_044350_654429_C39C872B 
X-CRM114-Status: UNSURE (   5.18  )
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

Both the old and new patch have been applied, it will resulted in
redundant calling of pm_runtime_disable when error returns. We Just
revert the old three patches to fix it.
---
v2:
- add subject for the patch title

Zhang Qilong (3):
  ASoC: wm5102: Revert "ASoC: wm5102: Fix PM disable depth imbalance in
    wm5102_probe"
  ASoC: wm5110: Revert "ASoC: wm5110: Fix PM disable depth imbalance in
    wm5110_probe"
  ASoC: wm8997: Revert "ASoC: wm8997: Fix PM disable depth imbalance in
    wm8997_probe"

 sound/soc/codecs/wm5102.c | 6 +++---
 sound/soc/codecs/wm5110.c | 6 +++---
 sound/soc/codecs/wm8997.c | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.25.1


