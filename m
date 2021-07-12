Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA11C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:45:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B72161209
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B72161209
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3X5heGxZYxBVNj3CY0MZoK/vl4cRSmqZ3xp0gUWGTpQ=; b=qwXT+oEU4O9SfnF1c/KCrdhmOC
	3jYcZwH6CtqWYS16Y9ui9aZCq8wdgf4vqyo+cl1DKQh9uJo3hZi4u/cHuu2/Za1Luomp5xLgLEey3
	TvZU1ieLUmqlYJpYxXx4FC3VVmJj+3VOtaLTzRuTeFAXaXXt77LeP1z67tbV4gm8f4es7JhdJZ3JM
	urhxKI8R/Dvbx3nzEUtnyfoExf5cVB8OkYZMr1tbB/zUmQB7jw/LzrPYvE2h8U7Ff+Pn6XVw7T6bL
	9v1xLHkzPTQRF6HizwkFcfCB6EughXSKzVSfDnlE/hPIlOknFQ6JPzZJYZUi+FQGeCXzVldGixyxl
	9XIJTeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2pgp-0069iw-E7; Mon, 12 Jul 2021 06:45:15 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2pga-0069fG-Gs
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 06:45:02 +0000
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id B62E64061F
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 06:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1626072292;
 bh=OR0zgeaONK2MupeyE6Ocj/7EocddRmlmkKFDNFfG1NY=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=hBUymzOYjO0+mRELEtavZJk/YNNokfJYII2FZaO/0D2sRCpPLJX1g3UfbGO0GwjFX
 5H6VEZtHxVwhxBpIoLIcPM/lmipcoX0ZNHwnfPxZ7uAkbflSxxB2OXLfr578LwJkZ/
 8W9aFrtmwm3tYLktymsYJXlafJY5ZfHQAOJHbL37pVGVBCiVadWWzXHkPA4mH6D+qg
 xWGnzd4F7lIAWzdOiWwZDqHDU7iTzAcADcS30pf7KIpdWRO3vCONkU+7ldbmkUgwoA
 7y1Qou9qF9chmgXVgDB0mkaHrK1od++36grkn4wa2SpuRB0xtXVCNI5DR/Of62bhFd
 ipjiD13HEuaCA==
Received: by mail-wr1-f72.google.com with SMTP id
 g4-20020a5d64e40000b029013398ce8904so6735953wri.16
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Jul 2021 23:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OR0zgeaONK2MupeyE6Ocj/7EocddRmlmkKFDNFfG1NY=;
 b=c8kXzIGqti3T7VpaXm6QvAXDzNhP6f2rE7hxovyLe0OJEY+fYhVN0x4LvG9B4zKLyN
 WqwrjzLXQbyXkuP1O+NCqa4GkR0y0aljhlZ+zOlpytOCsCplD7puO/B9jxc2v5SyWN2n
 gi9ec2vmxW17hjlf4NocfBBCc3py9WEp729xmq3Qi0QP6j9mhJ8354pHYEH+2PexNANg
 8aYUb9Cgt89a6zyX65UkpCZ/IGNA6CTwXUWbPeQ4PZjK8X6I2tk5WtQo8MS0Cud4++zF
 qGS6IpLOpLUMc05HBO4Uz04JgVdZGteRQUqGRZptaLO/LJLA6keT/rJJYeCl+62OvPUZ
 sKtw==
X-Gm-Message-State: AOAM531Vd7xN5sglzGE7imgQaOx9+S8bbXjBFnwSfxLlUb6qdP03j93G
 ZAVsinScxuVgDqsoynOGByhUIxw0+oYVgPQcfMeW3qrxoikq9wGwAr/8DEOMUX1BiWs1urJNDVj
 aCTZA7k2Dj9VZu7h1LF6mIxrgb4ll2aApwcAjB/cnhQqdFuAr7Q==
X-Received: by 2002:a05:600c:24d3:: with SMTP id
 19mr3339015wmu.171.1626072289748; 
 Sun, 11 Jul 2021 23:44:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySU0D9B7fRMXEvgvy6Ati/eZuKcVknMxNOdcIIsbPvm/GJGLKf3jsMbB7YcvqNiHnDrw1oEw==
X-Received: by 2002:a05:600c:24d3:: with SMTP id
 19mr3338983wmu.171.1626072289515; 
 Sun, 11 Jul 2021 23:44:49 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id o7sm15468284wrv.72.2021.07.11.23.44.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 23:44:49 -0700 (PDT)
