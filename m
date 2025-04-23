Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A0EC369D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=; b=QnkvWVn0JnLDZn73KLZSntmLPY
	g/A2wXZBjLRLKolHz4xv3IoTFTQothKuc7SmKEMjCSbpB6Ua8u8EBNJobVl0lucVDXxXPIWMd+9Fk
	1GEm02gpSUoR+oVOniJ162V16x1tPVIOcNcT2VaW2SU2Zwzhx2az+MOLw562T+RCa7RN927aOSI30
	zsxpnod7EAOhC0gh4SH2Npbe2E5LUvrOe9QzXK8MRkVA0i7RrrIhG1ZZUDa02JIWP4Px1aM94Hr1f
	3Ip/7/gvPjGTDbCsxBzxIS+gOM/nv0bWBJB8mV77hcwVl0BQiDS7i4vwIZutO67kD60XCO8Z2j+Sr
	ny0nHBbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Wgm-0000000A2we-0UqK;
	Wed, 23 Apr 2025 09:46:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7VO5-00000009ibU-18vX
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 08:23:22 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so4289377f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 01:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396599; x=1746001399; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=a0C66j6RZv2yJDJuNIRdaHfKUpctHqVOTmutM2HrkT02Mm7dytigAB/EfHEc25fVKZ
         JhxrK/jL9gaRIpuRZTB+Umyjh27vFg8G1ELN6yKfFIJgCLB9Hjy1WRS/yvnvPF3H2rp1
         js3uf4LeBfsiQlQOwYlfHWQ5k3ngZ70xf1Lvusbtgj9Sm47pVN6Ri/JFa6P4NsZtgR/u
         Bx2OfYQgdwn7j2J/QbrrLLSxMWUpdJd+mWFKoEmkD76onDX2xD+mh453PmnYB57GYvJc
         1P9qj5y/ItRoo7i1hVayM5GiCofru35tJSmxHEl2lUmc/ThGhCkaO/7/KcxovqMJXCzs
         MSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396599; x=1746001399;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZvxsiEPvdpb5l2WB/p6Z/my19eCAalsXZfsDJGPws1k=;
        b=XTfsYzksOZ81Vh7grfuy9v4Tv0Grs0vVNzUe3BmMIrHXN/K4bzJ07mGR1uuYdVz3oV
         soAt8VKFz3Ak3pGBMPlzUQPicxZb5U9gET4Zt2LfTUgP5F2egENGhI6936w7zYydvYT+
         AKNYOZZTeEAo9H6agMxvATF/hW+dAHBPDR8rAIutXb/3KDN1M62oPrTa/NGVrwj6FuT3
         LvPgRmp2U3bmk1guG37LbkWVRWGky6wQkDs4nSn1s/+BNSpf/T6kaX93VM2jxqv+BIwd
         BqYBjFlKKJraKRclrYhR7AR96BfsPIrKe9sp/o7Mg3bcCFRo4ou+udGxBntQ1/CGmgnM
         hNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp+LTMXVmFieFtnuLCuZCgGHom13sPyn36Y3jtdrofZsyqDONFRGyyYQfRb+Q4qXU7tUTILRMvqvhh7JcS4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxU4GZ7Aiz38ds94QLM1IDLLkoEeO76iuFMqsuYgt5klp1rOtj
	mR0A+ym3a8DNHVlVcS2kMJNPt/AoCdNrbvK9W7rhx1oviVi0W9ERP8tbHs9C8+s=
X-Gm-Gg: ASbGncsvdXwU3BSdyWtgGrNEQ0PKF2GQY0g/g/6B6wl2LjIko3x3YdLN5eUJGhjHSRl
	EaucJ7k9easBP1pT8KBnQmT+X6VAMtLFH6HPUxSPop6T1zM6e4YWpvlgyXRTVmcfR1ldzyyTBeb
	V+q5GIgCLKtuizR5fgpAZqJWaRswfc1blj0o+XD+QxmUSusE/2euXxhJQRmN3EqujfGO5X59foC
	w8U2pi7XZ08N4I5tnAY+o1mpwyzDk/nrit1h1MALWU4devg0X77vXrwDyTGD9cOxncvSxkapmTQ
	sdoQHZCST6lXJBuN/2O0NhLTGlkHBJgCzo/yxpKqjCkusw==
X-Google-Smtp-Source: AGHT+IEelUJ/5v3FltvPfU2HhobryVrZIBwS3AI8/YV8yIZfhl1ShQPfo3U4FD8Ljf8SiRZZYW9GyA==
X-Received: by 2002:a05:6000:2510:b0:39c:30f9:339c with SMTP id ffacd0b85a97d-39efba5a84dmr14374721f8f.28.1745396599114;
        Wed, 23 Apr 2025 01:23:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-44092d4707csm16964585e9.40.2025.04.23.01.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:23:18 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:23:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in
 mtk_eint_init()
Message-ID: <aAijc10fHka1WAMX@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_012321_304007_BF9A72A8 
X-CRM114-Status: GOOD (  11.50  )
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

The devm_kzalloc() function doesn't return error pointers, it returns
NULL on error.  Then on the next line it checks the same pointer again
by mistake, "->base" instead of "->base[0]".

Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on older controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 7585de11854b..8596f3541265 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1018,12 +1018,12 @@ static int mtk_eint_init(struct mtk_pinctrl *pctl, struct platform_device *pdev)
 	pctl->eint->nbase = 1;
 	/* mtk-eint expects an array */
 	pctl->eint->base = devm_kzalloc(pctl->dev, sizeof(pctl->eint->base), GFP_KERNEL);
-	if (IS_ERR(pctl->eint->base))
+	if (!pctl->eint->base)
 		return -ENOMEM;
 
 	pctl->eint->base[0] = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(pctl->eint->base))
-		return PTR_ERR(pctl->eint->base);
+	if (IS_ERR(pctl->eint->base[0]))
+		return PTR_ERR(pctl->eint->base[0]);
 
 	pctl->eint->irq = irq_of_parse_and_map(np, 0);
 	if (!pctl->eint->irq)
-- 
2.47.2


