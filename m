Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B343AC76196
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pmAi/Z1rlBfNKaCRlWLlCDkew8mH2p49s4pTlukDXDo=; b=Hwoc7iJthBEcJCZbOI0iFmlkPt
	1GS6Czy7dPG22dQUCc8MjKMr4MBIM6pcPLMcWw/N5XBk8P0OjmMgPbItwiJr4ClPTfxNBwi17DZ4h
	GKOsKIZAPk6PY2y7Wv/b8Jcy6yTvkFrLnKPiJ2LNNjf/yHrKmVMBYs0gDdfjwEJPWXC/q2mQisY6U
	lEO650uZRrwDvKL9SS5gIESExWmEttJNIaPCkDigcRY0uuRIRGRSYuauq6q/l97ASxhn3VoSbkk6j
	sTIN1lJU7NKtpRlKqrpPkFRXeE9pzRor/wTIwx+gR+qyDndkwaXu2Tho221z+SG9Vw0Qj355kZcRH
	/MjoqVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8I-00GSRn-0h;
	Mon, 03 Apr 2023 19:46:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQ8H-00GSQt-1C;
	Mon, 03 Apr 2023 19:46:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pmAi/Z1rlBfNKaCRlWLlCDkew8mH2p49s4pTlukDXDo=; b=jvUQHegVss3VQ00nCaCG/RKjFY
	BAO1fk12NA5yEAVXv1DnL3y7PgEH4pgrUJjWYgP1mvIBylYKv4ie5ic9OJY/DK3DVeihhfjg9tPvZ
	vMyW7hCCEs9LQdZinmuEkMdvSyKpJJ3648927HU571xLtn2S2+kHfNqKR3Tas0d4C8NMMGixzo1xc
	3B/fT3qUAK8QCOjrZOL4LKuaeDX8WRzVNq79POr3sCvi6TncU1CxQ16OYZ5MU+MBF7ek5G3/3pik/
	cz0ZEnPIvSjUUeS5Hfg5EhjtlVRbRYHyGClPhO7+9eCGqCjUXEZ5lFucoxoi9e4jNwHZb3o8s8hl6
	Oa+zMt7w==;
Received: from mail.hust.edu.cn ([202.114.0.240] helo=hust.edu.cn)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNLT-008wdw-2G;
	Mon, 03 Apr 2023 16:47:53 +0000
Received: from passwd123-ThinkStation-P920.. ([222.20.94.23])
	(user=void0red@hust.edu.cn mech=LOGIN bits=0)
	by mx1.hust.edu.cn  with ESMTP id 333GkBiv000418-333GkBix000418
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 4 Apr 2023 00:46:12 +0800
From: Kang Chen <void0red@hust.edu.cn>
To: daniel.lezcano@linaro.org
Cc: amitk@kernel.org, angelogioacchino.delregno@collabora.com,
        bchihi@baylibre.com, daniel@makrotopia.org, dzm91@hust.edu.cn,
        error27@gmail.com, henry.yen@mediatek.com,
        hust-os-kernel-patches@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
        rui.zhang@intel.com, void0red@gmail.com, void0red@hust.edu.cn
Subject: [PATCH v2 2/2] thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
Date: Tue,  4 Apr 2023 00:46:10 +0800
Message-Id: <20230403164610.3608082-2-void0red@hust.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230403164610.3608082-1-void0red@hust.edu.cn>
References: <6e3c59c3-8ad0-9c53-62a4-7be6f55a7c02@linaro.org>
 <20230403164610.3608082-1-void0red@hust.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-FEAS-AUTH-USER: void0red@hust.edu.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_174752_124045_ED57D5EE 
X-CRM114-Status: GOOD (  11.79  )
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

use devm_clk_get_enabled to do automatic resource management.

Signed-off-by: Kang Chen <void0red@hust.edu.cn>
---
I'm not quite sure if this function should return 0 when
devm_thermal_add_hwmon_sysfs occurs error. So I keep it.

 drivers/thermal/mediatek/auxadc_thermal.c | 25 ++++++++---------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index df5e2e354408..5baec2c08ebc 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1178,16 +1178,16 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(mt->clk_auxadc);
-	if (ret) {
+	ret = devm_clk_get_enabled(&pdev->dev, mt->clk_auxadc);
+	if (IS_ERR(ret)) {
 		dev_err(&pdev->dev, "Can't enable auxadc clk: %d\n", ret);
-		return ret;
+		return PTR_ERR(ret);
 	}
 
-	ret = clk_prepare_enable(mt->clk_peri_therm);
-	if (ret) {
+	ret = devm_clk_get_enabled(&pdev->dev, mt->clk_peri_therm);
+	if (IS_ERR(ret)) {
 		dev_err(&pdev->dev, "Can't enable peri clk: %d\n", ret);
-		goto err_disable_clk_auxadc;
+		return PTR_ERR(ret);
 	}
 
 	if (mt->conf->version != MTK_THERMAL_V1) {
@@ -1211,23 +1211,14 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 
 	tzdev = devm_thermal_of_zone_register(&pdev->dev, 0, mt,
 					      &mtk_thermal_ops);
-	if (IS_ERR(tzdev)) {
-		ret = PTR_ERR(tzdev);
-		goto err_disable_clk_peri_therm;
-	}
+	if (IS_ERR(tzdev))
+		return PTR_ERR(tzdev);
 
 	ret = devm_thermal_add_hwmon_sysfs(tzdev);
 	if (ret)
 		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
 
 	return 0;
-
-err_disable_clk_peri_therm:
-	clk_disable_unprepare(mt->clk_peri_therm);
-err_disable_clk_auxadc:
-	clk_disable_unprepare(mt->clk_auxadc);
-
-	return ret;
 }
 
 static int mtk_thermal_remove(struct platform_device *pdev)
-- 
2.34.1


