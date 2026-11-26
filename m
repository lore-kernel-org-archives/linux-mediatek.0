Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A7A606A338
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MtX4pAhX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ck6/iRYO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=; b=MtX4pAhXcvzekiaTTxWXq4tzP+
	3C7JkT7WxwdzcTn1Piv62lLGUaJE6+vNoTbbs8LlzhO+S0wt3/nAOMkI1EQwzjMFvY4UUG2Quw+WX
	prCUpd7os+0RKEfF3VBihCbTSadjvvS5EYY+N/tWsUe0M3yW1+5CWAiWCFELkEoDA57knU9G5Ltf8
	EpxtLGSvdLd5FjpV52JYZIOSIAGhpRs8ljkiReXkKnjwjpx+nOUxmXhoCpyv9IJJCOdTVAQ5esKmV
	UY+I2xIG9WTNXjcKCVwqtSaTHr1OhcaPQvdC9y/orOy9z6A8h+m36xb4gkBnmWypXewl0+apUtMcD
	EhhSZb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuV-0000000CB0G-0bbY;
	Thu, 26 Nov 2026 06:24:47 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuS-0000000CAxZ-3z8J
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:46 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1a3c08d6928so9890020c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674284; x=1796279084; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=ck6/iRYOZ2/S4xwsA9R5+VCGXc4xUeGuV1aonI3DpX3wc8hQgk/1y2gd5QblIwZOnq
         BSsdKW+NpeqiKR79FczxgNKY43ODttjJnZFdQTG3YNA+7zWErhuMpO9IqmY0wxphwWUC
         hASQ+d5UiGQvLsfqigaGCgqQhgzZtP7vzNIhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674284; x=1796279084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r10h3LnRLt9vjVGGqIH+e89aRk+gTjmWUgpe6jQIHI=;
        b=1gkBGNaHa9VeUY79QC5T/eGEmW1pw4mQnQFE0LbpUKQby33zMQ1w8EHRwMsEEZigsW
         O0hgKRRkIZJ+pMKcT5VyCk9/eks2T/T/WWoz0A7KqlaPetrEJgLJ/5ocoux6/UCGaZPz
         6ASVWbA6ToQ4segAI0epKKnQz6fhAWDYt6WAWbiIuIzmjkfJv3kwEPTg3dm/8fVbbso9
         RozPSvJzf4AdhpP4/D4RikKH0Wqnn546D5P7pGdti1MGak7rhtUNgCyXy8f16zB+hVji
         6sqWbWPsVA9AqgH43GtptylTD0U9OWhMW5mXUCeiB3dBjP0xvCPacd5BN1pcQ8H4QmIT
         p7lg==
X-Forwarded-Encrypted: i=1; AL+hErFlPuIgAhMIz/1YIL2T3ekym7l6enmfA3LuIicRhoH9iQReUYzc4DyFdIwJ4oOu+RKkEaZJtPt/r/dHi1vv4g==@lists.infradead.org
X-Gm-Message-State: APuU4Z8LZtVNuwDG3xdfZDPBVbu9/sAIT5fGeobDo69bc+7QMzdVIp5M
	x31k6ACe9oAya99dWuEmvXTNW3GbWvJ+SfVJwZjZtjA7e39tv3gnisFMMFeYkUNxAqJYHcKknPt
	hz3mkwQ==
X-Gm-Gg: AZFdTZcLNMSKADYNihu0KDj/e/xb4+T9f3CVof1eGcU8aCCV8RoSud6wN8i4eUkfumY
	50VgRP7U3ZdHxJzVC3sy+OkptXVJNsb+mGX02n3qwRgEKgxSbOilOLfyUvfqGAT9taY9TZ1ARaJ
	Gv5PrTI+IpUtE6hLRn0uqQHtmDdR15Slpt9F5LwmDSdKZ4nwZNiJzKxHv9iJaiXT7BFJAr+91bh
	JegXjlajsG+xWUXnUc2XJ2j962J1mvZuez5DxxbSseZ0j1CJjuPSz/anFj4WmJ/RsQp6+Y/ng8D
	HTUOjeRDrSviQdMH5oss17tdI61o3JPnZeUfSJc49yw0mOcziEJtEFgykkl7FfnYcVaf/h4Myr2
	vsz3LuIByaz4Yl5X78kXm3XEgromP/WGqbqYRRASpjYSdnzMehbHzVLQKfyuoCqNZY88dQIIfxX
	Ny9A4yikbeca3vfvoFJOLkh6W9VTdFWA3/KsK0KyPE4fWWdQ6dnG2GfMuHbJJ3YDbiP6qYV8AzP
	lKhrWsJQlp4DIKmRA25lIHTg1EGD0YuK8MNSgWRhqpY2CkqIVtLTBkHNaBrqD1aAeGp/iitP2kN
	o2Yixk1rh5YXFe1xffJgr3WfIvCZtM6PFqBsJkQnXtp8JJsBPlzltUmWVdQzo//+s+fQxcK6VRt
	+n2PxD4/NL5V5EGdPjx8Drw==
X-Received: by 2002:a05:701a:cc82:20b0:1b5:5a81:d388 with SMTP id a92af1059eb24-1b55a81ddfdmr16361341c88.4.1795674284302;
        Wed, 25 Nov 2026 22:24:44 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:43 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:45 +0800
Subject: [PATCH 3/8] drm/etnaviv: Use DEFINE_DRM_GEM_FOPS()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-3-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222445_000702_15F62446 
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
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index ec1352c1b09f..93869e8f3f96 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,11 +494,7 @@ static void etnaviv_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	drm_show_memory_stats(p, file);
 }
 
-static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	DRM_GEM_FOPS,
-	.show_fdinfo = drm_show_fdinfo,
-};
+DEFINE_DRM_GEM_FOPS(fops);
 
 static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,

-- 
2.56.1.839.g22a8290db9-goog


