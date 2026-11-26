Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734FA606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpNBPdub;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ioW90EkY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=; b=NpNBPdubyeu/Z/bPMzDl6Ue/RA
	1YDu8ge/hoMQmRfBtn5JulWWtwNYMXVQVbu2BkZrvPge6IWKs9pSPvTXq8qEOviK7Ey2FtXEs++UK
	qI9I1cxXnjOb+AxKDALEm6NdjC6zKw2/sA3QDmLrtH+SXFsjiyDkrkThm+NumD8NLGjXeFhWzehrB
	KM2o9qhCN2e2HNlbbhMSOml0oJPu2wkgPt62xUezegV5KOZK5MtxcUdBGEZxE2seSMFWkOj2LV0qI
	QIB+JjB3aSK069YuoMiXTtAAmKsOFIAEujWa04LgDR0uKpWEB2ARnFoH2Msg7iFWWYmdLvt2MYcQz
	fZUV8/WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSv3-0000000CBL0-0Jfq;
	Thu, 26 Nov 2026 06:25:21 +0000
Received: from mail-dl1-x1234.google.com ([2607:f8b0:4864:20::1234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuj-0000000CB9n-1xYp
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:25:04 +0000
Received: by mail-dl1-x1234.google.com with SMTP id a92af1059eb24-1b24f4b15c4so2983014c88.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674301; x=1796279101; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=ioW90EkYK52qsA1a8e5QE6AV1ImFFlalu4pGFZoGzUhqXT0g+ITwbeepgQmsFdgYlO
         FSWVApBWzLExmAPSv95Zucnu2uWEsxVqZHnRMp87Kp395Ieko+9B2lW+ubJsVmfZ9xjH
         h1L9lN2XEhP5eS2CI3o0TQzDkF25eAksUvsMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674301; x=1796279101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1gKLDwGyxRU9dYe2xyWHPCu5Y64d2Lo1PuFNknEYqTk=;
        b=AnC4+e9/zDRrU0zEN3YybcM4XYshDoMzZhoAmVQXw+wH7SZYeRTPEHkAXoJVwV+dyG
         qC4jEQb6tlN5RC+sQxtgcEUDzLG+RsrysH8IiisWu0iXcVOVSE+1wjEhyTaviWjNW3bj
         XPw7SlkFEKYWH0GKuzLUKvQpU3MkLYlV+WsjuQElidYABRl14txbS/5JXKfcyrx/8jiN
         EOVSzapG7/YB8yyYCQ9GARFS4czw5AOKIZQto+GamWrlPoO4wEfP1BpulTuFjJxomJbV
         ewnpyNqSW5ACkfUOTtPUPe1VdnYbshZ2KEwQssphYVSyVlqVu5nb8EiIpfDhF3cbPua9
         wysA==
X-Forwarded-Encrypted: i=1; AL+hErFtnTSjJFb63j1DIVVIWovPCg+U02CcmcMigV7BFWlj5lToIadc/vGxVpcp/f9qCnAnm26TYfOU1zTpvl8j5Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z//Eh8BCrtGRw36ITtrq3lykGqXToamh27DpqMWknmITVwJTWi+
	2lgppVpkWecGjhIq2ngmgWcSKoXLJjy4dRdr5+gErxEneAtgWbek/oZ0umirp7lB4+eG8SQ4AqP
	GpJkNkg==
X-Gm-Gg: AZFdTZeojIqAwJ7iqwYf5EiVTaNOqjdBvB8Nbm0eH+LJH6JB6pSENRkOSYKzad6q8rj
	DBn1JASMYT0vOZo7SdgOOUvv3I5vnfSttrdiXs0Xyd9kvrvzrgOt4nqHyiCdYAujM+lTOiHWZ5a
	Ibzvw6zr/b8m2VMNhj/OLYHs03cex5vOFJW6YHj3EAgJJDRqadyssE/YhAqyilHuqE+2InHdBQt
	DrFae6JneaTM0rPv8X+Db4IxOqEoAJ658wqGc38nwK/u9htwmyFTlE6NWi/fEc1lAspxGuPGwnw
	32+l+gHljbaquN7IrzDUGR926WRLQIR5QCNHHyqjD5dK98YI8Y124y/kaSHl5mMfaF5gSrNl9vn
	y9dJ68LUNmJmCDBNMsccgf+BaJ0KxWF3QncAB/n6yilsbcC5POFvt2N5v1+S2HV3GShUEq46ylU
	MXuJc0hZmsSteRofHE6rwNcqSZM0gyCWYVeS2gQOA3y33TsotU+7PVAN7AfXNADM5CnmElSzLin
	cnlq9tAma1mATE9+t1rGKOpncHCkebICALTj4wWpKqrno6bmTcyPPV3nOM+M7j1G+B2MVZFIYVy
	LJWrTfrWdVC+WCAx9NhtG9BI+/UkBFQWaArINdYDqJmsvV51quoeZy6ex6JCAicbsMEBrB5crUP
	ztOAhEwRcpxRD16DlrQg4JQ==
X-Received: by 2002:a05:701b:2603:b0:1b2:5ecf:9bd1 with SMTP id a92af1059eb24-1b55249484cmr20664343c88.7.1795674300778;
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:25:00 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:47 +0800
Subject: [PATCH 5/8] drm/panfrost: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-5-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222501_585810_D53FBB8C 
X-CRM114-Status: GOOD (  10.05  )
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index eeda113037fe..205838513379 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -789,11 +789,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations panfrost_drm_driver_fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
 
 /*
  * Panfrost driver version:

-- 
2.56.1.839.g22a8290db9-goog


