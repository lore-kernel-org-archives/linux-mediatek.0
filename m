Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C80C43458
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jul 2026 20:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=; b=4BbvZGan5w9XOY+aywgjV7wW9Q
	LrNDdEfV2jJELngoFCQSSL7Rm8MuuK1CkHn8WgXhCp9pqS4eJhcOb9vGkVBUJWMaaNVqk+MIVNyJ7
	9hi12eleHZ6DyMT0VqZPmpwAq74XYZbxBOgv6n8khPPew0hclBefKe2XiGd//3LP0BL2V30aC/3tM
	+eUp5lICkFJNQo2jk75l3eFFsr6NC3IJSlKuXw1WHctjbhPFeEJEtKiPV6FBQxdlt17V7QycdYFp/
	D1W1uNpZudVsA1OJtAj+4Dxre7txcGBQjsUi+fSFeyQfBdMlHOSWnyRoitkzcw5EscvhIfbfdCpBt
	9dYiL+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpVi-0000000DWjA-0mZE;
	Mon, 06 Jul 2026 20:01:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpVY-0000000DWhV-42RA
	for linux-mediatek@lists.infradead.org;
	Mon, 06 Jul 2026 20:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783368095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
	b=csDsfXS8I1UfzI/MbvtARWHu9vsvttxlqvLr1wY0YAYAv7l+XAiAuYHmMIJGYeDA/lxmSQ
	CbVaomcWFLLXjArsOi8i0tpDKz260Co9//AkqtAa+ePgTsBRUf3iuVl9s27YAIXqyHobi9
	xrWMoSB6Gpf5Eje+B5PIQ5nKQg0XatQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-UOW3wWtyNZqiQEVQ-OqckA-1; Mon, 06 Jul 2026 16:01:34 -0400
X-MC-Unique: UOW3wWtyNZqiQEVQ-OqckA-1
X-Mimecast-MFC-AGG-ID: UOW3wWtyNZqiQEVQ-OqckA_1783368093
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e538afe65so340344685a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jul 2026 13:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368093; x=1783972893;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JBmxobDW/MHje2f4xBTmx9aIBxPjJtJsCEI+DZFs4H4=;
        b=YKVbTmZJ7rAoyEc/+jkbpY8YuHxoMpZl1VvfkI4rhYFCQlJ7hfTOWCZ4chzR3qBzHu
         rii06uLMXjpprFdg2TdVUHI16n8HQXfne8DI0lg5KPYbJCkASBVDG/e+tQT1O5csmCY1
         lt4rbKq4ILJJQ/+uJztQ0N6XuHP7B1Y5A7tFaCfLJ2L0nmJVUvDTFBao34QjIWy1P3DF
         BD6sqoBhBH55mv4OMvQ+gOJbd/UuSf9orUj/b4/pswLusDr9ObdyxWso9oFpZv7BQqvp
         t+kIt4yeDR6A+P1SKe+DbypHtJsJJk99VF5cRKyCmyPQxhT63JeNlfYmz9w+u9r4wd6B
         Gx2w==
X-Forwarded-Encrypted: i=1; AHgh+RoqYj2YfnkOJpDZbUaxIItTixtOkXuK60DP69dpHdgnHridZoDO3Itk3A2oVblk4BajVwzVp4tXG0byv2mdQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUqxGqQq8iZeoBXo4vgI7oJoS6h6/V4l80fRWw/Z9BA2hczYaP
	0Qf24VoSkyGR6D3vfGsiWZY/EBUA9RrTFj1bYmGtUMmvRRmLuP3OFCCp+SIAWJm4pMW5tdq4LY4
	YEgLwndks/R8E6MdfLQCkBeYRibA6xir+Lh/D1ghtYOA6QtiGIbmPS6e1Uj9WQWMU6t0nDeYjPA
	==
X-Gm-Gg: AfdE7clcwB0Zr/9p9AWm0I5Odk28b9eSybymXueGhF9SY5FDxF8rATpha3PdwD7gy06
	dfISuIPs36uhvLSnb1wNTVVR+Y0uyB3PiAfkvTbPGkqjyBCYQmYjavWyF/JWKxZoPjrt8GWKI9Q
	ua80vBDTZ+RbA3uUAErZmmyWN8En+9d9UVISUzvlEuY6UGEKyWPSMRW3emu53ydu9l+7QgxcecN
	G3Eo3wCO50fMhF7vHKlRGKYiptNcnB7/fpMacD9fBm8JgSaAQKcl2ztuUgx2gQ/zp+ST5g+viph
	gd77wU19KeoTo8BtPWBlzmMBhY0BnxPyftf7ap1hRnf0ut2dTtnP6MfJJYaeWBhgatqNz7/ha8f
	fkiNUbDuW9JPZJbgOfG9tAYlWENSk5jbP0Z1oPGAqAEGR2Q==
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271389885a.36.1783368092260;
        Mon, 06 Jul 2026 13:01:32 -0700 (PDT)
