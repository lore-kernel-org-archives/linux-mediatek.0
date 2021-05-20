Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE0EC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D1886108C
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D1886108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUO8lRv9VEqTtLJJuZ3P17ZIVdwdgAqpKrxmZ/kMN8c=; b=C0BZHzOq+8lSj6vyfGjFQDxtWi
	BwyJZYTy5Lbj3d2tPPc5hYTbBqaaxvAQ8kMThlUUT3EJ0THfbNDgc9siQ+c2lTsNCGUMd0IlKIjzq
	jzelwEuYWp+aVCkwVWnq+A5IOM81vuEX9Omy9FD3Dc9qC4rEEXZv8CHlPNGn2MpP+MUVvfF1FHb14
	AWeEHkJaeAsAYj4HkXMtTcTJ+EM0qhxX8HJ09EdEcSlxBxchD2XG8y8h7mwSXahUpwvKXL9N1Ghd9
	HyLHddCgrXNPY5mwKR+gRovl0NR2Ahbj4VezBgp8mDwk/TFXJ1ZrWMg2LPIOLLEx7dCXSFZkEXWDQ
	CkxudXRA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhQ3-000hkt-8I; Thu, 20 May 2021 12:04:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhOF-000hDV-AS
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 12:02:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=; b=Kt9zMWSIjSBOxb5dDj5989z4zq
 dtEOCAngxPE1/yyHWsGXaxyZBJQul9S3Wkzc+vkPvzxcuD+7G1Vw5Rk18v3JdCXlXzrtyngtaPAor
 DqokHGb59uFZEZwiPWvbL3ckej9g4HgDaZQpjXh63zSvXXsMR4gL/UvocX9rU4C//6YSnceBm56fW
 ouExXnJmPne+Z6cIwY0zxVpWhxAuN2Dfe6Ug2Sd0lUGtD+VXXqvZDGQbwcdfbxDBgEGou6DbcwRKC
 N7w7hNhKvRGJjxm+GI7kv4S0rtcLG+hFk93ML473csEYZS6uvdccNYp9M89tcEhmnEvrf52A793gP
 SMRwXVVw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhOB-00GHmp-01
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 12:02:57 +0000
Received: by mail-wr1-x432.google.com with SMTP id v12so17385062wrq.6
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 05:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=DXAd2Cbmarjx32hRY0bCPUAuvAnlgW3AWRT/xVZNr8kCPXSByJXcsb+WRz3G5GS+pQ
 thEIPZ5g5m6vLshkZQvxmcGaXjvcI4oZhUtocbfMXaVxxNNNPOZLvWzliVMnTrLFje5y
 G5dTLLV2xex/mlTG+UDIVIUV97SCmZ4aTLqOKkYlrDpPyTTtdtmjdUOF3D45cdnog6rR
 Hr2z+K1bhuRkuFpXBZNOKXPUGzEF1Met2wSoYe0w0r5nfkK2GWYjVBM/Xks/ynTXf8/m
 y4eBvtnrSb0ioUWBKUvEYWqIzeaB6yLlLI55MpZUZp31h8lYD0AD8x3UTdQZ8NsXdOdI
 F4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gorhgp6A/JFLcLopPzVqEwuJgKOF4GUxJ0EbzsMlIrw=;
 b=NodR8pB3LIT4MLbpjp0+k40nIW1Fc3l0WFytxUW2+b9H/02WPd1KLGqZisorZuxuVY
 iCwZj0pCKE8DYjd09F0VkOh2Fw+oceOfaQoZ8KwS5n33CFE0FRx/8H/rBfsmogshXUzY
 ytwkdiSnZYiivzrVj+Ro987nNyeYzXUoFFiaoYfx8jt7HAre1gwdRNSf67X0H5NKZG5N
 VDq6Bj0xx6Ww5DOVpQdfwR9DzkwHH/aJe67vqusORsKxwVeLGeYRqSFz8G40tBoRC2Vn
 1BDrWhPz2rmKUum++mP3y1DrRdBcpOBjUG6lwbxY4ikZaITQBG8XxrdrT6Y7TNxEjEkK
 WfHw==
X-Gm-Message-State: AOAM530Memo8QTetEXnablvTpF900PNHXv+HnE3PNdbhfEk81y+MLKKv
 0tSz9qTR+KSTLoCOPy7bj0qutw==
X-Google-Smtp-Source: ABdhPJzh4BHbXGyx8cGFDsWQ6g9jPqTsOOVJGdjgVjcIBXa/i0FJFZTo8q2m6mCyS360dD9BWrucRA==
X-Received: by 2002:a5d:5382:: with SMTP id d2mr3785609wrv.367.1621512173034; 
 Thu, 20 May 2021 05:02:53 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/38] drm/mediatek/mtk_disp_color: Strip incorrect doc and
 demote header
Date: Thu, 20 May 2021 13:02:11 +0100
Message-Id: <20210520120248.3464013-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_050255_044223_39D6A33D 
X-CRM114-Status: GOOD (  11.90  )
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

 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'clk' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'regs' not described in 'mtk_disp_color'
 drivers/gpu/drm/mediatek/mtk_disp_color.c:45: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_color'

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
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 63f411ab393b7..6f4c80bbc0eb6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -30,9 +30,8 @@ struct mtk_disp_color_data {
 	unsigned int color_offset;
 };
 
-/**
+/*
  * struct mtk_disp_color - DISP_COLOR driver structure
- * @ddp_comp: structure containing type enum and hardware resources
  * @crtc: associated crtc to report irq events to
  * @data: platform colour driver data
  */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
