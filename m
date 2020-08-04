Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB53C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB44206F6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 03:52:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAJjNRS6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="e6ks3ajw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB44206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eUft4fukjBnLEwzzVKx4z1l9WUHsw5N84/aK9r8DeHw=; b=fAJjNRS6ctSPNmmcl5OXODKpL
	b5Pi+Sv+85tysPbgjazHttW3i+xpZE8MM3ZWCO4qpOpTz3icsI1lkbqE/IZ9MzWvSt1JM1yj/yGh8
	xezRDXBkbpGlckVlD/HdOIKUWW8L0agZC4t19q7fKZ/6mi3A4XOuDCdJSImcBnLatzT4V02ZQeQnG
	v0HiahpiGFpYzElpbytsA5BkR6bPfc/Zm7Vg0rIXyYZWwCmG2cmiXmiZ7dj4ya3VSDJ1VtF6Gsy5L
	S6ZJf2GAnm5B3ElzGLMn0HTxew1D49JJ4sd22pmwsQpNJtaeJd2EiwKSGXpZDPareRVPAg1L/f7Nq
	dYMhKT/VA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2nzV-0001EL-WD; Tue, 04 Aug 2020 03:51:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2nzS-0001Br-2J; Tue, 04 Aug 2020 03:51:51 +0000
X-UUID: 0bc4a7a8fd8b497ab0d7e72b0a3699d4-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rRaht40ywpbtfGb/T/WfXe2+9UkRVR2CCiHFLzzVJEY=; 
 b=e6ks3ajw9fvnxPuRjMUpEWacNGS2drL4ba8SmvT8YgTAKDd2ZbFsE6gQLjBsaHcUhVzaV+AiWmB069jPyZJekki+NzxedqYexH9h+3aXUCbHLQck6xbTJ8VF2eMbY7kqWh8akbAdECcuF5AHua2Y+5fPRj+H/hnHhDlpwEUgB0Q=;
X-UUID: 0bc4a7a8fd8b497ab0d7e72b0a3699d4-20200803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xia.jiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 748011956; Mon, 03 Aug 2020 19:51:46 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 20:42:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Aug 2020 11:42:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 4 Aug 2020 11:42:07 +0800
From: Xia Jiang <xia.jiang@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Rick Chang <rick.chang@mediatek.com>
Subject: [PATCH v11 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
Date: Tue, 4 Aug 2020 11:40:56 +0800
Message-ID: <20200804034102.22983-23-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200804034102.22983-1-xia.jiang@mediatek.com>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_235150_329416_B7FEB719 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: maoguang.meng@mediatek.com, devicetree@vger.kernel.org,
 mojahsu@chromium.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 senozhatsky@chromium.org, drinkcat@chromium.org,
 linux-mediatek@lists.infradead.org, Xia Jiang <xia.jiang@mediatek.com>,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the generic clk_bulk_* helpers to enable and disable clocks.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v11: specify the names of the clocks in the driver
---
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 28 +++++++++++++------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 +++---
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 7881e9c93df7..47d570f32e3f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 	ret = mtk_smi_larb_get(jpeg->larb);
 	if (ret)
 		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
-	clk_prepare_enable(jpeg->clk_jdec_smi);
-	clk_prepare_enable(jpeg->clk_jdec);
+
+	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
+	if (ret)
+		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);
 }
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
-	clk_disable_unprepare(jpeg->clk_jdec);
-	clk_disable_unprepare(jpeg->clk_jdec_smi);
+	clk_bulk_disable_unprepare(jpeg->num_clks, jpeg->clks);
 	mtk_smi_larb_put(jpeg->larb);
 }
 
@@ -935,10 +936,16 @@ static const struct v4l2_file_operations mtk_jpeg_fops = {
 	.mmap           = v4l2_m2m_fop_mmap,
 };
 
+static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
+	{ .id = "jpgdec-smi" },
+	{ .id = "jpgdec" },
+};
+
 static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 {
 	struct device_node *node;
 	struct platform_device *pdev;
+	int ret;
 
 	node = of_parse_phandle(jpeg->dev->of_node, "mediatek,larb", 0);
 	if (!node)
@@ -952,12 +959,15 @@ static int mtk_jpeg_clk_init(struct mtk_jpeg_dev *jpeg)
 
 	jpeg->larb = &pdev->dev;
 
-	jpeg->clk_jdec = devm_clk_get(jpeg->dev, "jpgdec");
-	if (IS_ERR(jpeg->clk_jdec))
-		return PTR_ERR(jpeg->clk_jdec);
+	jpeg->clks = mt8173_jpeg_dec_clocks;
+	jpeg->num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks);
+	ret = devm_clk_bulk_get(jpeg->dev, jpeg->num_clks, jpeg->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get jpeg clock:%d\n", ret);
+		return ret;
+	}
 
-	jpeg->clk_jdec_smi = devm_clk_get(jpeg->dev, "jpgdec-smi");
-	return PTR_ERR_OR_ZERO(jpeg->clk_jdec_smi);
+	return 0;
 }
 
 static void mtk_jpeg_job_timeout_work(struct work_struct *work)
diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
index 4c76a9dcc4b7..a54e1e82e655 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h
@@ -52,8 +52,8 @@ enum mtk_jpeg_ctx_state {
  * @alloc_ctx:		videobuf2 memory allocator's context
  * @dec_vdev:		video device node for decoder mem2mem mode
  * @dec_reg_base:	JPEG registers mapping
- * @clk_jdec:		JPEG hw working clock
- * @clk_jdec_smi:	JPEG SMI bus clock
+ * @clks:		clock names
+ * @num_clks:		numbers of clock
  * @larb:		SMI device
  * @job_timeout_work:	IRQ timeout structure
  */
@@ -67,8 +67,8 @@ struct mtk_jpeg_dev {
 	void			*alloc_ctx;
 	struct video_device	*dec_vdev;
 	void __iomem		*dec_reg_base;
-	struct clk		*clk_jdec;
-	struct clk		*clk_jdec_smi;
+	struct clk_bulk_data *clks;
+	int num_clks;
 	struct device		*larb;
 	struct delayed_work job_timeout_work;
 };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
