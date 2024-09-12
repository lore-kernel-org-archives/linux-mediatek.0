Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217FDEEB565
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Sep 2024 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iwn1or/bBYSNEeUGyuhOfxUWx3sWzISGdpZDtEwQt38=; b=q4Yyg7vhGbvWn2Jn/qeFuTp3BH
	OYSj+SjMKz0TD9xiOOkOr7TDTvNCaX+tm8o/djhW5cachOOwGL88WqOALV+SXD4TDR9qyI+EYd1yO
	cTulAHL63p4Und2Lp44o5Zm57NeAprqFyAnmaULoA9d4sgQKVIaoGMx/MWEXSuXshOlr2Ao7KG8D6
	nrnEMsEkvZ9aob2+UUjahjcpZx4W3UjW1JdrLYikzZlB3zqH3cnAAIOnXWJkJN2eQqxdW6dcgNX4V
	Y2S4Gg2W7GRf6TfP9hY6u7YUQ+7dnzddgnr+sOdplxn6+QcOR/Z/o2DMiEH1ov5NIjAZ3JOhEFDQN
	zwjCkl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofRr-0000000CQ3Q-1UAK;
	Thu, 12 Sep 2024 08:45:07 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofRp-0000000CQ2m-1Cdc
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Sep 2024 08:45:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso7521205e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 01:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726130704; x=1726735504; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iwn1or/bBYSNEeUGyuhOfxUWx3sWzISGdpZDtEwQt38=;
        b=YS80CzBHEINzs9TETL4ZEcNzkZsv+LdILhTLORFPcHsT9icj1aE3uCqawyUAVRu5KX
         JW1+hGNjVe2YkDx55IADD+vToaFArJ4exlLCM8dgROlJo9XuscNH5qWsm8Hs9kl3hikI
         KHhZ/nC7teuEzvLhkVBc+B1R/JDpuhPSkPFRQrYgoCJ5+HYnpoBWGL/4pbd3b/JAV/2q
         JQAKTXQ0mgfMPn0WPAH8Q1MbpPtvC1G9WCSZ5QWXXBzEuU4g9ag8ma3lrm7BflfuovGm
         5qbM4IdrKDogpQ2KyUz4/OE90Ged08K8XN9CV0CQUQmFMKefC+T0qCsiNeC8tduHLIdL
         ezZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726130704; x=1726735504;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwn1or/bBYSNEeUGyuhOfxUWx3sWzISGdpZDtEwQt38=;
        b=aQnuYVeDxbf8PELpdZpFZp9PHzjQNBxMr1u/Dydls8+J7MVn2YEXVh9w9tvIsKZWIv
         moHWouC8ic+Tuie8j8FpHRh1otwFq9VxDRZE783hSLxE18Bx2PRCQQNg8sFMvfFI1H+y
         JfEl3AMZGaKykFdusWLHF3BjXVHPz4SeQJ/7LD3Y+wfTzv/f13Yx4R7QJPRVeT0NgDU3
         gZHBLi+X7v+ET4Z4ffVdi27RE8ZIstIugnj33vdVSGIXf7ScgzqEoFPgKJiu/VR486SH
         x3arX7081G5sy0GXnTV42V/ALcEAvfifZC2A7MFSEadVM/B0HiRAG0dUgNAIUnp5+vtm
         vbFw==
X-Forwarded-Encrypted: i=1; AJvYcCWDgAD8EsuvCcKOhIa2S2Gg40aOdJfJddC+qsWdSGwSUB6AxRCsPBhIGzffLVs1yhW4li9VSoJgcZCGf7ywcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YydaBYxtfaLymvgRFG6iTUETIlr7gm0P4S+yLJNRG/QFpTamFlK
	GfCfIH+ctPfo5KLQeXT49rR4HijLUcVQYFMLFpZaH2kqHMefcB2rK3WqwEQKSJg4B1xsXzZFwvw
	q
X-Google-Smtp-Source: AGHT+IE3jIKp1LsMR7cNfJjwontG8p+Vo7dQ6rcRj2YQpKpztKUglDivYbVOWQlxSgzVuxQlXUEEiQ==
X-Received: by 2002:adf:ae51:0:b0:374:c7f8:3d50 with SMTP id ffacd0b85a97d-378c2d588d5mr1389741f8f.58.1726130703593;
        Thu, 12 Sep 2024 01:45:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956de262sm13712489f8f.112.2024.09.12.01.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 01:45:03 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:44:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>
Subject: [PATCH] drm/mediatek: Fix potential NULL dereference in
 mtk_crtc_destroy()
Message-ID: <cc537bd6-837f-4c85-a37b-1a007e268310@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_014505_368155_B7B36DBF 
X-CRM114-Status: GOOD (  13.05  )
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

In mtk_crtc_create(), if the call to mbox_request_channel() fails then we
set the "mtk_crtc->cmdq_client.chan" pointer to NULL.  In that situation,
we do not call cmdq_pkt_create().

During the cleanup, we need to check if the "mtk_crtc->cmdq_client.chan"
is NULL first before calling cmdq_pkt_destroy().  Calling
cmdq_pkt_destroy() is unnecessary if we didn't call cmdq_pkt_create() and
it will result in a NULL pointer dereference.

Fixes: 7627122fd1c0 ("drm/mediatek: Add cmdq_handle in mtk_crtc")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 175b00e5a253..c15013792583 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -127,9 +127,8 @@ static void mtk_crtc_destroy(struct drm_crtc *crtc)
 
 	mtk_mutex_put(mtk_crtc->mutex);
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
-	cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
-
 	if (mtk_crtc->cmdq_client.chan) {
+		cmdq_pkt_destroy(&mtk_crtc->cmdq_client, &mtk_crtc->cmdq_handle);
 		mbox_free_channel(mtk_crtc->cmdq_client.chan);
 		mtk_crtc->cmdq_client.chan = NULL;
 	}
-- 
2.45.2


