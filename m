Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16404D3C909
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Oct 2024 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YohracUhsDVEh+aMbdi9Y0PHB0rj7dLCkbDga3Dg0Fk=; b=KbnyLCW2Dv8U18QnLEL9Un0XxY
	HAPHJN9xzpdZCEXhQeVNbbMY3HV+pt8mx7U8AIVicFQRpKoLbqScQuWESU5KYirZakirZyUEQ7ZM7
	bbA+Vbbn42Cf9sgyXtrPTWF+0jqwtaqXmlshLvBLwcWMm+4OLTmQ9hNhXRTnazJ2JbDFDk8Mr8Pnw
	k9vHF7A/eEbjjdyFH/wl6bLEjK4nqxoakcm+EhvVfuitz5osYvS7p/7ocSJH4J81Ate4jf8qi0C2C
	1FcfoolMpqBX6AF35v+znXCIWj6bt8YPcXnweBHVm/btrzv9LPiEXBkizQT2b9Pdi/rK0saiTObC2
	ZZQ6yP4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t27Yn-00000003DD3-0bEu;
	Sat, 19 Oct 2024 11:23:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t27VN-00000003Cfj-2HBj;
	Sat, 19 Oct 2024 11:20:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729336819;
	bh=fgM8dTXtogJtNbM27u29QltmLJFMCoLsfeW9/uhqMqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XhIhRl1WjbKZQ+6IgcdASB3u6DRcer54NStItAFOZjmoAll1fvPNLoyB4DXDNkBs4
	 aBvU8QCX6v+fuWSeAsMn0iW3pGIV0yNxpivb/CkuO0PwSK67EWkS0LDd/kKIa3CaFt
	 sji7AM/Bbvqx97vGIijbg8vPrq/DWfcUGlSIPIeFdcXkHjEfOeJtPjhKNKLccpbWJT
	 XAmRQkDj5w7rSO1WkS2TC8E5YOVgsMCkXeAue2+KUcK3WIazSoVOIQyJ+tQrkxDWPk
	 UoZeM1zjOa50zZFaiT27nRbhvmr5sPruDdJoY+QpObAl8Ck+lsofSgeQ5RBXEpyXCL
	 RUK0Lhe583A1Q==
Received: from [192.168.1.90] (unknown [188.24.146.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3759717E1411;
	Sat, 19 Oct 2024 13:20:19 +0200 (CEST)
Message-ID: <9455cce5-af97-48cb-8042-24b714f29401@collabora.com>
Date: Sat, 19 Oct 2024 14:20:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] clk: Provide devm_clk_bulk_get_all_enabled()
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
References: <20241018-clk_bulk_ena_fix-v3-0-57e8bb82460c@collabora.com>
 <20241018-clk_bulk_ena_fix-v3-1-57e8bb82460c@collabora.com>
 <c0afdf9f8c9773ef83274cb119d14c90.sboyd@kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <c0afdf9f8c9773ef83274cb119d14c90.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_042021_769542_5D0C713C 
X-CRM114-Status: GOOD (  10.12  )
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

On 10/19/24 8:56 AM, Stephen Boyd wrote:
> Quoting Cristian Ciocaltea (2024-10-17 16:17:29)
>> diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
>> index 82ae1f26e634572b943d18b8d86267f0a69911a6..0d0fe364b66a8590d5e7c63dc6c1e70c59d53e89 100644
>> --- a/drivers/clk/clk-devres.c
>> +++ b/drivers/clk/clk-devres.c
>> @@ -230,25 +239,27 @@ int __must_check devm_clk_bulk_get_all_enable(struct device *dev,
>>                 return -ENOMEM;
>>  
>>         ret = clk_bulk_get_all(dev, &devres->clks);
>> -       if (ret > 0) {
>> -               *clks = devres->clks;
>> -               devres->num_clks = ret;
>> -       } else {
>> -               devres_free(devres);
>> -               return ret;
>> -       }
>> +       if (ret <= 0)
>> +               goto err_free_devres;
> 
> Please don't use goto so that the diff is minimized.

Done in v4:

https://lore.kernel.org/all/20241019-clk_bulk_ena_fix-v4-0-57f108f64e70@collabora.com/

Regards,
Cristian

