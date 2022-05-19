Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECF8C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g05odEcjV1/+7LgAqcPjH4zjIYKwhy2+MoMULN5GPDE=; b=JMOkBHYPbshEo9
	ADMuz8UYgfvd5di40+Ene3zHbmldsELVlF2an6l0t6dHHBV9GR2kRVG2hi4jhCMe4s1o4KPxmjApJ
	qu08dnm+LlixIuZPjHTzt5bDMNV5B/QdTmO3Y272qSmXvPDDfF2JtQsVd8AWCpM3gUQKyerE3dLnr
	/lJySCqDGrErhPUBtMB9eLwPva9LLAF+7a5nZ6JzLfJHVyvi3pwDmJ20kyCD+DZGqOHA7f5HU29H/
	bPGS3gwTasBciyDqkSbddV5HrB26AGXfIjQP/ZJkFX3Nitl6UYjL9F92xwGaBdK3UVSCRUr1uRL27
	QpBuZNMsjbYbZQuTx+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraPZ-005Tl4-St; Thu, 19 May 2022 07:17:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraOr-005TMi-AA
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:16:48 +0000
Received: by mail-pl1-x633.google.com with SMTP id 10so582866plj.0
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XyPdRLUOvzyoOkl8AJ9Cmk/FDiuMmkecbpR5XkIBENg=;
 b=AHJDPTazWz30qIgRscFtjGVTG8wlsDJmoNh5UcTl0JQ/yWCFbfHhNh44c0efaWZr/4
 NEiMqB/xHIS6ggcyJQ/jKNYgPdDQ1mke5W7ctIIlMEdNsH+1+b/egjr49xT8pcxMcZbo
 Te6muBz0eEZ0C1v+nEA4lan5cookOvqsJkG1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XyPdRLUOvzyoOkl8AJ9Cmk/FDiuMmkecbpR5XkIBENg=;
 b=S4noSFrfBT1vQPA7ZYFIuon3ydAeKiUuJTojLlJsh2vO7D3oncVoVOj0/8vRRmkkuJ
 W9Ij7SMo8/fNomWzEqppEExxOVEAknghlxIb07OM6f7g6D8HSaahguGKcxDqbgAVuoHs
 t9cIXHS6UIkVFxOhS9xGgum1LxVl+R9iRLmNomrTJ+PKPc3gNlCqa/HV9J7hWnpeiBUm
 3hobrlYxp+E+agg1MC7o9ZEcit6+X/6IGkxS9w2w5/OfiBZiB6mWzFmS3IECAGExFNCt
 gyCNGGbzUz02+raHBgtxwvhICyvuZ62qGWyPwHs+STXHgT/XxxOMFKALGbXbQM449sal
 tRBg==
X-Gm-Message-State: AOAM530F0jMWemNGPL4bImN6iHKCEC4FGRtf5IzQihZAbOiOVp6GRdRB
 EBZYF615ypF0lqq2PNHN+yyM6A==
X-Google-Smtp-Source: ABdhPJxLeoOFy08yRDFcGKNoS/bVuLsPzcc7Ug2Ns0s1mjVz6L+U54MF0RlA8KbO8s47+cog8MHGQw==
X-Received: by 2002:a17:90b:390b:b0:1df:b3dc:514a with SMTP id
 ob11-20020a17090b390b00b001dfb3dc514amr4322602pjb.25.1652944602480; 
 Thu, 19 May 2022 00:16:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2338:2871:9320:bed0])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:16:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] clk: mediatek: apmixed: Drop error message from
 clk_register() failure
Date: Thu, 19 May 2022 15:16:07 +0800
Message-Id: <20220519071610.423372-3-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
In-Reply-To: <20220519071610.423372-1-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_001645_442042_752AC7CF 
X-CRM114-Status: GOOD (  13.54  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
fails. It doesn't if kzalloc() fails though. The caller would then tack
on its own error message to handle this.

Also, All other clk registration functions in the MediaTek clk library
leave the error message printing to the bulk registration functions,
while the helpers that register individual clks just return error codes.

Drop the error message that is printed when clk_register() fails in
mtk_clk_register_ref2usb_tx() to make its behavior consistent both
across its failure modes, and with the rest of the driver library.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-apmixed.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index a29339cc26c4..06400c043fe7 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -91,10 +91,8 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 
 	clk = clk_register(NULL, &tx->hw);
 
-	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %pe\n", name, clk);
+	if (IS_ERR(clk))
 		kfree(tx);
-	}
 
 	return clk;
 }
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
