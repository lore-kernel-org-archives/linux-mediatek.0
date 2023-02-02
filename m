Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39FEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 13:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bM3yc7qiXwWhlRaDbvJOzi40+GQTbt6YaLYioRnS8R4=; b=wPlk2kpHCo2vT7RU7yYqUPz7FY
	1V4UVtGShG1ZizFJqwwPufQfJShtwW7Y7IrHBBYsbbdnT5ZK4NlLiX8S6X6ZKMgRSjGTY0nBnu803
	nHIwv+5wN13KpTx+bpjIVuWW94wr/iYs8OwIg3n0I2tIsQgyNRLvQw+AKNiXVz7WslQVjMcOdy3i8
	+l1RFnPfHR5IH3U8fU3bFRVP0h7l6SvpGTVHgWhb4UKFyET7ozpxO9MMJlXToTLaJXlNqa4HP7C8B
	20t+l66H2zpVnEAmcoivse/nrtuaT8fRStQOlHvSgqPCxX3a5CXib4J59FmqrWVHBNBdMbYpyUquj
	nztkw8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZI2-00Fwqj-Mt; Thu, 02 Feb 2023 13:06:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNZHw-00Fwmz-4d
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 13:06:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id k16so1344275wms.2
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 05:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bM3yc7qiXwWhlRaDbvJOzi40+GQTbt6YaLYioRnS8R4=;
        b=Rvww/bxfQGrNRtt90fBevNZNxYfMjFXMeYA2Q4f/J3H8lHX6JQyrOuYTIf8O0E8+qC
         UbXjTVeFtmdkOR71jPEyHKlFHV2kOomW2NYaRYkALBqeRTKFlTpauCdvvNkEGwPWkQKG
         En4FBMqMzUXanl8eTdkXNBZnLkURg6nATxfMdozkvfI6vDG3BYGJ8gfPOR22W1zZOQgy
         QLqoUc+h6NvUAKaSiH1Csn+Y/4ObEJy1n05Wu/zDmTcMXBddYsPPW6BG4PoVrSW9qxpS
         XfWFc4kIWUfd2QFSBO8oQY+k1c2H6FvvI0do/3KbWCSPh+8eMaABM9fwLDRg5KDWuYbu
         16Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bM3yc7qiXwWhlRaDbvJOzi40+GQTbt6YaLYioRnS8R4=;
        b=aAdSeaBEOyUdo1QRX4Xzp8tDZ5USV5Lgy+f0EcrVbKLxcSOO0LfKgnH9CUxyl0JhmG
         z+riDwkLG4uFle3rhJ/6FSR9vQ+k1DMtM/t8FSBq12lCo32v3Y70y8IDuW13wbAXEgGT
         uhggmuOamSmxSMlAoJ35B4oWR5mgiGqMqJsSbM0LDs9hSWtfIg6aiYF7RFslHj+zMnAi
         S2yhNE0MK+tUUQSidMomq48Uo2Qiwc2Dn1HqhS2pUzTvyayok6fwWmnQ+UFkNVIGqT3c
         sdWDdLK2JzZUMooSTCQwDW+vl0I0ZSNaSNgLLpGECW/mWUI8Tv/5vLLJG+4C9sLWcIZY
         9qXw==
X-Gm-Message-State: AO0yUKViMqOS92qzxi7K8eCiIuGjYIyJABVROot/H4Pgc4ndiSBtLQxS
	2mC06SyGvTkLtRu9qzfiCgU=
X-Google-Smtp-Source: AK7set+CWWn3Q1cPAOl+tVYu0Gng86xv9JLLy78eQfNvT9wgbId9PYFNHu1x7ipl1iVwDAHfpAzSVA==
X-Received: by 2002:a05:600c:35d3:b0:3de:e8c5:d82c with SMTP id r19-20020a05600c35d300b003dee8c5d82cmr5210093wmq.29.1675343160466;
        Thu, 02 Feb 2023 05:06:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p17-20020a05600c205100b003dd1bd0b915sm1814074wmg.22.2023.02.02.05.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:06:00 -0800 (PST)
Date: Thu, 2 Feb 2023 16:05:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [bug report] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Message-ID: <Y9u1NNZ4I6w4vygt@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_050604_220562_96A0672B 
X-CRM114-Status: UNSURE (   6.94  )
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

Hello AngeloGioacchino Del Regno,

The patch 7b6183108c8c: "clk: mediatek: clk-mtk: Extend
mtk_clk_simple_probe()" from Jan 20, 2023, leads to the following
Smatch static checker warning:

drivers/clk/mediatek/clk-mtk.c:558 mtk_clk_simple_probe() info: returning a literal zero is cleaner
drivers/clk/mediatek/clk-mtk.c:581 mtk_clk_simple_probe() error: uninitialized symbol 'base'.
drivers/clk/mediatek/clk-mtk.c:583 mtk_clk_simple_probe() warn: 'base' from of_iomap() not released on lines: 496.

