Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48692C77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDyX15c4y3riamcjrdLMF5pPD4/84jZH8J69KsbOpF0=; b=S7iT7ISaGLB49oU5qaj9AhhXsv
	AJJ5l6JLwK9CRVWUTq29jkNOFouEqIpnrUC3SqPTXzAkIG4oJTbu5Vr0POQenyenq/8gMNUddJWja
	1+Ld/oTKy5h12uZV5jTb36z1LatCaw930Jb+Ofw1kSDhgdOSJZ4k4CCur54TQziQc7ZwyT8bktJqW
	MSmqf+KahZCKPIz5/IfGzEPbhvsIdO/fvAqSNqZe84BqEKioOJiOf6q5J0AgqZwfZXNi43fTdlSXI
	rlE7I02P/j7AAArUUWjuPxOJkP1VG9VapH7dMVR0fGYHMKq8jUxcjEcPeet3osdCQ0tgp7e9W3PMf
	KOx3R+hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prJv5-001SC9-2K;
	Tue, 25 Apr 2023 14:45:27 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prIl8-001EVo-0N
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 13:31:07 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-2fc3f1d6f8cso3626396f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 06:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682429457; x=1685021457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDyX15c4y3riamcjrdLMF5pPD4/84jZH8J69KsbOpF0=;
        b=1OUmbyzN0xF/mDJ1gUGkqSjXYr2z+M5aimUYWd9TNVfidYxTNxjh2AtzJkq94h84se
         F1r6So8ybYynTOFUbiBR+B7R7r3yVfjalof12uKPCrxFGRoR8TBkkRBoBsSEfzttgbxE
         DeYWaiRnA/NUUATsH8ng8QjPP1ibPa5zg0at9vGqz9DPLlo1RCJJohmyRS1Dt81VNJmq
         8e5Qt5oMrzwUpORj3g22uN406FLzpVuyzKaFQZ2spHQHh98Uulw/s1bJHlLbsbkDW5Zb
         Rg7WPZmU+sWOeDXSS/APn4biXVeKfFF5ZDyGuqLXWeXx6Ee1Nh0GC58fFKtLsZlIn83r
         s8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429457; x=1685021457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDyX15c4y3riamcjrdLMF5pPD4/84jZH8J69KsbOpF0=;
        b=M5H2H0t6a9N92My1tZdXnIfnmiGW+VRFBP6bMEZoNDlIs+7urqTKjDeHJhz89i0TX8
         uLg6L+zD6taCXHR0nUYA5aDKTxOftSX7y41QSCdYW8FQfYxdS4Q4GVRW4skBCsEVG3Ah
         E5zGFOnxWrQsbVBeHpM+s2AH5bdkx0Pj1z5mNa9sSO0HsLoj3c21gnAwwSE5GRkX4lFy
         b6ol+qdrJ6AfCucpNVvDgvfQZjyScY3mftnNkpclk9Wd7yXcbllsf0RfH2YCUzrpDvjp
         0Hb3R7ucU/97lNp31uUPm1zZ6JXEDHN8x4SWB2HfEPoPPUhWUeEnKFOjA3dQz/8i1Wyc
         9ZTw==
X-Gm-Message-State: AAQBX9cB4j00oB97k6G6178CM/TLA2sfSujhxuzXxQ+8z6sPuJXlVgqu
	Q2Ge00lnqp0LE+/P2mdjBOHlRA==
X-Google-Smtp-Source: AKy350YyCGlFSEPWOXnlFISBuLHAPdnh04Ht+/tDW8FG9nCjr2WWTpXNTxCyBqmmPnR3q5N39NDk7A==
X-Received: by 2002:a5d:4f8e:0:b0:2fb:2567:bc1 with SMTP id d14-20020a5d4f8e000000b002fb25670bc1mr12267998wru.8.1682429456731;
        Tue, 25 Apr 2023 06:30:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003f16932fe7dsm18575434wmq.38.2023.04.25.06.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:30:56 -0700 (PDT)
From: bchihi@baylibre.com
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
Subject: [PATCH v2 1/5] thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
Date: Tue, 25 Apr 2023 15:30:48 +0200
Message-Id: <20230425133052.199767-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425133052.199767-1-bchihi@baylibre.com>
References: <20230425133052.199767-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_063106_166232_AEFC1118 
X-CRM114-Status: GOOD (  14.87  )
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
2.34.1


