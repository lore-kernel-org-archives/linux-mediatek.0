Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3C606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vfJ1P6Q9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JuoEWMoq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=; b=vfJ1P6Q9ZzigjF
	6R4If3T3uOvjCN9HltaaHA+CsEtsqiVBF8dF7cJV4YDCrqpg6COWGOSbOzmdksSrwQcPM5cmwGJs9
	hbIkADjhkzU1hxcmKYsP5L6asJxm0YHK6qi4OmfHoNuORavW0VObkgk1CM/2Im6P9seLJEwvTu9de
	Sg//J4jCFOsg+nLDZH7QQbVrqGS/yTSbo65Dl8Z+p7SLV055HiBfvl6I5Fbu37ds7dqBGUmqLXCHZ
	CF7Y46jYJrTTbbM3mY723PgKfOdC1iPOWCWIL+fSnIMy0LQ9PeMh59kpJ7H8qwJbksin7u9sKCjN6
	b6LYRif43DaStXOppQAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQS-0000000BFKQ-30nY;
	Wed, 25 Nov 2026 20:17:08 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPj-0000000BEtL-3W28
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:25 +0000
Received: by mail-oo2-x05.google.com with SMTP id 006d021491bc7-7033e26cb19so1878165eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637783; x=1796242583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=JuoEWMoqRqN1CFp55JofRMtJUlb8LRzYKOnPsu59JsCDdizBc05vTTfYV8ivT9lY+H
         aQBIOOJt8ERl3bBvsENc6VieoQAV+GXgi//bOJ3UGbia+3UtaxagmtiQm2hhVxmwWxXL
         cuJt559q7w5AM244AghvCja/XoMZvgYxd1VBcDAvO91gpV0saZQDRn3iaUwjU138K0ny
         ZoNdHMU7K/Q7Jt9uDnp4LHPjG5hp6hkF0OFddqh9+vKJEgfkdhRy5S/99CMPgCwTOHve
         1a9hhq1a9yuk2G2hWCNOBKqD/nZ0ZV+fGBuiVsyvmBxa4xYFNi3qt09Yhf9R42ZT4Sug
         lhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637783; x=1796242583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=moswij1DxNlgtZ2psQp6vB5WbP0Zx8EDmr2Dk41oG4M=;
        b=VjwXvIBaD5oplRKs+VPDRKneSeDjM4LnJuauFOAK7Gxnfa5+E7PhthwfnAp8IjgEeS
         kn57jEtlqRflb8wqdH6nYjpTMvqnCoVmeBi8+VX1nz54qGj6poEh4wNJ0oJyYIHMxlXF
         RT/39u04o9KlG1H828f9bm5+m42evyFMLgUVHMH8sAMy7TPGc5Uhw9abfdR39Gfm8STY
         xiG2I6aaK8gZPR4lZ7eQFuqF+5wOIsZ9UWdu1J6Dfiaw05UoVTjiYynV4uxOUVyeyRe6
         RVRoBmApDAsvSPvniwAkFLRpfmpvfOxStEF1nCy1eM1nysWu0W0eJMI/sTJ8qn3Lsl+Z
         WrYQ==
X-Forwarded-Encrypted: i=1; AL+hErFGvACneCp6Swkx59J43+btHJbyCqnR1WlE+oMQ5urTSL/Vg+bYRLQdMPO/iK4dUL+xaaNwx7xD5F8Wf5EmYg==@lists.infradead.org
X-Gm-Message-State: APuU4Z/sUAWsXAXL5K5539tu48o7kzWopOAc49h3Dyl2QEU2bg2vJyjL
	AP8wGaJ74hlVqA0qNF2aRqR00//DnqngH6B2X4Xs3nWLLrNR3erKhXml
