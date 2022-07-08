Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9204C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 11:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nszoEzYnCxQ1xDNDNvtGrYIcNHRX5TSbVWsgNtzZYhA=; b=SktxSG1yeycD3bpjUpGKLYo/u5
	4H47ObqKD0hlL4gOcIQjfPli1wBlVsXRh6EiiHK8Lq+UtzBddxhFaCqPJivP9p3NiVahe0DLmgJjF
	/ewAQJmdB+U5uuEzk0TFe34FYnx/kXMG1Gmu6iOrUU0N4tc63HcjeMKSqEA510ToqU9uQXMWIdsQY
	ud/KU1X6ms57IlznU9VaV8hXBoORPL/+3yFMsqyHT/hZi4n8V0FCRYA7S9Mlk8dtZLUYqXEXnjBT5
	Ehs3zwY84Dhyno45xP25KsagnP1PJvNExG80Gx7ijP2tV/nbKiMP0lyS3krvn55IICeuxqZNiT+Da
	+M/ctMHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9mJV-003RJf-Dm; Fri, 08 Jul 2022 11:38:25 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9mJK-003RHf-HC; Fri, 08 Jul 2022 11:38:16 +0000
Received: by mail-il1-x131.google.com with SMTP id a20so7950368ilk.9;
        Fri, 08 Jul 2022 04:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=nszoEzYnCxQ1xDNDNvtGrYIcNHRX5TSbVWsgNtzZYhA=;
        b=dKvjhinarA+FocDEae0v2+po7LXoRwU4pY01+kUagQ5SQYb3XXmu3zkzCPOoiQIK6I
         /JOuB/inq9ACoE5FjhLsVyJmuqdG97nxZOul+6cAackx1m82N44sCs/mULzrGat08yv9
         wUXyLH/M2uKfNvDXyes0tu22w4WK797yLHWyVeef0hjRaXeoO2XouqmmKWifJeY19mWR
         LY+h4c85KmZMyQqb3OG1G12IMWa/xrrdfVs4hiyoiFnvwbRxLsbnSpLzTCCrPAXAkFtP
         Zvt2kscGtFJCPLT/DEpLBLt3EQGmiLWOj8c5ITdnyHDMSS+AfdulxIthKL+LXDYS41rB
         ldrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=nszoEzYnCxQ1xDNDNvtGrYIcNHRX5TSbVWsgNtzZYhA=;
        b=GEW+l1JrQEaz2v8Cs7WmsMGF4V6RuXEf6ZFUj1tSFaDSPwHsTlBAnjtXdJTPCv1H55
         wTh/s7LRiB0eY3tu5ucG9SJxq/UmndOvi2bi7VzlciHYlg940zx2ihNhgEQoDdc1hEiD
         FdcZBpgd0CuDNlIBmNlIOuS7uW0343y3fg+sbXi+k61t02zwKt53HsVEalF/0I3j4848
         7T5Ap/Nqa9D9/fBUK0rbRmVDhXe3J3biahbrssOZWwTZKy6d6RSQm/TdvXbCXDwvuHT8
         qY3jTwZgePUCyAq65g0usztlP5YwvkAFbp5o/hXi5b6k0nl+PEkglxOjtCXWLOLzs5op
         +TDg==
X-Gm-Message-State: AJIora/5CQUlamlK1B5134qhNKeUMTv9GPIrsvT3M+RUka+BW6dLLXIS
	lCPWxjPu3E23mD/WSILg9UQ=
X-Google-Smtp-Source: AGRyM1sNiPet/tVOy6XFSa61R0msl5dFrsxCFuQMc8hx1cl0M2wFvwdfDVlZDWJVEB+BtAPuu3xZXg==
X-Received: by 2002:a05:6e02:1a2f:b0:2dc:31f1:2976 with SMTP id g15-20020a056e021a2f00b002dc31f12976mr1810014ile.179.1657280290036;
        Fri, 08 Jul 2022 04:38:10 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k14-20020a0566022a4e00b0067821726c8csm9007770iov.53.2022.07.08.04.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 04:38:08 -0700 (PDT)
Message-ID: <78beb398-01ed-400e-e79c-0bcdcbc279d0@gmail.com>
Date: Fri, 8 Jul 2022 13:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, David Miller <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com
References: <20220708083937.27334-1-biao.huang@mediatek.com>
 <20220708083937.27334-2-biao.huang@mediatek.com>
 <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
 <410b8c62ea399b51c11021c4838bd6a62d542703.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH net v3] stmmac: dwmac-mediatek: fix clock issue
In-Reply-To: <410b8c62ea399b51c11021c4838bd6a62d542703.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_043814_603574_5A091E7A 
X-CRM114-Status: GOOD (  31.20  )
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

Hi Biao Huang,

