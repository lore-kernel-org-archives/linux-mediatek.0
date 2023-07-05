Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4960DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 11:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKDF4qgNN4R898beQcJ64wYUsNRZY1JVRwiUnFtqmlM=; b=pNb51lCKJWatMEIPrJvv4pwBDv
	p3MFsxm7IZ7KY9wVZx+EmoQQMHfEJw+AFxN4MIZNK4sjqXQNsEC1Y5Qlng1BqTG5Z+nNpsOSNi815
	bTcYUPgMTqqjHb/qzNAl4iGHX5+rvCCKtKbt4L6GZqEqpDjbYmnl137uvUEPFnGsiuO240bHyjNES
	BWJrWFNQYCxSv9i+KsqH31w8bNSFkVcih22HQY6MZuECXV/xFzpjUObNy41AT66I+4mZwYaKnWRPl
	Hv1LgCAjkBr7TrTTHT0agZqRSJUrrN9mOg1is/kNytNHRUxZf2aTWSjzxOSRZtXF8n8agw1dkkPHl
	oV0/DAgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH0Fb-00FftH-33;
	Wed, 05 Jul 2023 11:00:47 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGzJ4-00FQuO-1u;
	Wed, 05 Jul 2023 10:00:20 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9873C66018CF;
	Wed,  5 Jul 2023 11:00:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688551217;
	bh=LWBUM2eAeMbEAdWCxLKa7EIHcDRWR8YL8nCssD1CCe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=djcXx8aPIDfdDlqSgm5afDE69qEwnOwDiGHiwcfdXow+r4J+SCeO8vfhHEpRmy++N
	 wUtFswCrDP3DK9E5rbh2B4dk1cQuWMDKRYXzlCTnQlE5SBYfuyRmrevTK9m2zwSrKA
	 PH5TxX47sCVBkIE8wXVkb2UMQcZF2j2nluOGAQ2bohdW2xOC7r7Mg9WjA28M0dq+1F
	 hl9TZT1pyuRRud/QCMpF4Lcj4PA9l2GwjRh69yhVNE4rT4xGsxh8Vt4d6cgf7Da2rA
	 9bZpqViGH0w/nlQI+eE+fOWUTCjEYyKoi/1nrDA+kbDpGtCD9lw7sHPboA4nk05rTg
	 5qTqBR6pszZew==
Message-ID: <be88f6db-8b07-1767-f48c-24a215006a4f@collabora.com>
Date: Wed, 5 Jul 2023 12:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/4] phy: mediatek: tphy: Convert to
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230705090126.26854-1-frank.li@vivo.com>
 <20230705090126.26854-4-frank.li@vivo.com>
 <ddc05f70-7075-97ab-1c94-cb3d5839ef2b@collabora.com>
 <6a1bde36-fbf9-9ddd-e47f-f3c21a3528f7@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6a1bde36-fbf9-9ddd-e47f-f3c21a3528f7@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_030018_778897_1E1FF38A 
X-CRM114-Status: GOOD (  20.05  )
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

Il 05/07/23 11:30, Yangtao Li ha scritto:
> HI AngeloGioacchino,
> 
> On 2023/7/5 17:22, AngeloGioacchino Del Regno wrote:
>> Il 05/07/23 11:01, Yangtao Li ha scritto:
>>> Use devm_platform_ioremap_resource() to simplify code.
>>>
>>> Signed-off-by: Yangtao Li <frank.li@vivo.com>
>>> ---
>>>   drivers/phy/mediatek/phy-mtk-tphy.c | 10 +++-------
>>>   1 file changed, 3 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c 
>>> b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> index 0d110e50bbfd..cb7a4e6ea017 100644
>>> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
>>> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> @@ -1554,7 +1554,6 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>>>       struct device_node *np = dev->of_node;
>>>       struct device_node *child_np;
>>>       struct phy_provider *provider;
>>> -    struct resource *sif_res;
>>>       struct mtk_tphy *tphy;
>>>       struct resource res;
>>>       int port, retval;
>>> @@ -1576,15 +1575,12 @@ static int mtk_tphy_probe(struct platform_device *pdev)
>>>       tphy->dev = dev;
>>>       platform_set_drvdata(pdev, tphy);
>>>   -    sif_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>       /* SATA phy of V1 needn't it if not shared with PCIe or USB */
>>> -    if (sif_res && tphy->pdata->version == MTK_PHY_V1) {
>>> +    if (tphy->pdata->version == MTK_PHY_V1) {
>>>           /* get banks shared by multiple phys */
>>> -        tphy->sif_base = devm_ioremap_resource(dev, sif_res);
>>> -        if (IS_ERR(tphy->sif_base)) {
>>> -            dev_err(dev, "failed to remap sif regs\n");
>>> +        tphy->sif_base = devm_platform_ioremap_resource(pdev, 0);
>>> +        if (IS_ERR(tphy->sif_base) && PTR_ERR(tphy->sif_base) != -EINVAL)
>>
>> That's wrong. You want to return any error unconditionally, as the V1 PHY *needs*
>> the sif iospace and there's nothing afterwards retrying this.
> 
> 
> When sif_res is not configured, an IOMEM_ERR_PTR(-EINVAL) error will be returned in 
> __devm_ioremap_resource.
> 
> This kind of error is ignored in the newly added code, and the driving probe 
> process will not be interrupted at this time.
> 
> What did I miss?
> 

As I said, MTK_PHY_V1 *needs* sif; devm_platform_ioremap_resource() returns a
handle to that iospace, or error.

tphy->sif_base = devm_platform_ioremap_resource(pdev, 0);
if (IS_ERR(tphy->sif_base))
	return PTR_ERR(tphy->sif_base);

Regards,
Angelo

> Thx,
> 
> Yangtao
> 
> 
>>
>> Please fix.
>>
>> Regards,
>> Angelo
>>
>>>               return PTR_ERR(tphy->sif_base);
>>> -        }
>>>       }
>>>         if (tphy->pdata->version < MTK_PHY_V3) {
>>
>>




