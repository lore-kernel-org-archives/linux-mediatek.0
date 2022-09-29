Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E9DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mm59cYXyPDT4FgMMLlTWzrEMazQhWF//z8fykkm0x4E=; b=z9Qt+Wv8zQnEMT7BwGfXzIgeNA
	wcRNOWyEEwdjGC72/uJWJbeWmmaQsBC0Aa/3RCPD1mcfdSaRpR58dIOUkLofVF+cCDXKbmZOjgQmr
	nZUjJP55qSerwGOn4kBgy/jM2T5G8gFEv/k4H7Ap5bZBojHxvqL/tOaWCrYxR81Msuw22ViBDiK1l
	QJqKOH+NAtnXRJ2dLUwXVGU21NeoF2I8p7ztVqPGrN3oFD7yvNM9b6OYtp1thnL4NnjjeddHpRktB
	BWdrKFvVHPm6AVOKlfc3GG91dsNj5A5blKMEUm7CdIV9GxyMq3ifVrJLUCnwmpnJpm9kkQe0wQ+SM
	uQLHXD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4h-003kIp-Mu; Thu, 29 Sep 2022 15:03:43 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4U-003kAa-Qt
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 15:03:33 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mdc1l0qGkzHth2;
	Thu, 29 Sep 2022 22:58:35 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 23:03:23 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 23:03:22 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>,
	<ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<patches@opensource.cirrus.com>
Subject: [PATCH v2 -next 0/4] Fix PM disable depth imbalance in probe
Date: Thu, 29 Sep 2022 23:06:49 +0800
Message-ID: <20220929150653.63845-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_080331_068531_9321981A 
X-CRM114-Status: UNSURE (   5.59  )
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

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context. We fix it by calling
pm_runtime_disable when error returns.
---
v2:
- call pm_runtime_disable when error returns.

Zhang Qilong (4):
  ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
  ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
  ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
  ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe

 sound/soc/codecs/mt6660.c | 3 +++
 sound/soc/codecs/wm5102.c | 1 +
 sound/soc/codecs/wm5110.c | 1 +
 sound/soc/codecs/wm8997.c | 1 +
 4 files changed, 6 insertions(+)

-- 
2.25.1


