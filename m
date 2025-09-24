Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B0ACAC5AE
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHXukUtqNvBzqJuGHZrUqP6JamZK4PwQSLqq++oGUGo=; b=L/YyYajQqma0ne/YcUUUsIigZf
	uPrZUCQTh6YKHmtfMl/+kWrloEto8OL5U6r8oUcfXLUfV1N2IiVauRmutZPMLAlVqZkZGlsuLln3X
	Z6JnD3U2BwdQLcbIdA3GeH7EEl6KHF4GAJrYtq4vdSI/JLR1mvFHZDwlINgJX9nyItij6OvShA/4q
	W4UMlTZGAXXaJ3HuOOHbDJn63nsEc4CZ9euI5/Gxe36q993RRA76vjOu6J08fZjVJO6lxoVr0pF7I
	160e1YEfFa79HG44ts/z6OiqQFqooraQMISXfUrcgUmTzAuWjYQbhiHIQKqvSwvzHsK4Wd86TK0HX
	762vQD1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pfc-00000000GpK-2iRk;
	Wed, 24 Sep 2025 13:36:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PfY-00000000Gjr-3Aau
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 13:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1797544A29;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E10C4CEE7;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=PP4GlelkN7bqBaOJj/FDhufoJKYKO3ceHzlIc1IQG+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A7dkHYzoc6XWoJzulEj9Zqm2lIm/xcCXfkksBISOkIqPH62biFJApKmw+oxiq+wcs
	 kK7GpQHOeyRZAcAn2Ld7fJf54/FZrxxXGfXEJ+8+1PnxbH4MLsvT7/HPEPDLOg3cbW
	 n5ow+8L6xU8bQN7p3iVzYmYJAm+Nq8ixT+Z0lQc4L51uvwM+N6D8yb35xNhQGzfTCF
	 1jTUdfogbKV7HwYz8J3/o7RWIm0GYo8DJpEVPmcPdW0RFt6lb92moSyH9KeUZpp5GP
	 YJGfLSqKwwFJf5Wsoe02SrZoSLrl2FuC2n8/sp4bABc0wrp4Blhj3WJIcWEdfMqx4v
	 Gd0ZBrHYT8vxg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfR-000000007Vm-1LPm;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] media: mediatek: vcodec: fix device leak on codec init
Date: Wed, 24 Sep 2025 15:35:50 +0200
Message-ID: <20250924133552.28841-2-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250924133552.28841-1-johan@kernel.org>
References: <20250924133552.28841-1-johan@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063628_845489_6CAD1A69 
X-CRM114-Status: GOOD (  12.75  )
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

Make sure to drop the reference taken when looking up the VPU firmware
device during codec init on probe failure (e.g. probe deferral) and on
driver unbind.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Cc: stable@vger.kernel.org	# 4.8
Cc: Tiffany Lin <tiffany.lin@mediatek.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index d7027d600208..9237738d7632 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -83,12 +83,20 @@ static const struct mtk_vcodec_fw_ops mtk_vcodec_vpu_msg = {
 	.release = mtk_vcodec_vpu_release,
 };
 
+static void mtk_vcodec_vpu_put_device(void *_dev)
+{
+	struct device *dev = _dev;
+
+	put_device(dev);
+}
+
 struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use fw_use)
 {
 	struct platform_device *fw_pdev;
 	struct platform_device *plat_dev;
 	struct mtk_vcodec_fw *fw;
 	enum rst_id rst_id;
+	int ret;
 
 	if (fw_use == ENCODER) {
 		struct mtk_vcodec_enc_dev *enc_dev = priv;
@@ -111,6 +119,11 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 		return ERR_PTR(-EINVAL);
 	}
 
+	ret = devm_add_action_or_reset(&plat_dev->dev, mtk_vcodec_vpu_put_device,
+				       &fw_pdev->dev);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (fw_use == DECODER)
 		vpu_wdt_reg_handler(fw_pdev, mtk_vcodec_vpu_reset_dec_handler, priv, rst_id);
 	else
-- 
2.49.1


