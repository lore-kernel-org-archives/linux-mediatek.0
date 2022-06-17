Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD01C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jek501v3Ydyv1uYKUNexRz+HOp+Tdh4kjY//8dd7V20=; b=TLcQB2+ySvOTwtFsjsanSXkdnV
	mT5NxGLIbofK40FO/TwdepNSnmChrH8qr8GdxJLMykca6CBfXqUyRT+nT1KcKEquG3gJatxD6Uhxp
	ln6NCjBmW1u7sNWZh0qtsf24v8suotASdM+Ms9dOPIgo/ACKRxmpwXVr/Tnl8nzKJrF8MXY3L91Bt
	+6YRUBeRGelHdP9n/lDly7lkldyPrRn2EmcVdGJTnKH0fLgkUG1cDwluKH+EucSLMlxjwXiY8e7TS
	6WtKZ2swKpwxpdAyQehO37OghybiHVwHLqgR6d4fx9A0V8hrG5gKvRURVmSROW+WBfSVB9ltlwi/L
	T5YSS1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2JBk-0098Xz-H6; Fri, 17 Jun 2022 21:07:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2IkQ-008zSC-9E; Fri, 17 Jun 2022 20:39:20 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CABF76601797;
	Fri, 17 Jun 2022 21:39:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655498352;
	bh=unOJLRCDw7ZgTYa/8lyD2J+JxtKXBgGo6Z3sHYVsN/8=;
	h=From:To:Cc:Subject:Date:From;
	b=XZ1pKxO8HcDYK1nHIJdH1GIT8ak5uIfYf37+VzFupVfJsNIC95X6RrjzhvnwWv+eL
	 1V5kGuBt0rMJU8N2FslzzJj+IQzzcxbeUyGz02gMuwdbzAy/NxNEfhX03BHTTPo0kd
	 iEZ7/eVobt29a+zVlMRMZZGwQD28ZeNLli4JaqRnpGXNvnuGYMLVfJlwQrzQ5PKhRU
	 PKOjMLScWEeqGZtCNW7JB+kJceemCwEfvLAwwlBN44YgrgZNRBE/3lHsmhMlva7QJQ
	 stYS3wC3VTM9qo9O3Fe2IGrp3nZtZC0APwZiZMHs0Y2+rnon+bgd5PJV82PG/gF9Ie
	 Umha8AdstBUlw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Marc Zyngier <maz@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Drop platform_get_resource(IORESOURCE_IRQ)
Date: Fri, 17 Jun 2022 16:39:06 -0400
Message-Id: <20220617203906.2422868-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_133918_514281_EBBE0A15 
X-CRM114-Status: GOOD (  13.47  )
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

Commit a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource
from DT core") removed support for calling platform_get_resource(...,
IORESOURCE_IRQ, ...) on DT-based drivers, but the probe() function of
mtk-vcodec's encoder was still making use of it. This caused the encoder
driver to fail probe.

Since the platform_get_resource() call was only being used to check for
the presence of the interrupt (its returned resource wasn't even used)
and platform_get_irq() was already being used to get the IRQ, simply
drop the use of platform_get_resource(IORESOURCE_IRQ) and handle the
failure of platform_get_irq(), to get the driver probing again.

Fixes: a1a2b7125e10 ("of/platform: Drop static setup of IRQ resource from DT core")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---
Tested on mt8192-asurada-spherion.

 .../media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
index 95e8c29ccc65..b91c27e79796 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c
@@ -272,14 +272,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
-	if (res == NULL) {
-		dev_err(&pdev->dev, "failed to get irq resource");
-		ret = -ENOENT;
+	dev->enc_irq = platform_get_irq(pdev, 0);
+	if (dev->enc_irq < 0) {
+		ret = dev->enc_irq;
 		goto err_res;
 	}
 
-	dev->enc_irq = platform_get_irq(pdev, 0);
 	irq_set_status_flags(dev->enc_irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(&pdev->dev, dev->enc_irq,
 			       mtk_vcodec_enc_irq_handler,
-- 
2.36.1


