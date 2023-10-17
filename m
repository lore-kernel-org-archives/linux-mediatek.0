Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D7FCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBUayoWq6Ye9sh8zhKBZbNdAgo6owoaukol1/zg+W4Q=; b=l2Z+J5RtGr75E5LmHLmNyZVGDE
	MYZD5ODjJAPUSctmJAIdRUiR4sq1IMyW3qxv4US6hr0sjQhkT2HLuIMP6C/kaeihXu0JRPSvgThZ4
	csgWTJOEsIUM6HgHl1yvw0ACUUbkL+HENvkvrayo+cMyVkxVMPbi82lqPgydigI1okKy326C5OhQZ
	fiDNb+Zqka+I4cL0GiJSXggAWlsF2hh3z35B/u8fBHIoQcTmMJ7e8KSLCmSJTz4DPQ4+o2QISXFY/
	aobXPwza/LOFMoDpLzlW5qrXwJOtIJF8j6t3M4YNMqvHcwDn/SgQzz+GXrBdbJHLJZUsskGJOstbq
	uG3u3q9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspOL-00D2vZ-0m;
	Tue, 17 Oct 2023 19:06:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspO8-00D2lE-04
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 19:05:57 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53dd752685fso10652208a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 12:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697569549; x=1698174349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBUayoWq6Ye9sh8zhKBZbNdAgo6owoaukol1/zg+W4Q=;
        b=ERwAs9+fY0LTSb+gl8Rp0qFDZjUNplAkYvf0sa7LLPPLqNu2QZpE/xQJwwaBM/KqAj
         hFw8xZD8Pjh1Cjg6WsvPlwfAC3wrgQSHxXXpvjZj8ygLHqulJdXfA3yI646NSDoedCQn
         fXPUelyAulY7xWghLpiSnQlXGZ+U7XB9Mfkn3JXJHioN9a6y8/4HbNCynlYb5WcVNC2R
         6s008wrBfQ1kiY/Bpuxop1rHspkMDjbLuqWGvMepcU8D2OPBT4Lr+loOlMv6P5UHkRxy
         24WVybIgsTtzvWgp7XnBO9d/1vOmZowx6QaDvcmbU2kKkBQ/s8lrD8p+Xv5X7HQd6/1m
         mBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569549; x=1698174349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBUayoWq6Ye9sh8zhKBZbNdAgo6owoaukol1/zg+W4Q=;
        b=fF3nOfoYHfJ0LdgFKMd9A8y0vd35zMfcHQOoKWpFJDqGIR8k6doOawi8dIxLHRs1a9
         4qTwQZ2PpijuWc2F1hhufSkA3fxx6Q6Wtox5qBdqs6Eej+3yWdY6Jab1ywQRS8uUSA04
         B3MeWNNL7UoocHOQkCoZ6sZpzkiIbFAMAdk3SUm5Orb8yv60ax1HxrGfKfdKAUAk5gmD
         H70gsDILYNNulunsQ72AziKPV1cxpBNyrqJmKhv0ijHwtpNfDY9WVkVFcyraZ9qKhEbF
         CtdqwaoSQ2/JV4VL4Y4ixsQfjLv4pg/8qS1i+JxJGm7ekGJt/LOgdHz/GjHkcKy8PsyE
         9/bg==
X-Gm-Message-State: AOJu0Ywbbt3ZO9hgjlimjo8/NuvxBt8NdalHn3cYlgkme+B7KBRtH/Es
	6ZEWGX2bj77eI1JRqtiJcJvf8A==
X-Google-Smtp-Source: AGHT+IGU75oiZLjfv1aMUOdogFiVYahAM5xruGsLPsg93m2QdVVig3JnLi7yURT/mjm0ThQ5atHgdA==
X-Received: by 2002:a05:6402:2711:b0:53e:f321:e6fd with SMTP id y17-20020a056402271100b0053ef321e6fdmr2651204edd.9.1697569549178;
        Tue, 17 Oct 2023 12:05:49 -0700 (PDT)
Received: from ryzen9.fritz.box ([2a01:2a8:8f03:b001:fe65:a70:2777:ab31])
        by smtp.gmail.com with ESMTPSA id bq14-20020a056402214e00b00537963f692esm1637990edb.0.2023.10.17.12.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:05:48 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dunlap@infradead.org,
	e.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	ames.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v5 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
Date: Tue, 17 Oct 2023 21:05:42 +0200
Message-ID: <20231017190545.157282-3-bero@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017190545.157282-1-bero@baylibre.com>
References: <20231017190545.157282-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_120556_067590_1D0C5FD3 
X-CRM114-Status: GOOD (  13.69  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add suspend and resume support to LVTS driver.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
[bero@baylibre.com: suspend/resume in noirq phase]
Co-developed-by: Bernhard Rosenkränzer <bero@baylibre.com>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 37 +++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 877a0e5ac3fd3..c5a03bdf63e9d 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1254,6 +1254,38 @@ static void lvts_remove(struct platform_device *pdev)
 	lvts_debugfs_exit(lvts_td);
 }
 
+static int lvts_suspend(struct device *dev)
+{
+	struct lvts_domain *lvts_td;
+	int i;
+
+	lvts_td = dev_get_drvdata(dev);
+
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
+
+	clk_disable_unprepare(lvts_td->clk);
+
+	return 0;
+}
+
+static int lvts_resume(struct device *dev)
+{
+	struct lvts_domain *lvts_td;
+	int i, ret;
+
+	lvts_td = dev_get_drvdata(dev);
+
+	ret = clk_prepare_enable(lvts_td->clk);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
+
+	return 0;
+}
+
 static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
 	{
 		.cal_offset = { 0x04, 0x07 },
@@ -1350,12 +1382,17 @@ static const struct of_device_id lvts_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lvts_of_match);
 
+static const struct dev_pm_ops lvts_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(lvts_suspend, lvts_resume)
+};
+
 static struct platform_driver lvts_driver = {
 	.probe = lvts_probe,
 	.remove_new = lvts_remove,
 	.driver = {
 		.name = "mtk-lvts-thermal",
 		.of_match_table = lvts_of_match,
+		.pm = &lvts_pm_ops,
 	},
 };
 module_platform_driver(lvts_driver);
-- 
2.42.0


