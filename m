Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3C6C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yKcCkKE/2oX6IpGSK03HcK6vdcvNJB2ouQUMEBDAy3U=; b=NEAbwex2r25zZ0iZHdOsGz7fbL
	zxoD2KRPXCc3thtj/mOGWQA5sFA2TCXxCHLtRHC7RdEUhuUpOoFemQkl6oCFXq1BN9vo92i5LYNci
	Us7wQX5RPWEbiBGz3uJQ7/UkxQ75ArKzdlj9Gw9aZF/t2i1IHrDCs+ShBD145rMuDtv3M0euZBNtf
	l4pmRyrClkmGiB/weww4AD0dol+qxhZeP9k13kLzpOkP4ph46kBqXF8UGu92k82dtXbFS9JPCVDvw
	NGYf4Ro2Uh69SNPr0UZWatS1mco92aABW8zhU20DA8n2bmusoKNen8AZfCOgqIX9CP+P7d3kgqJGZ
	w1QGRjQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwHt-00Cg4A-26;
	Thu, 27 Jul 2023 08:23:57 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOwHp-00Cg2w-1l;
	Thu, 27 Jul 2023 08:23:55 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4RBNzL3sg7zVjtB;
	Thu, 27 Jul 2023 16:22:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 16:23:41 +0800
From: Ruan Jinjie <ruanjinjie@huawei.com>
To: <sre@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <agross@kernel.org>,
	<andersson@kernel.org>, <konrad.dybcio@linaro.org>,
	<linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] power: supply: Remove redundant dev_err_probe()
Date: Thu, 27 Jul 2023 16:23:01 +0800
Message-ID: <20230727082301.741821-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_012353_792868_862E5D15 
X-CRM114-Status: UNSURE (   9.90  )
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

There is no need to call the dev_err_probe() function directly to print
a custom message when handling an error from platform_get_irq_byname()
function as it is going to display an appropriate error message
in case of a failure.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/power/supply/mt6370-charger.c       | 4 +---
 drivers/power/supply/qcom_pmi8998_charger.c | 3 +--
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/power/supply/mt6370-charger.c b/drivers/power/supply/mt6370-charger.c
index f27dae5043f5..571cf00dde07 100644
--- a/drivers/power/supply/mt6370-charger.c
+++ b/drivers/power/supply/mt6370-charger.c
@@ -849,9 +849,7 @@ static int mt6370_chg_init_irq(struct mt6370_priv *priv)
 		ret = platform_get_irq_byname(to_platform_device(priv->dev),
 					      mt6370_chg_irqs[i].name);
 		if (ret < 0)
-			return dev_err_probe(priv->dev, ret,
-					     "Failed to get irq %s\n",
-					     mt6370_chg_irqs[i].name);
+			return ret;
 
 		priv->irq_nums[i] = ret;
 		ret = devm_request_threaded_irq(priv->dev, ret, NULL,
diff --git a/drivers/power/supply/qcom_pmi8998_charger.c b/drivers/power/supply/qcom_pmi8998_charger.c
index d16c5ee17249..ce7392e7d8b8 100644
--- a/drivers/power/supply/qcom_pmi8998_charger.c
+++ b/drivers/power/supply/qcom_pmi8998_charger.c
@@ -922,8 +922,7 @@ static int smb2_init_irq(struct smb2_chip *chip, int *irq, const char *name,
 
 	irqnum = platform_get_irq_byname(to_platform_device(chip->dev), name);
 	if (irqnum < 0)
-		return dev_err_probe(chip->dev, irqnum,
-				     "Couldn't get irq %s byname\n", name);
+		return irqnum;
 
 	rc = devm_request_threaded_irq(chip->dev, irqnum, NULL, handler,
 				       IRQF_ONESHOT, name, chip);
-- 
2.34.1


