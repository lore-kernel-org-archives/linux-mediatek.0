Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E199BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PH5MlQkX1vfTuM0DyKocMubRbjVs/VkhnC6ZaRTKlDY=; b=YNEF4GffOukq03+4p9BsXQW9xP
	hPlK6zBjdby/ScQqlzfdcBX0vWaBWI0gkrb15soVfRgK1FLCTsK4+/2ElNd5rhmtOhdwctsP+8+Uj
	e3+4uKUhiDU2Qlc5St0x5TT4jBkESFEhM4H5FCvlr5GkxzDrJDrjRend7S9HeS3X0CBe2BtJ+wYju
	Do1Lg1avQVRQZObBHVS8mLUaWYFGmVHOz5sw7VJfARAVBylgzRXQzp+weuG8mTdYkQz8Kgh6pJycA
	xJxjDzsHRAdbJOwX4MD+QMd+uGq5IoeKTN5zJmN0/Ef/ZXQhTFPxXYjmQjMrGe1FcUyyPpmjdrFfL
	v0hhOr2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4i-003kJs-U6; Thu, 29 Sep 2022 15:03:44 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4V-003kCJ-ST
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 15:03:35 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mdc404HpMzpVST;
	Thu, 29 Sep 2022 23:00:32 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 23:03:25 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 23:03:24 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>,
	<ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<patches@opensource.cirrus.com>
Subject: [PATCH v2 -next 4/4] ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
Date: Thu, 29 Sep 2022 23:06:53 +0800
Message-ID: <20220929150653.63845-5-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220929150653.63845-1-zhangqilong3@huawei.com>
References: <20220929150653.63845-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_080332_112942_092B8176 
X-CRM114-Status: UNSURE (   8.68  )
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

Fixes:f289e55c6eeb4 ("ASoC: Add MediaTek MT6660 Speaker Amp Driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- call pm_runtime_disable when error returns
---
 sound/soc/codecs/mt6660.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index 4971cd0b90f8..36220a1f80a6 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -509,6 +509,9 @@ static int mt6660_i2c_probe(struct i2c_client *client)
 	ret = devm_snd_soc_register_component(chip->dev,
 					       &mt6660_component_driver,
 					       &mt6660_codec_dai, 1);
+	if (ret)
+		pm_runtime_disable(chip->dev);
+
 	return ret;
 probe_fail:
 	_mt6660_chip_power_on(chip, 0);
-- 
2.25.1


