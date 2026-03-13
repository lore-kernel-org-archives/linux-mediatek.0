Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC41106FD85
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 06:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUuMxTOrXr5dtny0Z1J2CPcZhaOa7T7CSblKG3q9akc=; b=fMB0UsDMfoJ1Dl9/TWDg00FDFZ
	cjUo7I3UIDDS/s9ueaRwWBj7eFVnmb4727n/HE05gV8MxODCZh+Ctq/kEDE8xGia/wvhLRhpquVNc
	nS+sMNvNNj249vy31NLf5P7ia/CWLuVuNT2RT+hGYITHhrVu6t2E9UCjHdz/WebndYLVIocoiN359
	ucB/hL3raBeGZCEL/ovP8MScJo9Ap+0Uo3ZNOJvAbXyHIxdBBVAQ+exRo9t6RkyYaY0Wz4a1DIoSf
	zkknmxG7fFXz3SnVXKiVDngQEHY8X44FoUJm542Dtc+GxqP+nwJSN1G0f4TXbhraGU2BkljjkdEtn
	UR3yfKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vi8-0000000GkTD-1Xgp;
	Fri, 13 Mar 2026 06:09:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0vht-0000000Gk1p-0k85;
	Fri, 13 Mar 2026 06:09:12 +0000
X-UUID: 1fac528c1ea311f1a21c59e7364eecb8-20260313
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11,REQID:d562d59c-9b4a-45dd-9858-dec13411d128,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:89c9d04,CLOUDID:03832810be6e0d7cf5b2b3e0023b36d6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|898,TC:nil,Content:0|15|50
	,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1fac528c1ea311f1a21c59e7364eecb8-20260313
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 693433072; Fri, 13 Mar 2026 14:08:58 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	openbmc@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v2 02/17] spi: bcm63xx-hsspi: Use helper function devm_clk_get_enabled()
Date: Fri, 13 Mar 2026 14:08:18 +0800
Message-Id: <5f0fd0644d53c8d703893da1c59ac44c9ef83716.1773381582.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1773381582.git.xiaopei01@kylinos.cn>
References: <cover.1773381582.git.xiaopei01@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_230911_106135_524726EC 
X-CRM114-Status: GOOD (  10.19  )
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

devm_clk_get() and clk_prepare_enable() can now be replaced by
devm_clk_get_enabled() when driver enables the clocks. Moreover, it is no
longer necessary to unprepare and disable the clocks explicitly.
Simplify code.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/spi/spi-bcm63xx-hsspi.c | 44 +++++++++------------------------
 1 file changed, 12 insertions(+), 32 deletions(-)

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index 612f8802e690..f45deb93cbed 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -758,8 +758,7 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	clk = devm_clk_get(dev, "hsspi");
-
+	clk = devm_clk_get_enabled(dev, "hsspi");
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
@@ -767,41 +766,26 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	if (IS_ERR(reset))
 		return PTR_ERR(reset);
 
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
-
 	ret = reset_control_reset(reset);
-	if (ret) {
-		dev_err(dev, "unable to reset device: %d\n", ret);
-		goto out_disable_clk;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "unable to reset device: %d\n", ret);
 
 	rate = clk_get_rate(clk);
 	if (!rate) {
-		pll_clk = devm_clk_get(dev, "pll");
-
-		if (IS_ERR(pll_clk)) {
-			ret = PTR_ERR(pll_clk);
-			goto out_disable_clk;
-		}
-
-		ret = clk_prepare_enable(pll_clk);
-		if (ret)
-			goto out_disable_clk;
+		pll_clk = devm_clk_get_enabled(dev, "pll");
+		if (IS_ERR(pll_clk))
+			return dev_err_probe(dev, PTR_ERR(pll_clk),
+					     "failed enable pll clk\n");
 
 		rate = clk_get_rate(pll_clk);
-		if (!rate) {
-			ret = -EINVAL;
-			goto out_disable_pll_clk;
-		}
+		if (!rate)
+			return dev_err_probe(dev, -EINVAL,
+					     "failed get pll clk rate\n");
 	}
 
 	host = spi_alloc_host(&pdev->dev, sizeof(*bs));
-	if (!host) {
-		ret = -ENOMEM;
-		goto out_disable_pll_clk;
-	}
+	if (!host)
+		return dev_err_probe(dev, -ENOMEM, "alloc host no mem\n");
 
 	bs = spi_controller_get_devdata(host);
 	bs->pdev = pdev;
@@ -887,10 +871,6 @@ static int bcm63xx_hsspi_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 out_put_host:
 	spi_controller_put(host);
-out_disable_pll_clk:
-	clk_disable_unprepare(pll_clk);
-out_disable_clk:
-	clk_disable_unprepare(clk);
 	return ret;
 }
 
-- 
2.25.1


