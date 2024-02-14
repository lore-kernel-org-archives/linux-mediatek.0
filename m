Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77076C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3oz8EH0OKcpFhmwJDBLxrQIHGXnO+990Fll/VjYnZU=; b=bE5K5NTIlSGMGZb+2+xyv7GDeo
	1XzLkLp2rz5amkK1v4wqC1k7H1HYc4JMWpPt+m399TFtGcvJqMJUH/D9XOLFvtF2yZdrXhfNyO70t
	orQm1YprVu91ywV0cNuAxGst8Iznxp3h/sSVlWxFXD0IDuivWDDHY7UwWnBw4SXZsLHe29e7d09h+
	vhtBm0fz5B0lCjuf/gv9QwaxcYIx45JTMO8qI1sG55YOE++hWDvWVf/Z3YNxxViAbI3WdQtEZl77p
	a0filh18nFF9igTeZhz3dXxG2aBFuKeBRtcjzopGp4nD3/ZPSM+o77+cC/q6v6qvHbi4yj0Nt/KEL
	dBWiIZmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMvk-0000000EK40-3wtH;
	Wed, 14 Feb 2024 21:36:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMvh-0000000EK3D-0jbm
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:36:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-55ad2a47b7aso276369a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707946591; x=1708551391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S3oz8EH0OKcpFhmwJDBLxrQIHGXnO+990Fll/VjYnZU=;
        b=LcmkWgLkXiThe7ie3YGc9A5w5O+GLiGzPnFbrg/vVtgWpY9XniDKKHGjo+Ym97Fha4
         lVUI3o5lNHCybhVkEcwhYUZgvsQvI/6yfdFNC3IyumQZKl1ZlPvoJrGuWrzk01Zosehn
         V/WYJaM7sNbwcw/7KL1Htm3megTxxmyB4UotgYeTIzFDWkW0gtxXhzwh9TV6lezsicga
         ieCDJVsdpOGMLnRpkoLCChqp8KeorEbkVI3LWTqowfcCTtc0BsXmei6oER1Piz/93PBJ
         CqtP4taUgVGDYCJ4kw+EUuh5pGowQHxTD76hJIIQImAv0UQU8KlEya6o7q4tBWlqt7NG
         Km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946591; x=1708551391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3oz8EH0OKcpFhmwJDBLxrQIHGXnO+990Fll/VjYnZU=;
        b=RfjjqgwnhUi71R2WNRFqC1qQQ/OS2bKHaxVeO0LJaW8mman57xnFBm4XOnDUscDQZD
         6wChLwLfIjwxOrkgUXRQWAB/ezxjfD5S/XtKl5/VjX1Wmj0E74FeDtFmEht0vmpsv9s3
         PBYCA5Biti7n3Exui2P7QdJ5ynQtp5l8EH3stA4Px6qa/LMydwBV6GSNSkz5PNBzpomI
         D/CplIpbX8iKALCRXnwrup/6XKxxA5tji7Y6ntpWOmcoSpqQZkXHElgnHVWypToEmkhd
         tuIsBaknS4/VUG3ZKpdGtms9hORD5+yXy2RHsieACOF4pL/kRGJ/3wDNFRuPBLMPnDz2
         r+qg==
X-Forwarded-Encrypted: i=1; AJvYcCXVrA+C6AkdI4NeVyb6+QVrkn9zwF31ESRSxvI21gHJ3uC+O32AP52dDoEV3yyETi3YkWT7M9uEWVxUbKG9X/2NFJV3Hngjycd55NHK7aoGaeXL
X-Gm-Message-State: AOJu0Yzb6lUV969gACa1aei2q/U9rWIlwkMAydvVwuJxM9dRM0a/EzP7
	PtCYzv11C4zkWQUBPW9oIhw5WtHCALYWjSQtjuW9m7UMgitBf0iKAITY877BpN8=
