Return-Path: <SRS0=YoiY=QG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45F28C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 11:53:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0139761212
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Nov 2021 11:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0139761212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADCbRI3WZDtSnM7QTw6E6NnR9+YNqXEbJLRvnlcEd0g=; b=x1BzLU3szTJ3XU
	TVPM4Skk6j8JmAgTLXrrwFVCUF7woNHQfRa7f4X122mcwetBfJ6qSvOt/Qk3ugfrbmfN1kPjkW1tg
	Y5eH72CSERCFc4wCWGi5oOI3fxA19COlVI+aBPt/A4AN7IPgyXjfIASsckzoQR+c3ztRr7VIh19wL
	/AvNUAIRtd1uwdyLjsBnQs4hv1AEOIyZAh/iQfM1dphdj1o/mihr760gXEKXbF/H+9HigsRotW13N
	mClCLgC+G0Nso1k8lGXhGCreGZh8VdtjNeysYxB+et4EBeiFhy1xdS9/fBLOwXDg2xh3AYSwFFQTW
	PCfOF+NuPDnwhDSl9jzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo2Sc-00AJWc-50; Fri, 19 Nov 2021 11:53:42 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo2Sa-00AJVL-0N; Fri, 19 Nov 2021 11:53:41 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r8so17680606wra.7;
 Fri, 19 Nov 2021 03:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=oR+4Ugm243EsWWYHBT9vURlenDoMi3/hy1iFqPAmvS8=;
 b=MGFOlH5IHYuiXtFmz2gc83iHKFHpx65rDT3iE3Ev6o0WJLcVUFPTCKTYHs7zIyGVyD
 SYwRnT/xAz30tntNWlTpUqyk3fCV3NjHRNeGfyjTKE19U2h0+SJc7P3/juMRK0Ha+G0m
 tWGfZTsAMOVRUoOLZVw8I/lrvVrgUTEOd28DIN8V/3l/bslPYWIanKSb7np+IBr4X/eG
 PywaeRinsQXYpwHfazA1K4wXFdeeDG1AyeVG0W2Czaj/I+kwZLWeUNd2kba/HRm4ksK6
 NXbAwCqyP1mueldg83SzVgG/csreiw5GfX58FAKq7y4zTvuI29u1R3TK8GxHfoeVbwOV
 NxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oR+4Ugm243EsWWYHBT9vURlenDoMi3/hy1iFqPAmvS8=;
 b=YzALfPdfqRjwh/xhuMEKooESLNtKXI+0WGWJNZQv1dSHSRzon2Lo1f2pptBRmDLCXF
 IkowQiduzisR1M1VsSdlWkEH7KZ+Ck6b8Lht2ZxLvCm9RjAfDgoKV2ObTRXs4PBH18vs
 JECLkblcl/sFwUzApxGh4FOOcRueZpOd9PZSlSIkE01eaUaNOaWZH8fSLz9QCTCLjq+1
 1n/VVe/n/UD8wUKnv4DOcS4wHHxtwi5Iyk3lvBd5cb1kxTenz9uYSPOQC1NacBWMwrX8
 WTMBwe3tRxfJBIQh1H4zdeuuC3z0PhMYQs53oCkQvLRv5+2KbKLuO3lDTZPzvhcTqsiE
 /CDA==
X-Gm-Message-State: AOAM530MZ6MvzF/lF38g6QNPxPgEO/fhYPwtYQ69BHzSTZ1tMWvZ7GzE
 j4TkgLYObZWnfcs/Zs3tIwc=
X-Google-Smtp-Source: ABdhPJzQsLrtW0In3DEbR+IjqSiaaiOSFxUzGF2EBp+WZZTiEtq1c8MEOsgteKa0jy7YjN4CA3+d5w==
X-Received: by 2002:a05:6000:252:: with SMTP id
 m18mr6536146wrz.117.1637322817365; 
 Fri, 19 Nov 2021 03:53:37 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id v15sm2747012wro.35.2021.11.19.03.53.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 03:53:36 -0800 (PST)
Message-ID: <4dd739b0-bed7-d932-d56c-96b20143ee79@gmail.com>
Date: Fri, 19 Nov 2021 12:53:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] clk/mediatek: fix missing null-check for mt7622
Content-Language: en-US
To: Chengfeng Ye <cyeaa@connect.ust.hk>, mturquette@baylibre.com,
 sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20211030140740.6947-1-cyeaa@connect.ust.hk>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211030140740.6947-1-cyeaa@connect.ust.hk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_035340_110650_35B9FC17 
X-CRM114-Status: GOOD (  16.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/10/2021 16:07, Chengfeng Ye wrote:
> The return pointer of mtk_alloc_clk_data could
> be null, adding null check for all the call sites.
> 
> Signed-off-by: Chengfeng Ye <cyeaa@connect.ust.hk>

This pattern is seen in nearly all MediaTek clock drivers. Is there any specific 
reason that you only fix the three?

Would you mind to check all of them and send the patches as a series instead of 
every patch one by one?

Regards,
Matthias

> ---
>   drivers/clk/mediatek/clk-mt7622.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7622.c b/drivers/clk/mediatek/clk-mt7622.c
> index ef5947e15c75..f16b3655ff76 100644
> --- a/drivers/clk/mediatek/clk-mt7622.c
> +++ b/drivers/clk/mediatek/clk-mt7622.c
> @@ -620,6 +620,8 @@ static int mtk_topckgen_init(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
>   
>   	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks),
>   				    clk_data);
> @@ -650,6 +652,8 @@ static int mtk_infrasys_init(struct platform_device *pdev)
>   	int r;
>   
>   	clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
>   
>   	mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
>   			       clk_data);
> @@ -700,6 +704,8 @@ static int mtk_pericfg_init(struct platform_device *pdev)
>   		return PTR_ERR(base);
>   
>   	clk_data = mtk_alloc_clk_data(CLK_PERI_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
>   
>   	mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks),
>   			       clk_data);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
