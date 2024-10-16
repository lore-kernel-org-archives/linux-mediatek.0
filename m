Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B21BD1AD38
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 09:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t90y80EPoeqIDTrgpnch3KKPlq/c/E72K2b9+K28uV0=; b=Mz4nLnCnteGHEsd7XVmt6/jruV
	qLFipQRxG+SytpOvG33Jy05dY0zrXqtESnNtDYGNibrivVPOxV6gfBLInmwGCX6jMcf1w0kEsjanV
	psGeRWEFAaPQUJonVAQRQTz+2RGO5tMxTUfaOxIPHXZKTqLd4Ulz+rmgwZKusNy6YAmTD28H1bZ03
	v4/+T7Fta2wlCwdzlSi+9xPTxbCdIrs2T896jTfZ/pgJeMe6gfCNqZr9iRtCfnKriZDVOTWwFpBOc
	aI1Cl5Ie3pSQbxTHg8qj3v/JRjNKBXKLTxfv3vMAZaFc0zKWGUSh35jLlE3wBqF/6UCJrilOdgjFX
	MeeHz1RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t10Us-0000000BGVJ-4BU3;
	Wed, 16 Oct 2024 09:39:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t10Kf-0000000BEcP-1EJm;
	Wed, 16 Oct 2024 09:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729070918;
	bh=1J6QfXBg9V1ZgA0yYgTnAj6Ox1PdlYEoRDRtJvp7+yI=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Z2WrxwlF/UbdQHHE3PaQ7S2n7qo/CiLPzkdsI3xTOvi2AKewdUkExHRZztiXYWHPI
	 UesLbavjU/KvWScNPW/g3Q0UxtvFsB176XHje9NQbBtCP0HV49M9lVqyvD4BKUKrUt
	 ThVeZukTzs/QEutWPDryjwwccLK4hwHKHEBObU2WmRaEdbWxvM3gPFBrzhBFy4txBr
	 UxEIYy1mO0MPWI+kUSQ+lC9WfAAYjVYsIgo0w5YoM7kJEz3Nytk1FZ90NuQMgXWG4E
	 DB87X6qHxD8Qc6Cu++5/3kumSN6xVdRMJJvqiuXdfR9jCKRhCev+eHYXmCiZIPneWd
	 RobPZ1sJd8dqQ==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F33B617E121F;
	Wed, 16 Oct 2024 11:28:37 +0200 (CEST)
Message-ID: <9ca2a9dc-b643-40ce-8177-68533d0733d1@collabora.com>
Date: Wed, 16 Oct 2024 12:28:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Provide devm_clk_bulk_get_all_enabled() helper
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
Content-Language: en-US
In-Reply-To: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_022841_548655_5214D562 
X-CRM114-Status: GOOD (  18.94  )
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

On 9/26/24 1:43 PM, Cristian Ciocaltea wrote:
> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
> return the number of clocks stored in the clk_bulk_data table referenced
> by the clks argument.
> 
> That is required in case there is a need to iterate these clocks later,
> therefore I couldn't see any use case of this parameter and should have
> been simply removed from the function declaration.
> 
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
> Changes in v2:
> - Dropped references to 'broken' API in commit descriptions, per Mani's
>   suggestion
> - Added R-b tags from Angelo and Mani
> - Link to v1:
>   https://lore.kernel.org/r/20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com

[...]

This still applies cleanly on next-20241016 and there are no new users
of devm_clk_bulk_get_all_enable(), hence I wonder if anything else is
missing to get it merged.

Thanks,
Cristian

