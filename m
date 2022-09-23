Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB44C07E9D
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMvGRyf6B1xSW6jldiB/4L2hCW2oiTVar6DgwfxZevA=; b=02qpZZP9CqjIOSQbFI5lxFApkW
	1h0aOcNVf6a7Cbr4TmtUFSXSCa2mRUR2gWs1f3w5jghNzVXp2jkDKdtb+on2b8Kzj3bQFAIhMcNk0
	Q/NxobJ/G/5RkF83HAlDXoZ9+vCl899B/9O6x4dtyseKl41yoYXee0CyS0hjvzCOC3OEaVxiR+cLg
	Gsme5sisZlnSeCY206iFRidzMV7biYHEKsV+6bY6XMzhpma5aiSDosNnBgHfhdeGKlGDskXV5VVXV
	BWhuLcJua9V1+hYN1ZDD4/ZHhADcUin9JGvuRiHoCxy0F/UNvoRJVHEmzha7GARaTbB5fzxlmPGyW
	bO6HRAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnBl-005Itx-57; Fri, 23 Sep 2022 18:14:13 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnBj-005IsV-4r
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 18:14:12 +0000
Received: by mail-lj1-x233.google.com with SMTP id x29so969250ljq.2
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=oMvGRyf6B1xSW6jldiB/4L2hCW2oiTVar6DgwfxZevA=;
        b=joMXbDUN23NrSPuFVRuQxyZ18+85jHWvFlgB5rHkyQB6MuTQv+11Blst3Emk2PKY+n
         nQnCehdvxQMvsQA4btPpAyPP7A2rskO/wpWNTd326VLi8qNLiaxtGTsbjoX+ObpiCpJm
         J0XwvrZycGuZOZVovoupWtzvwrgXa8V/+Stgj+L2zVD5+vIf8S8/dQGNT4ECX7/na9dK
         5ZrHOBzj5+T0zFen0C0YlgJjDGjqrrYvSllJnoBgLL1qLQEjpVVCO3efy9H6SOOqBcm7
         TV+wstyMe4wWuqQKw6QpkQHV2tLOj0lk3tSZefrxu3+P5luZKiLRGS3ChfdurG1sEBAZ
         2YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=oMvGRyf6B1xSW6jldiB/4L2hCW2oiTVar6DgwfxZevA=;
        b=TGzTT4BAprQT/DBbpLdDhkJRsgkpwL1rYodcnjhqbSgBKyNKZqjn+DTyD5pO/TCZvs
         pFOQ4DHfnGiVRUzd5pZcvTZUx2/+nK53Erpc2VjYFqqtlBmeJuz52YZYAagDN9fI9oUe
         LqWxA/sVNP3i5c7DYf4boB+pqP6saDYcIFo7sZp16sucWVtxp3Z9NFrH2Dm81Af+3xVv
         Hyd9XWiETFSrEi0Sfb3e4a/Ay9mM5bHeuYe/M9FBCYMU8wAKNb8d7+L4VHs43E6VqlQt
         6QWg+RlbYuUouGPuRKK9uIj/Mek4BRTJYNWkkorxyjiKWAlBf5U8iJdoS9hRfYioKZtn
         /J/g==
X-Gm-Message-State: ACrzQf2dVEiyputzSoE+fcNaw3TD8jx/gDtLW98Gr1y9PF6DuSLXr6xW
	Ni4lv6w/AVttgGySjXAZSGL8KA==
X-Google-Smtp-Source: AMsMyM6ZNkXX2AkLZWL390O0wf6Nou5HbOXvCjEuUZ/Qb6dNDl3VBmNR01p6Z/h5HcJXrDEEqprZhA==
X-Received: by 2002:a05:651c:19a6:b0:26c:4a66:aa42 with SMTP id bx38-20020a05651c19a600b0026c4a66aa42mr3624111ljb.231.1663956849278;
        Fri, 23 Sep 2022 11:14:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d8-20020a056512368800b004a0526b11ffsm415225lfs.133.2022.09.23.11.14.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 11:14:08 -0700 (PDT)
Message-ID: <ac24dc0f-0038-5068-3ce6-bbace55c7027@linaro.org>
Date: Fri, 23 Sep 2022 20:14:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v5 4/4] net: stmmac: Update the name of property 'clk_csr'
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jianguo Zhang <jianguo.zhang@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220923052828.16581-1-jianguo.zhang@mediatek.com>
 <20220923052828.16581-5-jianguo.zhang@mediatek.com>
 <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e0fa3ddf-575d-9e25-73d8-e0858782b73f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_111411_227675_11C79AF4 
X-CRM114-Status: GOOD (  15.43  )
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

On 23/09/2022 11:10, AngeloGioacchino Del Regno wrote:
> Il 23/09/22 07:28, Jianguo Zhang ha scritto:
>> Update the name of property 'clk_csr' as 'snps,clk-csr' to align with
>> the property name in the binding file.
>>
>> Signed-off-by: Jianguo Zhang <jianguo.zhang@mediatek.com>
>> ---
>>   drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 9f5cac4000da..18f9952d667f 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -444,7 +444,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>   	 * or get clk_csr from device tree.
>>   	 */
>>   	plat->clk_csr = -1;
>> -	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
>> +	of_property_read_u32(np, "snps,clk-csr", &plat->clk_csr);
> 
> This is going to break MT2712e on old devicetrees.
> 
> The right way of doing that is to check the return value of of_property_read_u32()
> for "snps,clk-csr": if the property is not found, fall back to the old "clk_csr".

I must admit - I don't care. That's the effect when submitter bypasses
DT bindings review (81311c03ab4d ("net: ethernet: stmmac: add management
of clk_csr property")).

If anyone wants ABI, please document the properties.

If out-of-tree users complain, please upstream your DTS or do not use
undocumented features...

Best regards,
Krzysztof


