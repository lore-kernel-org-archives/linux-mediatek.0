Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF46C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 21:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z41wTT110P1GAe0L+S4OKXh20Gfqxsl4liUxJPQgofw=; b=YxnMWrOlCIiy3y51YCe97+gOGg
	DUKtL4HW23ffmBXk8qL+67TTtRqpAGVhizd0Ps9gUlfuck0fTgD2y64sbzN7yNpDF+gasi1B/FRIt
	J6/oYg1c9OpC9ZZiW7fahgoGiT05t18m5m27MbgLzU93HnPBfpuEBI1j5d/Cta7SmeDI29tJr4UOv
	wjY1vsUzVrcOTI9ARn5N2+LyzxCDyAXZiefi9JF3LrVh/iGUBkA0l5BjiBxo6CjU70sFGFwuEfE+k
	VgYq8Xbru8Wr7cxaQNr0re4LxKrlz0GLA3S27xnyI3d6lNP2W7TjQbDIyijwtZu/nqTkc2WDm0x7+
	1Z41Nmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q46SA-00F9Bf-1v;
	Tue, 30 May 2023 21:00:26 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45Nc-00F1QW-1l
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 19:51:42 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so35565795e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 12:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685476297; x=1688068297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z41wTT110P1GAe0L+S4OKXh20Gfqxsl4liUxJPQgofw=;
        b=tEmQmpa44HZ/kv6vTlX8wyeO/afOACS5eUcBQq2VJB/P9Q3YypdEbY6cnBK/8GN8bX
         6TsjtwoSjliRb37xd9swXOthPTRt9HZjkIJlh1VXVkepdyiVC/hXUaN+Ax1Dsis4Vq7V
         n1a3Ci1olvT0RHTiDJm+AN67H+F/igCZP2S/93Y/BNs8fB3gf+aMy+64mZ29DqDqgEKb
         bTPewOBAxf4FvdW6S6/7Vs4npnOP1Jrla9Ok/PybMioQuJweLF/Lpr2vOVo3mKidb+gk
         Awkwi/vYduXHg0boGmaAzO2yMYJNQ3bvkPhA0OUU8HmGJXnqprqRCbIP5j2aQBQeHqHr
         fWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476297; x=1688068297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z41wTT110P1GAe0L+S4OKXh20Gfqxsl4liUxJPQgofw=;
        b=aHQ7HUqeH618Vx0eLxDei9VitZzAaLymY3HWyjaWi5GLetdR8tByr9i9gxRpH5OtPz
         17C0stmi0ai1U4ZEpmpIDJfLjuG7mZm/M924LSkDMgJ8D8P3GtzGD/IA/AQyyri8Wlc5
         qEG2d6Tr/1Ki7VJRHNj4K5au6pnsa13gknxcCG1WjsvX5BZnltAx/euKGv1rdEHT+Ikn
         AFC1RHA6ms6i6Nwn7eIH/jmD+tA1nfpztKGzmszFNQl0YRyVJ96lXkQyBdiXItwqrEE7
         8kbKk2X1tOI1F8/dD2uaV+fQ7ewpUKhdvS/ChTtOpJTzLXYzCfANiViixFiZs0Xb3ixD
         Gazw==
X-Gm-Message-State: AC+VfDw99T5a8AoHXsV/6KO/Gsf97sqmWWqZjn1ql6kUjnrt9ifwFwHy
	JKbKUvoz4/CuRvZmKPAnFuHLmg==
X-Google-Smtp-Source: ACHHUZ4ld9edihUQyCtHl6jda9XcQZmLvXT+gVCe4WVzk5SUgm2lOiWkYBStVyWeeuO0aIpiTxtF6A==
X-Received: by 2002:a5d:4050:0:b0:309:49e6:9047 with SMTP id w16-20020a5d4050000000b0030949e69047mr2494496wrp.16.1685476297465;
        Tue, 30 May 2023 12:51:37 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n11-20020adfe34b000000b003078cd719ffsm4271545wrj.95.2023.05.30.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 12:51:37 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v4 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
Date: Tue, 30 May 2023 21:51:29 +0200
Message-ID: <20230530195132.2286163-3-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230530195132.2286163-1-bero@baylibre.com>
References: <20230530195132.2286163-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_125140_581237_C3EDE759 
X-CRM114-Status: GOOD (  14.53  )
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
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 34 +++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index d0a3f95b7884b..5ea8a9d569ea6 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1169,6 +1169,38 @@ static int lvts_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int lvts_suspend(struct platform_device *pdev, pm_message_t state)
+{
+	struct lvts_domain *lvts_td;
+	int i;
+
+	lvts_td = platform_get_drvdata(pdev);
+
+	for (i = 0; i < lvts_td->num_lvts_ctrl; i++)
+		lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
+
+	clk_disable_unprepare(lvts_td->clk);
+
+	return 0;
+}
+
+static int lvts_resume(struct platform_device *pdev)
+{
+	struct lvts_domain *lvts_td;
+	int i, ret;
+
+	lvts_td = platform_get_drvdata(pdev);
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
@@ -1268,6 +1300,8 @@ MODULE_DEVICE_TABLE(of, lvts_of_match);
 static struct platform_driver lvts_driver = {
 	.probe = lvts_probe,
 	.remove = lvts_remove,
+	.suspend = lvts_suspend,
+	.resume = lvts_resume,
 	.driver = {
 		.name = "mtk-lvts-thermal",
 		.of_match_table = lvts_of_match,
-- 
2.41.0.rc2


