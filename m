Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE3606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fVhwiuBJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ECcTmIJN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=; b=fVhwiuBJtukpwKcYKeNOmleXdo
	4HuTOW9Ey5+UHbeJ4OjGzSGZco8/6l18z/LIxO+qe6AcuGn5RPRbxfXx5OA7WRlgHBT2mY1j098YK
	vt173DaA4TDdYMoUrakJYsxesa1IJfBpchK2fvl/7CNlCeThkG6GgHb9t/SSnH9M4emagmGZvxH6B
	7SZIWrac+ul9Yp5rSJfTgvuSZjOllOIIlpQj+tdKH5A5A6vfKdIDjzmnIfZW63gTqrJNdKkix3dyv
	RJW3z+xqx3/cXN7E7Sbj03Ice34BL0uZV3ufP3fLt7/HgsT8DyqOA5Q5WYX5y2velXTQ9mis5qvMT
	+Fxr8OKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSvE-0000000CBSi-3pSM;
	Thu, 26 Nov 2026 06:25:32 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSur-0000000CBG5-3ZMI
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:20 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1b546061d58so15284994c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674309; x=1796279109; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=ECcTmIJNM5zeBNzdBLUXqLgl1tcPpvXc63siNs0dbT7vF/AxUxBxmJlZXmsRqncn2y
         XBnRbRQMcT9a43p6gUJ6oXZtybFmfBZxUTJ1eZv1hKobF6fi5jTIZoe0FPfezPqgkkFz
         1/R/CTgWCQtMVABvxUu2ofMDWiQ4wWn2bHhNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674309; x=1796279109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M/GwF7ja2EExmiOCCoGRHXQh66DBZWnwfGBy5FGHJ3U=;
        b=ej6vie2B9dPr7ZpVMI+aS9ROa/GC1E4zv7aiNsHq7iwiZGERK3IbUjjozasaSN3wbN
         Ffw4FDjeQtlEzQyyvwRSwI7NIJmVv9gJaXmN/gO5t05lgrT1Bzhxyxd72woedxw6GFlV
         bUaGeufRj2tlf13/DYJ0JN4bMt5+PmZwa7tCrqtIYiLJVTDiPaLrIwv879cGm6fIFeVp
         3mUW+X3LOYhcAvMmf4mVULiMYg3jxTRnepp7dvB0qVhCfQwEhoMqXGw4IMfHmp3qujw6
         2fJn5AaEATa0t1XxQI3JgEUXyV5ajeT93cZh415gT7Cg6tk0JOz8QiUF8oEqJDOmlj1a
         rI9A==
X-Forwarded-Encrypted: i=1; AL+hErFOFO9zEmD9JFY5JdfYc8EA/89NC079IdDV/uSJ3sTkia5IlVBxMYHLWZRZxCPb9JlCczLTjEJj1p1rYK23jw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8sR+f+/eabyhn51C6EJOSybP2cbd8phmUpMRhPIDsoxeTh6y9y
	MUuCfibdwxVHqC67IzBnb0lozfyAZODksIuC4ITMDHCNMCj/hnrp5CRkH2MI7+XcycYQNXtrMmA
	k7WBpkQ==
X-Gm-Gg: AZFdTZfmEd4A59mY20eQEY7Cc7XSwfgywCJlakibw0cmjnZTa6KS6pMUPAch3uMb4dG
	lxX02+EYZzOQmgRkSxBnSvYrT/vS/FGphGdcDNDZUVfxBIoCk1sEKAAF+Ihk1fhq8gmfmPAvphf
	JwD3xeSUBhtrzcpuH70vsNzsDh/2QXAwhL6yXt4OqdTQl1ZUG6/Flx9Nu5GY0irC4RUhtbXYqqm
	kn2jETo2amm8Iz11DLM8gzYkH/4q0YGYQ7ei4Lg8H3xyZSYb+j6JZsbIAAtGSu7eUgX4igZi8JF
	i3ANU7pI5X/ZSQgKnNiocAu3MReUMyOt6wjmpON4GhwV5LvWMBMIdRNsm6NhA7G1JFd9vVivRQ0
	sugcRy0fYERNClb4NPqg6DQZH/uWxXBBYKAc8EbMlwYDm7sXEIzxf9VjGMZLLGbS/XEG4JfpTN+
	DsElNHMnTQaXOLDwgzT9H3IyOKZ1zuc4TyPtIwyUW7lRO4EuUc0vuH/9BnLyU3317/3ct7O0itA
	pBzL8VzZ7NZK0/uXrlF8OQZWyJLSXXgpIwODHTDZuhQ/vxkoZ1UxbtYwHhSxusVe4EwxvcowlHT
	hrcuz4UYmgJegaTqN74cqJV0790lhOf+xEUqQCf0e2HRzo4LW4x/c++GUCg/UyQ8IdHOE9DQRey
	Fldg93os/C9xGpjvThgHycQ==
X-Received: by 2002:a05:701b:2918:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b570d52afcmr11431758c88.40.1795674308955;
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:08 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:48 +0800
Subject: [PATCH 6/8] drm/v3d: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-6-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222518_422715_0C4DD17E 
X-CRM114-Status: GOOD (  10.32  )
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
 drivers/gpu/drm/v3d/v3d_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index b790be8a7fac..bde3561c0e69 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -240,11 +240,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations v3d_drm_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(v3d_drm_fops);
 
 /* DRM_AUTH is required on SUBMIT_CL for now, while we don't have GMP
  * protection between clients.  Note that render nodes would be

-- 
2.56.1.839.g22a8290db9-goog


