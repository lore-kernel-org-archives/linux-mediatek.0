Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E57CF9C6B
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=; b=cSm43DzqJ+mSziS0Oj+893UiBu
	SRTsj5LxfNY8QlD4Q7cjs6Sw4t1iw7OsTDZVd5uuJ/Nma+HsCkf7AfnHQQy+IsIFzogqm2r1Oo9Y9
	4nsFiRoJit+Cl4uRmQviBGu35DNfwJxl+0F02n88wf6n+A+b/04heIRMMVuSYcrvlAoZenrskwnPK
	FLEjy7XO5CFejAfpo5U9izsyOJXc2grNHaG/iANwlAlXMKI/5XLPCzYz/X2IvljquMvHD1/o5Bhh1
	6xFTmmmYZ0Mc6KhKYTarc/O9/qDXDfSGzGtfseqfNeCG4/cmJEez2ObdDVSPq8I2Rw09+Q6WXOq03
	ArFqNbJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st6fm-00000002Z7b-37AV;
	Tue, 24 Sep 2024 14:37:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st6ec-00000002YxX-2Br3
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 14:36:39 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so53977815e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Sep 2024 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727188596; x=1727793396; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=DjC+rNNueHNmpKJlAAUkGt/Y8ZvzVIP4Wz60jsOpkdfoRPHeduP7K/ZD+NtaF865Fm
         H1p94r0RtFbXIIuKwyt7AjXn+vqpXvarHReo6klI9OD8ruFYuIxN4khxf9xKuPFbDp6X
         l3O3zqcYGreFGplpx3lRI48yjeZvzxABgxZ1XZD/vB6jgJQ8QH9dIoUAO3KC7iH++1EW
         nrjaRBwRzlNngx7ZRDUA3DR3cBz4GKENwTiRhMJCz/DlHHYyy4pKT0e4jmnzLLjygpho
         gXzfaKS6eiTN5nMolCKvLrFi1aP9+RyojFe6pXnyrHYMnTVaS36gm7m0/TSYGZ59ORGC
         Cn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727188596; x=1727793396;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsQoCD7nt+kXzq9WRw11BBd3dSUqlfD/BOkGLN3L+0I=;
        b=XDZdW88KL4tyjtJ9aQi5JNfDmwIehayzIYIjykWCL3nS5wHgOcKaYaFbtiYwUCZiIg
         SAYd7I1WWY43sZc682vKSqykwjCYNS7YPeUzINT2ztF2RpfoRqwvFwqblKpgyb+bhjNg
         OPoyS0Hjj1VmXqAZrvczPwkKZVvKYWj+Dh53IOxcZhPZO6ELSVypOiC5duR43xeRXcIc
         /cKdtq/l8PaE0wTqn4DyxL6hEi2NsuAM0/QuqZF2iCqyRcGzYK3lAn9d7da2BK/gldvK
         yAQAUWBmpgHT/d9dkYN7iILvNHFU9VepAQOmSXS62F46FlU6BwuiabJY/YBt5kPgTdhK
         QVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkudCxf/BEWhcfeRaGUGAdFHKGhGrYqUU4bl7UDnOeoVm25RHb3ZZ2XSzZdCtF3uSib8HW7myCNEI3waPmMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw00Uyia29W+Hhajc1bfAqVQVAyftNSZBKtQ+iTwMUx612M9zHp
	+wORimAgM242vwxYC2w6sT/ueXcWNYbikMZhwymvJhn9iK/fv8NUSZeZ9WHmcg==
X-Google-Smtp-Source: AGHT+IFN85rvCU/A9zmRJhSH2USWFhIw9IW1vh5sN+JWuThrPkD39MtliW2jnnO6qPRDmIjAZMG5dA==
X-Received: by 2002:a05:6000:151:b0:374:b71f:72c0 with SMTP id ffacd0b85a97d-37a4227805bmr9321610f8f.21.1727188596428;
        Tue, 24 Sep 2024 07:36:36 -0700 (PDT)
Received: from thinkpad ([62.67.186.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc3187a4sm1763135f8f.90.2024.09.24.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 07:36:35 -0700 (PDT)
Date: Tue, 24 Sep 2024 16:36:34 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, kernel@collabora.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] Provide devm_clk_bulk_get_all_enabled() helper
Message-ID: <20240924143634.pqpdsewoqxn3liqi@thinkpad>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_073638_568655_DD172D13 
X-CRM114-Status: GOOD (  21.93  )
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

On Sat, Sep 14, 2024 at 09:04:53PM +0300, Cristian Ciocaltea wrote:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.
> 
> That is required in case there is a need to iterate these clocks later,
> therefore I couldn't see any use case of this parameter and should have
> been simply removed from the function declaration.
> 

Is there an user that currerntly does this?

- Mani

> The first patch in the series provides devm_clk_bulk_get_all_enabled()
> variant, which is consistent with devm_clk_bulk_get_all() in terms of
> the returned value:
> 
>  > 0 if one or more clocks have been stored
>  = 0 if there are no clocks
>  < 0 if an error occurred
> 
> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> the past form of 'enable'.
> 
> The next two patches switch existing users of devm_clk_get_enable() to
> the new helper - there were only two, as of next-20240913.
> 
> The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> helper.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Cristian Ciocaltea (4):
>       clk: Provide devm_clk_bulk_get_all_enabled() helper
>       soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
>       PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
>       clk: Drop obsolete devm_clk_bulk_get_all_enable() helper
> 
>  drivers/clk/clk-devres.c                | 30 ++++++++++++++++--------------
>  drivers/pci/controller/dwc/pci-exynos.c |  2 +-
>  drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
>  include/linux/clk.h                     | 12 +++++++-----
>  4 files changed, 26 insertions(+), 22 deletions(-)
> ---
> base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf
> 

-- 
மணிவண்ணன் சதாசிவம்

