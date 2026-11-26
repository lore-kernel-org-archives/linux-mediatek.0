Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010D9606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4c7xAUxZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eH/6iqG2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=; b=4c7xAUxZHnaayGj2eorlRTBVI/
	HXh8p7I7npH45/VepXSqzx2g8tTpmuR8MEHDkkBxtwMKMUKzOGbiFY7GbEfryNT5ho6XU8/Rv3N+t
	LQ5GAHdmc/RFXaT5IvDuFQ/tSumKma0LNjwdjuJG1DPONE+sgYbj2DzASDisxMgtekjVbLJcyv+ra
	mLShVuBAk4a8A4eirFqXWwi3L0n+45cc8UWpXdy2pGxpVKJ0eafcW92pbOH5T+ymDNLmD5CDrSyUD
	f/TYmXQ7VolMHnmommWfZf1alz7B3Q4uQ/38gDT8yzYJoqoHt30lSTBo8hxnkS+7YnjuHYtMmBrDh
	VjJIVc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuj-0000000CB9t-2Jmt;
	Thu, 26 Nov 2026 06:25:01 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSub-0000000CB4O-1Oid
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:55 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890162c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674292; x=1796279092; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=eH/6iqG27nNX/lMiqRJgtpabMRnKd9mcsUEBySIkQqtC36pRg3QXjx23pyE2j6B6OI
         pOMiAEw/WSQb6Yb2YE20/FES76fCfWZCkjwcqvxMsjpy/XK5ejlyt9HE8Bm2E3rO1UBE
         rQPRefOAE7sWMCY88if5RaXmUb1n4UcFfi7Tw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674292; x=1796279092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXfP+BBaRmFRvRsRkzl26nbPuaGAtebafKyAvaeF1Hk=;
        b=HVHbonVXjxWoM/Bsl7rFtQcVzKSyCv78t8Qe3B9rGS+7pXCkU1Jg49hEoXjTnDyslu
         GtbOPmgz4RiuWy4ZUKE6MHKn4e21FEVs5N+V58fBz+boeH5IfGTeTLer/SGNSDHNCyvZ
         LeYj4tLbqXAjf++CQlNjzRgovX/J/oTBIx/Gphi574dSM8ozm0VlSJa4KRxqpJEuWJ5o
         ++S4+HBs06A3o3KXvHkVKD58ObCEw3afp9AXabqI748XR4+rzSrAHCDwBC8zqt/pgel/
         xc/9HMp4GWxMH2KpOMNKFEhBHSJZt90b0iLzAFcf5YuzDgyQ8VrHqCfgDKpAd+HBdMr1
         aqXw==
X-Forwarded-Encrypted: i=1; AL+hErHGsQ34VT3JmwTDJwK/kWTR+Hcr4AhdXEKKiip4d6T3dEoXVpGtOFnMMKEv1xfG7B3uzLIBxPTnXFA3zD0pcg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+PVwAegrZyeLimWnkuHcZMGnhLDMXC2aAqG6/Bf4QiPruj7Sfo
	y82xOxfO2ABKf6o34/Ob27J6Oyup0Zsuwmt0ymwfZRRSyEsGb7PT6QGrk71FnBdYGmPGFQvFZWr
	cc3X1YA==
X-Gm-Gg: AZFdTZeXoU7GD8MZmZEl3MnOVVf4FcegvzqZgnzIGByh1G/n39DDac83Ywr4lLczjps
	isR/WfL5wOMhYw38jhFPsvp+gRow8LIBBoHMYJfz7JYUpLviza6KR3Nrto1xMIKpaDzO810UTJR
	Q710taBGnZa8X6wJxOfemxOZeI5eKJUkmRZGNBaIO7zrENR1K6dWYdTaI+iDigUl3OcnSQeEqOl
	Uvev/nA8s2uI37FNQJXrJXyCvqyo9nNjUXfg6QwYVjktZSFc8W2K9n8S0UULPvc8wmJeZCWVdnl
	xy/64I8e1N/EsslnemmQAZYak8LSavTSz2v+lhhqgFFM6+75RsBs3M1jcS2PoQX0Rr5ISjnQA4C
	HTETKyY+HV4Yc9rQ5Yv3V5xEH1C0fBOZ2B/xjCazXLZZQkYbmPMh0Z40/8zrrxqN9VCWuAtRWI+
	JIY2VNHB0OLJVGN8NT9Ns3S+vtWs3jKGEd+AaHQlHDuyFgjPzVcK+cgX5159d07GPBgRlOfDKJO
	bpCnsAv/zA240rv1rXDuflSKTnqJQCylZkfSgeMX6emAotllDD2gprBg2WwvO/XfkbBCkuxUW4f
	+2nuFZEfAvl/Yr4sUfEyDakdTG7VcZdyyNhzHcHBiDZYhKGagGxIDhvynavXG6IWO6PlFfgg0Bg
	CX+upGpdql0b379b9KALBqQ==
X-Received: by 2002:a05:7022:28b:20b0:1ac:f84d:4036 with SMTP id a92af1059eb24-1b55686f9bamr17794762c88.9.1795674292446;
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:52 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:46 +0800
Subject: [PATCH 4/8] drm/msm: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-4-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222453_939144_98E08D6A 
X-CRM114-Status: GOOD (  10.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, dri-devel@lists.freedesktop.org, Marijn Suijten <marijn.suijten@somainline.org>, Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, Rob Herring <robh@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Steven Price <steven.price@arm.com>, Russell King <linux+etnaviv@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-arm-msm@vger.kernel.org, etnaviv@lists.freedesktop.org, Abhinav Kumar <abhinav.kumar@linux.dev>, Melissa Wen <mwen@igalia.com>, Christian Gmeiner <christian.gmeiner@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dmitry Baryshkov <lumag@kernel.org>, linux-kernel@vger.kernel.org, Karol Wachowski <karol.wachowski@linux.intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, freedreno@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DEFINE_DRM_GEM_FOPS() now wires .show_fdinfo to drm_show_fdinfo() by
default. Migrate the driver to use DEFINE_DRM_GEM_FOPS().

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 3675df277f6a..06d997a7a237 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -898,11 +898,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 #define DRIVER_FEATURES_GPU ( \
 		DRIVER_GEM | \

-- 
2.56.1.839.g22a8290db9-goog


