Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA26C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:34:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DADDE610E5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DADDE610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wjm+vdGfEYs3MxxKneb2bEB10F0Nw1uCUvh7jxoG1pQ=; b=0W1zTKRd/YsXqX
	TwTZqB0EkdzLV6VlzHuOYly5y2U4F16nNTUq5mRnuJ0l5lDf0g6R2a1DKS3+6ba0BCF1/fpnCPn28
	lmwfXsA2W7Fb45mCQiywrs0dM645MW/egZx5D4nBL0jFGN5SK8iiLMsyZLplMCYiKnY4SF+99tDwR
	vkO1y9vXfggGRrAxuvwnqBHFBMVgTcVEZukDO0pLROcEY/tDLKDmE/+lN1iSUTO5fEI2W60a5HkiF
	S7I2Pq4EX/hxegpkSmDFBvdcY3t9eNNjBsu5B99E1I1WkoXJcX4gLGliWNi77n8dXIpQEdL81j3oI
	bXf8EbWh+JZXuxwu2hIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loRwv-004aer-I2; Wed, 02 Jun 2021 14:34:25 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loRwk-004aZ3-JE
 for linux-mediatek@lists.infradead.org; Wed, 02 Jun 2021 14:34:18 +0000
Received: by mail-wr1-f42.google.com with SMTP id l2so2551705wrw.6
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Jun 2021 07:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=K+TM+jok6dmGLiVfdJ5aHvkAyTXlaxEkUvu3eR15jQnSiQZDOVbl7Ad7UABtuK84F+
 SiGyWlm0Q/Roo4MaHxBw0hVagJn3kB7B36ned7f9VZ7qKdW9ew8tDax4JyeliwEfgol3
 LzTH/V9mmfZPWw8etltfOUAbOOTdt4Q0Ftc5FSS8fWAxZyn2LdeeVc0x7fAv7i5SeeiV
 RyQyKw94rLiFXSNIvLFJOHuBXAj1BVslRvQMMPFHt2y5OtRXJV3gKAa/0ebcSulVTrhy
 2+LLiMiabV/zAlV49XtTFoV3pIDQSZGzBFWLFN2PAdXSdV+a0OFPsprrfDXJgipgQSRi
 8lMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=VsO5p6FS1qoFKp+7aOQUFUHdS7HuvYEf2BP+PAaNzYDsGdVKeZL8QyvDNXZyYrs0rI
 IsLUYHUZXn3ZPAsCyXrnpyalHddtHxuJqd7CvCuS3F8U728B1qkkPrDElyI+422Agq6t
 ch685BZDC56Cms5QaShoUtPxVV5ycJLlxWyGDxB8vX5/bwwBgmDeFINtfdjLah76ulnu
 oDkLDm8j1yY4eE223Flh7hgr4RbPseAQeFvpkGzSZuAVbSV8vpcFl0lmTS9dyeqaJ8Ge
 67cJC2W5R0AkrwAO91/3o2nPk9rJFD7xEsm6yuIJhvF+udNAinNqD+iXTJOIxE8N8D9B
 /ALA==
X-Gm-Message-State: AOAM533Q1Mgcp+rSGWFbjUGNCUhic/Pqg4ekT07B/Fe4a3vPHSB9oTVz
 2GD5nOjj4JQOlOvkRKjLFHIURQ==
X-Google-Smtp-Source: ABdhPJyyjExdHvRbSDp8SXi+SPDREQCiQw3FO2lfDCB5q7ocoF+sb8JiXyCVcFPptQi4DQIZ2IRr1A==
X-Received: by 2002:a05:6000:1542:: with SMTP id 2mr3202490wry.4.1622644392816; 
 Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [RESEND 03/26] drm/mediatek/mtk_disp_ovl: Strip and demote
 non-conformant header
Date: Wed,  2 Jun 2021 15:32:37 +0100
Message-Id: <20210602143300.2330146-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_073414_652403_F4E9AEF1 
X-CRM114-Status: GOOD (  11.77  )
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

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'clk' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'regs' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:83: warning: Function parameter or member 'vblank_cb_data' not described in 'mtk_disp_ovl'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d15..fa9d79963cd34 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -66,9 +66,8 @@ struct mtk_disp_ovl_data {
 	bool smi_id_en;
 };
 
-/**
+/*
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report vblank events to
  * @data: platform data
  */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
