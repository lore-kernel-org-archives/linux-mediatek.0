Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DE0C44512
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 18:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=; b=2wOxTBq3ZLChMo8dUP1EvvKJpX
	ST7Ox+/01Ndx1GV+Yl++O5TXcc1Cl9XNlgv/zKziL4RG+s0Hrm2M6hazJ07oRaKa+rFbwsehycpms
	lGPfbLKx84PguHPeT0rR+l9TOPtOdWdK3TuzBjLCCp2higmk8HS+IEXAJEVhHRgwxafTNBKuyGqRs
	n1Hi2Yh6CO0W2Ef2kz6XehwpKyrC+tO07ihy0HKSOp2k4YPZCQow4yE8+nnNZi5WPrFOMkNWiyh8G
	IpkR1EuUVkkMJsBvxLoo7ubORqEppvvQsu8PTm9J6I/A2vXSniDEr4Q7XNljw148HIMLGfsyuwmng
	mUuXWQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR8Y-00000000QVm-2eo4;
	Thu, 16 Jul 2026 18:48:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkR8V-00000000QUj-3PNN
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 18:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784227722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=;
	b=WxuWjJ0G4EKXtHEM0S5925dJEeneFsNy/EEreYYwAQGpXRbQURY6V7kpBMk/8Ya6KbBSo2
	ZS3L7snwivR8vadnHX3BZkIiCyEVFBLyGQA9UTnqrC3NkbcV2kKcpzqHeyknQYAaLNtSm7
	uRqTfPggtBLRjXylHgCjZ2g27+BQlfQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-423-J0QwiIU9PruN2U7SiybkxA-1; Thu, 16 Jul 2026 14:48:41 -0400
X-MC-Unique: J0QwiIU9PruN2U7SiybkxA-1
X-Mimecast-MFC-AGG-ID: J0QwiIU9PruN2U7SiybkxA_1784227720
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e623b0e95so879668685a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 11:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227720; x=1784832520;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k90VREcyUMcR/OGuKj3U3g7OaZ/zXu0WG1tLumtRQ8E=;
        b=nXSD1Kvnc71RNRo7aVZJtoNP6N5L3B+yYKDQN/UDKeiiQHZ05NR8kQpZ1MVDTuV1Lv
         niS9KhwueEhjo13452dLrKZCScMaYC2amozM/qJftKuDWKEhoZAWe0I0n3rtocvkrX6s
         jOp+P6COOeRDyJUCgPeHjRU3R+Gy2quv8XlZGExKX5V6zMTdtXvfSLz8bFURl2zQe38g
         Dyx+x3A8RjC9P+wrFK/eeAsYLACzA+cuKQiXIvVnFyeZIHtvSz/IsBT1Ubtw2LZQT8yn
         la6yDd9DNiwhqWdQhafWrNrbSpxWbrc6sAjD2AtXsfGje7fAaAbUoXHk/PBedvEbwXw9
         Xoyg==
X-Forwarded-Encrypted: i=1; AHgh+RrKCNFcEWPQWdhQlMd7P0c7oD01f9Dwe2epehE5M5VhbYF0/9ArqeNMRIJqGtWhNTDD8kcbxkhleKfhx3mMkA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6A7PsQEStWfF7+t0UWZ3KoWkPbLqFV0idSFfTDXVAKlZJ9coB
	tUd4vWnYO5xGfJno1Z0EJ1B0ZT5mfApoJ1owJloQsQFH7HCKgCTo+IdqvIK5Hfkpfa0R3B+yFe9
	2mnm0x0nW/JQqF94pY+5Ea8LrXBeR8VYNrc5FWbgI5BfSspPwjay0ZJTzld8f4L+2qyppGXAHEw
	==
