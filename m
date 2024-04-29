Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BFC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=; b=grr2Bxpy0y9buLKP/8A40Qbi72
	jWq17ErUL2QC/2Dsb6acFm8NZpSbmZr6an24i1Q2Q2XfI1vi+DLcgH2EuYkoLY9Wr2lNup1zgRCUz
	jAkXv8s6lsAlCbSVcfKeKcf4XCrpmVVKQRLjh03b+pjyF9m2ES+FAn4kM9ksmYjjhyB/aocUCEWjI
	8ej5wI/k4gYnghlHIvtMrFZL7wIk2QmiIIVdmnCd4P9YxSew1E8CUJ/YCAjRlq8KC2XGb7tT6M4mx
	al35SAgnsIIH50NYthCL39q9d03Kj+NVWdzgPJHvOXjmFvBg3jGV/foa6cXuVApF0OZ5zAbvSoCjd
	PMYxWtcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYi-00000003FIJ-0QRA;
	Mon, 29 Apr 2024 15:04:49 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1SYe-00000003FFr-3t1i
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 15:04:46 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-78f05341128so332452185a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 08:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714403084; x=1715007884; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=VG+osiId90CMFXtEbs7eadJ8eYRfgWhvNm8QugtxWw8aRGwc7vM82Xlg72LxLrV9VB
         TTgkGJdHRgv694N/9W2c3L0CEbR9oQfNeHFzRSl/9GTogpdrv4XGJfQkCDu5lP6BG1TV
         bdO5tZdW8Y+ygR7uj7w8ZlDeFr6MU9a/64Krk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714403084; x=1715007884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cX0Nt2WjhKwJC/tEnFmYRvlB1MfFk2LmbDG81TIdFVM=;
        b=O2wUNVKfRKW6GOR4kcT0Qe1PNI3X8iR3juz/EQTvDcCRtGOY0dHrgVdc7Ztvjusq7L
         9bbuprMkB8ZUrlkADCAMNl6NKejcQbsSlE75xrMYrUEGbPWibUGc79qFsy0WnDBIbwEt
         /r7cjG79x7WH81hiBLklvdYS9kZ4jk+vGmQ0V771uQT1pB5R25r8z+tTJegkq40fY9Vs
         6JYbqqitQmdoySX01jA5XROP/jdpCU4Gm/SIyUJ4eDFrmdrIfCNDxktNTDnYDbW7WO4b
         nIZpY6jyFxBVoiP1jhW+EDRkN/B0/TCRCrJ/fRnu7yBcXnHLwdRNgxurwe4TRtmiFp27
         XP4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWanOE1rwRWSqhzL0s/7hOCkpR6udL46OREKLK3IOn1BnfqvOqDjVMU92y3ZnUvpWNynujRGGCLDQ7MMvsbtIkHKSp0o9rwZcFkbKxzuVjchnzE
X-Gm-Message-State: AOJu0YyPmwgvWOGHcfPe6+1O1/yDY85E5Mxnbhlv5gAHypr5tfSGO3zh
	ltRxrqXCHxsiGb+WFolnykcDXTFYNQiswiQ6+l5xSAX38NyG8n9JcKIPWXSqIw==
X-Google-Smtp-Source: AGHT+IHWuK1oddmDBavr6+ksLu5/g3HWffeblwIQsTBH58X6jA8tyFIvmLIj97Bf7YP3AKSemxlfBQ==
X-Received: by 2002:a05:620a:4eb:b0:790:8e96:7841 with SMTP id b11-20020a05620a04eb00b007908e967841mr10130143qkh.60.1714403083799;
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a056700b0078d3b9139edsm10568591qkp.97.2024.04.29.08.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 08:04:43 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Apr 2024 15:04:40 +0000
Subject: [PATCH v3 01/26] media: pci: mgb4: Refactor struct resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-fix-cocci-v3-1-3c4865f5a4b0@chromium.org>
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
In-Reply-To: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_080445_005673_AE2631AE 
X-CRM114-Status: GOOD (  14.94  )
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

The struct resource end field signifies the end address not the
relative offset from the start field i.e size == (end - start) + 1.

Amend the .end field to specify the end address not the relative size
from the offset as is currently given.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 9bcf10a77fd3..60498a5abebf 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mgb4_dev *mgbdev;
 	struct resource video = {
 		.start	= 0x0,
-		.end	= 0x100,
+		.end	= 0xff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-video",
 	};
 	struct resource cmt = {
 		.start	= 0x1000,
-		.end	= 0x1800,
+		.end	= 0x17ff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-cmt",
 	};
diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 53d4e4503a74..31befd722d72 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -10,7 +10,7 @@
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
 {
 	regs->mapbase = res->start;
-	regs->mapsize = res->end - res->start;
+	regs->mapsize = resource_size(res);
 
 	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
 		return -EINVAL;

-- 
2.44.0.769.g3c40516874-goog


