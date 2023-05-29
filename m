Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9F7C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=; b=2Hlai1ev3we8NY5o1Az/QjFRA5
	VZwPGm0uZlSpLODTEd1YkWAJkDpaWZ9stJ/2GXtLt2WVmd8+Tf2/aQe+06bdvQqRl5eW73xUkhgcL
	a4w0ONBVdoVdA8TKKUVbZBDbXG73xDYDycCUNsmDyQRRVNHs57NI6if2ATz6STB+BKmexgJQpBVw4
	VVVbZiu+YZCAQd9Qo4hwtNwJjrR2pR1bTkEky7T2jp9W4fMHhsp6paBcG1SG2ccgYPx58pls0lnSX
	mpC9SmeV4EjJG43mm0Q+NK3lCykfNxbCjWVQHol/A6DQp06N5Zx82ZYeQsEwxei8hysW3kJ9D5GXG
	TR53FPMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euQ-00Awzf-2K;
	Mon, 29 May 2023 15:35:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euM-00Awuw-2K
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 15:35:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30a8fa6e6fcso2098472f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 08:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685374537; x=1687966537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=;
        b=4mZai65JwnIG31lGL2FdgRbna5ZX+1vQfraelVx+zO93D0FR0QuDbiNo8FaYCM2xYJ
         SOnD9umdATXRVthXkkARqZIMPkDTQy23NIHNmbGkqswDme5R2INWw/exCro7K8Q3odVt
         O/qbxxy3w9JYMmbv7BJUfS1o1B4GzJZjRi4Eh7pRT+xpItAMYaqURjelrCQvlpwDs2c+
         l9Yg2bfb0aOxWERFNunADa2qvLxt/4fPWMpqf2K4i5L+tWFhVM++jki+iXq55Z37IRZA
         KAv6NStIoaqaxTMRch67UfZBCoxRLLhUpwGY3w3PUBSENfUMiHfasMUFzFs9PRGbjeZU
         CjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374537; x=1687966537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GZ1Pw000YHwunl4UOYUIH6XIIpBvLCqm0y/k6ZseuYk=;
        b=bn/CksFM5ZJnn6lowKFly6c8n1WoGhdUPlsAFaEXPjJRKpUvh4bLHZnPb2mhseqmE4
         ZwRHJQRHdRgXDS9KM/Ms9WuymOHfmsD0wogewz1WI/QFEK0xbV8vEQbIyJEk9symSFzM
         rFzqK+hs5ZA8I8iLmgKCVtWDgha4vYoA+e5hCQbvl4VVr6bcSMy16tfGKFL3IqDuVksn
         keUH5c7+NOmig7HL1jD8RQvMXlmlAVdhZLe3rSYSGb35kZ07mfPZtXnQrlRRHhE304eO
         jgsDaIHHgyAI+7KQkcVZrEe2wwICpXUbqCQJK1C79ehiLs2nfctmIhcoG8DtUb9Kpitg
         n/mA==
X-Gm-Message-State: AC+VfDw/XBl8dUdlWw43LBvooMLF8bMsGPy85pKG5u3X2oHqyUAk87vd
	dHC2GBjL+SRrm1fJltxtM5GsXg==
X-Google-Smtp-Source: ACHHUZ6G0aBAtC/cPLbBBLlra6lcIfNV54GneoMynv4vOLmsZoj4L7CcHXrSU5ONQmISmgw+w6krYQ==
X-Received: by 2002:a5d:67c5:0:b0:30a:e3da:efe5 with SMTP id n5-20020a5d67c5000000b0030ae3daefe5mr8296777wrw.32.1685374537501;
        Mon, 29 May 2023 08:35:37 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j27-20020a5d453b000000b003095a329e90sm269781wra.97.2023.05.29.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 08:35:36 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzystof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pangutronix.de
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
Subject: [PATCH v3 2/5] thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
Date: Mon, 29 May 2023 17:35:29 +0200
Message-ID: <20230529153532.3541327-3-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230529153532.3541327-1-bero@baylibre.com>
References: <20230529153532.3541327-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_083542_789643_35B8FCAB 
X-CRM114-Status: GOOD (  14.54  )
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


