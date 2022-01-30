Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9A7C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 23:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FBFsZRjtGINuf1BiIqTgyE8pELaQn7FvsAl99d/Q6W8=; b=YxoADpPxx+ZfUo
	gUGxlQSjKzrXghXERAr8nEAgOU8IawTXvekg4fLxL2sr8ugEnVnFLPDXRPMe+YhwwwdzIo8T9SrfX
	Xoixf4sSQ55EfNYA0CpKaCIzsd5DbAKPygAkbErYaZhfFUZdVhXGF2FclDKenFMGyIoUYaxhymthg
	mBQ3SSfNuoq59mce414RJdiQdcY8TkZzrHXNkxahTjBY6h0a8QVy8x3RUxSaq++rhc/mWPZafLe8j
	qsJ4GK6S9Mql9mhmp8W7EdhdYdSwUfPLy3szKwwn1SjT+eNAKLIWGdcWg6KGLVjT9q+ASek8yJBXP
	HRj8oF4yEQqf/gCL0ZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEJLx-007cyd-Ow; Sun, 30 Jan 2022 23:11:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEJLl-007cvf-Na; Sun, 30 Jan 2022 23:11:14 +0000
Received: by mail-wr1-x42e.google.com with SMTP id e8so22030108wrc.0;
 Sun, 30 Jan 2022 15:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIdPqYs8pcB/F7X2IthUrwmWJbc2O1lsmbqHpZXh+GI=;
 b=XjyGAy2uvlKwAUCs5+9yzRDXlMoY/j1Fhlmo2d66/Vlw6KVNcUKS2FZ/9pvNCr7MZx
 BlwFU03OlwWLausgmgG7ICtMVATz2iG4/WtA5brbo2hw2/MPEyJ769oW406pMTtU4UF8
 E4s5KTB2dbJKbAQ1LqCE7f4y7nM3UmC0rq6dL/DXbNI/iK4MEFA1Slbo4KmHrOGE/0S9
 4wCqVkqsv5VWLK7z7sPBUGpyJdxy0fVOs1rElhZIxtcQaR5uZiJCgk3WrEJ4uVMZzEDQ
 TqW0PgK3eRH+AnfbYBOGyMM6hGog/VHUbStj6jm2G9hhaNG3qGkjxIynljciYHYtMJlE
 FY8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIdPqYs8pcB/F7X2IthUrwmWJbc2O1lsmbqHpZXh+GI=;
 b=VYgy7v+8nQgWF17OB9ZjOW9gBD52ZQL5ztsw3RkZNbYUb47Ce2YC1VAYBKOF6epdfJ
 Ny8cFGHzD3W8Ix9W49n0VntnBOn8+TUub5xAgAaPXY493NICa5VoOTa1rf3J1PW+uZxU
 34tqJxMkk0uztbcOwQCwtXutwsE/eilK5BBr0NRUCpckrpq6o/34lTVJOjJDggMyYV3L
 5QIvUhlzsEukoe7PA8EbNzP+uAESUpgEMVswSap4nPYe2aSOQLW+Ri0wg4swywbCqE6v
 gvK0JBG+GY8eN5zrcsWcM29rHlfPuHRGJsYVdFVUmFlZHZC/9r0fieSXAOAl31/+5GxQ
 EDhg==
X-Gm-Message-State: AOAM533X4m//UsXgCf7CCLp7bD0yUOmmZTb6dCjmXsrwmmv6ngJNotsu
 hwKjOh0fGYsV8+0V1I3IxY6o579EviOMig==
X-Google-Smtp-Source: ABdhPJw9oOFK6pyGWIH/2GPlhXou3jJsuUPf6+NVS+34/TUD9G3Tzw+tqYsd85BYIPXisSnWQkiZXQ==
X-Received: by 2002:adf:f045:: with SMTP id t5mr14744801wro.383.1643584272372; 
 Sun, 30 Jan 2022 15:11:12 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194])
 by smtp.gmail.com with ESMTPSA id p15sm10018366wrq.66.2022.01.30.15.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:11:11 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Rick Chang <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: remove redundant initialization of variable
 plane_fmt
Date: Sun, 30 Jan 2022 23:11:11 +0000
Message-Id: <20220130231111.8563-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_151113_802422_913CC3BB 
X-CRM114-Status: GOOD (  12.90  )
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

The variable plane_fmt is being initialized with a value that is never
read, it is being re-assigned a new value on each iteration of a for
loop. The initialization is redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index f332beb06d51..b334bbb2e682 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -681,7 +681,7 @@ static int mtk_jpeg_buf_prepare(struct vb2_buffer *vb)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct mtk_jpeg_q_data *q_data = NULL;
-	struct v4l2_plane_pix_format plane_fmt = {};
+	struct v4l2_plane_pix_format plane_fmt;
 	int i;
 
 	q_data = mtk_jpeg_get_q_data(ctx, vb->vb2_queue->type);
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
