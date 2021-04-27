Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05739C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:32:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A860B600D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:32:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A860B600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UUV26tARk+pf2ec3VSP5u/CiGEh4nQWPaPp4xMmFi5E=; b=qJUMbU8HyTZqh5TVBj1PBGjPJ
	bVr6dCXogElFbF6IADh/Wr/O6QJEfsPpaRxbPlCrgsCYHGP0srOx9Dh56bINQKKfGYsDymsN4FOG2
	VEcP6bpuam/uDauFoj6v4ohAQHoW0Xbqild92sUH+8++f3/At0f6LCXT9UmlgZoch14uLgOPh1B68
	n0b3VrdvKJjAedAP9M3Q6s16cuqRHVzIQnJ67wKVbeP5T+lBdnnAIhiO8hKhOLOKdnLHik/vygAmB
	oPvcbO5LC+OSHP0TNf8fpmC2HkHYWYJcLAENcw2GBJy1XLKqwFyreI1tk1tsyjG9NBDIFcqeUrEdx
	SbrC6iQ5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbL0G-001OJR-Kz; Tue, 27 Apr 2021 10:31:42 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKwB-001Myl-2O; Tue, 27 Apr 2021 10:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6tWS5AWeHgEG14BxYeaqs+XN0hv2Iox9SZeAydDvL1Y=; b=cE4tXBRCVXCAPm04+d+6PGkJJU
 KJh1oiJ+GJvg9NeHCWDKRJmTTR9dK+VpF/8cQc+enT9y52QgSHpGjKZC0SYG4sUQKd3XqNSlTor9l
 hS25SFiV3H537ir+oGUzBv3HCuLLzUaa/+BH0va0rifWzTrH41bXe7VFWmCg6iJ65GTOi5vnrR3bg
 T+H/H+ror8Mfu65gNJn1bCmNJcvxuqCkXDY6oNHsEcaois8kknONeRLEQ0Y9hF6xRQPfTtj89XufD
 Y8IqgjD/C1OVqMZarMCaKfgYwxqnQQiSZ0diP4FTYuvj5sKNK8xYHKeUwyy9nF3fUpUj/oqGYEgzd
 MhUdyNzA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKw6-00GdDo-Sv; Tue, 27 Apr 2021 10:27:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C2176141E;
 Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619519236;
 bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pWCJ5+YzV+LcsvBasttI5OaUINWopbWyj5/ga5/WC9JOzN7NxnwTRnzkoR7yiIP3M
 +PJcHT2kOzktyDUf+En6mdaLVD47HSRIUekSKGttv24KunrF/o7IWKUQgRHxBmRmxP
 NAKUYCWxqb2ukUddcCcWJe/3opHkQSJ1dpwhkJOnO2HzTPUY/+PvRjKo7uC0AJ/lYE
 mMICK4o0IugbeRbRrm+pqk6xcnDCcGjbzvzPuJxm4d09/tBaTO7XGgbv3oFX0coXZp
 kXMCdv3dhLDoUl1ET24dOAze3Z4SUP89d10BaIGokgAoVe1ecYRQdNporXx9cbZbGy
 UmAxT+47WFBhQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKvy-000o2J-Jt; Tue, 27 Apr 2021 12:27:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rick Chang <rick.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 64/79] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date: Tue, 27 Apr 2021 12:26:54 +0200
Message-Id: <a6fcf38f0add7f5ffc3b8d8b923c8dabf22738d7.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_032722_989598_4FF2697E 
X-CRM114-Status: GOOD (  10.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..a89c7b206eef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -920,7 +920,7 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto enc_end;
 
@@ -973,7 +973,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 		return;
 	}
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto dec_end;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
