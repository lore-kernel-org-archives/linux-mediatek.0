Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488DCC3DA7F
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Aug 2024 11:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WjGa1PXf2QdLqPrY3XfFGhbeSFb6g3387jwXF6umc8=; b=Atrk/5ZoowVh5UBf0az8zGGV3d
	7fKS78CsdexKbpDQ4I4zfpJm4Uxd8dRkutFnyPQAzvCTe7SQmG7TU3TIr3CiM0CJ5XPmbEF7XdWsJ
	orq0mzXuD+qEPCKPGQlSyFXO9VrANZCmsX7H7BF68WkA/U8wezM/oJJUUV7knjJXkebvveaLgIlot
	CFKM8IBsBGv0RmimufmK+kyi/S5rr11YleDHecVUrJTMVe/4mI4OHSWCzOfyOw96Bc3EeqVsAa0yU
	dh09TskY85gCEFVXHjYM3yVmdKXODXDP4/aYXgLvVi8JBhpd4/2jjCaGa8+4eB3h+0/IeoKbzi9Tb
	mmMIX8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scjxD-0000000E2j8-2BQO;
	Sat, 10 Aug 2024 11:08:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scjwc-0000000E2fU-3zc6;
	Sat, 10 Aug 2024 11:07:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc5296e214so28539005ad.0;
        Sat, 10 Aug 2024 04:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723288053; x=1723892853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WjGa1PXf2QdLqPrY3XfFGhbeSFb6g3387jwXF6umc8=;
        b=hIWFG++Roxvl/xJB3x/BO0Plb+0dwHqt36hH3K7yg7wN48k7lvaf+DNR0nnNylKdiP
         cHC++GyVYTfDA6txAHluqMHMJjjIxEF6XlLF3lcsGI0VmH9vWOswOI4cGgVNeTY+LBQQ
         8y27HugrRBV6IBqxz6hwRndGmhbvb9qzRVvwJeXSFytWI5/oi8w1Bj39EUhNioZaovIS
         NUDKW/t1He7UdRsGdf1NL6MjkhyLwd/OsYX7oeozPPsarX8mesv4KRXH+Rs+Rzc2ZFM9
         gY77cqFYLkfF8bei2Y9EOIn76kbYntGzBvDOXFZPV7351n1lHAOIa5Sr66txsmkWvybd
         M+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723288053; x=1723892853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WjGa1PXf2QdLqPrY3XfFGhbeSFb6g3387jwXF6umc8=;
        b=SSlhVnEMQHdvoJ1q1B71Jp4o1mOm+Sl/5HlvGpUjHxQ2syTihmU7jUvSJBA8ca/x7I
         SoOIiWcTnM1GwloIdnhOxNevDK9y+6Sb4T54HchHVbpHB++gLf/tIFipyESB+RR+FwKg
         5/T6osfCO9ZTkT2jUPrpjQDcKGmXD9A8/iyzxNa3JdAmvUOq3jrPLe6mGPS9OszasXW1
         7ArkfXTmeI/yywLH2IOpCMhrYT+KWRwjUocyxF++ozXdXae0QEMYOxEFzgahiBlIKEOx
         rIdkME3OE00To8ugEZp8JpzBK4VTpcuQxZyGu5eOcZawDlmLTjRPV3A+JwhOK9gPxHv+
         lV+w==
X-Forwarded-Encrypted: i=1; AJvYcCU6C2XpaWnuNYAuU3gQ+A7vdJ0Urd8Da7KRbU3CC/n9nF9nJbV/0pDNfleedYJRxsgq0WDkF3R+cI3bhGSI7UxE/ihohxuluzVposq72e29lkxd5AGIBL5ExuhkPvAKCxvNySqfb6FN1qhzxuORL7f++G49EV36+lY=
X-Gm-Message-State: AOJu0YxbUpg+faaO5IBl46cMQ2wBg4W3kaeT/kEdLpePshVDo3Ng8y8Z
	Tdlcx/QfWvGN1k+2M0Gydc1uwmJioJ1GbnNZDlnFwLVh4+4j24At
X-Google-Smtp-Source: AGHT+IHolzyz9S8pd+GOOcW+1R0bING8PpCkunpPTukviWMZPY/lvqyK2Uo385BypufhWs90tL9WEg==
X-Received: by 2002:a17:902:f689:b0:1fc:5879:1d08 with SMTP id d9443c01a7336-200ae550755mr57229755ad.32.1723288053298;
        Sat, 10 Aug 2024 04:07:33 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200bb9038fesm10002735ad.114.2024.08.10.04.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Aug 2024 04:07:32 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: drivers: gpu: drm: mediatek: Fix warning: Using plain integer as NULL pointer in mtk_drm_gem.c
Date: Sat, 10 Aug 2024 11:07:23 +0000
Message-ID: <20240810110724.174338-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_040735_016790_2E682573 
X-CRM114-Status: GOOD (  10.19  )
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

sparse reported following warking:

'''
drivers/gpu/drm/mediatek/mtk_drm_gem.c:290:27: warning: Using plain integer as NULL pointer
'''

This patch changes integer 0 to NULL.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index f8fd8b98c30e..885ce6ac7bad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -287,6 +287,6 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
 		return;
 
 	vunmap(vaddr);
-	mtk_gem->kvaddr = 0;
+	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
-- 
2.43.0


