Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DBCCDB486
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBUayoWq6Ye9sh8zhKBZbNdAgo6owoaukol1/zg+W4Q=; b=kZi4xHN4aw2VVY63FsgQh/EO0W
	GcNDUsmZO8kY9lSZAdCOauCBLYbroMJQJc+HcaSJHp+rjWuuac3oeOAvcB7ovO+ffC7CJo1aSWY9+
	pvDonmmpxQrtg09LPNSXCNvsN+pCMt9/A8lzsQno9942efRLgswswfkJmxqqI1oetoHsdkdoKY631
	rS3pe6KVGJk0wfHuYwMDeW6b+DSC/wn95vvUxEuKr+4r6PMDQsn47TX2kZWIyG+TkSmTBaaHPfwJI
	tYtkFkbTPYURTMHr1AWy1GxU8mLBqg/mB0Yt/tlkkpMxV0c7cheBGEGSboi3qt8wERwFJzuFB4n7T
	Cl0UXjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspKf-00D1v2-2J;
	Tue, 17 Oct 2023 19:02:21 +0000
Received: from [2a01:2a8:8f03:b001:97bb:be5f:f990:97fe] (helo=emag.lindev.ch)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspKa-00D1rx-2R;
	Tue, 17 Oct 2023 19:02:18 +0000
Received: from ryzen9.fritz.box (unknown [81.221.122.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bero@lindev.ch)
	by emag.lindev.ch (Postfix) with ESMTPSA id 1125A200469;
	Tue, 17 Oct 2023 20:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lindev.ch; s=default;
	t=1697568968; bh=sGV1KaGdNbJasxMe48TsIwJCZ4Q8G01C6MkFdMZptyA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WMaC6jPPX+FM6LKRrYsBCPHxJmD5ULASta3hAVLm/RXCM9mZVPWXGzd89m5mmJfRh
	 vhuPW8gvjCp1BtaTYRonLfp0jFkia8JmqyhxKhnYZlktNvr67vpSi0DTAzdaMP8MfJ
	 PFkIhNcE3l+DAVJz+S4V3MtnJJe3R8380cVt9S6k=
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@lindev.ch>
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
Date: Tue, 17 Oct 2023 20:55:52 +0200
Message-ID: <20231017185555.142062-3-bero@lindev.ch>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017185555.142062-1-bero@lindev.ch>
References: <20231017185555.142062-1-bero@lindev.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_120216_975221_C2B6860D 
X-CRM114-Status: GOOD (  12.12  )
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


