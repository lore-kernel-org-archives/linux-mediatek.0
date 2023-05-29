Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4A5C7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jmuun/VWT+neP2DA7RKfwQ89UBcOBnCQ2W3RabGpYlk=; b=Pgi2lwP8ZlEzM/GKAcGYX75lxS
	7hmbPwTu/sb40wM31y7/e8m7a4asP7sBETRuq9rYBfaOn0HO4WEeWnpU7YB9XyQ3DafXE403TwRgE
	Sm9xVhy3ggj3fGGJJ892qiDc15pTircFhv/HD2sGF7BGe+IZLFYsL0dsHGf19B14WeJ1j3AojS0qZ
	aP/gTE9f1dam7PKn4gJog+mi8rLGJ4GkpEDRfVigdPL7/sG+oqB077fM0tiRHCnMb2JltRE0arqy/
	7BRFD7Oh6H0sQTjvkd12+zd5zORHEvIcWzuUEj8YAvVSwyDDgjSx9TUiZIRpFVq5V6JnY6RB2bkHc
	XHn3rcTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ep6-00Aw5m-0P;
	Mon, 29 May 2023 15:30:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dqp-00AluH-1B;
	Mon, 29 May 2023 14:28:00 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d4e4598f0so3830484b3a.2;
        Mon, 29 May 2023 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685370478; x=1687962478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jmuun/VWT+neP2DA7RKfwQ89UBcOBnCQ2W3RabGpYlk=;
        b=sShWWNQl21iKyy6VI0j8on90ULIeyVnlk1w3zQwvz7MOJzRfMW5cp5G4uijrcrxEY0
         6C8sKU2Qfzpb3GFSngykxKOa8CLHryobEhZ4eZzXiRyC6Mi6eNG+Ax7UhTl/oFRANKgy
         epWdGu5xe1F27+rkJh6DJVBn/p25g2l+3p2r93rbc1YY4HC3W01v4hxU7WuxvqpT6LG4
         PUHfudkGsFaeQKBlCUt4NFIzNEyPMCdPcl4l23AZfQDQQxkj9r6jE+NS8HFqE6uxkeMt
         ZPUXaQTJOTsgiF+Cb4BrdFDtGUGzPcZHQEna70vWf3MG27npVY5Gzq4OaeMWBPR8Es1Y
         4oQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685370478; x=1687962478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jmuun/VWT+neP2DA7RKfwQ89UBcOBnCQ2W3RabGpYlk=;
        b=JDRgTtcxPPYl6bgckctuOea1fpxtVSBZMExnwG/5mCkQP+t6ZMU7gpZEIBsBq1L2M2
         XsYaW6iDur3AbXdVf9evtUvadCosav/97jyDNM2vl+DoBI51xxLU49+2mMjmRD35OouI
         KxtXY0PXCjQsWD+rKqQG70qeSO7JIa65DAla82yy+cxXRt8Wkm2vMXTw+Z8ZZ8ESP5S3
         2oB9Vs+WSWbF+4W8RJDus7GLAmQj8suFYFNfJAKp7YB8vf/CwkIbTLtZ7ApyFE9AkXBa
         cm4fX6XCyZNCS0pFE5fYn9bxnp+WYQ0JZRIQbI0VzrB7iK3OuPgyTyZpZucqhclOvX29
         k78g==
X-Gm-Message-State: AC+VfDyAxlFTs3pAWXXe+oJJ02AXQPG5kQAOmb7Y0tmweZa226BcHrZq
	IsQrNeaQ57cOQf+qVOyX0I4=
X-Google-Smtp-Source: ACHHUZ4m+1SBfexp2uuaKCxUBhxnxFcc8rr2wUBHwXHwRK+R4InktUg565WydQIQVbv++T185v9wPw==
X-Received: by 2002:a05:6a00:228f:b0:63d:368b:76b4 with SMTP id f15-20020a056a00228f00b0063d368b76b4mr16718661pfe.17.1685370477720;
        Mon, 29 May 2023 07:27:57 -0700 (PDT)
Received: from [172.30.1.35] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7818a000000b0064f97ff4506sm36358pfi.68.2023.05.29.07.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 07:27:57 -0700 (PDT)
Message-ID: <eba06c01-e2bb-f715-8b2e-9c489e7c06d3@gmail.com>
Date: Mon, 29 May 2023 23:27:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH5b51a54ae2fa1cc8459b68a28b3c8ca7b7203994] PM / devfreq:
 mtk-cci: Fix variable deferencing before NULL check
Content-Language: en-US
To: Sukrut Bellary <sukrut.bellary@linux.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20230518084033.508711-1-sukrut.bellary@linux.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
In-Reply-To: <20230518084033.508711-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_072759_405420_92C34D63 
X-CRM114-Status: GOOD (  17.00  )
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

On 23. 5. 18. 17:40, Sukrut Bellary wrote:
> smatch warning:
> drivers/devfreq/mtk-cci-devfreq.c:135 mtk_ccifreq_target()
> warn: variable dereferenced before check 'drv' (see line 130)
> 
> This is based on static analysis only. Compilation tested.
> 
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
>  drivers/devfreq/mtk-cci-devfreq.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/mtk-cci-devfreq.c b/drivers/devfreq/mtk-cci-devfreq.c
> index e5458ada5197..6354622eda65 100644
> --- a/drivers/devfreq/mtk-cci-devfreq.c
> +++ b/drivers/devfreq/mtk-cci-devfreq.c
> @@ -127,7 +127,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
>  			      u32 flags)
>  {
>  	struct mtk_ccifreq_drv *drv = dev_get_drvdata(dev);
> -	struct clk *cci_pll = clk_get_parent(drv->cci_clk);
> +	struct clk *cci_pll;
>  	struct dev_pm_opp *opp;
>  	unsigned long opp_rate;
>  	int voltage, pre_voltage, inter_voltage, target_voltage, ret;
> @@ -139,6 +139,7 @@ static int mtk_ccifreq_target(struct device *dev, unsigned long *freq,
>  		return 0;
>  
>  	inter_voltage = drv->inter_voltage;
> +	cci_pll = clk_get_parent(drv->cci_clk);
>  
>  	opp_rate = *freq;
>  	opp = devfreq_recommended_opp(dev, &opp_rate, 1);

Applied it. Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi


