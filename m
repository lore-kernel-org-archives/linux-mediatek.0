Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2E1D3C533
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 23:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JnF4DhQWEcKTIPI030OJAqd4YC80q8oD4ETGn9LVGQU=; b=v2DcjgwhQpdobubKKYVVydfvbA
	Vt/7aXovonnffRmcnm6y2hhlgq7kQJu6wqZFsAhBPWu6u6/7vV5rsuH9T7IYK9QZkoBwORdwg16fu
	MoHWJR4q2GwJmvlz+4LpplqFIOMqpojSlgWOEwDPD5acZKexf5XCKrO4eAvPJQ/Zqw9U+fVqSaECY
	iIqON2KrP9VPb9tvGeXqYAa1WkPHKrquPjER6CH0uyqi/cPEXV1ZBmi+3SVoWWrxBEqsFlTC6k2Vj
	QJjZMmVthw8CsJ2sOq/rtJatO1cklaUw6EPPhdoN5TXR3mICkgSK6pWjSiZm8hLQtov58hV/R0o/c
	fXblHiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ZtD-0000000GQsu-1zfz;
	Thu, 17 Oct 2024 23:26:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Zqc-0000000GQYV-3soy;
	Thu, 17 Oct 2024 23:24:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729207441;
	bh=stynPAKb67QZa/lU7ZIP8zDcPVSvZM4VE/kuZgRvW68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a8ExjZa7BXve8hN7bF41EjrnBaIRjB1DZGyLFYJFg5m3YcIb8+01SRWT4XOuSnd1g
	 951q26phmb2PPL+3JnRQbyvLhpoHdGOKwtJIFiIAj0UaCR1uSIVU4LMo/RKPMlC16b
	 zoYykMa8grW3NO3hvmHH3U/PIa6K3YRAhsKQntX4yAnXJr24bMMyBx29558glxL2uZ
	 kdky/hm5Tr3xB3CThNHTnDJtDvSu3MkYd1powH5Xrhaw4tEWzh5QSo8+JJAjuJED7P
	 67Ykrw+4TGTsg9Vh41NW9DjkPofMi25k8i7cDnvFWZ/gKCFbIQMyjQxIjvlTLidC7Y
	 6N1rL2y+qSwTw==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7079317E0ED2;
	Fri, 18 Oct 2024 01:24:00 +0200 (CEST)
Message-ID: <6acaeefe-54f1-4a7f-9e07-bc8b1bfbab08@collabora.com>
Date: Fri, 18 Oct 2024 02:23:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: Provide devm_clk_bulk_get_all_enabled()
 helper
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kw@linux.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240926-clk_bulk_ena_fix-v2-0-9c767510fbb5@collabora.com>
 <20240926-clk_bulk_ena_fix-v2-1-9c767510fbb5@collabora.com>
 <347771679b3ac765de3f79c26f3d3595.sboyd@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <347771679b3ac765de3f79c26f3d3595.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_162403_148847_34E5A78A 
X-CRM114-Status: GOOD (  11.47  )
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

On 10/17/24 10:45 PM, Stephen Boyd wrote:
> Quoting Cristian Ciocaltea (2024-09-26 03:43:20)
>> Commit 265b07df758a ("clk: Provide managed helper to get and enable bulk
>> clocks") added devm_clk_bulk_get_all_enable() function, but missed to
>> return the number of clocks stored in the clk_bulk_data table referenced
>> by the clks argument.  Without knowing the number, it's not possible to
>> iterate these clocks when needed, hence the argument is useless and
>> could have been simply removed.
>>
>> Introduce devm_clk_bulk_get_all_enabled() variant, which is consistent
>> with devm_clk_bulk_get_all() in terms of the returned value:
>>
>>  > 0 if one or more clocks have been stored
>>  = 0 if there are no clocks
>>  < 0 if an error occurred
>>
>> Moreover, the naming is consistent with devm_clk_get_enabled(), i.e. use
>> the past form of 'enable'.

[...]

> Instead of duplicating can you make devm_clk_bulk_get_all_enable() use
> the devm_clk_bulk_get_all_enabled() function but not return the number
> of clks all in this patch? It will make the diff much more readable that
> way.

Done in v3 [1].

Thanks for reviewing,
Cristian

[1] https://lore.kernel.org/all/20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com/