X-Received: by 2002:a05:620a:170c:b0:92e:9cb3:3f71 with SMTP id af79cd13be357-92ebb56bfa3mr271386185a.36.1783368091707;
        Mon, 06 Jul 2026 13:01:31 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b81342sm1006981285a.7.2026.07.06.13.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 13:01:30 -0700 (PDT)
Date: Mon, 6 Jul 2026 16:01:28 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] clk: mediatek: fix memory leak on module removal
Message-ID: <akwJmKqZJS1sJzFk@redhat.com>
References: <20260629142348.273766-1-akkun11.open@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260629142348.273766-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r2bSnHoJqNH4SYVptFpxHkSbULPh568EkSE9HXRbhjI_1783368093
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_130137_080363_488B52C2 
X-CRM114-Status: GOOD (  20.20  )
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

Hi Akari,

On Mon, Jun 29, 2026 at 11:23:40PM +0900, Akari Tsuyukusa wrote:
> Some MediaTek clock drivers do not call platform_set_drvdata() during
> probe(), but their remove() callback calls platform_get_drvdata(). This
> results in platform_get_drvdata() returning NULL, which leads to calling
> mtk_free_clk_data(NULL) -> kfree(NULL).
> Therefore, the actual clk_data is never released, causing a memory leak.
> 
> Fix this by calling platform_set_drvdata() during probe.
> 
> Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> Fixes: 54b7026f011e ("clk: mediatek: mt8135-apmixedsys: Convert to platform_driver and module")
> Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
> Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
> Fixes: c6368ce86435 ("clk: mediatek: mt2712-apmixedsys: Add .remove() callback for module build")
> Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt6795-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt6795-pericfg.c    | 1 +
>  drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt7622-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8135-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 1 +
>  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 1 +
>  drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 1 +
>  10 files changed, 10 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> index 54b18e9f83f8..24522fc24019 100644
> --- a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> @@ -129,6 +129,7 @@ static int clk_mt2712_apmixed_probe(struct platform_device *pdev)
>  		goto unregister_plls;
>  	}
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;

Please add a newline before the return.

Also, please split each fix out into their own patch to make backporting
to downstream kernels easier.

Brian


>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> index 123d5d7fea85..b607592a7c37 100644
> --- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
> @@ -175,6 +175,7 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
>  	dev_dbg(dev, "Performing initial setup for MD1\n");
>  	clk_mt6795_apmixed_setup_md1(base);
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> index e4559569f5b0..12146bb3b726 100644
> --- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
> @@ -116,6 +116,7 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> index d48240eb2a67..28faeb2e657a 100644
> --- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
> +++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
> @@ -125,6 +125,7 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_composites;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_composites:
> diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> index 8a29eaab0cfc..a9fc2e5536b3 100644
> --- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
> @@ -109,6 +109,7 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_gates:
> diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> index cfdf3b07c3e0..b44baf521d2f 100644
> --- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
> @@ -90,6 +90,7 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_cpumuxes;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_cpumuxes:
> diff --git a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> index 19e4ee489ec3..41e5cfbcbb76 100644
> --- a/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8135-apmixedsys.c
> @@ -66,6 +66,7 @@ static int clk_mt8135_apmixed_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto unregister_plls;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_plls:
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> index d7d416172ab3..fe36d2eac3da 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -179,6 +179,7 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_ref2usb;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_ref2usb:
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index fa2d1d557e04..b923b73c64f6 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -128,6 +128,7 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_clk_hw;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return 0;
>  
>  unregister_clk_hw:
> diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> index b0563a285bd6..446c55b77777 100644
> --- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
> @@ -176,6 +176,7 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
>  	if (r)
>  		goto unregister_gates;
>  
> +	platform_set_drvdata(pdev, clk_data);
>  	return r;
>  
>  unregister_gates:
> -- 
> 2.54.0
> 


