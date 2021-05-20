Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2C0C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E3B16108D
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 12:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E3B16108D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wjm+vdGfEYs3MxxKneb2bEB10F0Nw1uCUvh7jxoG1pQ=; b=OJbX3R84LnrN1fFOC6kh6dhFkC
	OAiupqpbMIsUQDqEF80BrPzCgVkb11sLwd/oIPLlWC9B5u1LndzyA9UxwDSdBPgTrr6qkGd4gTWQZ
	JJdMROrFasFqjQhypihA/F1lIYFPEBkC847v26uy37uxPwi4m3A8dmN5oa3Fco/jHX2y1O+lGKLVQ
	WYqtm1naRYMDr0SYEunue0BL5uzcYTmfHyu651tAJ7aeT7Z2mM3loZ3hr8Dt5maqrvgMzejUMgAyD
	MoGn3UU/z7KftAE1E92AvW4QeFTN1I0tj3kdHrxvk66eK6uJ5soGkyws0buf6UWWBV3JiTRUNHhel
	BP6my69A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljhQY-000hzD-08; Thu, 20 May 2021 12:05:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljhOG-000hDy-Ae
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 12:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=; b=V4/FVmjqQt2N5iLAs5QHlH4lb2
 odvzY1+egBv4AQmC+72DjgJX+ZdHADfSnxYuOYWI0DdIu0dEUO99g5Zak0suYXYSCOHBfsOj/GOVi
 lIZQuNFD4lMMz4FM1zweQxFVjUwz8Tl1g4u4Yc06KSd3lLGUvg95cy590V/TV6wa7lNXBX+W0jDVe
 0iKFj0CZXRGlntAYVpfvO9js+DwcDr7fv/pOneUJHbVxHrAaFvS6HIRLMqtpVZ38j067FKXOWSQf+
 gf6wAT3CmlN7aPYqFWhizksLjIwQcou0fCXkusKP5oN4eLiYrTp5hhQPb5Bujhqs0PkyPMSosnFBs
 0phxh/UA==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljhOD-00GHoa-By
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 12:02:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id a4so17422989wrr.2
 for <linux-mediatek@lists.infradead.org>; Thu, 20 May 2021 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=gJ5vwtlJY7kaNteg3cWUjwJv5QuZOeibKsxrj//n0jDmkoKtte74LApZcTlPr3qEqP
 Mzlsm32bjp2uf3LzaVXTu+oFZkLGE4pTbES/qflCNupCozcEmwvchzxKRUHqTfRKpNXs
 zEicCevttpN4sMsTEZ94vVRt504daIkzMKuLcw3vq1J0PIZIfEVUUHhct/UQaU/ZB9gx
 J5d4neL47KFQgbcS03O3OV+qSvgERINie9CzvOoS3MZgvX8kCZhOlq8BmHybvhU7Ozwz
 RqTuE8aFs3eZ8FW0ANRkzgtq4JeJkrDEZqY6jD+Talvm6SYqqFJfG/V/DGQCZbqQ2YnC
 QGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMlp5Ni2aMFHyMfn1NEHDx/+WQIjP8upodgZGGEhVrs=;
 b=dAZA7Bp/Ri6wZee97/sqK7m5cZWTyfHAuNrUodPbn3sPJ8l5QqE+Guj2UJKPPS84oK
 1sYMI18eoIinniHsFIULVdWA4YIs1F/mCtRpL14hZ22R3sEhMwGRJLCZuut0qUoZd/oT
 8NDkgwfU4oMWFWaG2gkhpiJcG5nqLB626kCe1YEMBGkOSgb61EXFKxYLkwanC++wGrJC
 KGmVfPpSejh3XOlFUYoSWh12Zzh+Q1PP8qUCYQD6BbPwh2IbwKd/tlRLwC0grb1fs0aT
 gX2rn0r8uV1llh5a2RArADQ8bRPzNuGTCJryMO9imkEigZ/mYEmp3j25KGLck5qywyHO
 vXpg==
X-Gm-Message-State: AOAM530MPSZUINKWmKMd9HXP8KJ8J/nOgJSak1Nz9XyoGUh7fs3LqaBs
 5O3ViNqX2BYleV/dWYxSJ227gA==
X-Google-Smtp-Source: ABdhPJxP35SmgHpjJBCWNK5+CE0sT2ZLGFbHSqTr5K3epue7/zsIbU6Tm4drzmp4lFX5MYElIP+/cg==
X-Received: by 2002:adf:e291:: with SMTP id v17mr3940756wri.149.1621512176218; 
 Thu, 20 May 2021 05:02:56 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:55 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/38] drm/mediatek/mtk_disp_ovl: Strip and demote
 non-conformant header
Date: Thu, 20 May 2021 13:02:14 +0100
Message-Id: <20210520120248.3464013-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_050257_440936_0826D16B 
X-CRM114-Status: GOOD (  11.80  )
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
