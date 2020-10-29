Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DA1C388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 01:25:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF4A02075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 01:24:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MGEdIqvR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cB5wv06C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF4A02075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jvVL0qpN4XtLzPERn2wDv8vBdoYCy0i8k0YoNVV0t0=; b=MGEdIqvRkmh4OO1tg2Tn/F1vss
	WNLElUEvuHvL3K8HY9C4CMd4/8BogytFisHCNLB/v9ByWRmWdQDiXk+Bm8nVL+khbRtaRmTMmhWLG
	3O2Z8Z8sBvS4CwzDeR+g/fB37nMM9XHkCgiIhABRHa1Bl0wGOROBIJ0nYR3iN6b8odllFFoAlSd/2
	wckmRVRGWbxWZMCvoolVeG+CUHJA+/aJjmEjDEqeZ6JCJ8hRH5NuBY6OxW1pi5jRjziRdEDyCTaZz
	QS++S9TdCjI5muZWfIeeHSpkQ0hJzXVJ0QBr9FGIwSG6Ymos8qhTOXtkTA5FA8tYqoVfc8UrX6vhN
	ucQ+3Uhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXwgM-0002rC-B9; Thu, 29 Oct 2020 01:24:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXwgJ-0002qX-K0; Thu, 29 Oct 2020 01:24:49 +0000
X-UUID: 6b5ede09491f4a4f9783155c016e4641-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ujdVt5VMrFd483ldP8ff6NTFRc237VrH06AfNH0Wzx8=; 
 b=cB5wv06C6bAjln7t01d6gCkootzuL8rbhKGnJGv6FsFxCShp4IXLUWqRD/o0EMYQgsiAKWKlBni3XSpUWj9R/nEGW7bhRSCXdXRkJHfsuXH7mvqwsULH0jyaNhZzHBifSGMF62NgdEp+Dd+qB50fTbfRh7SM+atExCjNahKLj1c=;
X-UUID: 6b5ede09491f4a4f9783155c016e4641-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 957129294; Wed, 28 Oct 2020 17:24:40 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 18:17:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 09:17:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 09:17:23 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <hverkuil@xs4all.nl>, <acourbot@chromium.org>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] media: mtk-vpu: VPU should be in idle state before system
 is suspended
Date: Thu, 29 Oct 2020 09:17:20 +0800
Message-ID: <20201029011721.6705-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_212447_857251_FA7912BE 
X-CRM114-Status: GOOD (  17.06  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT.Chen@mediatek.com, Maoguang.Meng@mediatek.com,
 srv_heupstream@mediatek.com, irui.wang@mediatek.com, Yunfei.Dong@mediatek.com,
 erin.lo@mediatek.com, Longfei.Wang@mediatek.com, linux-kernel@vger.kernel.org,
 houlong.wei@mediatek.com, linux-mediatek@lists.infradead.org,
 PoChun.Lin@mediatek.com, hsinyi@google.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VPU should be in idle state before system is suspended
or it will work abnormally like VPU program counter not
in a correct address or VPU reset

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 68 ++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 36cb9b6131f7..86ab808ba877 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -27,6 +27,7 @@
 
 #define INIT_TIMEOUT_MS		2000U
 #define IPI_TIMEOUT_MS		2000U
+#define VPU_IDLE_TIMEOUT_MS	1000U
 #define VPU_FW_VER_LEN		16
 
 /* maximum program/data TCM (Tightly-Coupled Memory) size */
@@ -57,11 +58,15 @@
 #define VPU_DMEM_EXT0_ADDR	0x0014
 #define VPU_DMEM_EXT1_ADDR	0x0018
 #define HOST_TO_VPU		0x0024
+#define VPU_IDLE_REG		0x002C
+#define VPU_INT_STATUS		0x0034
 #define VPU_PC_REG		0x0060
 #define VPU_WDT_REG		0x0084
 
 /* vpu inter-processor communication interrupt */
 #define VPU_IPC_INT		BIT(8)
+/* vpu idle state */
+#define VPU_IDLE_STATE		BIT(23)
 
 /**
  * enum vpu_fw_type - VPU firmware type
@@ -945,11 +950,74 @@ static int mtk_vpu_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int mtk_vpu_suspend(struct device *dev)
+{
+	struct mtk_vpu *vpu = dev_get_drvdata(dev);
+	unsigned long timeout;
+	int ret;
+
+	ret = vpu_clock_enable(vpu);
+	if (ret) {
+		dev_err(dev, "failed to enable vpu clock\n");
+		return ret;
+	}
+
+	mutex_lock(&vpu->vpu_mutex);
+	/* disable vpu timer interrupt */
+	vpu_cfg_writel(vpu, vpu_cfg_readl(vpu, VPU_INT_STATUS) | VPU_IDLE_STATE,
+		       VPU_INT_STATUS);
+	/* check if vpu is idle for system suspend */
+	timeout = jiffies + msecs_to_jiffies(VPU_IDLE_TIMEOUT_MS);
+	do {
+		if (time_after(jiffies, timeout)) {
+			dev_err(dev, "vpu idle timeout\n");
+			mutex_unlock(&vpu->vpu_mutex);
+			vpu_clock_disable(vpu);
+			return -EIO;
+		}
+	} while (!vpu_cfg_readl(vpu, VPU_IDLE_REG));
+
+	mutex_unlock(&vpu->vpu_mutex);
+	vpu_clock_disable(vpu);
+	clk_unprepare(vpu->clk);
+
+	return 0;
+}
+
+static int mtk_vpu_resume(struct device *dev)
+{
+	struct mtk_vpu *vpu = dev_get_drvdata(dev);
+	int ret;
+
+	clk_prepare(vpu->clk);
+	ret = vpu_clock_enable(vpu);
+	if (ret) {
+		dev_err(dev, "failed to enable vpu clock\n");
+		return ret;
+	}
+
+	mutex_lock(&vpu->vpu_mutex);
+	/* enable vpu timer interrupt */
+	vpu_cfg_writel(vpu,
+		       vpu_cfg_readl(vpu, VPU_INT_STATUS) & ~(VPU_IDLE_STATE),
+		       VPU_INT_STATUS);
+	mutex_unlock(&vpu->vpu_mutex);
+	vpu_clock_disable(vpu);
+
+	return 0;
+}
+
+static const struct dev_pm_ops mtk_vpu_pm = {
+	.suspend = mtk_vpu_suspend,
+	.resume = mtk_vpu_resume,
+};
+
 static struct platform_driver mtk_vpu_driver = {
 	.probe	= mtk_vpu_probe,
 	.remove	= mtk_vpu_remove,
 	.driver	= {
 		.name	= "mtk_vpu",
+		.pm = &mtk_vpu_pm,
 		.of_match_table = mtk_vpu_match,
 	},
 };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
