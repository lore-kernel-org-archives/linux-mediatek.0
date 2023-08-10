Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823C1C001B0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 08:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+e1KIdPkZ9W1pyyhd0vEg/XdGpbw4lhXOUhvTsBhFP8=; b=CBPh4EK9EEbEAcuHXZdqS3xsj0
	qPGiTnU/GkxoH12iWlJguzwIF0R6/ei3bYrOCk+W7nH+Gm5nQ4/JTRP4VveJxV94DkIiGNvPd6+V8
	BmYMXvssRDatarjoCGYhotJRHC24/QuPdpTw7IbkB+3V8hyOQca0x+O0aYXTMAEnFzQAZMe1qPyy8
	kL30Nz0AZGGdHO2ml2FX9erXdUHIdcwqw/wtFFzCZZUiXl5ys/8bkdDMOMN5AVrKg7xlpMGWGGk33
	myITKhf8Hj9AZisQdqkxRrV/yvoUsTD2ZkVSy0dp+4CjcyuLu827lcaUMDFqpEXPZ+UVmuKxsExnk
	XNU1mQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0xP-006rzr-1G;
	Thu, 10 Aug 2023 08:23:47 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0xM-006ryO-0l;
	Thu, 10 Aug 2023 08:23:45 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-26b138db5easo69261a91.1;
        Thu, 10 Aug 2023 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691655821; x=1692260621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+e1KIdPkZ9W1pyyhd0vEg/XdGpbw4lhXOUhvTsBhFP8=;
        b=TTOA9ZLE7hKSMCbIwQzADz/+r4wuL4LTp2U75XuUd+F7tqRVer2IsUqHdhUTm4I+7e
         EQ8T8tV3MIvU4c6sNRhK1SsTSBMh1WlNdCP6IDXwOo+G3Eo3XzfSoVGb1TuIUDM66Zx1
         phsMLiRCjyZ8YUolNzCy6Je0WdBvVU+G4uZOYQmzc28zHPObIPykgnsBXcDN+SLHqDXC
         eu6yvHjG8KUj5jEjr3/l1NjOgT99tm3j7cGCYJonYBPcpiQVgIkwRGuEsYrtBPLTk4bV
         gIlwQebmAvJq8O77JKv26Nws533bFZAx/UULe9hmAWRaOWc4EQ0YSwJERc77jZjot+2D
         9RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655821; x=1692260621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+e1KIdPkZ9W1pyyhd0vEg/XdGpbw4lhXOUhvTsBhFP8=;
        b=aTu4D7++V9kySGDKX+FPRmQNqYoem3UTBdYOxeNlMN5h4xyVTLnmsfB44amnAJk48a
         2GKF9dBAQ1rYUdvFw3ZuekyjMrhbBgCsh0XkRSp/uYJuFOeAbdGan+YtjuhkQDVb0m82
         wTX4ra54e/whRbSHcppILkK9WDyzj/jpnljGrrhhVa/3so42g/1objJt42O7VzkAsfpF
         0EXVCDshSz/rWX9z+9aIjSomiO8xq1htSgfQRiMCErC0zqNBdDed98HT9SGvHIkLDyTp
         G3RlggV06lxZvTpP56NlrutcTguWw/racuug/e0ki0ig0Icqr21Cw0sxHijp0cIuNtFd
         wBIQ==
X-Gm-Message-State: AOJu0YyELwla4q2x/wRSPgEO5QOs8uQNY9vbufNkMhMk66MoO8Sovo9T
	8jIizxngLYPhECZr1+UXQtg=
X-Google-Smtp-Source: AGHT+IF0RBM4ZHsM63NvX20vvcHeYHCe+RlLwL/acMRAMdeJsd+ke0rPK6heeKTWeIZNx8WQyrf4ng==
X-Received: by 2002:a17:90a:384a:b0:268:2b5c:14c with SMTP id l10-20020a17090a384a00b002682b5c014cmr1384067pjf.13.1691655820696;
        Thu, 10 Aug 2023 01:23:40 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk. [143.89.191.119])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090a2b4700b0025dc5749b4csm2772243pjc.21.2023.08.10.01.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 01:23:40 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
Date: Thu, 10 Aug 2023 08:23:33 +0000
Message-Id: <20230810082333.972165-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_012344_274579_6A587292 
X-CRM114-Status: GOOD (  12.38  )
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

variable *nplanes is provided by user via system call argument. The
possible value of q_data->fmt->num_planes is 1-3, while the value
of *nplanes can be 1-8. The array access by index i can cause array
out-of-bounds.

Fix this bug by checking *nplanes against the array size.

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder Driver")
Signed-off-by: Wei Chen <harperchen1110@gmail.com>
Cc: stable@vger.kernel.org
---
Changes in v2:
- Add Fixes tag and CC stable email address
- Change the title to be more expressive

 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index 9ff439a50f53..9e8817863cb8 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 		return -EINVAL;
 
 	if (*nplanes) {
+		if (*nplanes != q_data->fmt->num_planes)
+			return -EINVAL;
 		for (i = 0; i < *nplanes; i++)
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.25.1