On 08/07/2022 11:46, Biao Huang wrote:
> Dear Mattias,
> 	Thanks for your comments.
> 
> On Fri, 2022-07-08 at 11:22 +0200, Matthias Brugger wrote:
>>
>> On 08/07/2022 10:39, Biao Huang wrote:
>>> Since clocks are handled in mediatek_dwmac_clks_config(),
>>> remove the clocks configuration in init()/exit(), and
>>> invoke mediatek_dwmac_clks_config instead.
>>>
>>> This issue is found in suspend/resume test.
>>>
>>
>> Commit message is rather confusing. Basically you are moving the
>> clock enable
>> into probe instead of init and remove it from exit. That means,
>> clocks get
>> enabled earlier and don't get disabled if the module gets unloaded.
>> That doesn't
>> sound correct, I think we would at least need to disable the clocks
>> in remove
>> function.
> there is pm_runtime support in driver, and clocks will be
> disabled/enabled in stmmac_runtime_suspend/stmmac_runtime_resume.
> 
> stmmac_dvr_probe() invoke pm_runtime_put(device) at the end, and
> disable clocks, but no clock enable at the beginning.
> so vendor's probe entry should enable clocks to ensure normal behavior.
> 
> As to clocks in remove function, we did not test it
> We should implement a vendor specified remove function who will take
> care of clocks rather than invoke stmmac_pltfr_remove directly.
> 
> Anyway, we miss the clock handling case in remove function,
> and will
> test it and feed back.

Right, sorry I'm not familiar with the stmmac driver stack, yes suspend/resume 
is fine. Thanks for clarification.

stmmac_pltfr_remove will disable stmmac_clk and pclk but not the rest of the 
clocks. So I think you will need to have specific remove function to disable them.

>>
>> I suppose that suspend calls exit and that there was a problem when
>> we disable
>> the clocks there. Is this a HW issue that has no other possible fix?
> Not a HW issue. suspend/resume will disable/enable clocks by invoking
> stmmac_pltfr_noirq_suspend/stmmac_pltfr_noirq_resume -->
> pm_runtime_force_suspend/pm_runtime_force_resume-->
> mediatek_dwmac_clks_config, so old clock handling in init/exit is no
> longer a proper choice.
> 

Got it, thanks for clarification.

Best regards,
Matthias

> Best Regards!
> Biao
> 
>>
>> Regards,
>> Matthias
>>
>>> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level
>>> clocks management")
>>> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
>>> ---
>>>    .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 36 +++++---------
>>> -----
>>>    1 file changed, 9 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> index 6ff88df58767..e86f3e125cb4 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
>>> @@ -576,32 +576,7 @@ static int mediatek_dwmac_init(struct
>>> platform_device *pdev, void *priv)
>>>    		}
>>>    	}
>>>    
>>> -	ret = clk_bulk_prepare_enable(variant->num_clks, plat->clks);
>>> -	if (ret) {
>>> -		dev_err(plat->dev, "failed to enable clks, err = %d\n",
>>> ret);
>>> -		return ret;
>>> -	}
>>> -
>>> -	ret = clk_prepare_enable(plat->rmii_internal_clk);
>>> -	if (ret) {
>>> -		dev_err(plat->dev, "failed to enable rmii internal clk,
>>> err = %d\n", ret);
>>> -		goto err_clk;
>>> -	}
>>> -
>>>    	return 0;
>>> -
>>> -err_clk:
>>> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
>>> -	return ret;
>>> -}
>>> -
>>> -static void mediatek_dwmac_exit(struct platform_device *pdev, void
>>> *priv)
>>> -{
>>> -	struct mediatek_dwmac_plat_data *plat = priv;
>>> -	const struct mediatek_dwmac_variant *variant = plat->variant;
>>> -
>>> -	clk_disable_unprepare(plat->rmii_internal_clk);
>>> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
>>>    }
>>>    
>>>    static int mediatek_dwmac_clks_config(void *priv, bool enabled)
>>> @@ -643,7 +618,6 @@ static int mediatek_dwmac_common_data(struct
>>> platform_device *pdev,
>>>    	plat->addr64 = priv_plat->variant->dma_bit_mask;
>>>    	plat->bsp_priv = priv_plat;
>>>    	plat->init = mediatek_dwmac_init;
>>> -	plat->exit = mediatek_dwmac_exit;
>>>    	plat->clks_config = mediatek_dwmac_clks_config;
>>>    	if (priv_plat->variant->dwmac_fix_mac_speed)
>>>    		plat->fix_mac_speed = priv_plat->variant-
>>>> dwmac_fix_mac_speed;
>>> @@ -712,13 +686,21 @@ static int mediatek_dwmac_probe(struct
>>> platform_device *pdev)
>>>    	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
>>>    	mediatek_dwmac_init(pdev, priv_plat);
>>>    
>>> +	ret = mediatek_dwmac_clks_config(priv_plat, true);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>    	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>>>    	if (ret) {
>>>    		stmmac_remove_config_dt(pdev, plat_dat);
>>> -		return ret;
>>> +		goto err_drv_probe;
>>>    	}
>>>    
>>>    	return 0;
>>> +
>>> +err_drv_probe:
>>> +	mediatek_dwmac_clks_config(priv_plat, false);
>>> +	return ret;
>>>    }
>>>    
>>>    static const struct of_device_id mediatek_dwmac_match[] = {
> 

