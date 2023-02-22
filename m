Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE46CC6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stbm2bViHbJFBttOg7e77uVJKA1jg2DgX/TYeRBwDTM=; b=yZMfc386X+ssDv6jVqH4jeiHau
	DaeZu2VfNSS1EzY4thgjGwxg8X/rGyQp2Nzs9z15tb2Nl4jYb63We/pSKIGGcg5j5F0h1yMPjAOkV
	lmHIXQp5/J1gwAxERqdvj5PcN5hvaekqFf2xD7v9UdclKx9qXOx4Z/7sQfyTcDhxSYoCnwtaoDhce
	gHP8baKkRgLBt5CJv5xrZPsgOj0NNPDhhhUG2RqL3z3KbxAnpdK9psQKs5XEkgnsnocD/V6DmZTrZ
	d+deW3Yw3B1NLZ+MVUEljCgzWtQe8g7Y7lxZ8KdylprHpyw8pFs2F7TcooSAeI2Uui4vwq9xGHgrk
	oPkIYVNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl4a-00BK4W-TW; Wed, 22 Feb 2023 09:06:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUl4P-00BK11-Pa; Wed, 22 Feb 2023 09:05:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 465A9660215E;
	Wed, 22 Feb 2023 09:05:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677056745;
	bh=zSRq4dEwuKW8nbx0nGY4kiZd4ygu6loLn9qrQqhjK1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q8n9TNEao1QzWy8XNYJDyqpjHmpQg15INEmMs5cEbR3Ort6Ee4puYfk4YrBgvCdRg
	 OosK5dSlV0u+jNe3fahwPV7jgG/FhCE8+vEG4upzXy3BH0yMQC6CNNEQLoOhLq3Kc3
	 eLFknQG5p5rF9M0jqHpNEelhMa9ViQqcEIq7N08gL9+R+oOs/e1jbiT4wSF1pGinIA
	 qQYho581r95EBWh4UwPT/v/HXq398g6i5CQ0tqmTnwZjml+LFqB6wUWwIv9FIVWdPZ
	 6uBIcZxttpPdYdcDu1/U2zdoOTV/EUDAC5An+j86XJV32rMGQl2BtIk9gHQ6HpO/ba
	 zDmnj9tZTfOxQ==
Message-ID: <5274b05e-194f-131c-bedd-6b879a8ff946@collabora.com>
Date: Wed, 22 Feb 2023 10:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 49/54] clk: mediatek: Add MODULE_DEVICE_TABLE() where
 appropriate
To: Miles Chen <miles.chen@mediatek.com>
Cc: chen.zhong@mediatek.com, chun-jie.chen@mediatek.com,
 daniel@makrotopia.org, edward-jw.yang@mediatek.com, fparent@baylibre.com,
 granquet@baylibre.com, johnson.wang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com,
 nfraprado@collabora.com, pablo.sun@mediatek.com, rex-bc.chen@mediatek.com,
 sam.shih@mediatek.com, sboyd@kernel.org, sean.wang@mediatek.com,
 wenst@chromium.org, yangyingliang@huawei.com, zhaojh329@gmail.com
References: <20230221115549.360132-50-angelogioacchino.delregno@collabora.com>
 <20230222041422.4429-1-miles.chen@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230222041422.4429-1-miles.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_010549_983574_98AA95F8 
X-CRM114-Status: GOOD (  13.52  )
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

Il 22/02/23 05:14, Miles Chen ha scritto:
> Hi,
> 
>> static struct platform_driver clk_mt8195_venc_drv = {
>> 	.probe = mtk_clk_simple_probe,
>> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> index 84805a114387..3d1ad92b663e 100644
>> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> @@ -95,6 +95,7 @@ static const struct platform_device_id clk_mt8195_vpp0_id_table[] = {
>> 	{ .name = "clk-mt8195-vpp0", .driver_data = (kernel_ulong_t)&vpp0_desc },
>> 	{ /* sentinel */ }
>> };
>> +MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp0);
>>
>> static struct platform_driver clk_mt8195_vpp0_drv = {
>> 	.probe = mtk_clk_pdev_probe,
>> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
>> index 3e91dfed2996..b463f8e197c6 100644
>> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
>> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
>> @@ -93,6 +93,7 @@ static const struct platform_device_id clk_mt8195_vpp1_id_table[] = {
>> 	{ .name = "clk-mt8195-vpp1", .driver_data = (kernel_ulong_t)&vpp1_desc },
>> 	{ /* sentinel */ }
>> };
>> +MODULE_DEVICE_TABLE(platform, of_match_clk_mt8195_vpp1);
> 
> I got the following build break with ARCH=arm64 allmodconfig:
> Do I miss something?
> 
> linux-next/drivers/clk/mediatek/clk-mt8195-vpp0.c:98:31: error: 'of_match_clk_mt8195_vpp0' undeclared here (not in a function)
> linux-next/drivers/clk/mediatek/clk-mt8195-vpp1.c:96:31: error: 'of_match_clk_mt8195_vpp1' undeclared here (not in a function)
> 
> ARCH=arm64 allyesconfig, defconfig: passed
> 
> thanks,
> Miles

Sorry, this one was meant to be `clk_mt8195_vpp1_id_table` instead of
`of_match_clk_mt8195_vpp1`.... something went wrong with the rebase.

I'll fix that asap.

Thanks,
Angelo

