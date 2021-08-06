Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5C5C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 08:29:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DCEE61040
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 08:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1DCEE61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KOrw0fW053cFhAtuEUexfYgnRtTK4v+fzqx37IyPdQ0=; b=H0wvkMvdo1xCmU
	6kr5VPWblmPJ4Pyec+jNrTLhEb9zgqbkkCD8yDAIwUTDarNLxDjSt8onaAoboWwS9J3eg/pmt24lm
	9JET42xFwYPRs8CGUSzzviN0/GbmNO/AhIlUMCKIK6mu7DcOQ7XtG7eYrG2bvUqjrbLBfbGZeJatx
	npFfeVAojX7LuQ3fFNrET2pEUnnLuB+NaOaB6VrCbPUxxyeZbBE8tarsuy3vtkNav6RtF2nqaNEWd
	5kEsNV1zDtXA+GlbcNwzPis4zcZXthItkNUF5leDYQrnYe0P2QMzmIpfXpb8aCLlMVxkTaRwZXoYk
	D5lPkZgTy1C0aaozoC9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBvE1-00BsWQ-1q; Fri, 06 Aug 2021 08:29:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBvDy-00BsUQ-3U
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 08:29:03 +0000
Received: from guri.fritz.box (unknown
 [IPv6:2a02:810a:880:f54:ec56:4a95:44cf:a8a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: dafna)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 86E691F413B3;
 Fri,  6 Aug 2021 09:28:59 +0100 (BST)
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To: linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <acourbot@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, hverkuil@xs4all.nl,
 kernel@collabora.com, dafna3@gmail.com, mchehab@kernel.org,
 tfiga@chromium.org, minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
 andrew-ct.chen@mediatek.com, tiffany.lin@mediatek.com,
 matthias.bgg@gmail.com, courbot@chromium.org, hsinyi@chromium.org,
 eizan@chromium.org
Subject: [PATCH v2] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date: Fri,  6 Aug 2021 10:28:10 +0200
Message-Id: <20210806082810.9378-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_012902_325582_9ECB13E0 
X-CRM114-Status: GOOD (  11.88  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This patch ensure copy of a multile of 8 size by calling
round_up(len, 8) when copying

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
changes since v1:
1. change sign-off-by tags
2. change values to memset

 drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index ec290dde59cf..66276c5a1bc3 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -316,6 +316,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 {
 	struct mtk_vpu *vpu = platform_get_drvdata(pdev);
 	struct share_obj __iomem *send_obj = vpu->send_buf;
+	unsigned char data[SHARE_BUF_SIZE];
 	unsigned long timeout;
 	int ret = 0;
 
@@ -349,7 +350,9 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	memset(data + len, 0, sizeof(data) - len);
+	memcpy(data, buf, len);
+	memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
