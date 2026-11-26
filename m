Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFED2606A682
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 06:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fYpTWX0m;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DZqO8ojU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=; b=fYpTWX0mw+aU5+OAPYGGTHzDfS
	SuZGvaBxbAi5mOuf9UHz3hZ6r4sh1yZR8kIfzfa5G33bRhyKr/t1E+K1RaiMrSKR3Sc47zwncG4Oh
	wtlq6boIXdnhPGyuxMUjrzOpQN05Ct/SnZtBqOb/dNXV70weJdAN8vLwbulijiRK/szjnpkirYt3L
	hm2r9rGnXIYxqtk2YwAe7mhBht8Q67EGCaDlPXesj0Gg9mkpMXcJvlpcLkwEBIU4l0APKvmdAihws
	pYaHXW444Sj9otMzt0hbYL5jkviahDkinVGBLqxHAsgl0jMmHQxsB8JLzIZMG7lYatnq9tRukfJGz
	FXKzUfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuE-0000000CArv-2xd2;
	Thu, 26 Nov 2026 06:24:30 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSuC-0000000CAr4-2pwO
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 06:24:29 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1a2af4c8d00so5976397c88.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 22:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795674268; x=1796279068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=DZqO8ojU6WBZh88gd6ic7J56CIykRTrG0794JAcIXrlary/j6z+U77lhPleFspwMKk
         Mx02WmYsWWWLLacUZRoKNYuTqqDA+te75XgaziiGBcI7V4aaw3IkxNcpYJwlRsKthLQO
         UX6HXCJrnls8GnthW6+GnerBN9+hx2cuKEtMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674268; x=1796279068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1d5rRHIyLnLkkI5kSP1hcdlsa/voBQeRYBRgutIn/lg=;
        b=fJThz0Fj/eWeYjz5klddaqsf7DlI+zqR693sixo4awIREzUkIa1WiTpVV4d1RkbzHv
         Fc4Klcwac6Z6BCqYTxlrIEYZRIZ4wmFXxrGXjJg+f/Kq9HXIZ2q6GwVsE2C6WAwBAoew
         7peyol5+rTpYh+x6wW+G1qTjkT4z5JYpLMMou9Gdyx10AApGu1oNNF9lWIgwayl4HOzJ
         hOpsuJmYk7EU1YhOiPgwkaWGTkUuze0GBAzoy4pH/sTD5fKCGmnjYI1foJ+cLu6j6g7H
         b0n/vCSXJKjvfETiUDIOyqwax6u8kfJ1EvZC93qQP0iec0qrmLrd73HSC1Q0bFnW1ZJG
         TupA==
X-Forwarded-Encrypted: i=1; AL+hErEdnKtyZ5FnPGkRFa/YHrIr5Vhep+a2Rs4Fpa8zU6fpoZtYW/OzDaQieoi4ax2Alv4qSCKBZruH57AHKpocTQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+WJd9CWt0mPtWmYgxLUOBFNIxu++6DMYtmB3lHdwRgdhZuwory
	r6NFjZsYcxqiLH4asCHVJWe1pk5CVCYx3exs8ACo0AlIdwyAR1TTM5MeRRuubAcL95BhVLZkK6O
	2IQr2Rw==
X-Gm-Gg: AZFdTZc+QaYie4vV0J6VNvTf9gx/HF1tg1gstgCb/tK7dbfL1ob8UB1xm8cHYBueFBp
	GdmCfm7FKzXTzmQfEnMpWa02EGMYjiQQ2EOyoX321njhM36jRFTSfr3pk5cIFHdsSzttarSvLVR
	/JlveuP78kQ6+78FXu0mmCr/SWuN9v3h2ZVe0rrfYeJj3T3BZ+QKXdXg/58pwtbpcYI5oo32aH+
	wLSnmq0rl9lwTggyCFg1LCF6tOoE7pAUh2K5zO6T2akmtlYmg1wMAVkIDWQqz+kaX7/KWjWuozq
	6kmxpcVSH1LvAOJpu/pbFNrgnKUzCYQ6VkcA54VJlqGoEHHdIKZKIB8MEN9zb21n7ILByHjBqfo
	o74OX5yCI18n1HtbkTDoFQcKc0UqUczbp11XEptvQRSNtawo0/dQ2koQkgbPGmdVHpzzLeqv8yP
	HLrhFcy/qdo4psm2WuAZYHy94xxTmjekcXBSHuevDZgkE7xgTHMj50xppouOk+KxXum4FvtN85u
	zcCaCRA72D+WU6JFFU5825I7yiuqTAqtCTajg6awymGFEO+9VYigRb9gxBz6xzynJ4sRli2VGb6
	W3mjmcFvHbd0I1RkXo1RQi8WjzVAfRipn7Ww9MDWRaoUhFI5eC1FLo/LvrKvaBZlrzVBAweIDZA
	WhmBKC8CLUk1reXVFNYDYYg==
X-Received: by 2002:a05:7022:290:b0:1b5:283:79c8 with SMTP id a92af1059eb24-1b5567a6eb4mr19652296c88.4.1795674267942;
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
Received: from fshao-cloudtop.c.googlers.com (123.142.199.104.bc.googleusercontent.com. [104.199.142.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm36793186c88.4.2026.11.25.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:24:27 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
Date: Thu, 26 Nov 2026 14:23:43 +0800
Subject: [PATCH 1/8] drm/file: Define drm_show_fdinfo as NULL when
 CONFIG_PROC_FS is disabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-drm-fops-show-fdinfo-v1-1-7cb1d1a5d6ef@chromium.org>
References: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
In-Reply-To: <20261126-drm-fops-show-fdinfo-v1-0-7cb1d1a5d6ef@chromium.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Oded Gabbay <ogabbay@kernel.org>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_222428_734083_2FD7556F 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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

Define drm_show_fdinfo() as NULL when CONFIG_PROC_FS is disabled
(matching drm_compat_ioctl() and drm_gem_get_unmapped_area()) and guard
its definition. This prepares for simplifying .show_fdinfo assignment in
the DEFINE_DRM_*_FOPS() helpers.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
 drivers/gpu/drm/drm_file.c | 2 ++
 include/drm/drm_file.h     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ec820686b302..bcc1b47616c0 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -961,6 +961,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
 
+#ifdef CONFIG_PROC_FS
 /**
  * drm_show_fdinfo - helper for drm file fops
  * @m: output stream
@@ -1003,6 +1004,7 @@ void drm_show_fdinfo(struct seq_file *m, struct file *f)
 	drm_dev_exit(idx);
 }
 EXPORT_SYMBOL(drm_show_fdinfo);
+#endif
 
 /**
  * drm_file_err - log process name, pid and client_name associated with a drm_file
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 6ee70ad65e1f..6fc3d7060f30 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -525,7 +525,11 @@ void drm_print_memory_stats(struct drm_printer *p,
 			    const char *region);
 
 void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+#ifdef CONFIG_PROC_FS
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
+#else
+#define drm_show_fdinfo NULL
+#endif
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
 

-- 
2.56.1.839.g22a8290db9-goog


