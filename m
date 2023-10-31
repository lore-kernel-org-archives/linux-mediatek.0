Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73230C0018A
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Oct 2023 07:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJWU5tnjso1vDAK736GkMoFEm3BXg8uhBy9G73LcJvU=; b=tlk5gbuMt0Mc3QnWrNHtvqwUWR
	PzCRei74qTt8QnpkcRDs6h3lofx0H6a4lNSk/+tM1SnnkD0Uzffow2QANbeb8rTTRbIehSMIhnPLy
	rmSU0uiTqxizCkhetNhiioWe+V1Isb6dS4h8lgjYgAgq7TyaBWxrS4RSJEZ8DYg+iL+XxK1NyB1Zw
	QH+yksw58tMPODzCI27MFpz+9Sp3cw8FsbFkPFt15Mb8c7XuaKP4yPRGEq0MsTy5cO31Ns8/Ykdas
	WMUtqWXCX9HA6DpKxX5rAs/zVP3O5x2Co2BLIIkLESSght6aTAuOv1J7lLYgSUl7snuGOWIsn3a4e
	d4dLUzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7n-004gk3-1c;
	Tue, 31 Oct 2023 07:25:19 +0000
Received: from m12.mail.163.com ([220.181.12.196])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxj7j-004ggj-34;
	Tue, 31 Oct 2023 07:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=SJWU5
	tnjso1vDAK736GkMoFEm3BXg8uhBy9G73LcJvU=; b=J9Q0LIkiiwv/VssVaKp3e
	vXr/+9DXZSnlshaZwntbXD0UtypAGWdOLzJG001ilaLfHUIT9x+pGVNED2Aei0fJ
	HZWPhCNKzECaAxBQT9tYmDejmv2RA+Qq0n4htosaxWi9BAqlfv1M/pW+PdpJHUhd
	9TTo8OhyXPGGXNrMwXD1iI=
Received: from leanderwang-LC4.localdomain (unknown [111.206.145.21])
	by zwqz-smtp-mta-g5-0 (Coremail) with SMTP id _____wDXP+6wq0Blv5KVAQ--.8863S3;
	Tue, 31 Oct 2023 15:24:32 +0800 (CST)
From: Zheng Wang <zyytlz.wz@163.com>
To: dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com,
	bin.liu@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Irui.Wang@mediatek.com,
	security@kernel.org,
	hackerzheng666@gmail.com,
	1395428693sheep@gmail.com,
	alex000young@gmail.com,
	amergnat@baylibre.com,
	wenst@chromium.org,
	Zheng Wang <zyytlz.wz@163.com>
Subject: [PATCH v2 1/3] media: mtk-jpeg: Remove cancel worker in mtk_jpeg_remove to  avoid the crash of multi-core JPEG devices
Date: Tue, 31 Oct 2023 15:24:27 +0800
Message-Id: <20231031072429.21448-2-zyytlz.wz@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231031072429.21448-1-zyytlz.wz@163.com>
References: <20231031072429.21448-1-zyytlz.wz@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXP+6wq0Blv5KVAQ--.8863S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw4rtF48tF1UJF4fZr4xWFg_yoW8Gr45pF
	WfK348CrWUGF4qgryDAa47ZFy5Gwnaya40gr47uwn2q393XF47t34jya4FqFWxXF9rCFy3
	tF1FvryfWF4jvFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRNBMNUUUUU=
X-Originating-IP: [111.206.145.21]
X-CM-SenderInfo: h2113zf2oz6qqrwthudrp/xtbBzhQaU2I0bIocowAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_002516_352939_FC87E13C 
X-CRM114-Status: GOOD (  10.93  )
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

This patch reverts commit c677d7ae8314
("media: mtk-jpeg: Fix use after free bug due to uncanceled work").
The job_timeout_work is initialized only for
the single-core JPEG device so it will cause the crash for multi-core
JPEG devices.

Fix it by removing the cancel_delayed_work_sync function.

Fixes: c677d7ae8314 ("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
v2:
- put the patches into a single series suggested by Dmitry
---
 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 7194f88edc0f..60425c99a2b8 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1403,7 +1403,6 @@ static void mtk_jpeg_remove(struct platform_device *pdev)
 {
 	struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
 
-	cancel_delayed_work_sync(&jpeg->job_timeout_work);
 	pm_runtime_disable(&pdev->dev);
 	video_unregister_device(jpeg->vdev);
 	v4l2_m2m_release(jpeg->m2m_dev);
-- 
2.25.1