drivers/clk/mediatek/clk-mtk.c
   466  int mtk_clk_simple_probe(struct platform_device *pdev)
   467  {
   468          const struct mtk_clk_desc *mcd;
   469          struct clk_hw_onecell_data *clk_data;
   470          struct device_node *node = pdev->dev.of_node;
   471          void __iomem *base;
   472          int num_clks, r;
   473  
   474          mcd = of_device_get_match_data(&pdev->dev);
   475          if (!mcd)
   476                  return -EINVAL;
   477  
   478          /* Composite clocks needs us to pass iomem pointer */
   479          if (mcd->composite_clks) {
   480                  if (!mcd->shared_io)
   481                          base = devm_platform_ioremap_resource(pdev, 0);
   482                  else
   483                          base = of_iomap(node, 0);
   484  
   485                  if (IS_ERR_OR_NULL(base))
   486                          return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
   487          }
   488  
   489          /* Calculate how many clk_hw_onecell_data entries to allocate */
   490          num_clks = mcd->num_clks + mcd->num_composite_clks;
   491          num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
   492          num_clks += mcd->num_mux_clks;
   493  
   494          clk_data = mtk_alloc_clk_data(num_clks);
   495          if (!clk_data)
   496                  return -ENOMEM;

goto free_base;

   497  
   498          if (mcd->fixed_clks) {
   499                  r = mtk_clk_register_fixed_clks(mcd->fixed_clks,
   500                                                  mcd->num_fixed_clks, clk_data);
   501                  if (r)
   502                          goto free_data;
   503          }
   504  
   505          if (mcd->factor_clks) {
   506                  r = mtk_clk_register_factors(mcd->factor_clks,
   507                                               mcd->num_factor_clks, clk_data);
   508                  if (r)
   509                          goto unregister_fixed_clks;
   510          }
   511  
   512          if (mcd->mux_clks) {
   513                  r = mtk_clk_register_muxes(&pdev->dev, mcd->mux_clks,
   514                                             mcd->num_mux_clks, node,
   515                                             mcd->clk_lock, clk_data);
   516                  if (r)
   517                          goto unregister_factors;
   518          };
   519  
   520          if (mcd->composite_clks) {
   521                  /* We don't check composite_lock because it's optional */
   522                  r = mtk_clk_register_composites(&pdev->dev,
   523                                                  mcd->composite_clks,
   524                                                  mcd->num_composite_clks,
   525                                                  base, mcd->clk_lock, clk_data);
   526                  if (r)
   527                          goto unregister_muxes;
   528          }
   529  
   530          if (mcd->clks) {
   531                  r = mtk_clk_register_gates(&pdev->dev, node, mcd->clks,
   532                                             mcd->num_clks, clk_data);
   533                  if (r)
   534                          goto unregister_composites;
   535          }
   536  
   537          if (mcd->clk_notifier_func) {
   538                  struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
   539  
   540                  r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
   541                  if (r)
   542                          goto unregister_clks;
   543          }
   544  
   545          r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
   546          if (r)
   547                  goto unregister_clks;
   548  
   549          platform_set_drvdata(pdev, clk_data);
   550  
   551          if (mcd->rst_desc) {
   552                  r = mtk_register_reset_controller_with_dev(&pdev->dev,
   553                                                             mcd->rst_desc);
   554                  if (r)
   555                          goto unregister_clks;
   556          }
   557  
   558          return r;

return 0;

   559  
   560  unregister_clks:
   561          if (mcd->clks)
   562                  mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
   563  unregister_composites:
   564          if (mcd->composite_clks)
   565                  mtk_clk_unregister_composites(mcd->composite_clks,
   566                                                mcd->num_composite_clks, clk_data);
   567  unregister_muxes:
   568          if (mcd->mux_clks)
   569                  mtk_clk_unregister_muxes(mcd->mux_clks,
   570                                           mcd->num_mux_clks, clk_data);
   571  unregister_factors:
   572          if (mcd->factor_clks)
   573                  mtk_clk_unregister_factors(mcd->factor_clks,
   574                                             mcd->num_factor_clks, clk_data);
   575  unregister_fixed_clks:
   576          if (mcd->fixed_clks)
   577                  mtk_clk_unregister_fixed_clks(mcd->fixed_clks,
   578                                                mcd->num_fixed_clks, clk_data);
   579  free_data:
   580          mtk_free_clk_data(clk_data);
   581          if (mcd->shared_io && base)
   582                  iounmap(base);

This needs to be:

		if (mcd->composite_clks && !mcd->shared_io)
			iounmap(base);

   583          return r;
   584  }

regards,
dan carpenter

