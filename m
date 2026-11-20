Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6014606A33B
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xKb3/x+7;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EGL0EanX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=; b=xKb3/x+7cul1cw
	IQP2Zu9BVqYNcnWQnkfPwfLGKWhSqm0C6FJDHbL9ckkqY2MGJhPaIxeoIOJgmI/PZUht2IePBa816
	YluLU29eVcqHLNce3/l8y2+Jl/PvoWJlFeSQkDIfuhMS0QDRgmLuoCaIltKnzdIrciwqPjZb8zkMd
	NQX3SsRCvTeWJPm/zuWEKuOkfsHHbqLP326AsiDGtr6woCPZg33dlMMo9HV9VjEicJ8r9uauGBf4e
	L+juFHa8HMFJrPb2HKYZ+WvSDPGaqg9jVfkQaEceibiJuE8UtjgoaWK4GyN4ppFqtpTVOmVMisIIN
	fOQ/e75Tv0oni8HirNbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUj4-0000000GA8x-2U6V;
	Fri, 20 Nov 2026 19:56:50 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi9-0000000G9Px-0w3K
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:21 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-862a1dbb516so245147a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204552; x=1795809352; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=EGL0EanXZfA2bewqmhmPD0XckVs80Coh3B979OOuTt5//mlj0XvNcV0P6dSFOQ/ecE
         hguM9XatTdqsht/wbKogZ1UBLtJ7YWMtFcD9dEHRiuLOz/WJ+PIRjuWPAVRiYNqEtMEL
         3ZqW7ojjQtZoCXkRuVDFx7w4Z35L2fTgVDvBlUqJ8PktYz/idLnIL2Tp0rOl8jKqqazx
         QsVPUg83OlWs+GqxpMwA12m1xYBo9MB3Vm1MDMyWIu2Tc63zZ/zD8jWwgNMT12U83LKw
         Z+McwhJGexQRQz0/QMbZNJcoRvAIA/4xxX6b3W5myWHbZYxH5EGZ9crtYTLVXuXv9I8y
         73/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204552; x=1795809352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UsF4enTkpz+cKFEUMfo1tkSb8SS+Yf2yjxyk1f8Cx00=;
        b=h4+NijJJx0KI86hfnaVrrlsCoea6VKsh5GBdLr+QWi46EjCakONwC8Cjh6rElGqQ2f
         z/kxKZmG9zlLf64dR47Jv2EVZxFjvAUdFZecDafAVS0OFkDz1XF8ulGgoEldtg3DY9Z9
         vnHurLlTBnSx5sOPxjmM7wRZeZ1KKTM4RTs1oTwf/UF6IlUHD8r7jVTSTurtZ2CuEOHA
         lHUxDipkz3OcS73eWoUltUj+HH/iheJ2cDiLZ5IxgKa542ClUW/DnZeOMUy8cdt80QNZ
         /PPji2cxqQ8ZDHWlCfYFhChBB5O5Dg3fNFK3YNXlrtUXD1ZJ4R1f78vpFHWoBsqdN/qh
         XoQg==
X-Forwarded-Encrypted: i=1; AL+hErEW09KAKRvUupCQJ/KpaCcFkalyy/ilzIkRIbVXw88P1yXVARYVuzgTgTLBxApwXIxsxZW2+wdaaPFJN4XxKw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8buDw7dpEuriOj4+h+XwfPPlzzHAtTUNA/9DUxy0UWHxeea6tn
	YRqi77SfibFfkzG1hxYo5x/qCxVapj9/rt+9eDHKI3G9q1jCNXPnRvGnQj/X6Ju+T2pgnA==
X-Gm-Gg: AYBFou1F2qzc2OLDBK5zfWk55X4xQPOMAoXM3iZs5lERDf7SYI6VfgO5iTGntagwP9n
	09tPbmR4vbhwqD13D6P3e3W+sRvnrEjKLamfEzj7cb/tVwehLkFjitVqA/zNH1RInEq6nqbWL8o
	nQgiEisup+z7iyORVid+VKs24ysny7ejeaT4F3luknbXpE0c14xn5Q+wCAeH68/7cZjpmBZ2X1/
	ttxJzRSXYXA5LL+JnoaFEF0vweWl/Z01Z8IYDR3xzDG5x1CXcJTthMvqFREqP4iK5EYk0Rj/8Jt
	X87K5rkjln3S9B7Dax/I9jOr0nWY9nSkhWoc30Q/pIK/IJC+W3fTK6hSESiNFcJvL0OlVZkN0eP
	ZpCCQcd9dmQWoAAGo7OU4j2ALryJfRhjI2XDj9Qs9uUTmUFhjSFxFg2oanNh7d1K38utx/Ju2u8
	wanm03YKXJLXfDDvH9HQkDKJlRrjkxq3kF/wH1FRzZ+iEApC3LfgpDKn/hwCBndfdzQR4t/ry0M
	Eh3Wx7QwdUEITwWUHXU7jWiginvkK0sqAtUIVPwg8ctzZ61MTq/vmxeVIpaAe5OhtISlQliM1S4
	r7L4efzLlM/n7Wm7u1qAo+UFwaGJRVkvMc6K3ZOfdy7SmiWzEhLLbv1+VvyD3AkNXamadanNVKv
	LTapNK0iQN4wvjuF0BPU=
X-Received: by 2002:a05:6830:2303:b0:862:a48e:24d7 with SMTP id 46e09a7af769-8631595152bmr4939139a34.23.1795204552390;
        Fri, 20 Nov 2026 11:55:52 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:51 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:41 -0600
Subject: [PATCH 7/8] media: mtk-mdp: Refuse a format change once buffers
 are allocated
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-7-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1946;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kJaFb9TDiCBW9wH5WEhVxXJkX3lfruWKRoGStsnFGKg=;
 b=PCPt45813EoOYNHjxRgmlOVKVszumvKZjt/ednF2qJK8wPlqgWFtSes8GV7N82tDxXhjIVjXf
 8Y/vKnhc0YNCkSxZuIIevgZmBuoRH+twcsRDuNmFFFjAm9j2qLjIYA0
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115553_352811_BF86CE5C 
X-CRM114-Status: GOOD (  12.86  )
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
2.56.0