X-Gm-Gg: AZFdTZdOJev5JmCrJdgTOE1pYZ+2j4IhLt9tZ3RCmEuQx9ZYRLvuL6GRgnDAvEKxVIP
	8SSI/n+xLHL3anMK6WwFc+9HP7AeVlkSfK71qalSX9AS4FkRDGVYoDSfkvh4L7k3rDRIUD8eEPf
	EAfovmmeHdRV6s/XPetSwnJJZjiuni+OHd2drKaY1P9oW/u8C4R2ot3KazkFv+6aVlmAdayyeeM
	mgVUWYoMU7+q3fG4K9XQi6X3CsGMRBoR82mVwPPDbrr4ZfLn1qVpUdHESmtBd6SvBlXXTQ/a5mZ
	YCjSbJhkwUHHIASpaUbASij9yzA9oslPngr4PiyAQrbuP/7GoELYKrYc0KjJn277HiLveYvVCRJ
	Js1p+PH3GYmNyCApxqCpviq37Qitj5v4/mEkXwqZoaZuHoxqF3gXoAN+frQ/TmVJCqztdUGPNpg
	GpT5cwSDEkZFOsavFkehh7rntELtD8+zYzRiVMeypUduiH8KYrLIAc34vagYm5m+Wjihw5tlNeq
	cbT4F4QcjBdmOgVPINnTkJXOlI1irXx1l8x1+9LvVipZJ2ueXDF8GIEjWlVezFsp5owCgh/ZKNi
	G4dghmes3FYEKWKJoRKd57qEqOJ9gczBFSZlXpSOjcepE6dO0NhHErLj
X-Received: by 2002:a05:6820:1c92:b0:71b:7929:cb54 with SMTP id 006d021491bc7-71b7929d44fmr3615961eaf.38.1795637783065;
        Wed, 25 Nov 2026 12:16:23 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:22 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:10 -0600
Subject: [PATCH v2 7/9] media: mtk-mdp: Refuse a format change once buffers
 are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-7-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1974;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=ToIzGemh2HZYfPM+0fU+WVM5fBqJcWgALuaETYVwNso=;
 b=YyKMx+idzrYsHi5C/jJHDCr8A4+FV3/lteY93PlNVBFkvn2Yc532M5WpbprdE0h37qx239ObY
 NbKcfOxO94bBh6twJeOGkYBw44Fa9nxQDmOu8P83mq+1flUeTlwmTUz
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121624_040700_4069598C 
X-CRM114-Status: GOOD (  13.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VIDIOC_S_FMT stores the new format in the frame before it checks whether
the queue is streaming, so a refused change still takes effect: a client
switching a streaming CAPTURE queue from NV12M to YUV420M gets -EBUSY,
and the next frame is set up for three planes in buffers that have two.
And the check is for streaming only, so a format set after
VIDIOC_REQBUFS can need more than the buffers already allocated.

Check first, and refuse once the queue has buffers, as vb2_is_busy()
does for other drivers, logging it at debug level since any client can
trigger it.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index e0627127430b..1be0f44fe1b2 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -698,6 +698,12 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 
 	mtk_mdp_dbg(2, "[%d] type:%d", ctx->id, f->type);
 
+	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
+	if (vb2_is_busy(vq)) {
+		dev_dbg(&ctx->mdp_dev->pdev->dev, "queue %d busy\n", f->type);
+		return -EBUSY;
+	}
+
 	frame = mtk_mdp_ctx_get_frame(ctx, f->type);
 	fmt = mtk_mdp_try_fmt_mplane(ctx, f);
 	if (!fmt) {
@@ -706,12 +712,6 @@ static int mtk_mdp_m2m_s_fmt_mplane(struct file *file, void *fh,
 	}
 	frame->fmt = fmt;
 
-	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
-	if (vb2_is_streaming(vq)) {
-		dev_info(&ctx->mdp_dev->pdev->dev, "queue %d busy", f->type);
-		return -EBUSY;
-	}
-
 	pix_mp = &f->fmt.pix_mp;
 	for (i = 0; i < frame->fmt->num_planes; i++) {
 		frame->payload[i] = pix_mp->plane_fmt[i].sizeimage;

-- 
2.56.1


