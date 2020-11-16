Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A909EC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7CF20B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j6I8fG7f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zrf2ywI6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D7CF20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cTOqss6Bd6r7J7OKVMzLTV2r566Pygm/hhUT2pjaIro=; b=j6I8fG7fq4QC7GU6pQ83Zla94
	h9uGOR/zWPt3jiYyIIbBJPth4kXlqWxZxGG1HDVDlFGiISM5YrYdnp9vTBvYv2gSFKV5S6wyVgMMY
	KfcFoDDdlekUjYfG7YKIAw7iFqZefB5Cq1Vq/wjuqdsGjkeTaGpCb4Ksikxnu+SnhRTAUJltQDNH7
	YW4YIpcnR7L5kny7ivEVl7cRNPRslrbz1EFlesUpE4U232+JQFih6CYCZuQxFnBsYGtg+np2D+xl7
	usfkxQYuzPVr8uGjjTsVbH2Ewl5kt01Y/0axx0NJt7Z/axMEygxKU5DzN/d6zFK7mJke4J0yF1rb6
	lMveqqeaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keiXf-000587-1W; Mon, 16 Nov 2020 17:43:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiVQ-00041i-M7
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 17:41:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id p22so43781wmg.3
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 09:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=Zrf2ywI6nk+V0LerSSoBh85knKxg9wJ+fPH0SnSGqaqQ12rxleOIn+iiCOD32LvrWe
 Bkf/Wb6oGiBXh81lSfbbUzMj46qGlT4x4+1uL52OqwD66udoi+19y2OiHokqejefMpki
 LmeWQ+MHrkhBMuJk+MdgLyk7MESyvv31arSx0QUkqSIS1x66KRZp1d4y24TPZMNm83lQ
 Z/8XQ6zO07K0BXmGzG4J9egEP+HIctkyoaLLrtPIWFXQNAkfouPKrKFL3r8kdJz9S87x
 0LJf4EPdEEJ9lt64nU1UXv2v/MlEJ25+E2sOtvy96/QpqSBFGgfC2NTk1OGeGMfirb+6
 SY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lV20qvkcXuKJ/8kdoQy2xSMx6pSot2KZYylCMdc97vk=;
 b=Jy7KpqZF5TCvNu16bVtX8FmmH4fKdT8fq9ImUEp2wNcc99kf1iPWREyH9r9tIBYadT
 og/gxfTMS9PG/lpceZG3ESycadJNFhmhfbFACav8wOA1MMEA+QFt9YeE9AjWL35g7dZt
 6+rXeTcy1GCFdAYBZLOxfkWsKA1H2/iFKC41xQ1bgIBpu1qHplawDopAqQv52RK4ykyM
 PjnYyYyHlONuEzZpGMcI8u2VhCMM3fBGaHQeQvDMJ4J58cNpyn48Q9dozg3ZasA2Mz+Q
 cw36HLSgoNWJvY3PypmpbJRTN+zmp642m9GPN8LuaKMmPrb661ZC5NVvV4ZN2+O8o5Sw
 B+6A==
X-Gm-Message-State: AOAM531cdRbPJZ2GdzgPfPJuhMiSxtgBWwIvwgeosKxBWSQx41wGViqu
 TiDzrQQLrj+m8XJpNSU/c73VmA==
X-Google-Smtp-Source: ABdhPJxIdXRERwdbm0KN6pgN4q/8GjFcbWLDvydipEOB1BxVtliCNpiCbiQUfPa+193dGkiQ5Fu86A==
X-Received: by 2002:a1c:658b:: with SMTP id z133mr7692wmb.1.1605548491414;
 Mon, 16 Nov 2020 09:41:31 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:41:30 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/42] drm/mediatek/mtk_disp_ovl: Fix formatting and provide
 missing member description
Date: Mon, 16 Nov 2020 17:40:39 +0000
Message-Id: <20201116174112.1833368-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124132_991024_0F07C19A 
X-CRM114-Status: GOOD (  13.33  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'ddp_comp' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'crtc' not described in 'mtk_disp_ovl'
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c:75: warning: Function parameter or member 'data' not described in 'mtk_disp_ovl'

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 28651bc579bc9..74ef6fc0528b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,9 @@ struct mtk_disp_ovl_data {
 
 /**
  * struct mtk_disp_ovl - DISP_OVL driver structure
- * @ddp_comp - structure containing type enum and hardware resources
- * @crtc - associated crtc to report vblank events to
+ * @ddp_comp: structure containing type enum and hardware resources
+ * @crtc: associated crtc to report vblank events to
+ * @data: platform data
  */
 struct mtk_disp_ovl {
 	struct mtk_ddp_comp		ddp_comp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
