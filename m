Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4140C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Nov 2023 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmCcZKWWwZWAAIdygGTS4bHPElBN0IgCDYBXIzaN8Rc=; b=wYnyOIIg2aWygd
	YiZGKZmFtmVu79mAE9fe8BCAWVjZf8FF1HChlektZ/VrlA6j0x94IPfq3Tr9VuLw4BPPlG0fN+OrQ
	7Q1qFs469C2OvMywLuMyviXHC9qmQccCrzB/r/wGF3Jv3DEwDs8T3uUWcort67QrhWMiLyWERHgsF
	ZdmxQ8zE9CrrUcddpmVj/elGTs2QXquNdp5encDmr1wUJTs+kzXkn/FgVjCqz4zdS4mfP2iQR/ihP
	H4wcvCh1nTiVL1tqkxMct898R4LAF6HR4SwEsB4U6BLmphsyFpMfP6t2yO2pKmveDATMwBxz8oz42
	cnz2pu7TI6MUd0MT7R4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6y-00DxrU-2b;
	Mon, 13 Nov 2023 12:32:16 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2W6u-00Dxkx-2E
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Nov 2023 12:32:14 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc2fc281cdso31067885ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Nov 2023 04:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699878726; x=1700483526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmCcZKWWwZWAAIdygGTS4bHPElBN0IgCDYBXIzaN8Rc=;
        b=FcFDsfViNXZTq2KwdC6HoPAFGJcLudBUwNo4GYaTDm2nusqQV9oxW5uo/s37OHhcJh
         ohy9UGVtVzhGnGgJa4KhKsxoy5QizgbHTEWKMGoDUZ2QE5jvyjKZe2lTnBQ3uSdOCxMi
         xfO/rGNlJsUFYHE+0NhlkAmuZUK44FqpK/yps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699878726; x=1700483526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KmCcZKWWwZWAAIdygGTS4bHPElBN0IgCDYBXIzaN8Rc=;
        b=RuudJwqDAmGh78lqQ+NQxiYOlrFS3MIVGCyTfh94nHVnAdbOZuaQRwLcmJcYpSRzHp
         ys2EsEQxSp2OQWDiYE8FDjeIhLh/aucpsa32JOamgrKjzQx6Mm702DHqDi1cMO4l+794
         WCoJk0BcjM5jEJpPMNeRaAI6A1re37uixmwiyFcoZ26H1TK6w4ZmZ+dazM+vNt7ieOzw
         rM9JXDP2Vq2YuS4wwLRx+xhpLVpXOC9IRBUOWPcfPLfVuFn3vWHoepW76qf7PWWD391s
         FPptNZJS01e7v5COgCvvtwdGR+8J+k8vs/WW+ZYEkYHUrF41h4f9JxmBYjW2jKqFshmy
         Ascg==
X-Gm-Message-State: AOJu0Yx4yHRI06p1IttcJUj6QEeGOXU8zVVvKUdC+3O/xFamAXQCin5d
	+ekZ+ZWTTAbfK7HRnJI6B9W7Nw==
X-Google-Smtp-Source: AGHT+IExf7ObUmbvOTrAkJwVf7MguRRwDwFguon7N78CqrwPhBqwig/xn/knQ10TaWNK8GigQiHqwA==
X-Received: by 2002:a17:903:1c4:b0:1cc:3fc9:1802 with SMTP id e4-20020a17090301c400b001cc3fc91802mr4826133plh.61.1699878725604;
        Mon, 13 Nov 2023 04:32:05 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:bc9:4777:173:8be3])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001bde65894c8sm3924104pld.268.2023.11.13.04.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 04:32:05 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/4] media: mediatek: vcodec: Replace dev_name in error string
Date: Mon, 13 Nov 2023 20:26:49 +0800
Message-ID: <20231113123049.4117280-2-fshao@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231113123049.4117280-1-fshao@chromium.org>
References: <20231113123049.4117280-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_043212_730675_BEFEA885 
X-CRM114-Status: GOOD (  10.54  )
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

mtk_v4l2_err() already uses dev_err(), so don't print the device name
again. Print function name instead.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../media/platform/mediatek/vcodec/common/mtk_vcodec_util.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
index 9ce34a3b5ee6..ea8c35c0e667 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
@@ -67,7 +67,7 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
 	mem->va = dma_alloc_coherent(&plat_dev->dev, size, &mem->dma_addr, GFP_KERNEL);
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_alloc size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return -ENOMEM;
 	}
 
@@ -99,7 +99,7 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
 
 	if (!mem->va) {
 		mtk_v4l2_err(plat_dev, "%s dma_free size=%ld failed!",
-			     dev_name(&plat_dev->dev), size);
+			     __func__, size);
 		return;
 	}
 
-- 
2.42.0.869.gea05f2083d-goog


