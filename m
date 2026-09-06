Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8DCC79F99
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 06:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=; b=QvCKhxIeUhMl5luW+Kv6fv8nJ/
	zNgcrvmf+IpsVRB1x1nQw7r8w3fTRSIgnGr0thSs+5FGssviCNN5jp8jvSw1lWCVmbVab4DP+57OC
	jjfzDvVsyDB2ASRl1tdqIyAavQEX/H8iXJ1l5/bUwBM1quEoEURN1FmY0FFE7Du7GXJuDvblm/sG4
	6uASuvYIgBBggEGtN9P1ZzAgtxGbrtYLPWmKox34LXzvAI4MNh8DrbbnR0c1XV407FiTuAFe1DtJr
	pesBn/qyus9cV2Mu8brbbD8wKPLkPqX5Vp1ZkNJiuSYtrkdj3R7vQ3igQRyIuOBMTdfhVQvmZuy89
	IMOMalkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Da-00000004kK7-49Lr;
	Sun, 06 Sep 2026 06:19:06 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36DX-00000004kHA-1mIj
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 06:19:05 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1921769a91.3
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 23:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675542; x=1789280342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=k4UCNb3a4k82GMXF0lz/wWZ2IT12ZpkH1/PVQ23MiXoJdQZ1q0u1I4LM7SfU61ilk5
         eVEFNGZUJsZEqE0u86MkCxiRemKDA+XPuVVhq0c2tqeeNcS0sz2dsI3TXGpBfW6jLQBi
         lKOmRI6sSEFuxzVvapDRxzDwa+pSFbX0JLv+MB3EW9Hq1bYa6F1U6oUBY/bDcLBjemCE
         vUeK8Y3NOOX9qrzLRw7hMIMNnGHaQBvgux+zarXh7SnptcyOp1cVgyJ/bstUev2wn77y
         eLp8xi1ZxFwiU/z9Y0tn8qV5R6zqcPrITe77Nc7A/oSGQevEGI3/Gqy1m5EnggOX9I6v
         4X0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675542; x=1789280342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P29HLotgsQWEFXe03chzciCUSFMzhS7FgdZp0wCdfRQ=;
        b=DY7YKpzQA1fzFXReCnJRyO93I2g8MNA8y0gV5gtqyzc9d2t45Inr1tYI5wBiYKr16V
         VxfTSRw61NJ4OWR1rScu+TxXpLCrywveywarRThM3aa6KLNc6Myf9es5jpS6tD7NIT7U
         1kbj6y7+8Qq9TwaWaoO0+JP7xv7wF/Bp+lDKmglV5S+DsySY0CU1VPIm8+T4csqetPZz
         KiJvSvnWnfpKbJvldA8lVgw6TEqnZ25zp8xPUBBiz4PfTHtWheo8Lo+BqRgAFq/3f21+
         LBqTFkzP8Q1yxmEU0FDOBa/VG+xNaHC/tLynrmNHOxmkguJsMS+eZg/0FYMemP0nNupa
         t+7Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/h4MJ38/Pa3yw72SLrhMrqTbJh/K404GE/Jv6sU2upS3/btbpNBMSYZmdklSHuIoWy6SwOZ6eMiZn4UFc4g==@lists.infradead.org
X-Gm-Message-State: AFuF++moI+m+lEy710kKE4za+JaNHadpe6PQHhRJUDVfw1BmSN0usizB
	EYL6+78iUEy4HCmwbj+KNjuFGg+tlzQwIvC5kqHmTdwfv8+eJbeve6HR
X-Gm-Gg: AYBFou2NdqjdQJ70ayw4aZ9jcgfgnkImm1VqYuhPWPQMoonB6lO21LNY+vWaPWby/A6
	COaBI4IgO7hPcSFaPKB6wo8Og3i1qImHzjjiazBclleuciFmKVzWEUVxzgE+A4mFJfoVlcs4B5u
	6xeGwMwb1YIpP1yxFt9x9x1I8p0hXpZUFWuN2cc+jxYg5TdqVMPzj2EW3GK1hEiFcsV4N7PcVFf
	bWmqVVuIpd64DGCvl+iFEWaEa3uZaI611mxEtpKGH1WWqu+0rszzNBsywJNmg6Egl5ud7Q/ziU0
	RozDvNXWVmuHvlmfOe1l58tGV5DRi4vhkONEupfbi7W9eo+mKt6ZG9ihG3y3kcaF2L/P2U1laW9
	ucBwd/5x8jH0SpIIrM2rng1WEFhjt/eiqP6AJl//4XoQ0Zp/4bfmIAmrfwM9JNApHVfKXGk6gyf
	Fqj/gDJrDIIhdHFUwKcAYr+SrUXsNqefr20MLVnHwHi7PXAKu5w7XNtjXuSks=
X-Received: by 2002:a17:90b:2f87:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39b261e75femr24578243a91.16.1788675542370;
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:19:02 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:53 +0530
Message-ID: <20260906061755.5103-5-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231903_473839_DFEEF855 
X-CRM114-Status: GOOD (  12.98  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c         | 4 ++--
 drivers/devfreq/imx8m-ddrc.c      | 3 +--
 drivers/devfreq/mtk-cci-devfreq.c | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
index 4c22be728f6a..bda788909887 100644
--- a/drivers/devfreq/mtk-cci-devfreq.c
+++ b/drivers/devfreq/mtk-cci-devfreq.c
@@ -364,8 +364,8 @@ static int mtk_ccifreq_probe(struct platform_device *pdev)
 					       passive_data);
 	if (IS_ERR(drv->devfreq)) {
 		ret = -EPROBE_DEFER;
-		dev_err(dev, "failed to add devfreq device: %ld\n",
-			PTR_ERR(drv->devfreq));
+		dev_err(dev, "failed to add devfreq device: %pe\n",
+			drv->devfreq);
 		goto out_remove_opp_table;
 	}
 
-- 
2.43.0


