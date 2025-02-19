Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD45C021AB
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2025 05:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=; b=RiEXy27Xb9qHnj8msu23l+EOpj
	HAFRIsG2yT3LNJsALVI9x/eHihg+XSVuo/7jGUGgikUVffKFaY33sFvH2sYSRdzUzc6Obfl+U1DVh
	8+ZemSYuQIXizKavSoTIzKEmzAcmiIFuJfp17FRlXeSi3fZZ/W7UcqwZMnfYl51OMZxTNb9b7c8uT
	0PAPw7HzmpURmm+GSruKYZM5Ge4zBDEPWDJww9HZMR3ShKsKcapS1J6OWMBKQWK6tYwAFITi2vaNh
	J+LOstqPPsiEGG33Hks4BmeUImGEXR2fBTpez6+thKxsCLCiGsWrSBYDr1OHvzsexum+Swdzi7gAG
	SgWErW+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkczQ-0000000AxKb-0SS5;
	Wed, 19 Feb 2025 05:51:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcxv-0000000Ax7P-3x1g
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Feb 2025 05:49:50 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-221206dbd7eso55169665ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Feb 2025 21:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739944187; x=1740548987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=;
        b=Z0ZH5GCBfb0iSixroAL8TZotC5Mqq4rG07SZf8Sy2PRFTpXKun+Ft8AxgoUTpTOiz5
         /EQB9YKENDHp7icH1VquW2mToBvXc8AZDI++jO1nnYDWRXBdcpMbh4fW4J4zq1qcE1L/
         xdf672FmX6/ZMqfM8rOubrdEn/scfLsRw+gRQxuh90agRAgWxBjTKlCPsyYZlqcX7eR8
         PGJXw7NwAggWQzFRfqEdjCRkvBKs6Bt+JQmmpgsRs5QUQxDgPjgOclfxTADc3OcaW/UE
         gSaPzdhkXTBvJ+N9QPOmR/aA7S6M7Df6siulfM/iwg0ixvnmdZMjJxNFAymlXbIe7pxb
         YnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739944187; x=1740548987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=;
        b=V1FMfuHIRpYuc33cPDpuQTFQY1mvDbsV/EZYZcYVfRyj7xE6bU1yQxcTpDjwjAl4ND
         AnXqmWx0wxjkkMCJ7y9OrsK4PE54sY+2HAxdlN2j+kGdJDxL4NAZWfJf/ygeMb4C+UQ3
         9lfBAmhie3jx+CvJ94fIyK7L55qOIH/Q6MOuVNE/SQ4Kjy9OtTuDMvyhO0e1bMv0FQPl
         ipFoyqzqJj21NKqw04TGYxpjqSY6u4dANygteZeg1p414njavk6zkk4JK/OXo4KXtTOd
         XQ6t42+TOH6n1gK/xllDDN8Lxf8nlSLOm4fX5anf2taCWLMc0SL+EFk1IAGLGFGQ/DV/
         7P+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUVLCBPnblpC2bGM4cWZsOArCpRxCBsiONoNnY5ZqkRddzQr3FPCHdyLVPXpiO/1nmk250rgYYJ5gw80/k3Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtCe/4Hf1BgK2PesdOh62gZjQ3r4glzkH/BCRSx0gcvjzXTBS/
	Dg4MHQNJAstpiCAiCHBccBCoE9PpDphS/WDOtdfYupleehkASwm+W6ehti+TP1s=
X-Gm-Gg: ASbGncuzUq46R5KlZ/qoC74mjMawbZcdicZ279dp+rMl5cGGgKSeLZD8f10u7lc6Qin
	qLoyVdAR3azZG/vFcSOAI21Pt5T+nfioO1T9oN/t1qlyu90YVevBvjBrrEvm/RUjkLdA3qe0MuO
	R0VqV+6ie2seuM+2mFVwMIiVqCydBHYfne5PhB2u361iBZKD825+sxmEl2NPXEcsT7vQHPMO7lw
	4dOOHToNmUZ+l3EE7vPZkIuJc9g3DOHSI+ypLqxg7MLD1lr2MTN1goaW+T/v1axcOb6Mp/FF+Os
	8nAmFD/KXU1umBs39g==
X-Google-Smtp-Source: AGHT+IGTrwUiHai/F6Gc6jLbRLvEYwLeRI5NCdNzX1yb+2FEyc1a3QDq5aXdiTbSDtTZsAlf5lbhwQ==
X-Received: by 2002:a05:6a20:b58b:b0:1ee:8bd5:81c4 with SMTP id adf61e73a8af0-1eed4fb2d4bmr3091062637.28.1739944187132;
        Tue, 18 Feb 2025 21:49:47 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73274399467sm5972331b3a.140.2025.02.18.21.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:49:46 -0800 (PST)
Date: Wed, 19 Feb 2025 11:19:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 3/3] cpufreq: mediatek: data safety protect
Message-ID: <20250219054944.4kztb6rtumdt3x7h@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-4-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-4-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214947_981025_52FED82C 
X-CRM114-Status: GOOD (  11.90  )
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

On 14-02-25, 15:43, Mark Tseng wrote:
> get policy data in global lock session avoid get wrong data.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

I think there is some confusion on why exactly locking is required and where
exactly you need it. This patch is incorrect.

If you really think some locking issue is present here, please explain in
detail how a race can happen between different threads.

-- 
viresh

