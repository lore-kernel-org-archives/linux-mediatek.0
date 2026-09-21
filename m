Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D3AC982E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=; b=LnERGBBUOgyHT+XD5PGxao+aTK
	ZdV2gZEvy0X7DlAYoF8tkrsJh4NBQZVHjeDgra1swKCegob8wGAm7DiWPN089pUOFy1Gd/Zkc/cjt
	Lgw8nRhBc7teiEs8skm+WKehlmIv/C0TpbE3KxML4AcQAiQv2TeE8lblxdsEY5ygWW8ebOC0Ih/i2
	K54vpP4bv8av8i3jRvNSqKMup5RJpMgCeOJng9bMlXGrmLzw3Zt/1dr9WYWKiy9ZOC25i6Q8wCg+w
	bjLSH4sMjxkeinEqwvDRHE48bcXTS1iPjju5B6M+5KQznarlnomc0aWWT9gyEXZbvUarevFALsQbp
	syW/0GRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZkM-00000001P4q-3qH5;
	Mon, 21 Sep 2026 08:51:34 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ZkI-00000001P3h-3mgV
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Sep 2026 08:51:32 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso2201948a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Sep 2026 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789980689; x=1790585489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=QKyp69MY7ZL/M/iL2fZGr9dYe5BxawupqmcL3mxeIpAqnup1qWmQ1HPU3KGdO5uONW
         UxSeG2NrM5TNBy0yDRXA3FzOMyCFUXa/kc4ztTKoFKf/KfAA8E6/qgNEhARKxlj/gkW7
         W+ogLZyYdv4OZB4gi4CqozlbPljKvURxPPcdf9DASAq1Sx7GQ+soYI9FBrZXPCJ8huoy
         8zYNEyd1/utSEiMkxZN0oNjEgVi3pULL4MB03G4+WZKbEtysjae8NwnJt3ySGwM8tn0q
         BifO4UKADhNRLEDm7yAjX/hlDs8FhsYzuGFBzAQFkZg2qHtqdp29KBhteVu6uS1Ewc2K
         WfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789980689; x=1790585489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAoUJ5n70t4dRNpVYU2ESN0IQMx9sWFKtOYuOw8UYwc=;
        b=SBUio+MPeVr7krNMXUx929UQ1PW19EFa52y+UnhAk7g3js0YmWh9yRGEjLBS5Rbl/9
         D8anKfArvFlNQKEcEIavAnv/bhnh/pnhV1W8Nf0ndOvwx78CvHU1+HugHxDFlIcFOV95
         VRVMsxq6vIXvgbgzWjdh0Z8u3C/emLlIJVOA4Vn1wBqI6iOu72H8vmrNCJrXU7hZmEDn
         zgCYJD493Mq/gVtSrSvg533LMIoqFOwIlfd+mvUByWDb9AXzxJeQUb0s4G2/Bbnjuzok
         4RapDrEiCm7Vvc0eGtCsu2SZtX93qYr6MSUvwaZ9q8fzB3ogrp7fGFvqfrRpm/4LAtvi
         L+qA==
X-Forwarded-Encrypted: i=1; AKwUvBzK+uFQfaWcd2cafBF6awBqO6LVNwXMHGb+EOd5/dAJp3YIlhSELjYgVg94uIFMAg4uu5uiKZhqjRx03xxicw==@lists.infradead.org
X-Gm-Message-State: AFuF++ltfITGjZW4uk90kxAim49eUNFmGg4SDFxUeeofuL7Wc5A67x6S
	rzLVPmTiY4Ajdp3MqhLnMLVhJ7FOC4PpZpfbNCoO38zMyFmLwKoYV3gO
X-Gm-Gg: AYBFou0SyhrgXc2ThizLAMRI1nJiKz0m6EZ6m/Oqvti3lMDfvjRjDGYwHYAfI383dVj
	f6xxzIFsW9nJGv/wecMFIdzl6sSs59J9Jo7pef06oIqg/y2OXUpF7fdJq5VGGEHwuSMQC1/qRTy
	1WWX7Xe0sVlZRVUYv9kbzfqFeKQOCIVaS4jPP9LQCon38re/Bg2ZOdleQAVp7qlJFsQstkgi/AR
	b7CkKoQEQR1QrWYkREAkAy39DOMhreLXYtXHD+RFVS9ZPoKQjr72Xx11KkyDkiZlO6QYvE4/qpH
	VM17w3VDICYFmvMgW0eUZR/Nx212u7946HcM98BidgLguDnctWdPi0SRlpqvLyVlranIgVlh/LZ
	Th19kGeJBYm4qtmk6m8HHkzqyTqu0bNTbDwV1LPenzJlnaaoPUDwytTHgeX5WSHCYjuwAfeqRNT
	9YRSSsjSx0Cn5l5FOCyHtSFh8JpWKSDEiANP9OTvvU7W3fOe8naUMrHg==
X-Received: by 2002:a17:90b:1b0c:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-39e54bbc32fmr15958386a91.9.1789980689350;
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e55b83602sm7853716a91.1.2026.09.21.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:51:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yonglong Wu <yonglong.wu@mediatek.com>,
	Min Guo <min.guo@mediatek.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] usb: musb: mediatek: fix child device leak
Date: Mon, 21 Sep 2026 16:51:19 +0800
Message-ID: <20260921085119.308981-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_015131_948651_3D892AD3 
X-CRM114-Status: GOOD (  13.52  )
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

mtk_musb_probe() populates child platform devices using
of_platform_populate(), but neither the probe error paths nor the
driver remove path depopulate them.

If any initialization step after of_platform_populate() fails, the
probe returns without unregistering the populated child devices.
Likewise, the children remain registered when the driver is later
unbound.

Use devm_of_platform_populate() so the populated child devices are
automatically depopulated when probe fails or the driver is unbound.

The issue was identified by a static analysis tool I developed and
confirmed by manual review.

Fixes: 0990366bab3c ("usb: musb: Add support for MediaTek musb controller")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/usb/musb/mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/mediatek.c b/drivers/usb/musb/mediatek.c
index c6cbe718b1da..3aff0add2faf 100644
--- a/drivers/usb/musb/mediatek.c
+++ b/drivers/usb/musb/mediatek.c
@@ -415,7 +415,7 @@ static int mtk_musb_probe(struct platform_device *pdev)
 	if (!pdata)
 		return -ENOMEM;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
+	ret = devm_of_platform_populate(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				"failed to create child devices at %p\n", np);
-- 
2.43.0


