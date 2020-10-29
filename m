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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B886C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 01:27:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4562075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 01:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QvPjZTCe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aAlerXkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4562075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mofXm1nPbvGLukP+asG2UDL+NLnrJsdmTV4h4m3Xo1w=; b=QvPjZTCe0e71sazlIhrJQ7W2P
	oIauaVtH3IdS6BSuktkPBowZO+Ed0FBxApSZgoaKC2TgAFr9flx8Gw7qKkyfS8u+YrHckLdafINI6
	n3nO29t9DBAaxLiCh4PV6YwYtPq6OK0VJ4vOxLOpp5LCTBiaYxkytHfIL0sSsrpz2cUOFu/DnaeF6
	kq2Pmzx1C98y4WFFgixgYAWffQ3ioPZUb3QHgNrI9jm9Dw83Qkbj07A9ULTuu/GzVrzd7QJ9NigZ8
	TW+SofELDGqffaQnzII2PaCVArCU08/ZO9m5ofcBnIbwenS2/xAx7EMQjskfDlaIjzBzZmO4FbjPy
	wR/qBpkCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXwj7-00039G-Bn; Thu, 29 Oct 2020 01:27:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXwj5-00038m-SK; Thu, 29 Oct 2020 01:27:40 +0000
X-UUID: 338503d637db42a5a3c45cc4155d6edd-20201028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=twT+r5b5fxyEgKPFMU6gXc8bZs5Mwk3ZxfFWSI7c33Q=; 
 b=aAlerXkCRKGEwbQ8NukTm+uRpER7Li4/ilkfZdfczcduNVEmyC5M8ZgnftIT3jpEtw4tyeWcNn7X4qgJg/BEGRgDTKvPcErgFy3JoHMlV3D7iqseVSV/KAWx4t0nGDTEzJfRrbxuyUEPzZrZPi4gKuv/xHlATLae3bcm05BNCPI=;
X-UUID: 338503d637db42a5a3c45cc4155d6edd-20201028
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1574167956; Wed, 28 Oct 2020 17:27:35 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 18:17:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Oct 2020 09:17:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Oct 2020 09:17:30 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: <hverkuil@xs4all.nl>, <acourbot@chromium.org>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>
Subject: [PATCH 2/2] media: mtk-vpu: dump VPU status when IPI times out
Date: Thu, 29 Oct 2020 09:17:21 +0800
Message-ID: <20201029011721.6705-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201029011721.6705-1-irui.wang@mediatek.com>
References: <20201029011721.6705-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_212740_047775_76E1755C 
X-CRM114-Status: GOOD (  14.00  )
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

when IPI time out, dump VPU status to get more debug information

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 33 +++++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index 86ab808ba877..043894f7188c 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -61,6 +61,8 @@
 #define VPU_IDLE_REG		0x002C
 #define VPU_INT_STATUS		0x0034
 #define VPU_PC_REG		0x0060
+#define VPU_SP_REG		0x0064
+#define VPU_RA_REG		0x0068
 #define VPU_WDT_REG		0x0084
 
 /* vpu inter-processor communication interrupt */
@@ -268,6 +270,20 @@ static int vpu_clock_enable(struct mtk_vpu *vpu)
 	return ret;
 }
 
+static void vpu_dump_status(struct mtk_vpu *vpu)
+{
+	dev_info(vpu->dev,
+		 "vpu: run %x, pc = 0x%x, ra = 0x%x, sp = 0x%x, idle = 0x%x\n"
+		 "vpu: int %x, hv = 0x%x, vh = 0x%x, wdt = 0x%x\n",
+		 vpu_running(vpu), vpu_cfg_readl(vpu, VPU_PC_REG),
+		 vpu_cfg_readl(vpu, VPU_RA_REG), vpu_cfg_readl(vpu, VPU_SP_REG),
+		 vpu_cfg_readl(vpu, VPU_IDLE_REG),
+		 vpu_cfg_readl(vpu, VPU_INT_STATUS),
+		 vpu_cfg_readl(vpu, HOST_TO_VPU),
+		 vpu_cfg_readl(vpu, VPU_TO_HOST),
+		 vpu_cfg_readl(vpu, VPU_WDT_REG));
+}
+
 int vpu_ipi_register(struct platform_device *pdev,
 		     enum ipi_id id, ipi_handler_t handler,
 		     const char *name, void *priv)
@@ -328,6 +344,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 		if (time_after(jiffies, timeout)) {
 			dev_err(vpu->dev, "vpu_ipi_send: IPI timeout!\n");
 			ret = -EIO;
+			vpu_dump_status(vpu);
 			goto mut_unlock;
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
@@ -347,8 +364,9 @@ int vpu_ipi_send(struct platform_device *pdev,
 	ret = wait_event_timeout(vpu->ack_wq, vpu->ipi_id_ack[id], timeout);
 	vpu->ipi_id_ack[id] = false;
 	if (ret == 0) {
-		dev_err(vpu->dev, "vpu ipi %d ack time out !", id);
+		dev_err(vpu->dev, "vpu ipi %d ack time out !\n", id);
 		ret = -EIO;
+		vpu_dump_status(vpu);
 		goto clock_disable;
 	}
 	vpu_clock_disable(vpu);
@@ -633,7 +651,7 @@ static ssize_t vpu_debug_read(struct file *file, char __user *user_buf,
 {
 	char buf[256];
 	unsigned int len;
-	unsigned int running, pc, vpu_to_host, host_to_vpu, wdt;
+	unsigned int running, pc, vpu_to_host, host_to_vpu, wdt, idle, ra, sp;
 	int ret;
 	struct device *dev = file->private_data;
 	struct mtk_vpu *vpu = dev_get_drvdata(dev);
@@ -650,6 +668,10 @@ static ssize_t vpu_debug_read(struct file *file, char __user *user_buf,
 	wdt = vpu_cfg_readl(vpu, VPU_WDT_REG);
 	host_to_vpu = vpu_cfg_readl(vpu, HOST_TO_VPU);
 	vpu_to_host = vpu_cfg_readl(vpu, VPU_TO_HOST);
+	ra = vpu_cfg_readl(vpu, VPU_RA_REG);
+	sp = vpu_cfg_readl(vpu, VPU_SP_REG);
+	idle = vpu_cfg_readl(vpu, VPU_IDLE_REG);
+
 	vpu_clock_disable(vpu);
 
 	if (running) {
@@ -658,9 +680,12 @@ static ssize_t vpu_debug_read(struct file *file, char __user *user_buf,
 		"PC: 0x%x\n"
 		"WDT: 0x%x\n"
 		"Host to VPU: 0x%x\n"
-		"VPU to Host: 0x%x\n",
+		"VPU to Host: 0x%x\n"
+		"SP: 0x%x\n"
+		"RA: 0x%x\n"
+		"idle: 0x%x\n",
 		vpu->run.fw_ver, pc, wdt,
-		host_to_vpu, vpu_to_host);
+		host_to_vpu, vpu_to_host, sp, ra, idle);
 	} else {
 		len = snprintf(buf, sizeof(buf), "VPU not running\n");
 	}
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
