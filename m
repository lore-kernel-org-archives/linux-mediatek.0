Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41947C44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 08:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5WnsBAYG56YcYpIFG68fmgIsTfeIiu5tlkG2mA3FEU=; b=WGePcoA1ELiEocE6EjvV9saE1s
	20T+mIQcalmuLc4jfOedXlC1qyukoaxN/l5yyhM+0sZHdZjuYOJS/XdOumihkOLjeYVlFjmcSoiNC
	DatySB3wR+ZBbODpGa1aI0UR2HhZsTZ2FZ9YksvNd7DHje5TzZSeu2fhQWY8dFPsx/e0wOlnbV9nh
	CvD0YXhFKyf/HwwTcf6K7WgBTf5W7ejv6SQG/bZp8YRTy6DtYPtSTPqItiHRjgiXghqnHaZwzM0z3
	VsNIrV3dpozVWcEgzRKJq4KrcGuxKGi+p30tea3EDncDnzPjpsQoJJ8f27VdJAnbIcliqWW5QgzwU
	X9JQO2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpd-00000006Fun-07sQ;
	Mon, 20 Jul 2026 08:58:37 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljpb-00000006Fti-1K5v
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 08:58:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8484a0b998fso9556024b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 01:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784537914; x=1785142714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/5WnsBAYG56YcYpIFG68fmgIsTfeIiu5tlkG2mA3FEU=;
        b=Of3FhrFXfQN/0YKKTWjimyWBtzMRjrLfcd2pt/i73vEitrWmw3ldvVPi2+FS8CQOQZ
         In/GcG/oOQ0IhkPxgeCPrKt8i9JtrFgGsZrKs4VqBgqdWQmuVnJ75cxVcrBC4NBkl4je
         Fz+uBHzJsI9DVgoDb+icit3lHOMfVkTSlJV5N44RzzEL8WPYYAqYRXqIhl/a4DekPUAB
         bobEWC7KpfCFTaG02sGI+iH0ZxonHmrwwDJtxGplnhvG3l03/ELiO+QNSIAs4Xfsy1vi
         aq2UhY7g4/8pEx56B3MF3VTkFdPrwo5zcm7eC1PtxnCV6aOENUSVqm+ySU1CLsIS1bcV
         keHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537914; x=1785142714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/5WnsBAYG56YcYpIFG68fmgIsTfeIiu5tlkG2mA3FEU=;
        b=boO0IlJx39RzfUEFlcds2z0GGS910tQYYUrY04WvJsaXtbhyykYZC7aLHaIXYmsfFw
         G/NlsRoF8q6agdu1fXDQAF4oKitdlPk6UaRtTlYqfhv2oVo8y9A+kIkl/OkgOFuld0QU
         63KAB9iIPyii3BENtWUbOuE+ir18WpHAGZkIxdSFz17NnkJlihTXrAbtoGrvY/EQmVPP
         V6FX5bZEP7zyjoJncvPc5sSZsXI/fxw0YYXFm+V/6KZl1jA4zCwLD/uVlmAKoycv1z2T
         /3ep9pdo/ti1atnW6WCYqMr2MV0psZWaRIasBjHIvRpKkuFqFLW0YJ/07kAkXs+hxfU+
         fi0A==
X-Forwarded-Encrypted: i=1; AHgh+RrZSt4lDnQhXdVodTAGaokIfH0yA0t5H1RrUTMC4ZtTVYHhqXPxQxSFFPW8d6WnCO7qwVd+9tsvfI96MAt3PA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFV6tYjuP90fuaE0cMF3SHxODkxXfug5Lcqxc3CFo3CQ0liH45
	OlG4EJnboDOQusHjLz7ysvK+T7aZfHQsiQFLkK0RkmbT+Depa0O2EEQq
X-Gm-Gg: AfdE7cmDCa/NqwiAufs1SqEFh/wrLCsVz+hQpWgAY1AKUVuZqRYbXEyXxJLR5xdXE3C
	4lT1qon3wkRARj41BYGE3zOuxwlURdu8fYTPfIc2AZBkaxY1kJgSGR7JiOnTScwAtOnCAlD6gsk
	a6oYkTOlotrlHGcdqP0cX4T/tM6DokgxWpF3QB5V1ke7IK/hF7UFD400m0fQNMX/7ej1nA7q2Fg
	xJ54+7bgSDERCd0frKW3qiiMIgN4b0t8tU0JX2FZ5MozX3oBc9Z9MDTp7fSn+q6A9YqPAQ54RCG
	lG0+pRDDS0lJ6JBhxBSvZgrpfEw9JF1y8w181iHluxAIPCat9zh8WM9jnHwjaGXGzoArXs6KJPB
	l33VcXOd6mc0H/9PnlNMWWKHUZY+T+LofwxNVVChAYOalk8eVY2Qxxl8eKYZC9x6pDQCmr4m+Z9
	yq9A==
X-Received: by 2002:a05:6a00:288d:b0:845:d650:b75f with SMTP id d2e1a72fcca58-84c29270e93mr13637631b3a.8.1784537914434;
        Mon, 20 Jul 2026 01:58:34 -0700 (PDT)
Received: from lgs.. ([118.193.39.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc78asm5247901b3a.23.2026.07.20.01.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:58:33 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fei Shao <fshao@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Haoxiang Li <haoxiang_li2024@163.com>,
	Eizan Miyamoto <eizan@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/3] media: mediatek: vcodec: unregister VPU watchdog handler
Date: Mon, 20 Jul 2026 16:57:55 +0800
Message-ID: <20260720085756.465667-3-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720085756.465667-1-lgs201920130244@gmail.com>
References: <20260720085756.465667-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_015835_358657_14D7A876 
X-CRM114-Status: GOOD (  12.44  )
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

mtk_vcodec_fw_vpu_init() registers a VPU watchdog reset handler and
passes the vcodec device as the private data.

The handler is stored in the VPU device and can outlive the vcodec
device. If firmware initialization fails after the handler has been
registered, or if the firmware object is later released, the watchdog
table can retain a pointer to a vcodec device that is about to be
released. A later watchdog reset can then call the reset handler with a
stale pointer and dereference freed memory while walking the vcodec
context list.

Unregister the watchdog handler in the firmware initialization failure
path and in the firmware release path before dropping the VPU device
reference.

Fixes: 01abf5fbb081 ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
index 3632037f78f5..ee50a794077f 100644
--- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
+++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
@@ -40,6 +40,11 @@ static int mtk_vcodec_vpu_ipi_send(struct mtk_vcodec_fw *fw, int id, void *buf,
 
 static void mtk_vcodec_vpu_release(struct mtk_vcodec_fw *fw)
 {
+	enum rst_id rst_id;
+
+	rst_id = fw->fw_use == ENCODER ? VPU_RST_ENC : VPU_RST_DEC;
+	vpu_wdt_unreg_handler(fw->pdev, rst_id);
+
 	put_device(&fw->pdev->dev);
 }
 
@@ -120,6 +125,7 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(void *priv, enum mtk_vcodec_fw_use
 
 	fw = devm_kzalloc(&plat_dev->dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw) {
+		vpu_wdt_unreg_handler(fw_pdev, rst_id);
 		put_device(&fw_pdev->dev);
 		return ERR_PTR(-ENOMEM);
 	}
-- 
2.43.0


