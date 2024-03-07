Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8813DC54E4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jRG/YqmHFlWDrNbOjxutM1RemaGj2evaTF8++ZPF8MQ=; b=1iNayDJ9JrDG+2
	iJUmNfO97NilRGZLdQe6nsXLo+am0tlg/haaePB2KUvtOfJIGS9XQnpkCLDw52xBzE+DtuM/T60vJ
	zK5Y5MsRlnlVC6NXwixXKQr3qfMfw4TnDVH07EjBaN6M9r3sNJsbRrVdm52/SgwBAuFOlmSsRwbV4
	l+tBGdTPsXNgyhvSvNVuUx6zwBFi/lLqz1+G1lL0EW/vmS7oDH8KXBZbhBc5yyyfmBYdeWSpk2wL9
	yBdXY7Q0nvnUG3M1rS8lh1h+/jhe98ivwJf871OsoIXz/UsjMGUD4knKo+L9p7gJRPAtY05k1h4m7
	Gb4ZntlJECLLSeOajrfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riI3H-00000005nnj-2gGm;
	Thu, 07 Mar 2024 18:01:07 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riI3F-00000005nmc-0Bvw
	for linux-mediatek@lists.infradead.org;
	Thu, 07 Mar 2024 18:01:06 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-788455430easo88281585a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Mar 2024 10:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709834461; x=1710439261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jRG/YqmHFlWDrNbOjxutM1RemaGj2evaTF8++ZPF8MQ=;
        b=SOlRmFryHhZJE5Wfzrr1s74wx9CpI7OHwvJ4WtQLdQkGMPsGjdavQHAzo9/azBkzxQ
         DQF6HmQ5spx3ijWbw5pqvb7v2bEgitAP0sRGkuDlTzWC8Nhq8rJ7ubGhyGe1bq+UYhFJ
         NUu7zXcqaY0xabL4w3O1GqSqGFbQYwFKN54Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709834461; x=1710439261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jRG/YqmHFlWDrNbOjxutM1RemaGj2evaTF8++ZPF8MQ=;
        b=jBMrDz5ehommWPHX+TX31tfS+yXvw2E4oUWq4ifWQESpMoBwwnR/2EBsJ9V8v0Nns9
         do3s4CU2fn+1LhbdFwopFjDBYRWv7lGKOKWsXcyhc1/cAJ6VACoGq9v9Dp/Y0sG1w+Tw
         pI5Qa2MPhtmjfNR+isbZGt9PqnYw4D+Ulb2DQ4NeD96UC4S45cUh/w0SxbPW32UgTVEz
         aeejrEMIYEgCyslIEWfnM24gMiN4CPn6wHpYwco9/BwznZEYJzJ8kAiGIOusU3kkXjL7
         9bjHGyy+rOXK4mtwn09TIJJOI7bvCHO2e3ssh9wHgjjGCRnwPpTfy+OA2MsZtjBRfL+L
         liFQ==
X-Gm-Message-State: AOJu0YwOLzMfUBUrwuHpVGSy6x+XbaQMEW/P/zfQQ45yE0DMf4gHaSiT
	RkIK8tUVVTm8X0OHzvl8qv5OVwzjzTtmrID6udt2DzI8ZJUllsxktvSxWmiBSDfiQ4SriY8lGrY
	=
X-Google-Smtp-Source: AGHT+IGW3tqY7OGYR19Ma9Zb70i2KwijogurTQ2heISkKZ5PCaoaaPJpEkpxUwrfWzzei7FKIaPnpw==
X-Received: by 2002:a05:620a:1377:b0:788:1679:3378 with SMTP id d23-20020a05620a137700b0078816793378mr2768489qkl.15.1709834461151;
        Thu, 07 Mar 2024 10:01:01 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:b1b:3408:6f14:8be5])
        by smtp.gmail.com with ESMTPSA id 25-20020a05620a04d900b007882528475dsm4880997qks.49.2024.03.07.10.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 10:01:00 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH RESEND] drm/mediatek: Add 0 size check to mtk_drm_gem_obj
Date: Thu,  7 Mar 2024 13:00:51 -0500
Message-ID: <20240307180051.4104425-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_100105_274178_BB07C225 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, Justin Green <greenjustin@chromium.org>, dri-devel@lists.freedesktop.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a check to mtk_drm_gem_init if we attempt to allocate a GEM object
of 0 bytes. Currently, no such check exists and the kernel will panic if
a userspace application attempts to allocate a 0x0 GBM buffer.

Tested by attempting to allocate a 0x0 GBM buffer on an MT8188 and
verifying that we now return EINVAL.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Signed-off-by: Justin green <greenjustin@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index 4f2e3feabc0f..ee49367b6138 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -38,6 +38,9 @@ static struct mtk_drm_gem_obj *mtk_drm_gem_init(struct drm_device *dev,
 
 	size = round_up(size, PAGE_SIZE);
 
+        if (size == 0)
+		return ERR_PTR(-EINVAL);
+
 	mtk_gem_obj = kzalloc(sizeof(*mtk_gem_obj), GFP_KERNEL);
 	if (!mtk_gem_obj)
 		return ERR_PTR(-ENOMEM);
-- 
2.44.0.278.ge034bb2e1d-goog


