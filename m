Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFC1C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:39:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F6F610FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 14:39:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F6F610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3i2vd8Yp6YZ0MFyfb7FCydlj7oGKtzyjhn0P8gzLYWA=; b=nhRkxwgHEv6tABgo8i+jBu+a7
	ViAcSSq+qlBwiTGG2O+w4EWloqxBIoEmA6/zxP5ZpBmEcUgUtKK0XUMcEGYERQwiLJDEGAij8Vm5r
	nXAjNFQ3TDEYkVeNnUmsGsqJD73MFd8OzlPfSPn70XWCCO2d3ADgK6lRhnconK0j3zHtf+W2RuxNf
	EJsGngVoqsiXi4Ft/luadX2J+EZC3unRYDs8VlOU2N/DyG/waR4Qkbg4H9CgH0SpTkTYtd7tzKFW+
	DEb5GvU9TYGZRkMRvqftK7Jdz7UEfYS9X7tBkkPhHyHZTlijwy6a2FNFE+zVs4ZYsdktwMirHyw2i
	+WYqlYFyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXPcb-002Qur-Md; Fri, 16 Apr 2021 14:39:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPbv-002QkR-4Y
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 14:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/J6GwXeDyu6BFCOqdnjyM+gc8J2+w9Z9RwZ5xPgtm+s=; b=02d10wiEfQTuU9OHvPeEw8Yi/x
 AgQa9THAYBNqM9WYY5nxQRq5F3kKqe6pjtDdOuvnyplJVMqTtAC5n9c8oeZ7Kgt7h5NgPKl9jNP7h
 XXMeJcBoLjBWn/hJMvJPTJ1mtWJO3JNhuHOcNzu/ePb4/6rTIVwNfsfW/0zS/+35r8Of9oFw0YRK6
 W2kMwS4t1EsGUx1fGkzCjBZqXvKnBrw5XY6msC/x5t8K55V65jGxfbJS5wKefteOvlloO3HNKpww+
 /UobsQgvCvZjoIbKR/o82LeZSHilZV5IAclUVLVFspHDJ60lHtMg2l3HmNmkxdaAraS6YpK//2QuP
 Bij/vXig==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXPbp-009SAh-TT
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 14:38:17 +0000
Received: by mail-ed1-x52c.google.com with SMTP id f8so32557730edd.11
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/J6GwXeDyu6BFCOqdnjyM+gc8J2+w9Z9RwZ5xPgtm+s=;
 b=Q3vDrMvdLvGZIwxQufcM4ObRDx1q/WwhSRnb8Nni/u1IMyeQoijNkIN4BYPVyYvvT6
 /d2kp/zGgNL4i6WogCZhbQAsxU65ZQf0NFwbktiqhs4jT5qsfNLrV1K2UPY+cYk5/V3M
 XVrZeEroUAorEs8+4tHS6ZR/z+7PEBUSIi98XEgp2F8Yyp7XZbEn0ZZRCffdMSZcmORh
 hRXm2eliqwK2RzS7LJBm7RRY3JSpby9cx17daB9HzLiMMQyrTt1SInsWK3wraCZJ4tC4
 dIFEHd8x7WDxe5ft26oGQAsVj4rST6nYZeFhajLg5Y1yOHHwGva8v98HGJHotVerp8mB
 2mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J6GwXeDyu6BFCOqdnjyM+gc8J2+w9Z9RwZ5xPgtm+s=;
 b=U3Ep2k3o8pdBqijlL5E86BSkjrlLDRGnW4MEcxt86rrQ4se7brJseKsl+yY6yD1NCf
 J9i3GhQ1pK0dw1shDXcahihGsqyTV486Jur6gfyfdcEiONoWTN+AL2CnSYkLKH3X8MLe
 uOwLtktJ1MsyOC4xqe7akZaCuIYI6kGUm9O8qnlsN7/UkJ+u47HbQAxI6jzEm1esU7X3
 edAr4NNpPGQJ++c/HZqrEFiusPQF9ZWbGtaqXTR/s6SQbmKHboq2JnOGhsan+AVQFZjJ
 ynvMwIxoOgxvll8eudaEWBs6pQC5sAmCBklnayH8J94NTF8p+T0Xe7370rB0p/0lr0jS
 Reig==
X-Gm-Message-State: AOAM533MUr/6jU2ZwP3SE6vp8j7f1rEq6QJLQrsN0P6dk69pdvFX3Ab6
 mNtmQsjPsbGrIyGqVU5s730ULw==
X-Google-Smtp-Source: ABdhPJwD6mZ3l1v7npdR3R06Fu1vIMDRzVQSJrKew9+6JJdz0z3JBBQ7KHxq+ICMPQfnZUPlojP/Ag==
X-Received: by 2002:a50:9b12:: with SMTP id o18mr10609284edi.376.1618583892423; 
 Fri, 16 Apr 2021 07:38:12 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 40/40] drm/mediatek/mtk_disp_ccorr: Demote less than
 half-populated struct header
Date: Fri, 16 Apr 2021 15:37:25 +0100
Message-Id: <20210416143725.2769053-41-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_073813_955198_7C6E4928 
X-CRM114-Status: GOOD (  12.11  )
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

 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'clk' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'regs' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'cmdq_reg' not described in 'mtk_disp_ccorr'
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c:46: warning: Function parameter or member 'data' not described in 'mtk_disp_ccorr'

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
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 141cb36b9c07b..5276909a775fc 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -33,7 +33,7 @@ struct mtk_disp_ccorr_data {
 	u32 matrix_bits;
 };
 
-/**
+/*
  * struct mtk_disp_ccorr - DISP_CCORR driver structure
  * @ddp_comp - structure containing type enum and hardware resources
  * @crtc - associated crtc to report irq events to
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