X-Google-Smtp-Source: AGHT+IHl91PbeghiBa3dyQcytSfZSO2Uh1MXz9LvIQ+QvKdlDHPnH0w2engCYxWRpYz0JoSMhh3kqw==
X-Received: by 2002:a05:6402:398:b0:562:1637:2d94 with SMTP id o24-20020a056402039800b0056216372d94mr2765447edv.8.1707946591185;
        Wed, 14 Feb 2024 13:36:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVx+5f51MvOnaR/HdfKjfiLoqtyiGaLlZVPu2bk7kiIoyXuHZHrEzhiWcnMeLMqYmIOzcUr6Zr3PuUVxKziQelRpsNO9SVFFMg4TNKA5I82ui9T2nsrkzQMPBbNzgOa5/ETe7VF63o2T1fNrbCnbibfSDu2zK3G2Zxd+0IaE6G+GiLKQKJax61uZ4uuy851w7fof3Hd3sCEHMwIWr/yQyq4V3mLU/B5mVqXIWsvxqur1fSqli64wYXvqbD/Y+3mH61ESpuLnVqQs9pfNIUGsdZ9rHNJqiZPy42wnB/wsMbZxx0/rQOw/8KxK6aXtNnj+x6bPYclGPf/e8iEZ0ZBJm192YP9O0NTX1xLZXCsmVHzWapNBDujmCBWMktXR0y8JFPQVT/Cd5VfjmPUKt6MIrdv9eDg6AoZLDBe148XfhQiJLVahIARDbLl56RQD/5T06pj6RcFOAPVLouGfXTApznQ26X5roY8PW52kVp4ce1i//uLrYR97g==
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id er13-20020a056402448d00b005607825b11bsm4968098edb.12.2024.02.14.13.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:36:30 -0800 (PST)
Date: Wed, 14 Feb 2024 23:36:29 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 3/4] spmi: pmic-arb: Make core resources acquiring
 a version operation
Message-ID: <Zc0yXR/fC2OcObLB@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_133633_252793_F6439608 
X-CRM114-Status: GOOD (  23.69  )
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

On 24-02-14 22:18:33, Konrad Dybcio wrote:
> On 14.02.2024 22:13, Abel Vesa wrote:
> > Rather than setting up the core, obsrv and chnls in probe by using
> > version specific conditionals, add a dedicated "get_core_resources"
> > version specific op and move the acquiring in there.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> >  1 file changed, 78 insertions(+), 33 deletions(-)
> > 
> > diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> > index 23939c0d225f..489556467a4c 100644
> > --- a/drivers/spmi/spmi-pmic-arb.c
> > +++ b/drivers/spmi/spmi-pmic-arb.c
> > @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> >   */
> >  struct pmic_arb_ver_ops {
> >  	const char *ver_str;
> > +	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> >  	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> >  	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> >  	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
> > @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> >  	return 0;
> >  }
> >  
> > +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> > +					  void __iomem *core)
> > +{
> > +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > +
> > +	pmic_arb->wr_base = core;
> > +	pmic_arb->rd_base = core;
> > +
> > +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> > +
> > +	return 0;
> > +}
> > +
> >  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> >  {
> >  	u32 *mapping_table;
> > @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> >  	return apid;
> >  }
> >  
> > +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> > +{
> > +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> > +	struct device *dev = &pdev->dev;
> > +	struct resource *res;
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> 
> It's no longer indented to deep, no need to keep such aggressive wrapping
> 

The pmic_arb_get_obsrvr_chnls_v2 is used by both:
pmic_arb_get_core_resources_v2
pmic_arb_get_core_resources_v7

> > +					   "obsrvr");
> > +	pmic_arb->rd_base = devm_ioremap(dev, res->start,
> > +					 resource_size(res));
> > +	if (IS_ERR(pmic_arb->rd_base))
> > +		return PTR_ERR(pmic_arb->rd_base);
> > +
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> > +					   "chnls");
> > +	pmic_arb->wr_base = devm_ioremap(dev, res->start,
> > +					 resource_size(res));
> > +	if (IS_ERR(pmic_arb->wr_base))
> > +		return PTR_ERR(pmic_arb->wr_base);
> 
> Could probably make it "devm_platform_get_and_ioremap_resource "

The reason this needs to stay as is is because of reason explained by
the following comment found in probe:

/*                                                                           
 * Please don't replace this with devm_platform_ioremap_resource() or        
 * devm_ioremap_resource().  These both result in a call to                  
 * devm_request_mem_region() which prevents multiple mappings of this        
 * register address range.  SoCs with PMIC arbiter v7 may define two         
 * arbiter devices, for the two physical SPMI interfaces, which  share       
 * some register address ranges (i.e. "core", "obsrvr", and "chnls").        
 * Ensure that both devices probe successfully by calling devm_ioremap()     
 * which does not result in a devm_request_mem_region() call.                
 */                                                                          

Even though, AFAICT, there is no platform that adds a second node for
the second bus, currently, in mainline, we should probably allow the
"legacy" approach to still work.

> 
> Konrad

