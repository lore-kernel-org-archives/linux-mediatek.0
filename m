Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43599C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66uBaYt8Xy7lgtFqygB0rNgvl+ILbeWaE5hL6kWPqnQ=; b=ijXYfoF/603q2+Uz+iUM+rlAc2
	OvO6K9pLfYA3N9M+g9DRfOyezvwZIng4Jka07oBZOk5Qiruo7P2Iug+gGkuP6lSQ9d2+Cwa94VkJg
	6BGuVFWmoCsba45PZpkKQdg0jGKVucyX8pveGHVAOrY+TCczTQMHebnIB45orRiBsCGGvGkf3sUyM
	AKRXjAO9oapJyW+rvmjD1jYLTZzw3sWoorh39j+zhpQfV3mUks3k9masa7xAfa2G4l8woGmiAqDU1
	yuEtl8rEWt0JoH8JEHFDIzXFbhoEE8dir5Z+vM8GtmTORTIJzcIiIvdjSFnsVXnPNJ+EHf7OfVxl3
	LEzJn2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4X-003kDo-Ox; Thu, 29 Sep 2022 15:03:33 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odv4U-003kAb-2v
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 15:03:32 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Mdc4f0T3MzHqRp;
	Thu, 29 Sep 2022 23:01:06 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 23:03:24 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 29 Sep
 2022 23:03:23 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
	<tiwai@suse.com>, <matthias.bgg@gmail.com>,
	<ckeepax@opensource.wolfsonmicro.com>, <jeff_chang@richtek.com>
CC: <alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<patches@opensource.cirrus.com>
Subject: [PATCH v2 -next 1/4] ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
Date: Thu, 29 Sep 2022 23:06:50 +0800
Message-ID: <20220929150653.63845-2-zhangqilong3@huawei.com>
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
X-CRM114-CacheID: sfid-20220929_080330_332179_4DA4082D 
X-CRM114-Status: UNSURE (   7.47  )
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

Fixes:40843aea5a9bd ("ASoC: wm8997: Initial CODEC driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- call pm_runtime_disable when error returns
---
 sound/soc/codecs/wm8997.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 210ad662fc26..c0207e9a7d53 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1187,6 +1187,7 @@ static int wm8997_probe(struct platform_device *pdev)
 err_spk_irqs:
 	arizona_free_spk_irqs(arizona);
 err_jack_codec_dev:
+	pm_runtime_disable(&pdev->dev);
 	arizona_jack_codec_dev_remove(&wm8997->core);
 
 	return ret;
-- 
2.25.1


