Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3A7C369A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ex1eFr4hS+ZGn1Z31JmBv4PhcgqRDO/Hbk8Px9C2Jek=; b=t6PeoxIWovBJfBh4Wjfz8FiyNv
	R04Qk5S1XjcQ0ReI11HyZzFAA+dTBgHnlgpNC8Kksac0urH1GapHEu78JELVsx3lkPrl7DkJe9Pzs
	XvpxRDxvOONs6pQ3kmKpB+Hf9HAX1fO93/9D7P76EJHbT0nLRV1G9KGGu2eXIghEYtb+NfbIZXwRY
	XluE0B8lIZgOBTcB7Zp/+KZTtPuAVgViDA5zgRL4+8ImD3SPme/6AggPmcUicUhMzT0eBq0K7i7no
	bpwpZA+JZpjEUZbDGDs4gMHcrXB8UhPcCE3Zg5yvWebaBkT3COoAeEj3i3fKD/QekyrgOgPTKlRp8
	MjjFyk1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stMyp-00000004R4i-26GE;
	Wed, 25 Sep 2024 08:02:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stMtO-00000004Pn7-0Dj4
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Sep 2024 07:56:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so3734714f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Sep 2024 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251016; x=1727855816; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ex1eFr4hS+ZGn1Z31JmBv4PhcgqRDO/Hbk8Px9C2Jek=;
        b=voPwJy3zCT3a+QIJSJxTlHl1vp44btcIL4lVqNFpVRDHSa9c3QB9wcGT/qnGDFtUDr
         eSG28NHmjswsAz61RYdj/fhxwVrJ6JfM5igkPU82Sg2qsO2l4sYPh05u0gjcm9Zo5sou
         4M9jaK3jpaPuRnL6YG3zGPYuMP+0RztqDWW8ntqreO+jG4o6ZEcBCNBg9iVcoKwIDcl/
         O5DhkC4K+D9nBJPk0a112Na1GbTWNKJJsKSPOVjdunAmWcK7hoBzsAvFndlZXOqEVylI
         2h71rGDBvpBOWl3LwI+aAvU5eq7yBXdSS8a48qZNIDHGpEpgTtkfleNGwdmYX83jlM1B
         ZhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251016; x=1727855816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex1eFr4hS+ZGn1Z31JmBv4PhcgqRDO/Hbk8Px9C2Jek=;
        b=oSlIBKvTzaH4NGbmbNGUeZ4pzgdsxY+ZOgux3+DW/4n4WfN/3cAyAHdk1/pVHrMtUt
         l+X8DmxGGWaJQewr/E3K2Zn69YOzCBO48+nq17qamz+iHbKjCYAws5nCs4mvcn3XovJe
         Ru8pB2eBNWaBAuBz5aW6lJZWQeMMiYTFBnF5ken+DvpCA0ihUMBrx9tPnbyludATd84g
         qIJ1NmlX3tPFCHvHqDeoslOl5aWU9ePVWbmoT7nubroFREq+Bt81sZJkb1qt36mP+txI
         Fbswdl37EntjsCurGfiFw+EGGsJJfOuw1BQZ7IagJ2Y/W59hBzir6/pFVuJt6jL+Flpu
         ADAg==
X-Forwarded-Encrypted: i=1; AJvYcCUITzJK2vnYUwxxJwtcZBCzf6FRydgZP3eI3cutfQAW2IJ8wPufc7sihvIarLbpsMkkz4t9MBdDc/X0FRqtqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJaooWgMrXYAWFUSXxqYphgPaP03+28/xEbPegl/Z7sfbrQuQR
	y8QxxCrinMXs78ycPleg9seZltPydFaAe9B35/Vkra0rLTDk6yQPLiUT7QcRGQ==
X-Google-Smtp-Source: AGHT+IF2WTBpi0WKM13oYD6g9v8s+vSbS1vZ7h85OwPzdWyievegW/qIqe69gYQpJLdHkgY2OvXiUQ==
X-Received: by 2002:a5d:64c9:0:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-37cc246b30emr1075354f8f.7.1727251016023;
        Wed, 25 Sep 2024 00:56:56 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e96a1682csm10166775e9.36.2024.09.25.00.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 00:56:55 -0700 (PDT)
Date: Wed, 25 Sep 2024 09:56:54 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
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
Message-ID: <20240925075654.f2pefosdspqiakvj@thinkpad>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
 <20240924143634.pqpdsewoqxn3liqi@thinkpad>
 <70a24964-990b-4606-bdc8-4dd42c44785a@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70a24964-990b-4606-bdc8-4dd42c44785a@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_005658_156177_7CFDE13D 
X-CRM114-Status: GOOD (  28.95  )
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

On Wed, Sep 25, 2024 at 09:52:44AM +0200, AngeloGioacchino Del Regno wrote:
> Il 24/09/24 16:36, Manivannan Sadhasivam ha scritto:
> > On Sat, Sep 14, 2024 at 09:04:53PM +0300, Cristian Ciocaltea wrote:
> > > Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> > > clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> > > return the number of clocks stored in the clk_bulk_data table referenced
> > > by the clks argument.
> > > 
> > > That is required in case there is a need to iterate these clocks later,
> > > therefore I couldn't see any use case of this parameter and should have
> > > been simply removed from the function declaration.
> > > 
> > 
> > Is there an user that currerntly does this?
> > 
> 
> Yes and the patch wasn't sent upstream yet, but anyway, regardless of that,
> this series is fixing inconsistency with both naming and usage between the
> clock (bulk) API functions, with that being the only function acting
> different from the others, at best confusing people.
> 

I agree with the 'inconsistency' part of the API, but I wouldn't call it as
*broken* as this series does. Please fix that and you can have my:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Cheers,
> Angelo
> 
> > - Mani
> > 
> > > The first patch in the series provides devm_clk_bulk_get_all_enabled()
> > > variant, which is consistent with devm_clk_bulk_get_all() in terms of
> > > the returned value:
> > > 
> > >   > 0 if one or more clocks have been stored
> > >   = 0 if there are no clocks
> > >   < 0 if an error occurred
> > > 
> > > Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
> > > the past form of 'enable'.
> > > 
> > > The next two patches switch existing users of devm_clk_get_enable() to
> > > the new helper - there were only two, as of next-20240913.
> > > 
> > > The last patch drops the now obsolete devm_clk_bulk_get_all_enable()
> > > helper.
> > > 
> > > Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> > > ---
> > > Cristian Ciocaltea (4):
> > >        clk: Provide devm_clk_bulk_get_all_enabled() helper
> > >        soc: mediatek: pwrap: Switch to devm_clk_bulk_get_all_enabled()
> > >        PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
> > >        clk: Drop obsolete devm_clk_bulk_get_all_enable() helper
> > > 
> > >   drivers/clk/clk-devres.c                | 30 ++++++++++++++++--------------
> > >   drivers/pci/controller/dwc/pci-exynos.c |  2 +-
> > >   drivers/soc/mediatek/mtk-pmic-wrap.c    |  4 ++--
> > >   include/linux/clk.h                     | 12 +++++++-----
> > >   4 files changed, 26 insertions(+), 22 deletions(-)
> > > ---
> > > base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
> > > change-id: 20240912-clk_bulk_ena_fix-16ba77358ddf
> > > 
> > 
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

