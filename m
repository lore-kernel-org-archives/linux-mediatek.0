Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452C9C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gdC3n49f3pUPNsrcBA7Bt2BGENrWBIomL/x/RasR6Lw=; b=nh8jyv1TO7+m0aetSDIB2kBJ5N
	xp1PWcdit7nkcEgYJ7LpPjKBjPh/jWZTVuB50b2VfIFkpMbgPmdKD1mhRyh6sSHX19/zaiK9JT69L
	P+TTEFs9S589OuDVjsRyE3HOuRJkDjPb/KGOLfJZtIZKB2AG6r+KqSy9sRj/UGQa2DwBTqa7VOTXA
	ERWje2BDlJ5GsS5TnR/cO09wIYJLGYiDuhmB6Z2YyExTPtrzzvfndeW1Avfk5EWO3tJDpOjK2zpVC
	cl0Ldu7ItlllVdYpx87oplV8ZYg9q+hLoBLHU+pSvmwFOfTDQOC9OsxiA65Z2xEHswXhq1la3nljX
	icjnSWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkru-0000000G3rC-42gd;
	Tue, 30 Jan 2024 09:57:26 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkrb-0000000G3h0-10mN
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 09:57:08 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-295c8b1cd4fso3630a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jan 2024 01:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706608627; x=1707213427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdC3n49f3pUPNsrcBA7Bt2BGENrWBIomL/x/RasR6Lw=;
        b=jtT/QvICZU4DUSwd9XmrrH53E8KmlCLowtXnWe95ekbeVlwJXxgd2/SOoCCxy0+POr
         TrKXvHm6Y/zSf+qfyNlH4WPVMeXugWqFzesUC8rAZJiN0gcEVCHH9MaJe503xG5SuDBS
         qrGMTQuzpMtK4ryV2ARouTl8DjWlna9Q1trLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608627; x=1707213427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdC3n49f3pUPNsrcBA7Bt2BGENrWBIomL/x/RasR6Lw=;
        b=huzJz7lUwpab0QLKAFNpongS1aKhgI/bSY1LI2Ilb6wfuAcse7VRM3izDtqBWtwUBq
         GRyJ5Ls1JFOxs4SjN0Av5L7rGNyykubgPxEJSPcqGTC7Xmt7THpg1rvvf162KwX2t7JR
         RBvGibwyjhO2NOaaqI39w/e5ZbtcHg8WIQNJX7U3QxC28vqrkxs7nA6cgypyrB3wXz7d
         zhqMtr2IGxvfumDp/AD4GXmUIjoZVgPF11Wt/x1QNmp4eKIUw6i78qbK0Q7bx5vtzGJG
         H59R+2HCibgp7yQwXY12IvGJ608h0C65pD8vB0uHiISkGMmIIbMD5yzVCld8/G5cT6sj
         uwLw==
X-Gm-Message-State: AOJu0YxqFX3io3dhega0ZHWLpe/+ERGiwSoQ42KAwm/OJ66WKCG+WfrC
	Nb4930EL5rOkOJZteeG2vbK094IdBDKK/D946mGuTXCnHA69HnFDs7AOPpAV5A==
X-Google-Smtp-Source: AGHT+IGlxSqsMuF9m2bnctGlj48RdUWW+c4ToCBn1TGjF/x6IAqZ5PbEFfSDJkkT532DsO+oYz2DtQ==
X-Received: by 2002:a17:90b:696:b0:28d:1581:29e6 with SMTP id m22-20020a17090b069600b0028d158129e6mr1136268pjz.13.1706608626736;
        Tue, 30 Jan 2024 01:57:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:469:110f:d748:6896])
        by smtp.gmail.com with ESMTPSA id sm5-20020a17090b2e4500b0028ffea988a2sm8069810pjb.37.2024.01.30.01.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 01:57:06 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH 3/3] nvmem: mtk-efuse: Drop NVMEM device name
Date: Tue, 30 Jan 2024 17:56:53 +0800
Message-ID: <20240130095656.3712469-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240130095656.3712469-1-wenst@chromium.org>
References: <20240130095656.3712469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_015707_373202_3F136F69 
X-CRM114-Status: GOOD (  11.32  )
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

The MT8183 has not one but two efuse devices. The static name and ID
causes the second efuse device to fail to probe, due to duplicate sysfs
entries.

With the rework of the mtk-socinfo driver, lookup by name is no longer
necessary. The custom name can simply be dropped.

Fixes: 4e6102d60d88 ("nvmem: mtk-efuse: Register MediaTek socinfo driver from efuse")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/nvmem/mtk-efuse.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index f5bebcecf9bd..9caf04667341 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -86,7 +86,6 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
-	econfig.name = "mtk-efuse";
 	if (pdata->uses_post_processing)
 		econfig.fixup_dt_cell_info = &mtk_efuse_fixup_dt_cell_info;
 	nvmem = devm_nvmem_register(dev, &econfig);
-- 
2.43.0.429.g432eaa2c6b-goog


