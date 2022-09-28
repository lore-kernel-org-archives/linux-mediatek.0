Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F148FC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9vLZ0bJxgRTzZOiGjvk0UYH7mx/pwKm8D1xn7l8y9s=; b=1FzASmPPmHHdkCquY1H65O1y10
	K8O4f0enJcwf5Fl+e3l6u4gvXBRrVgHVr3KKv6qaujHDo8rFOudIQ1lfsLzHJT65AGRq26I0zVjFR
	A3nGL+WZx62D1YlQ3OTEXEuV3G+d40K0OuTL79RbU/UHB4ngTSSvEG9BNqVgq1UDmipVD2MUeusQR
	mbjg836RScHfxa9x8x8/YJpZ+YaVZN3jijizI32fz5DrL8tF7ENnG5OUIVj73qqrm25XRUKYWXxik
	d32HnkL3hwXif2dHSTFcm4fd1im9BN8HZZFXyOrYuTsblhC8lf5NHVPmzupRHQVieDb8KWLSNTcYp
	ueZoxzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZSl-00H1LV-1T; Wed, 28 Sep 2022 15:59:07 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odZRa-00H0UQ-DA
	for linux-mediatek@lists.infradead.org; Wed, 28 Sep 2022 15:57:56 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Md1Kt4jnhzHqKp;
	Wed, 28 Sep 2022 23:55:30 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 23:57:47 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 28 Sep
 2022 23:57:47 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next 4/4] ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
Date: Thu, 29 Sep 2022 00:01:16 +0800
Message-ID: <20220928160116.125020-5-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220928160116.125020-1-zhangqilong3@huawei.com>
References: <20220928160116.125020-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_085754_702178_3AD13C37 
X-CRM114-Status: UNSURE (   8.41  )
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
pm_runtime_enable to the endding of mt6660_i2c_probe.

Fixes:f289e55c6eeb4 ("ASoC: Add MediaTek MT6660 Speaker Amp Driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/codecs/mt6660.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index 4971cd0b90f8..554c33e8b62f 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -503,13 +503,17 @@ static int mt6660_i2c_probe(struct i2c_client *client)
 		dev_err(chip->dev, "read chip revision fail\n");
 		goto probe_fail;
 	}
-	pm_runtime_set_active(chip->dev);
-	pm_runtime_enable(chip->dev);
 
 	ret = devm_snd_soc_register_component(chip->dev,
 					       &mt6660_component_driver,
 					       &mt6660_codec_dai, 1);
+	if (!ret) {
+		pm_runtime_set_active(chip->dev);
+		pm_runtime_enable(chip->dev);
+	}
+
 	return ret;
+
 probe_fail:
 	_mt6660_chip_power_on(chip, 0);
 	mutex_destroy(&chip->io_lock);
-- 
2.25.1


