Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B94C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 09:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5KcKTaCQn4pBwWr+P+bPuhSGEvM0dqpC2FO7BYBz7I=; b=Px9qJRgCNRSZ7utl4npT2xuL53
	OezJCkLL1AkKsRqZfq1tIIZgbw/y1U4GuFWY7exAAEeHiyW7z52XOVdK2YYlJvJG8cCPPqhlcJzcI
	f+IvZbY4sBFz1eDIe5/PYGliYWjUeUKzP0O9JQ/AccOxQEwd6avySXQCtIXA/dILhfqObwqnZLsxi
	61UoLdFYTIPb+zaPac1avHAztg8rol5G6FKnIHNnXTa8vQ8j4EEzJwtYeRhjZmnfyEK+oH7zVkA4P
	xrsiyiiYcC3ptR31KrrEgWq8z4AJxYk9R3zJ5tPu0eLjHfGqLgVwBzf2VsC4Z1aXvzYJjgfeyDqCN
	sJDiZPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY19-0000000FZAK-2mA5;
	Thu, 15 Feb 2024 09:26:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raY17-0000000FZ8k-40BS
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 09:26:55 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a2a17f3217aso75307766b.2
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Feb 2024 01:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707989211; x=1708594011; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w5KcKTaCQn4pBwWr+P+bPuhSGEvM0dqpC2FO7BYBz7I=;
        b=dQxRS3qY5dlK1H07kZ7aHA55/iU4YlVGMixAqiOui7LbKE5T3oqmLaQgo0TnMQIA0N
         vx5KeImpEbEYImXNYbi2dWk3ORQLmVybJN4/svPpNeNbSjM6Fp2Mu2TQEWylOn6ag7cd
         bhd9U3I6MQ4Ou0CtiSUGII18K8NVb0IJ1+U7PNgNTo5Obgbk/m84BvcIq2GsllkzcasG
         7u/JEQRdvU30/Sd0UN95/eJUMoRn82dSZZi774NGd0WKYJNdiF9zkis4rCi8Ui7HskRL
         nymlqnANrQoK6nNuaL0OXw1gwWc7/4fnLpnVgjMcQ2e4wJbh1YEyZ9a9ecRrDr28jzzi
         +0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707989211; x=1708594011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5KcKTaCQn4pBwWr+P+bPuhSGEvM0dqpC2FO7BYBz7I=;
        b=gfsvYFfgansOhenCbcExccSjbNRnHnQs3Z1lEFjeh8DnQ4ZHr4NAugewKnhwejpFuM
         WTS+9xvWKHagu1eXf82fF7EVSIJ3aQJjHCHEQ62FLx9qiauiIMqZxKPXryCQbgTw8jzK
         kPaQcDQ8YWZJUtX66O3FEPw1QiqBfPJnl/tUAbuJEIfX/DVydHWUcYYtJMMCO6nQs/cG
         qtSDAkZBxG+IZSzEJfHLXeTACe3+eCdS9gjiWbXv92qXLKuCRiTcQIrHsh9ARDDMRBKF
         G9tM38AaKYBZWH5Z023m3PMWSIZjCsHN/VfWI5yDRYPOhrN5QAj+ELaUyeFFg/uPCDzV
         dObQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNKrq6zfTGHypS19huZ0zRcAeO+cTBc9eWwZGcJi/nWx5q80bZMrkj5EsMPQjpQrj4Hwr4LtZNBnNQ1E8SSnpkvbwN1FyUe1BmFREaKFW1bmFy
X-Gm-Message-State: AOJu0YzpxZQGol8wvFlGRyikIxzvgXjbWLf7qhJ3YMMOLdta82Q/msf6
	1qAAzyjPiwOB7FxNnoAzbisUnvA8LzIG8ackfaP2lJgx6gj53WOn/TEPBOBM3nM=
X-Google-Smtp-Source: AGHT+IEoMFpPFkQ98MpNIYsjxXySN2OmKZ5WeYtjXYVrEAtCkS8teqIlHftZm4rd0q8pEldzBbNu4g==
X-Received: by 2002:a17:906:5f89:b0:a3d:5e44:83aa with SMTP id a9-20020a1709065f8900b00a3d5e4483aamr848262eju.20.1707989211294;
        Thu, 15 Feb 2024 01:26:51 -0800 (PST)
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id bq14-20020a170906d0ce00b00a3d2157e267sm360824ejb.11.2024.02.15.01.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 01:26:50 -0800 (PST)
Date: Thu, 15 Feb 2024 11:26:49 +0200
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
Message-ID: <Zc3Y2YmjZ1gYjmmq@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-3-0bae0ef04faf@linaro.org>
 <d9d8e86b-a499-49d1-90ad-6fae5b7dcbb7@linaro.org>
 <Zc0yXR/fC2OcObLB@linaro.org>
 <5e878fd9-8215-499d-ac1c-191cb5bfe798@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e878fd9-8215-499d-ac1c-191cb5bfe798@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_012654_023791_E3C7041E 
