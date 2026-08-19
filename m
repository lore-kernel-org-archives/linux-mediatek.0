Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABE1C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=; b=CPFS/2wgVTDc4T/z0tHPrXgC70
	BRbLoI/li6g5MMaesRr0Xm7FtuY8h41aUAZaEqpQy2AcwpKSu5ntKhR8WqYwYFLzydW5I2qOYFzhV
	rGgWhpa5tgMOTsi0eWtibJhlsjIryJxRyRMV1D5cE73AuwxBsMQzh0GXBYn65OcomqjR1+X5V/Ejb
	04x8EaS4sStWlPdRv8KJPZ1tvDoP2VoxV8L+rzmu1Lwmsun1xi7xGAwIsqkx+4qD3r5whe5OL5dCX
	SYTcfNDsRCn3xkFMEYipsTjCTs2+vdZqH6AW+GX1hhclooebhpw3t8sR4a6dUTNFww/yy/MBPd7Uy
	JD6KoGgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdN3-00000009VTX-0TZ0;
	Wed, 19 Aug 2026 10:18:09 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdN0-00000009VQR-2j6d
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:18:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1488440a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134685; x=1787739485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=miapOLXYCi9zmmc9GYsv84ybP+8LxUkZrxL9fHiIG40+NeED1mRgmTDpVqrlV9t0Co
         rcnQIz+seF1Rwifm0rwXXyJIwwfDznwMgw/UpebFPCVL36sWxmyd3XFAgrAw5DWWZvO4
         Tpw9cdHfbUAWaG1T036utGDk93K53d8ikknV1Dtx1laygu6P07kZKtoC24SB9hwNUH4M
         qt4YaaOV+/SrNJflyrVWDD0hBG3ns8SOySho3C7D2KLJvwiKf8hEfx27FWiSzqvlX6CT
         pPF/2n4eHkPRH0VPDbFK7pVcpb755aezu4Uoib3/rmAhpP9ghQSTubHli0F3diwLdZ9N
         l0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134685; x=1787739485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZQj+ONDwpbh4PJ71wQ7JZ+LMR8i+c4jITqEqjly3CM=;
        b=o41Qc1NcvTNOpIgAHKuv8vjnLYISKQMOY5IcZ/zNOhfyGAoctE5ECAKQrMFS7l0Y3f
         Z+mC2rkLXMtGZw4HlmPpR5XBJFltOQWZg0cgcyYek4aBjxkTFG5rFgJSi3ZTwRJO42WR
         Tl5SxJtCVCdx+pgTVmBgL/wQSEp5jNqoB6rzkTz5UlWxmubh2O5e5MFJJZAiBJI/BOYw
         Tm39mhnEU5+wq+yx/fFMjAfez1/HFtbiFooe/UW2d/DibQnaqm7sEj+LNaXV1occpfYG
         mHTibhfbJybu1J1pjXG9xmQJQ/KdSaBH5vpqqgOEdLLzqgbHJNIakw+E2vqFePh3P/e4
         Oc2w==
X-Forwarded-Encrypted: i=1; AHgh+RpFCqSFMncLWaeJMzfOl6pKpmV8of/hvLoMBYDDEqKW+S1NR0SvdJl3PRR3CnaKofC5wIefcUawJPeRIGCi0A==@lists.infradead.org
X-Gm-Message-State: AFuF++mVAmycNqztM+DzdE573XTDGKQNvImANtfaljzBCTeAd0ITGF6o
	8BdUobw6DgDyK6OMPeu/uIPMtghHNQvJ/hlcG9o4bvJb7zpiZ0HKV2NT
X-Gm-Gg: AR+sD10vG+EXyyuQjik7RtvT8NgaByzWMdUXKkoLFY3rI+hm3dO3wyTDFRB0EqQzU0P
	zqJdA18X4MCEy9/tGjVJ6BcSE/n6bHKAOQtkoeRPXcaJsKxObmE0yLCXI+Nlwgl3PWYsr3QOJxD
	uyVOjQLP+V/nrP/PMVdLRclbyvBYwZixPOWywwdiIDeT+yKUMuqblw/XHG/LpoM3zhT5RbykSVv
	9zphCgUmGR/cRDTbx9Cmx0gsxMFo6X4KzQxLQQcCM25l16duZevZ32GkAWD9gRkmvVxv0DNRJNb
	ccGRBrk67fmF/BloppdvbZ1QuM+74muHcjsfEgPYjtBubeAHbWZq9efH9RBy5snoJDTXW9+deF9
	TDR+CE4Q5CYv+hK1qPi5MMHh76U6I3AQNmlYQR9G6em5Tp2nEl/kHdQvOsx26BBLmyirmP49f0j
	+suIADtC0+GLOeFM8SdJyVhWYCnmwoLI/OBlrAmENQctzQkv6i3u8mmBd17q/P2VTq26OLBk3zp
	dFcacKAfWfVNHgUcXpV+w8tQwR8yfpxmW8uAPpCsyeIBhVzBpC9x8R5P4MKX3mMohGXLKEIu/rI
	fUR+
X-Received: by 2002:a17:90b:1d0d:b0:38e:9ca8:e99 with SMTP id 98e67ed59e1d1-3957f8f8c35mr3775298a91.5.1787134685426;
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: mediatek: mt6797: Drop redundant probe error messages
Date: Wed, 19 Aug 2026 17:17:36 +0700
Message-ID: <20260819101736.67632-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031806_956705_5ADB39F5 
X-CRM114-Status: GOOD (  12.21  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index f62a32f2f2b6..dfe67727fe47 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -754,10 +754,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt6797_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	/* regmap init */
 	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
@@ -800,10 +798,8 @@ static int mt6797_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt6797_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		return ret;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


