Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4BCC43458
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2026 17:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=; b=ZUAVoJu34O/wJKvUrQWkVhwpiy
	WCEZPZ9sq4rg7rgYWFPu5BfWOFe3aUzZnHB7DEVUpHLhqEKo9E18BQ67/Z03wZ+KC8qo7Cx2OBwbn
	XI3zqa3INU3UMCjVMZ6WRQHJX8rSWV5a00YENxVpyUXKwPOca005dk0Zjvpphp9/zylxg1CDaKGsx
	AtCUFWKtatzTGzZUT4I7j5PBrd7ic0OYeX1t4KL3IX2N6v+Fm0MaEghKj5Ddy22kLsUZePcJ4dNLI
	eMw92vCpyTfK+BPUW687Wof10iC4i+N6ctnik1gCseCYHichDJCh/vmpW3a4istDgOxET3iioIr3z
	epnRw0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4DI-00000008cgv-2b65;
	Sat, 04 Jul 2026 17:31:36 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wg4DG-00000008cg0-0c6V
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jul 2026 17:31:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cacb8416a1so11290505ad.1
        for <linux-mediatek@lists.infradead.org>; Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783186293; x=1783791093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=ZDctpDo5zrL2y0RackA4IbCe9ihbc4+SwIl0SXWjrmmRPS5FfEU6OJce9qiCIO2LeA
         SbiFuJ0wGTaDDr6MmPeAZNM7nh2Vniblkxy4JUzYiPS06OSc2+on/AHxxXnRYLRg15OS
         BMH2kvd1xXFcs9wGJvWyDAJr3ih3iOSzalA7JuABBJTOs+aREFb+Ke3Fz8dIW+JO3tSM
         PscadcIA09hXrT2FJqqnpR6VzKqfDRgb0O3S+Q2jD9P1jN6nyo468QrHkSzFuBDY9yCK
         mfeFUc5iuTHVrGvUT7rvDk76kE4ehnBM7V6akTIgX8gw2mwa2Z6ARwalDbIqvYh93w0G
         sFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783186293; x=1783791093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGW3vnuOQowUku+yOKABC0SiawHjWOple2z61d4A5zU=;
        b=d5eO0Tkl7fsj0bn6a6yyDpdOqPo8LMEti3xDr+qEyOcyxYIVm2BssC7QCIlDiD70eP
         BjQrwlQAWZE9xwQ1GPe3EbJ/9mDx4x0FcxXPvVCAL73i5C0vokYRs0KNdjIO3S21vdxK
         Vadr+cZ84wbRG86RlrrQjnNJFNkxNZ77EWV48rfmMLbXhoipelzuK0NDldaNYNp1rCQE
         lJ1n7Tt61uhcBml/TZWP9N/3U7sq/4jPKQtau0ofgOIEuZ7U/xVpkuMrQxkQagcwbX8G
         f43zF8rmZ5HfpOUbf5lolacgXcHX5+hjXbF4GFmI3NkMskGZvfuHgB1lJuhKbNvMA22O
         N2Rw==
X-Forwarded-Encrypted: i=1; AHgh+RrjnQlmOFuf/meCkZ649o7UxH3sgR9KqaB5GaMJXDDnmWbwhfoFQS0C+TdbUYiQ8Nmy3ZtQvLR5dj84zckS5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8aGslgZnWd2AO2pYakbLEQdRmeH6MHw9rtCmwDSDerlJr8Atw
	Zd8UcTC1WygFiPqYO1mGpJs0dd6/crdpHdp+iDB0jX9Kk7LoaRYjiwzl
X-Gm-Gg: AfdE7cm0yrf/Rh2WAUq7s0DaTgts+5GEJPI/ylZcZ5xGXFkkeNjz+8wzhKgHprEIo/5
	GmrYBYUbeDN606bviwbUoXmY17ArmhNa5783bcHuPu9F2K18jduSO8qobSvBfjetvCuHjr7Kcro
	pf6PYWoZKqxAWDpaPQTZtnPrJoJrZG2SeqHoYY1egx1yA5CI8PO/u4r2HfZNWU21KfW09Qu+cF6
	42HlN6Ymfkv2D/jxUXKh8FTZzrPxPlOGd7VqZaG8dKM+hcd8AmTuZYL3vnDOGg76FGtjAOTRFWz
	mb0B5LQZOD0Z0O7CPNmwlqUPwS2WNTH51F69VoWaErZZe66QgOR2i93MAu+dnIaUuEp3nwkDjqr
	Y8YXIXXNi6i3Ot3MEd0XCzVliDLXW5O5sM203cU3RM3ghEr6AJHfOWDRdTATZihTRE6nlWKKsa+
	Gk/A==
X-Received: by 2002:a17:902:e74f:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2cb97e58139mr41657465ad.8.1783186293171;
        Sat, 04 Jul 2026 10:31:33 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad71328d8sm25082305ad.29.2026.07.04.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 10:31:32 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: platform: mtk-mdp3: Fix SCP device refcounting
Date: Sun,  5 Jul 2026 01:31:19 +0800
Message-ID: <20260704173119.254975-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_103134_193868_24178071 
X-CRM114-Status: GOOD (  11.12  )
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

mdp_probe() first tries to get the SCP handle with scp_get(). When that
fails, it falls back to looking up the SCP platform device with
__get_pdev_by_id() and then reads its driver data.

The fallback lookup returns the platform device with a reference, just
like scp_get() does. However, the fallback path currently drops that
reference immediately after platform_get_drvdata(). The driver later
still calls scp_put(mdp->scp) unconditionally from the probe error path
and from mdp_video_device_release(), which drops the SCP device
reference again.

Keep the fallback reference until the existing scp_put() call, so that
the fallback path follows the same ownership rules as the scp_get()
path.

Fixes: 8f6f3aa21517 ("media: platform: mtk-mdp3: fix device leaks at probe")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index 8f4da4cf55d2..121b1006ffdc 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -294,7 +294,6 @@ static int mdp_probe(struct platform_device *pdev)
 			goto err_destroy_clock_wq;
 		}
 		mdp->scp = platform_get_drvdata(mm_pdev);
-		put_device(&mm_pdev->dev);
 	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
-- 
2.43.0


