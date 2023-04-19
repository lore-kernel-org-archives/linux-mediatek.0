Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9441C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 10:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NEe0NpnWpFWLDYDVlG1mOdgbx4oOhUH/eiSAn6qpqbg=; b=Jd/wmQUcrdHGS/N3kwUBqLRP7R
	+ckivZNYzg8cx11eSP78cwgTikH1IiXVqn372zxmng7PiINhCdkkI91rnkysDG54ykZVEEHxo+1Oa
	T5tOtdwDwkoO40kJtJ85wXjgevbWphn/jLbOl/crmzvBSx0o+NJ7ogEJbPcYFlVKqiM0MYICJB8En
	PBUj1H7v+0+dwCP6qsnLrAbnwfmV674VkHAvCvqcjcTklcAizaxBvc+4rF/HL8iL31ABzTac3sBXs
	pcC2h4k4S8oOCPAyGFt+ajPgjW4SV37Fd5EHxUp3YGgo3Lf+zJiLY1VIaJrJ+wXnwv/TAYaZ6ue3M
	kSNaYtCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4vp-004snD-24;
	Wed, 19 Apr 2023 10:20:57 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp4vm-004smE-0p
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 10:20:55 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f17b967bfbso28025455e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681899653; x=1684491653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NEe0NpnWpFWLDYDVlG1mOdgbx4oOhUH/eiSAn6qpqbg=;
        b=WLazIsjjrYAGGyIiKWVBk+lEgPzUZOsdUJ3FA156vbrHSGMeBw4b5pxZUsyy7iwpar
         gd6s1/pi2PRr8GJrXx7OQHcI8kWetTFJvg+0ZdZrbteaFIhan1EuMxrkXj9XBShfh99r
         2VUMCNG0oLLfaSsHPGlX1nqjRlhaGs7wv5g2A8R/YGK8xsDi5eyopoTw6j7NZ5e3qelZ
         X3FkbBbK029Z52fVZ4lxmx8nQtFZeETrnICFtuc5ASVX7SDuwHRMWrHPRS0Wlm1IEPIv
         ImIv7bimBRBJS8GIpp4vQUjwJGeXTg2Y6judfzq7FVvp8cG57UBALsWmenMopNzASvgO
         SgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681899653; x=1684491653;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NEe0NpnWpFWLDYDVlG1mOdgbx4oOhUH/eiSAn6qpqbg=;
        b=W5h0NGB2x2QdQ85iO/zXPFvXUETKWtAvvRW1PfeG2Tuz4prWvouXLjIRuUsFS/S52S
         EkRj1TzAVxWjjzu/ugAZ4f1IdIk4o4tHcinf7Fb5BYWWMZXfoKKxK21UAS4jkuA4Rl8R
         AV1i7YxWTjH8H5buF2hcLak+BeZUQnMlQ2Ga3sz6OvE8JvgqQ5RaxgRXT6x3PaRat8aD
         u/V7BoQSzvcdQVWGnemKVZ25baQ3FjwUgfy392MLr5Gm47yPUBrWz4FlP/Rxpi76ZYP+
         OLWmosDmeNaJsaLJVmQf8PtBRCARi+lnyXwMrVs3rsGFIstLZv3PBJgIl/sepBfNX414
         tsIA==
X-Gm-Message-State: AAQBX9f+bwbxFlFqsY9BAKiEzfqfEmAp80JxYi/qiNkt46o1DUsvrGUp
	LJR4oXc+E43ZGLqDinQQcbO65Edq/fVahboZiX3G8E03
X-Google-Smtp-Source: AKy350Zly8Abjlk5FZCpkeo/ALvtL4giCpBEjXOQsTfnwJBECnf+5G1Ls+akQW5tArxj5F4kV2NRcQ==
X-Received: by 2002:adf:f0d1:0:b0:2f1:ef98:8d18 with SMTP id x17-20020adff0d1000000b002f1ef988d18mr1585359wro.26.1681899652946;
        Wed, 19 Apr 2023 03:20:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020adffa8c000000b002d322b9a7f5sm15447841wrr.88.2023.04.19.03.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 03:20:52 -0700 (PDT)
Date: Wed, 19 Apr 2023 13:20:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: nancy.lin@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Subject: [bug report] drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
Message-ID: <58bfb6b0-8dea-4d96-925e-bb96d80629b2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_032054_295434_D0D1A515 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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

Hello Nancy.Lin,

The patch 0d9eee9118b7: "drm/mediatek: Add drm ovl_adaptor sub driver
for MT8195" from Mar 21, 2023, leads to the following Smatch static
checker warning:

	drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c:606 mtk_ddp_comp_init()
	error: uninitialized symbol 'comp_pdev'.

drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
    546 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
    547                       unsigned int comp_id)
    548 {
    549         struct platform_device *comp_pdev;
    550         enum mtk_ddp_comp_type type;
    551         struct mtk_ddp_comp_dev *priv;
    552 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
    553         int ret;
    554 #endif
    555 
    556         if (comp_id < 0 || comp_id >= DDP_COMPONENT_DRM_ID_MAX)
    557                 return -EINVAL;
    558 
    559         type = mtk_ddp_matches[comp_id].type;
    560 
    561         comp->id = comp_id;
    562         comp->funcs = mtk_ddp_matches[comp_id].funcs;
    563         /* Not all drm components have a DTS device node, such as ovl_adaptor,
    564          * which is the drm bring up sub driver
    565          */
    566         if (node) {
    567                 comp_pdev = of_find_device_by_node(node);
    568                 if (!comp_pdev) {
    569                         DRM_INFO("Waiting for device %s\n", node->full_name);
    570                         return -EPROBE_DEFER;
    571                 }
    572                 comp->dev = &comp_pdev->dev;
    573         }

comp_pdev not initialized on else path.

    574 
    575         if (type == MTK_DISP_AAL ||
    576             type == MTK_DISP_BLS ||
    577             type == MTK_DISP_CCORR ||
    578             type == MTK_DISP_COLOR ||
    579             type == MTK_DISP_GAMMA ||
    580             type == MTK_DISP_MERGE ||
    581             type == MTK_DISP_OVL ||
    582             type == MTK_DISP_OVL_2L ||
    583             type == MTK_DISP_OVL_ADAPTOR ||
    584             type == MTK_DISP_PWM ||
    585             type == MTK_DISP_RDMA ||
    586             type == MTK_DPI ||
    587             type == MTK_DP_INTF ||
    588             type == MTK_DSI)
    589                 return 0;
    590 
    591         priv = devm_kzalloc(comp->dev, sizeof(*priv), GFP_KERNEL);
    592         if (!priv)
    593                 return -ENOMEM;
    594 
    595         priv->regs = of_iomap(node, 0);
    596         priv->clk = of_clk_get(node, 0);
    597         if (IS_ERR(priv->clk))
    598                 return PTR_ERR(priv->clk);
    599 
    600 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
    601         ret = cmdq_dev_get_client_reg(comp->dev, &priv->cmdq_reg, 0);
    602         if (ret)
    603                 dev_dbg(comp->dev, "get mediatek,gce-client-reg fail!\n");
    604 #endif
    605 
--> 606         platform_set_drvdata(comp_pdev, priv);
                                     ^^^^^^^^^
Warning msg triggered here.

    607 
    608         return 0;
    609 }

regards,
dan carpenter

