Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C71606A32E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M/oZBKSh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=P9ShnWq0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=; b=M/oZBKShjuCNeWRERfyglhZ9+w
	l+qOQPGpyg1clTP6ahowkouQlfsUE14msfg8UtBBHGNCviigKy/3bgtHIeCoJgBzr0FdKTtjEhst2
	170nYnPjzDouQQPtxLPqLyePH+q36XkGehe+MDTQ/KtkG2PEgsq6EjEbvsxXdpH6ezky/2jp3Zr7P
	eJ4DuauimHfJKEjG0+v3qLeZ0Pdl9x45uXNchmQJfrrSjPgqOcqjWUAo/QzBRgg89z21wWSg8/+w6
	BWeS2MeDpvNPaZP6K+Srvulbr4Jqu8ivymPvMQayNbverkFTdRrBmNqH8Tig86EBrHbxF84GmP3WM
	OuF1Oftg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuT-0000000CAyk-45so;
	Thu, 26 Nov 2026 06:24:45 +0000
Received: from mail-dl1-x122c.google.com ([2607:f8b0:4864:20::122c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuK-0000000CAuI-3isW
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:39 +0000
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-1b3b4944a0eso5039750c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674276; x=1796279076; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=P9ShnWq0bQd/KEir1StgDNH1tRAF+3V4oixYdLWeUyHSJdHTLtEWcmbJ0e0G1ZiwxH
         Qf870k+SUwn3Tu8uZx+N+FSUDOh3l1ZBTOdezVlDZHSCo9bwtf/cb383kepzQJj14i1s
         I29nsydi1i/VSGr1Ij2G7OAlTEa12gGdNb1W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674276; x=1796279076;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ePKddXgsQ/sIOcUIgiDq+rw3pTmufgmB0dzzvy5WTTU=;
        b=bmhyFzn6zDbrOmsYyI3ar11oXWUJdWmb6K1PWf0VEQYyFbaJrzRKcEHhXpqMGeqfCg
         EbLOn2mH3OzX/PArivsctUFKYWjricw+oOF7ZBge7PCZe8i3ISceEVqK9AuvM/XIFRrz
         OwP+q2L39UkL2xMgQl0bQCqtRqgaugLxVa1goED9VYmTPXBPuuc7Ndww77GzUFthodxW
         qYmwstQ93fYJMMGpamdCYvPv7V+Zp9UVDKYwVAoqkk6GTTcfrmuWPR6e1vQ6HafqnGu7
         Eq4wupVIwOuhqE/BT9qCMk+U752JyJ6nDteR9fyvNW+95djk4y97w160ZR+0S4Jf/EFN
         vAQw==
X-Forwarded-Encrypted: i=1; AL+hErHi4hox9ec46BGA8O/krHVW2/G5wfhzoTZyoasgFvc9RHuGu3corFE+mInz2F9+COdYCHoTvFI90C9carv20w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9R7yuo3Dk8khjRWdQHlTLj8VmNycAdHQib7YPGCF4M3c4w36Ko
	vXN6k6+pm48HzD4cWJ0SYnkrG4aoZzJIs5Ii+IomJwd2/IzfLYv3oBmbbDaw9Ju6uWFz/O1M/QY
	yLuRuPg==
X-Gm-Gg: AZFdTZcin4O9R91NwRubBq+HKMRbXPLIglKRzUWw3tXV1MszzrcsSdrgbIBLgUjHrag
	lVr1FA3/3ehsn3ehMnAUgKc30/ZSimA0AdyFUu+KadaRT0IpH9MCjnqb1WoU6WWCcYP9nsvgqVB
	9IuxKb1Y83J3fg+7oI9rpN7pYtZQTvKg5WWgXQnNwuVtztE6zHvRRHhJi6BrH/A/+I3/qnTGh/+
	wVwywzpI9DeeHFedDZir6I8oCsEvh8SUb410hn7Nm7D4wJbr1CzYXGrnkcLVmKUMKYDJ4hyL1Jv
	0KH062WaJe2VjOaoLDv1H7mlA/4hZF+GzoL3G8NCTXBz6rwjrgbzjD+6Q+H4MHo1jgrWEjLh8+v
	l0edBKXD+Ojq2maFn/mmtR4FsrSNQNhyLB+xnnRERzHYAuu8KQc3F/Ho75syDuUjia+a2N9Y6JD
	LD0hh3iCwqntoDnkwkm9vW1o/Z4TMeYsaKWgFt6CCorMq+jg1ozX5g7ZOztjV00sdMcO3t6w3Bb
	CF3Dgh2S/Z7y81PTHieJQ+/Pu+kSgTlX0lnPZQkICz+Dn/2UuNOpKU5CXv6Nw7W0gl5L1e6JNVK
	FAVZ8o52zjqR/gYOEs8O4afmgVzt3fXnSWwlIdat8EnTuAHmXkiZNWSpTkMJxuuh8xFQpl8Sg2N
	HITc+FzhSzLpYXDiNUhQ86A==
X-Received: by 2002:a05:701b:4585:10b0:1b5:8f22:9803 with SMTP id a92af1059eb24-1b58f229b6bmr2042435c88.1.1795674276127;
        Wed, 25 Nov 2026 22:24:36 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:35 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:44 +0800
Subject: [PATCH 2/8] drm: Wire drm_show_fdinfo() into default fops helpers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-2-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222437_211242_0D699210 
X-CRM114-Status: GOOD (  11.45  )
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

Wire drm_show_fdinfo() into DEFINE_DRM_*_FOPS() in the DRM headers, so
drivers using the default fops helpers support showing standard fdinfo
out of the box.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 include/drm/drm_accel.h          | 1 +
 include/drm/drm_gem.h            | 2 ++
 include/drm/drm_gem_dma_helper.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/include/drm/drm_accel.h b/include/drm/drm_accel.h
index 20a665ec6f16..1f3088002e52 100644
--- a/include/drm/drm_accel.h
+++ b/include/drm/drm_accel.h
@@ -48,6 +48,7 @@
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_ACCEL_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #if IS_ENABLED(CONFIG_DRM_ACCEL)
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 56dd15921c7a..d0c30bf23e58 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -43,6 +43,7 @@
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #include <drm/drm_device.h>
 #endif
+#include <drm/drm_file.h>
 #include <drm/drm_vma_manager.h>
 
 struct iosys_map;
@@ -501,6 +502,7 @@ struct drm_gem_object {
 	static const struct file_operations name = {\
 		.owner		= THIS_MODULE,\
 		DRM_GEM_FOPS,\
+		.show_fdinfo	= drm_show_fdinfo,\
 	}
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..3fc22b426070 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -267,6 +267,7 @@ unsigned long drm_gem_dma_get_unmapped_area(struct file *filp,
 		.read		= drm_read,\
 		.llseek		= noop_llseek,\
 		.mmap		= drm_gem_mmap,\
+		.show_fdinfo	= drm_show_fdinfo,\
 		.fop_flags = FOP_UNSIGNED_OFFSET, \
 		DRM_GEM_DMA_UNMAPPED_AREA_FOPS \
 	}

-- 
2.56.1.839.g22a8290db9-goog


