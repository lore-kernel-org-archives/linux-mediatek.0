Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D72C35274
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpgYqGOhJKgjrH+Y+gow5aHhwckMqDVFEItsLP1DgtE=; b=u0iBRctHY2kFvX
	bIfb45v/zZhmNi8DwplRXDeyffqdXj0a0xK7WBLjDcv1i2YHxCY1l3bFBM2MpOZjPOWOOwIZBDCBb
	bhT3CTGnq+vxs+FWcGh3GgHCZDFXadZFpmyGLPr6hX5Wm/TxmIVmLf/NAtutgIqkwQ5yKTct0Z1xE
	kTYlY0+nmjRzZBZkKeLhE2fFNwgBuibeWih1wmu7eiJiolG/0rTHg0SGB8sdeNwKXw4pJD1H7nqwj
	m/J00gryQFn+iuDRGz3jsQfgQgOwbDZ6gO4w6qWPclc72CMKSUt80FfBQuNaY6S7Sar/kjD1fEmu7
	7YsoLx0TUrVWdPzabQrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFHI-002FSH-2Z;
	Thu, 21 Dec 2023 09:23:40 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFH5-002FJL-1h
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6d532e4f6d6so309128b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Dec 2023 01:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150606; x=1703755406; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpgYqGOhJKgjrH+Y+gow5aHhwckMqDVFEItsLP1DgtE=;
        b=mJ9L7koHJdSZzkKN3GpZC8dX+hxlr0daIQmEeLAx+0Q+60upXtPbUpr61zZNoquF+c
         lyBlAzlGOoQcZYAw32enNkoJxvQ9AD8IoY9tQ66axQPRgrAtXtX3E/oOdDak3csamvmO
         08nLWKSKInpFgi1Tvn3jn6G9tBlLvC/Az4Nbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150606; x=1703755406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpgYqGOhJKgjrH+Y+gow5aHhwckMqDVFEItsLP1DgtE=;
        b=o9TvFaH0BaC3NXLdUmHD9LOMBAlazsIUB3u6VVfK2jHDxPQyciOjhZdxQtUYDBbX1J
         AywSzRFmsTTmICdTHVSaHb5GuLNGDuIfDVZvZhjumV8y3rNVdFHPoSLsGBu2RQqGQILO
         ltIDvAZfSDQ8CwD6CqJ9yJMsBINlZGcSmxbdYxx4Fdftu0GpqZbXOgYp5rUeo4pBXS4K
         d6bFRyauJ+htbSTCXAEXwyPq8V3zL1fRW/pskVpuCMfEXOxsUewmhElCpgKuodB8+3CO
         hxTHVXiXVSS8fUbxiY5SY8we03AIUZiN54yQkQq9y38vcRqMpLrBJISLof7/ZHt3vpuG
         aElw==
X-Gm-Message-State: AOJu0YwxGJBEZVBAKTfSUB+GgxoCmgmnoLNpTa8srSGR9uJHL0Yrkge1
	VPZ27yMWLZSKq9GSceDO/fV2lQ==
X-Google-Smtp-Source: AGHT+IFnrts3BeDUhUkXV+RyB4brmj4RfCUKgv5oiPG6/u9kJt/qtACQnRiXrrJZ8XuzpZM2y2ZDHg==
X-Received: by 2002:a05:6a20:2e25:b0:188:1df7:9afe with SMTP id be37-20020a056a202e2500b001881df79afemr560527pzb.30.1703150606111;
        Thu, 21 Dec 2023 01:23:26 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:25 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 3/4] media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
Date: Thu, 21 Dec 2023 17:17:45 +0800
Message-ID: <20231221092226.1395427-3-fshao@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
References: <20231221092226.1395427-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012327_560460_C40811D1 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In mtk_vcodec_mem_free(), there are two cases where a NULL VA is passed:
- mem->size == 0: we are called to free no memory. This may happen when
  we call mtk_vcodec_mem_free() twice or the memory has never been
  allocated.
- mem->size > 0: we are called to free memory but without VA. This means
  that we failed to free the memory for real.

Both cases are not expected to happen, and we want to have clearer error
messages to describe which one we just encountered.
Update the error messages to include more information for that purpose.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- update the error messages based on the suggestion

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 23bea2702c9a..c60e4c193b25 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -96,8 +96,9 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
-			     __func__, mem->size);
+		mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
+		if (mem->size)
+			mtk_v4l2_err(plat_dev, "Failed to free %zu bytes", mem->size);
 		return;
 	}
 
-- 
2.43.0.472.g3155946c3a-goog


