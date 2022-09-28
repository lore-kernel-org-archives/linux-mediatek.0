Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744FCC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hoDW28LbN9wh88TfKRfQ8Y8Bs6SZAqPa3+dXOv5I+EM=; b=fjxsIK58UH2aRiWphhkLlNZ6oF
	bVE8mHbJjZrsGfYjYVpifyjx0+lCdmmJzfXBGboXLr5bWReRXx34HYBhqSzTubDKEiHi2eXz6AEOc
	kbfM/Cdl6kjLFWbzymy6Hq/w2Ji878QGQUdg/apwVjUWTNAyMq5WGroEtHo0WRPLiDu3PQuud0yU5
	/gDhP5HG+9W44AAJr4zHXn/177p+Bz0gHas4hpyo0KBtlq5sn75AzJLPnF5WgCeY17cx43JUG7sIl
	dhcLZ3hjBdXj/GjThzvnGWh7IJm956Y1yyNqJQpmbsUk4hn69u3IuPr87OzRrM2p3HvVS2AqCMI1g
	5ImfBfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZSc-00H1Fk-Mu; Wed, 28 Sep 2022 15:58:58 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZRZ-00H0TX-2N
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 15:57:55 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Md1Hm15HzzWgnq;
	Wed, 28 Sep 2022 23:53:40 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 23:57:46 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 23:57:45 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next 0/4] Fix PM disable depth imbalance in probe
Date: Thu, 29 Sep 2022 00:01:12 +0800
Message-ID: <20220928160116.125020-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085753_352790_AE65F24D 
X-CRM114-Status: UNSURE (   4.25  )
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
keep it balanced according to context. We fix it by moving
pm_runtime_enable to the endding of probe.

Zhang Qilong (4):
  ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
  ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
  ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
  ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe

 sound/soc/codecs/mt6660.c | 8 ++++++--
 sound/soc/codecs/wm5102.c | 6 +++---
 sound/soc/codecs/wm5110.c | 6 +++---
 sound/soc/codecs/wm8997.c | 6 +++---
 4 files changed, 15 insertions(+), 11 deletions(-)

-- 
2.25.1


