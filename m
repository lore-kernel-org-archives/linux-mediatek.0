Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4881C282EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 08:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=; b=ARSGchlOpvfE4L
	C57tHeaQKkXc54xuJlmBbvcBiK3qRl4SF4eNZbgeZLfRnTV0SZfhpkHUXJtR9bvRYcz66EtM87a4Q
	r543uYgEmmBDkm3L7M0LmwDPNnkimVts5XVsPvVg1dQBrPfxxsxIACyh01hTwjOSXiU4psggLc8Yi
	4ni0wh29B+uHPOkQT0+/BdUXV2xcTS4Tul7NU12YI+Lw1FoxBf6NVy5aN4twpEMAXrrK2WEQ/TCwV
	pEUkk6Zs4NhnFkz2B4l80Qubxb1GNTGDfTzcQKqF+UFjNUOIG/f+lpPFA75EcIyP54eeG3rUUDBlD
	g6AF7g7ne1g86ggTDWYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt02o-0000000DOE0-1k2t;
	Fri, 14 Mar 2025 08:05:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tszv4-0000000DMrv-3mt4
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 07:57:29 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-223a7065ff8so49485025ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 00:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741939046; x=1742543846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=;
        b=HYWaY0AJB19CvvKe6IuKkLxyA2HX0Bw4fD/KPZYI8LlYCYNK4jUIO33eoUai6JB1r7
         6PUVCZDEwD50MCyWfswiLH5hy5NJl3Nv1BaFTJMeJfRPnioqm5CI6ezhKoF924O0Pkqf
         EYGg3CqIa2AG0Z+eiHggU7m1nXdQr7hNtjBxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741939046; x=1742543846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGqvrAfhcKrz89VYEJIZSiwWmc+V5sZA3zV6G2zLMIE=;
        b=t15EqHfQxerV2+K98wW5VSEDJK4Kvs3rW28wj4YDtdYJjDX1gvNd8k7PomHto86Nsx
         QE+af6fzW6hBNHUxN/v65eYv2n+oc7DBGjEBjYgkF6C1sF69ZOUceaETHyJuHa7cN7G2
         Z5ZhTHrFkXElvbM1/2Z+9d2C4FQVE6p5+701FjXAqEuTtYrcZGNVHYmRhUwKiL2mvg6z
         0u3KpkbB/TxEIkZrYKvWjyQTN93d9bWvsWh4aO+YA0u82Iii5L7bI8OMnZ7+c7EpnjI1
         eNlq3Icfibfuk5BiGXN3u0Yk5UbX7hOydm9m/pKm/Yt+mZhsGD3ZiiU4pMdJP7fnJmvE
         wQJg==
X-Forwarded-Encrypted: i=1; AJvYcCXjohl8V8FRolE5+Fvt1gq8HTSc0m2EN4iHbjt0wkk8TVBSGkJS89kFqhy1MGIOBl46oofp3XufiPJA6y7O/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVdDCZB10g2uorng2oiwoRC4NGS8eIpunyxB+pDEavgLOP1fy/
	qynrtC7HUt4VIWfEA1/emj6NuJ5sAywmLb5Iald+MXmeQQF1Roa8ndxl9ffttA==
X-Gm-Gg: ASbGncuw9oonNepCJvK/S3MU8CnCkWxwhfZP/UsvJXgufLYBmFikn3i3j0PB2NaGXh/
	xglmBvM8mWZiezrTzPKezOFBZOGY+yg7QWJvAKTnLNuuXT7Y45PHNHbjjMXiD2YyciafHpq8q4d
	Hdu9DEb0TGAmeQl3m3wIAiI07SNV4enUxudHYJfErLOS5gSB06OnNwcVrd/BUX5unF30QWQT7+D
	Yw8eld2K0Gh3+ZeJ+loEr9WqQQP83TcTBvKJkukMM3azMgKC3demXq29fByefncPRepcf5Wa9sc
	HBLczDrES77c1gm/dgGJp9xo9CPoIDbJpm2/3BQ+czpQt/I7MAb5ZMBt65vky1JEHbrrdDDMTUg
	=
X-Google-Smtp-Source: AGHT+IGcdiyY6idwVO/6iM9R+Lbkfus0qpbdDrY+BW36asi0U5rIaBOZjp3x3v1YPc7FN9l17L4XaQ==
X-Received: by 2002:a17:902:ce89:b0:224:1579:5e91 with SMTP id d9443c01a7336-225e0b51498mr21334615ad.47.1741939045771;
        Fri, 14 Mar 2025 00:57:25 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ae4f:9361:a038:8207])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688da81sm24405595ad.43.2025.03.14.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 00:57:25 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] media: mediatek: vcodec: Correct vsi_core framebuffer size
Date: Fri, 14 Mar 2025 15:56:17 +0800
Message-ID: <20250314075703.4167532-1-fshao@chromium.org>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_005726_966630_E649A6DE 
X-CRM114-Status: GOOD (  10.04  )
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
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The framebuffer size for decoder instances was being incorrectly set -
inst->vsi_core->fb.y.size was assigned twice consecutively.

Assign the second picinfo framebuffer size to the C framebuffer instead,
which appears to be the intended target based on the surrounding code.

Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc decoder")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
index aa721cc43647..2725db882e5b 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
@@ -821,7 +821,7 @@ static int vdec_hevc_slice_setup_core_buffer(struct vdec_hevc_slice_inst *inst,
 	inst->vsi_core->fb.y.dma_addr = y_fb_dma;
 	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[0];
 	inst->vsi_core->fb.c.dma_addr = c_fb_dma;
-	inst->vsi_core->fb.y.size = ctx->picinfo.fb_sz[1];
+	inst->vsi_core->fb.c.size = ctx->picinfo.fb_sz[1];
 
 	inst->vsi_core->dec.vdec_fb_va = (unsigned long)fb;
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