X-Gm-Gg: AfdE7cn/L1hRMxy4bUefRNn40VdA1xC7NudN7F8v+KalI/8cwstTmEU79wvVdnMU3te
	njDWmywZGylrnbhuw7vDlFL1lf9hErqMv842JyHoURyL4clVZExQOnKUkUML97s2QKNShp2apGb
	hhYS43saCM3dFw9yBkZh2mRRAWrGcyQ55nX/wkC+vXD+nSMx/Px6RTyKXXWP2D1S9fQ/ip9yYx5
	M/DsRR4ac1P03TBC8KDNqDiMZybmrHqdnDaaker2/aXh5DMKEnXSzeT1JKJGYybg8BG7YPPKUV3
	FjkCuP0wscn79BfqXuWGdKOSOKESLsBRtVFNGHx0l5rQzImo+UTylU/3aZ6hKv4+V8Nt8Baq8Xe
	hvBtoyals1Gq4kZ5/qiFisqHRTu34cJcWXto=
X-Received: by 2002:a05:620a:1a14:b0:92e:e569:dc20 with SMTP id af79cd13be357-930962abddbmr924061085a.78.1784227720190;
        Thu, 16 Jul 2026 11:48:40 -0700 (PDT)
X-Received: by 2002:a05:620a:1a14:b0:92e:e569:dc20 with SMTP id af79cd13be357-930962abddbmr924057085a.78.1784227719524;
        Thu, 16 Jul 2026 11:48:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9d9bsm2074490485a.28.2026.07.16.11.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:48:38 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:48:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/4] clk: en7523: add support for dedicated PCIe
 PERSTOUT reset
Message-ID: <alkng6IIkInZjxqA@redhat.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
 <20260714115848.8537-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260714115848.8537-3-ansuelsmth@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nIYwdLcn4gfcJNIJimYKPAB6WHMuwjF_RCepi356elY_1784227720
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_114843_926237_9B4C32CA 
X-CRM114-Status: GOOD (  25.08  )
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

Hi Christian,

On Tue, Jul 14, 2026 at 01:58:44PM +0200, Christian Marangi wrote:
> Add support for resetting the PCIe lines with the PERSTOUT reset. These
> special reset are controlled by the PCIC register and are specific to each
> of the 3 PCIe lines.
> 
> Notice that reset logic is inverted for these bit where 0 is assert and 1
> deassert. This is intenrally handled in the reset function.

s/intenrally/internally/

The "these bit" above is awkward as well. Sorry I don't have a
suggestion offhand, but I see what you mean below based on the code.

> 
> PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
> reset handling.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
>  1 file changed, 28 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 1ab0e2eca5d3..c9b21d9bf2f3 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  static const u16 en7581_rst_ofs[] = {
>  	REG_RST_CTRL2,
>  	REG_RST_CTRL1,
> +	REG_NP_SCU_PCIC,
>  };
>  
>  static const u16 en751221_rst_ofs[] = {
> @@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
>  	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
>  	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
>  	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
> +
> +	/* RST_PCIC */
> +	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> +	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> +	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
>  };
>  
>  static const u16 en751221_rst_map[] = {
> @@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
>  	void __iomem *np_base = cg->base;
>  	u32 val, mask;
>  
> -	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val | mask, np_base + REG_PCI_CONTROL);
>  
> @@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
>  	void __iomem *np_base = cg->base;
>  	u32 val, mask;
>  
> -	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
> -	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
> -	       REG_PCI_CONTROL_PERSTOUT;
> +	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
>  	val = readl(np_base + REG_PCI_CONTROL);
>  	writel(val & ~mask, np_base + REG_PCI_CONTROL);
>  	usleep_range(1000, 2000);
> @@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	void __iomem *addr = rst_data->base + offset;
> +	bool inverted = false;
>  	u32 val;
>  
> +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/

Add space before end of comment.

> +	if (offset == REG_NP_SCU_PCIC)
> +		inverted = true;
> +
>  	val = readl(addr);
> +	val &= ~BIT(id % RST_NR_PER_BANK);
>  	if (assert)
> -		val |= BIT(id % RST_NR_PER_BANK);
> +		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
>  	else
> -		val &= ~BIT(id % RST_NR_PER_BANK);
> +		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;

Could you do:

    if (assert ^ inverted)

Then keep the existing logic for val inside the if/else?



>  	writel(val, addr);
>  
>  	return 0;
> @@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
> -	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
> +	void __iomem *addr = rst_data->base + offset;
> +	bool inverted = false;
> +	u32 val;
> +
> +	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/

Add space before */

Brian