X-CRM114-Status: GOOD (  28.44  )
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

On 24-02-14 22:44:55, Konrad Dybcio wrote:
> On 14.02.2024 22:36, Abel Vesa wrote:
> > On 24-02-14 22:18:33, Konrad Dybcio wrote:
> >> On 14.02.2024 22:13, Abel Vesa wrote:
> >>> Rather than setting up the core, obsrv and chnls in probe by using
> >>> version specific conditionals, add a dedicated "get_core_resources"
> >>> version specific op and move the acquiring in there.
> >>>
> >>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> >>> ---
> >>>  drivers/spmi/spmi-pmic-arb.c | 111 ++++++++++++++++++++++++++++++-------------
> >>>  1 file changed, 78 insertions(+), 33 deletions(-)
> >>>
> >>> diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
> >>> index 23939c0d225f..489556467a4c 100644
> >>> --- a/drivers/spmi/spmi-pmic-arb.c
> >>> +++ b/drivers/spmi/spmi-pmic-arb.c
> >>> @@ -203,6 +203,7 @@ struct spmi_pmic_arb {
> >>>   */
> >>>  struct pmic_arb_ver_ops {
> >>>  	const char *ver_str;
> >>> +	int (*get_core_resources)(struct platform_device *pdev, void __iomem *core);
> >>>  	int (*init_apid)(struct spmi_pmic_arb *pmic_arb, int index);
> >>>  	int (*ppid_to_apid)(struct spmi_pmic_arb *pmic_arb, u16 ppid);
> >>>  	/* spmi commands (read_cmd, write_cmd, cmd) functionality */
> >>> @@ -956,6 +957,19 @@ static int pmic_arb_init_apid_min_max(struct spmi_pmic_arb *pmic_arb)
> >>>  	return 0;
> >>>  }
> >>>  
> >>> +static int pmic_arb_get_core_resources_v1(struct platform_device *pdev,
> >>> +					  void __iomem *core)
> >>> +{
> >>> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> >>> +
> >>> +	pmic_arb->wr_base = core;
> >>> +	pmic_arb->rd_base = core;
> >>> +
> >>> +	pmic_arb->max_periphs = PMIC_ARB_MAX_PERIPHS;
> >>> +
> >>> +	return 0;
> >>> +}
> >>> +
> >>>  static int pmic_arb_init_apid_v1(struct spmi_pmic_arb *pmic_arb, int index)
> >>>  {
> >>>  	u32 *mapping_table;
> >>> @@ -1063,6 +1077,41 @@ static u16 pmic_arb_find_apid(struct spmi_pmic_arb *pmic_arb, u16 ppid)
> >>>  	return apid;
> >>>  }
> >>>  
> >>> +static int pmic_arb_get_obsrvr_chnls_v2(struct platform_device *pdev)
> >>> +{
> >>> +	struct spmi_pmic_arb *pmic_arb = platform_get_drvdata(pdev);
> >>> +	struct device *dev = &pdev->dev;
> >>> +	struct resource *res;
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >>
> >> It's no longer indented to deep, no need to keep such aggressive wrapping
> >>
> > 
> > The pmic_arb_get_obsrvr_chnls_v2 is used by both:
> > pmic_arb_get_core_resources_v2
> > pmic_arb_get_core_resources_v7
> 
> I meant line wrapping

Oh, ok. Will do.

> 
> > 
> >>> +					   "obsrvr");
> >>> +	pmic_arb->rd_base = devm_ioremap(dev, res->start,
> >>> +					 resource_size(res));
> >>> +	if (IS_ERR(pmic_arb->rd_base))
> >>> +		return PTR_ERR(pmic_arb->rd_base);
> >>> +
> >>> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
> >>> +					   "chnls");
> >>> +	pmic_arb->wr_base = devm_ioremap(dev, res->start,
> >>> +					 resource_size(res));
> >>> +	if (IS_ERR(pmic_arb->wr_base))
> >>> +		return PTR_ERR(pmic_arb->wr_base);
> >>
> >> Could probably make it "devm_platform_get_and_ioremap_resource "
> > 
> > The reason this needs to stay as is is because of reason explained by
> > the following comment found in probe:
> > 
> > /*                                                                           
> >  * Please don't replace this with devm_platform_ioremap_resource() or        
> >  * devm_ioremap_resource().  These both result in a call to                  
> >  * devm_request_mem_region() which prevents multiple mappings of this        
> >  * register address range.  SoCs with PMIC arbiter v7 may define two         
> >  * arbiter devices, for the two physical SPMI interfaces, which  share       
> >  * some register address ranges (i.e. "core", "obsrvr", and "chnls").        
> >  * Ensure that both devices probe successfully by calling devm_ioremap()     
> >  * which does not result in a devm_request_mem_region() call.                
> >  */                                                                          
> > 
> > Even though, AFAICT, there is no platform that adds a second node for
> > the second bus, currently, in mainline, we should probably allow the
> > "legacy" approach to still work.
> 
> OK right, let's keep it.
> 
> Konrad