Subject: Re: [PATCH 3/9] memory: mtk-smi: Use clk_bulk instead of the clk ops
To: Yong Wu <yong.wu@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, ming-fan.chen@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20210616114346.18812-1-yong.wu@mediatek.com>
 <20210616114346.18812-4-yong.wu@mediatek.com>
 <4047dfaf-f2f8-b6b2-52fd-41821475b162@canonical.com>
 <1625992199.22309.15.camel@mhfsdcap03>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <fe426c10-4cfe-103c-9961-1b8fdb18a16a@canonical.com>
Date: Mon, 12 Jul 2021 08:44:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625992199.22309.15.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_234500_725212_BB3D88F7 
X-CRM114-Status: GOOD (  26.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/07/2021 10:29, Yong Wu wrote:
> On Thu, 2021-07-08 at 11:32 +0200, Krzysztof Kozlowski wrote:
>> On 16/06/2021 13:43, Yong Wu wrote:
>>> smi have many clocks: apb/smi/gals.
>>> This patch use clk_bulk interface instead of the orginal one to simply
>>> the code.
>>>
>>> gals is optional clk(some larbs may don't have gals). use clk_bulk_optional
>>> instead. and then remove the has_gals flag.
>>>
>>> Also remove clk fail logs since bulk interface already output fail log.
>>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>  drivers/memory/mtk-smi.c | 124 +++++++++++----------------------------
>>>  1 file changed, 34 insertions(+), 90 deletions(-)
>>>
>>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>>> index c5fb51f73b34..bcd2bf130655 100644
>>> --- a/drivers/memory/mtk-smi.c
>>> +++ b/drivers/memory/mtk-smi.c
>>> @@ -60,9 +60,18 @@ enum mtk_smi_gen {
>>>  	MTK_SMI_GEN2
>>>  };
>>>  
>>> +#define MTK_SMI_CLK_NR_MAX			4
>>> +
>>> +static const char * const mtk_smi_common_clocks[] = {
>>> +	"apb", "smi", "gals0", "gals1", /* glas is optional */
>>
>> Typo here - glas.
> 
> Will Fix. Thanks.
> 
>>
>>> +};
>>> +
> 
> [snip]
> 
>>> @@ -493,7 +449,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>>>  	struct device *dev = &pdev->dev;
>>>  	struct mtk_smi *common;
>>>  	struct resource *res;
>>> -	int ret;
>>> +	int i, ret;
>>>  
>>>  	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
>>>  	if (!common)
>>> @@ -501,23 +457,13 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
>>>  	common->dev = dev;
>>>  	common->plat = of_device_get_match_data(dev);
>>>  
>>> -	common->clk_apb = devm_clk_get(dev, "apb");
>>> -	if (IS_ERR(common->clk_apb))
>>> -		return PTR_ERR(common->clk_apb);
>>> -
>>> -	common->clk_smi = devm_clk_get(dev, "smi");
>>> -	if (IS_ERR(common->clk_smi))
>>> -		return PTR_ERR(common->clk_smi);
>>> +	common->clk_num = ARRAY_SIZE(mtk_smi_common_clocks);
>>> +	for (i = 0; i < common->clk_num; i++)
>>> +		common->clks[i].id = mtk_smi_common_clocks[i];
>>>  
>>> -	if (common->plat->has_gals) {
>>> -		common->clk_gals0 = devm_clk_get(dev, "gals0");
>>> -		if (IS_ERR(common->clk_gals0))
>>> -			return PTR_ERR(common->clk_gals0);
>>> -
>>> -		common->clk_gals1 = devm_clk_get(dev, "gals1");
>>> -		if (IS_ERR(common->clk_gals1))
>>> -			return PTR_ERR(common->clk_gals1);
>>> -	}
>>> +	ret = devm_clk_bulk_get_optional(dev, common->clk_num, common->clks);
>>> +	if (ret)
>>> +		return ret;
>>
>> How do you handle now missing required clocks?
> 
> It looks this is a common issue for this function which supports all the
> clocks could be optional. Is there common suggestion for this?
> 
> For our case, the apb/smi clocks are required while "gals" are optional.
> 
> thus, we should use devm_clk_bulk_get for the necessary clocks and
> devm_clk_bulk_get_optional for the optional ones. right?

Yes, I think that's the solution. Otherwise you might not have proper
clocks leading to accesses to disabled/gated hardware.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
