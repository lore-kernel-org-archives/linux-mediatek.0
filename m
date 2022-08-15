Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659F7C25B06
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Aug 2022 12:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cb0QvKMoKu2xzU2m5fn8KpdSBP1r0jNnjaCG9BaoJf8=; b=kUPYPDNrn+loxp7JKgbmpx4pf2
	nDleZQ+dFK6slSTpaTYdrrXWSOJzxk3oAbtkSBqaWe8zbRzm6GZIX2R1Ln1gJk1/VS8e7nM3IiCn6
	fR1xX4LJ+TShp+gXBif6r0KK8/fUL4/+e8W9YhTQIOglevU+9HB2ESP9pfsTM2+APi5uPb+IN8lqn
	7b0BCWBp4LmblYpLOM+eiNNg9zOitf6BH0f8YjRk+vqfFkyfOM3iHEzWTiqxZHbPhtCmCWK47weAL
	EODuL3ALzdjDo1PQFhIbUQ95hMEJzrQMcEpl6VH3Qnj02DR7jHLSFBw20VRnU/DjCHssSxOwmy0wY
	0COr3n9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZ4i-00G1d1-6d; Mon, 15 Aug 2022 12:20:08 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNZ4c-00G1VG-S6
	for linux-mediatek@lists.infradead.org; Mon, 15 Aug 2022 12:20:05 +0000
Received: by mail-wr1-x42a.google.com with SMTP id l4so8848049wrm.13
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Aug 2022 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=Cb0QvKMoKu2xzU2m5fn8KpdSBP1r0jNnjaCG9BaoJf8=;
        b=f+PqK1yxoLrzKdv8s2Gx0dw1GGRi6kzs2WtESzUBUGQG7gNf8/5tPqz5d6f0l+0Ky6
         7ndLFsBkewX2QTK2z0l3UYTB2sYOin1HS0/9taL7mPO08fZK3Ju66PG/VFHq94m2oaF+
         xVn2KK9BpqqxxaBq8/HQSQPgTz8TLhYBRrgAI0TAzDciDdidR9yGAx1Vb+KW/jTmVTvW
         35zTA2WK3EaDTcXPDxVeqvlGQPHGM5mhZocrw0Lv8IHEB6LzqY7dlPwJ/CKQch2sTKkE
         wehf/6PQ3X71Wj4IIRU+XYRTJGVM6u4iK8XAGfIHRuquPeHL2hFylVMgyUdwkXpDILqd
         vDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Cb0QvKMoKu2xzU2m5fn8KpdSBP1r0jNnjaCG9BaoJf8=;
        b=U7QDKSXWhfhe1i8azR2UAWFYCf+y/ti/VB7Fm0NZPq34k7dq0aq8P0KD5SD1JB4p8h
         kjLDHkb+MvYXDePysgclCcDXboddrekVYp6TjVOtgoRbGxP5Au6kSYzGw69UTTVufRRz
         nl+bNFeqffCoI/olwe0MT6AODiGpwVxhmUNsJA61Jm/7AAxbGq4L2KVLiTexVtlpM8Zt
         vyUL4i0nNABPw2sal58ff7NzIlq+HbG+Oo1OmpsdBCa10DMX4PAlhjX7Y7ZeoT2H/EGC
         M7QdUDVUWLXeZVNvOUV0hhQXm5ifx5O9gXz87cplDhkLC07K3AKZ1q7LcX78ZhQ3YGKX
         AtIg==
X-Gm-Message-State: ACgBeo1fHHZYkk1J5n41R4o38OGCmnEOfqy3j/XuSoWM4/dzvAdPp51B
	4UcRuVgHIYIxyD8C24efXWF3UA==
X-Google-Smtp-Source: AA6agR5jpGzcnMVoqZ1w4ypUaJvlsmJvJ2YUHA0qHL2TGohWVGn+LfqxLQC+7LvF2t549pKJvp84Vg==
X-Received: by 2002:a5d:684e:0:b0:220:63df:3760 with SMTP id o14-20020a5d684e000000b0022063df3760mr8120665wrw.508.1660565998532;
        Mon, 15 Aug 2022 05:19:58 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id x15-20020a5d490f000000b002205a5de337sm7084777wrq.102.2022.08.15.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 05:19:57 -0700 (PDT)
Date: Mon, 15 Aug 2022 14:19:57 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mediatek: gate: Export
 mtk_clk_register_gates_with_dev
Message-ID: <20220815121957.hmdjsznp4zj2ijmh@blmsp>
References: <20220813083249.45427-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220813083249.45427-1-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_052003_174125_7F561D55 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Yassine,

On Sat, Aug 13, 2022 at 09:32:49AM +0100, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> This allows it to be used in drivers built as modules.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This change overlaps with my patch [1], I added export symbol for more
functions as it was necessary to build the mt8365 clock driver as a
module. I will rebase after this one was applied.

You already have two reviewed-bys, but if you need one more, here you go
;)

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best,
Markus

[1] https://lore.kernel.org/linux-mediatek/20220811084433.2598575-4-msp@baylibre.com/

> ---
> This patch was originally part of a series, and is sent alone now since
> it doesn't depend on the rest of it and can be applied directly:
> https://lore.kernel.org/linux-clk/20220519134728.456643-1-y.oudjana@protonmail.com/
> 
>  drivers/clk/mediatek/clk-gate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
> index 421806236228..0c867136e49d 100644
> --- a/drivers/clk/mediatek/clk-gate.c
> +++ b/drivers/clk/mediatek/clk-gate.c
> @@ -261,6 +261,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
>  
>  	return PTR_ERR(hw);
>  }
> +EXPORT_SYMBOL_GPL(mtk_clk_register_gates_with_dev);
>  
>  int mtk_clk_register_gates(struct device_node *node,
>  			   const struct mtk_gate *clks, int num,
> -- 
> 2.37.1
> 
> 

