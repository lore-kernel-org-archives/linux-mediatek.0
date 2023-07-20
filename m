Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CEBEB64DD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pX/Ty9NAcT9bYpPnRuDBO1Tp6SxCU3ljG9XRMY4bllE=; b=3vRwgrkqdjYwL3sa/+hyjxf4zj
	8q88mUwWZkQb7920AmDQcJAD7MvDbPrN/sEKlOVXltTp7mOEefF+HIFGLmC6g8hNpon6CxhrPzKfr
	ZZmYpL4dIhgFsZQUIxjVH3WqbDVLDpnVWys+h/NH3mngS8fyxXv3lcpVVu3aosG74TN0Y236II4qQ
	SwGmvjiHQHtFoTLIcvUBiFKM8pPnZo08Ki6If3oO3kjkCZryOd72oIHfEGAxJfjQAslQWTPZymcQP
	f4pw6/BnYDJW+WCMVAKg9R5xYuMEJ7Pq5eVGm3E/d9vjzv4P7lNNc2wFmz5wflzGCKkfeBABoi3DK
	ZEmIL5OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQw0-00AprX-1A;
	Thu, 20 Jul 2023 10:31:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQvx-00ApnQ-1A
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 10:30:58 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-666eb03457cso366591b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 03:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689849054; x=1690453854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pX/Ty9NAcT9bYpPnRuDBO1Tp6SxCU3ljG9XRMY4bllE=;
        b=YEjHygSXionVn78E3LIw9gY7VVbzoifbq/0xL4Hy8vefi+FIpQ/OrhbweiqbVZGW2t
         a/Mk5zS1jQUvlYWJQNzdQVBXR2kp29aBK5Cv0JMhaSDLSoRkZcMiEyUixP9M3bo7RTdT
         rVW633peGDgCzxJM7AGqjl6c13L5dRfNlenfMfRkoBeaKK/v59do4NNecBanveHVl0x2
         WesSQ715grtexLTfZQe4aGPs/PWbPzqnv177lvc9ENtemsZkWkTUBgE/iB+806lMu8NI
         Ad6FCd1eCaAgrUHr6GjtDkXJvxdbAXd4jyeV13pPEjL7cNtD3eI6lJprClc7LTszVzhp
         iPiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689849054; x=1690453854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX/Ty9NAcT9bYpPnRuDBO1Tp6SxCU3ljG9XRMY4bllE=;
        b=KBayBfymRj1Nfim1suDH3Oy4Wy/X1Xr52lmdmce/qWVOHYnaemKwarsXEUOhL18pGZ
         kJa2/MGDOQa30v063xYtlWoTdudbNYOmMDjTPyWDx1Od+LdgU+e9Rl6D+Fff33hfihgQ
         nOmM0z7bTs4iUHFOSRJt2FQBNLfbGOAy+Sdhz+UsLKcv4vsTMLP7OJl+5RZqDDSjC2kK
         p6lcO6OrFzyF5fwNaXEa+gxprOpVUeVMawKxUvJOW41pTGx+JT0ixYS7rPMk3Sl7b8vL
         5MdIBbQtGrVCjuayahf5VAQpCZgoie8C2e5APX0GWaOUMA+zI/mnMGfgrSld/5N7e5rz
         mukQ==
X-Gm-Message-State: ABy/qLaGP7yWLOJt0s0hnNsw5KPcRnhXvTalZLkBYyEaXQn+BcYUbrbq
	I9hu9/YWrSjLGRRxxSk95uq6sg==
X-Google-Smtp-Source: APBJJlHQ3TBhJch4+9s7IdsXDe4mP52ispONeRhDFv3IHs7DNJoO/6dUpqV823L+edq5WpNkcQKRmA==
X-Received: by 2002:a05:6a20:54a4:b0:12c:e3c8:8c7 with SMTP id i36-20020a056a2054a400b0012ce3c808c7mr19779825pzk.41.1689849053763;
        Thu, 20 Jul 2023 03:30:53 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id m12-20020a170902768c00b001b8062c1db3sm977831pll.82.2023.07.20.03.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 03:30:52 -0700 (PDT)
Date: Thu, 20 Jul 2023 16:00:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ilia Lin <ilia.lin@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: Explicitly include correct DT includes
Message-ID: <20230720103050.325y6n2zqiv5k5ku@vireshk-i7>
References: <20230714174414.4054011-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174414.4054011-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_033057_465698_F6D57BD7 
X-CRM114-Status: GOOD (  12.16  )
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

On 14-07-23, 11:44, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/cpufreq/armada-37xx-cpufreq.c  | 4 +---
>  drivers/cpufreq/mediatek-cpufreq-hw.c  | 3 ++-
>  drivers/cpufreq/ppc_cbe_cpufreq.c      | 2 +-
>  drivers/cpufreq/ppc_cbe_cpufreq_pmi.c  | 1 -
>  drivers/cpufreq/qcom-cpufreq-nvmem.c   | 1 -
>  drivers/cpufreq/scpi-cpufreq.c         | 2 +-
>  drivers/cpufreq/sti-cpufreq.c          | 2 +-
>  drivers/cpufreq/ti-cpufreq.c           | 2 +-
>  drivers/cpufreq/vexpress-spc-cpufreq.c | 1 -
>  9 files changed, 7 insertions(+), 11 deletions(-)

Applied. Thanks.

-- 
viresh

