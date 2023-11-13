Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B359DC4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 12:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utq/LEPd9MWgyjAIqUwG3FJmsCfoE7UdWxPvzIdPYb8=; b=rDdSlIhinjTIt7
	YEpdz3DTE6Ipp7F4udq96bfW8aYUkhSOqJuL+QdnINP8pKoLnLXAOOgaZ631DsTg1WUW3T9ocrpV9
	Plic4DkpkNCZumll2EVJAzPIkrQCk1Y80ycdEg9dbXqyMy0cB98CrSMFGsI91GIgeLrKArc1TEdvx
	5V80wTjPpuIY6xMLxcADcz1rSp+WHgDY/AKokPwEW8t7+mJs7G0TUbpOBv6MhpwMGRq9Ri4DUgQMi
	q3bSKNVfqutZ+T8hln51XEbzarrQSboYJYSqJHQaoNGwvRoSef0ZgRYSiUMluFXxFVvSPrq6KBSFk
	JcD7/wEfZKoZH5o1mepA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W72-00Dxtr-1t;
	Mon, 13 Nov 2023 12:32:20 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6v-00DxmZ-20
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 12:32:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc3388621cso39173015ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Nov 2023 04:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878731; x=1700483531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utq/LEPd9MWgyjAIqUwG3FJmsCfoE7UdWxPvzIdPYb8=;
        b=fWp6edFZ8/X4O3hB7uD15ufqngN3k0VulZQYHXT4EsAEB6q2Mbgg4gr+t2GXlhKFFS
         0bn9GBgjYKIEENERLaFXTcUrLvFUhUSoXz5xN/UmfYUeXRBLf5s0S1CLRQV3b8EXVvYZ
         gkHs6vaL3/mGqmAXqfWT+jxnrxJK+UKZ3sEjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878731; x=1700483531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=utq/LEPd9MWgyjAIqUwG3FJmsCfoE7UdWxPvzIdPYb8=;
        b=ngpH2lkOZVCYkgnI8xeEPe9aF0lcepl1HIh1hvMso+P7TYUJeRzifhCoMoXuLM1FT1
         v6Xl2NlcZ/bE/wWNxzZNKSEEVt+n5NRM29NpBKWg242jD4LdvHVroUwSOEJdvr5uqi4t
         LjMJUvBOrI6EadLhMyLR9+Xas5pxL5oAA1+5Fv/1/nUjdmKBS5H2MCcZ1XkTasgOK7FA
         EQRlTdDdVUBeVZyarnAaeT4RLDAwedYoWrwkdhSnpsEepx2Df/o+4g8sDINLgDTD6TI9
         pwBdeNqMY/tjo8QeEPbKmwTLjhLmW+FIrpm+d5NbpebU4FR4NTYVXarJzkXwO02QgxtU
         ccHA==
X-Gm-Message-State: AOJu0YyR5XLVl2NyhlLq2mCqXh/hg9yd+vwhHLIAUvy9oEZO1/1PuD0a
	rrYhg1hhXBfI0pF30y6E8/j5Ww==
X-Google-Smtp-Source: AGHT+IGG/zF/QwLP8a9jX0YqCzyCMTgh29CNbFu1TQxkbJZaAa/VU3oDqMMh5ijHm1SKJCkxOnMJZQ==
X-Received: by 2002:a17:902:dac6:b0:1cc:42d0:dbc5 with SMTP id q6-20020a170902dac600b001cc42d0dbc5mr9611281plx.13.1699878731524;
        Mon, 13 Nov 2023 04:32:11 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:11 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free() error log criteria
Date: Mon, 13 Nov 2023 20:26:51 +0800
Message-ID: <20231113123049.4117280-4-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231113123049.4117280-1-fshao@chromium.org>
References: <20231113123049.4117280-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_043213_668744_7051670D 
X-CRM114-Status: GOOD (  13.34  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer has
never been allocated or was freed properly in the previous call. That
makes log confusing.

Update the error path to print log only when the caller attempts to free
nonzero-size buffer with VA being NULL, which indicates something indeed
went wrong.

This brings another benefit that the callers no more need to check
mem->va explicitly to avoid the error, which can make the code more
compact and neat.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c  | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 23bea2702c9a..5eb267decfb6 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -96,8 +96,9 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 	}
 
 	if (!mem->va) {
-		mtk_v4l2_err(plat_dev, "%s dma_free size=0x%zx failed!",
-			     __func__, mem->size);
+		if (mem->size)
+			mtk_v4l2_err(plat_dev, "%s VA is NULL but size = 0x%zx",
+				     __func__, mem->size);
 		return;
 	}
 
-- 
2.42.0.869.gea05f2083d-goog


