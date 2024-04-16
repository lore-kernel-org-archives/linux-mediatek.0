Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E899C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6/Ij2BI4KgUf4HBpyoT6OK7u+XCMXcU8fmDxwL4t8E=; b=nWWZe+8G4gFApo1dAniVc1o7Pl
	wYvP57pRAD5jI8bSshojTNyZ/sB1GWP3DZv/aSZCVvLfCj7+Z48jQ0tCYrAMWsWoZ6bOFxxo+k/bf
	m6QbZwa5BVZSz1xl/keU4puN9ixpGyD5xwWnYRw0wzTAbHF3MZanb7qk5pKhobT4MRESz6IKW/rSb
	29l2HH21fPbz1rcyVmEQRFtE/PWAc6d3TjkqcDKiV+jv6o4HDEELDJvnL0GB13ctgQ+fMXCWeNJl+
	V7G0rK1CiX+ZwCmGRPWX4Wc+vJLZPQ/dQyTPV/ompLsZ8jRg5RqPPvMYr1R9yk/gTqzbpuuKbxAbs
	up4CF+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdf3-0000000BLV4-46kt;
	Tue, 16 Apr 2024 07:55:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdf0-0000000BLUO-0Kxc;
	Tue, 16 Apr 2024 07:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713254119;
	bh=/N51T8HnLQj9KU4DpUIGD0F8mipJ+bMfeUuzlyssn4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndXtNV3hcFpkcNYJo8JuG7v+O3l6lDGNurA3lFy6h2pDZZGy9mMH3RXI7tSDsSIoj
	 tf1QBfxFe2Mn0z9lpqVd8FGPlQRwoosatdNvPrBeSuv00uqnC5Gh6FZrn2Gtm/GakO
	 idCukbxDYZrkjXV6mPP68/W6HO5+IwyITWJop/zr8XtkX82mWjBIWazunwNrfln70x
	 o/UV/Qb6phNaxfZVtlYpsh21k0glAS8aO1MjzFDKMcxpRgnwfPmFykO8GgQ2YJvvTt
	 4KJS4xnwBWGnKM37nTdEFYVoGo1F6cxlixLcN7vhV9FGQE25OjAVAD4luS1nHCFjkd
	 /u/9FsyQeCQzw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 225CB37804B2;
	Tue, 16 Apr 2024 07:55:18 +0000 (UTC)
Message-ID: <4d60e9e4-9eae-4b0a-abb2-b1ad3d278fc9@collabora.com>
Date: Tue, 16 Apr 2024 09:55:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] scsi: ufs: ufs-mediatek: Remove useless
 mediatek,ufs-boost-crypt property
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
 <20240415110012.148871-4-angelogioacchino.delregno@collabora.com>
 <c9634a286fbdb4c98a7fe6703a4eb10d66dfcb9e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <c9634a286fbdb4c98a7fe6703a4eb10d66dfcb9e.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_005522_303280_5406F56C 
X-CRM114-Status: GOOD (  26.91  )
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

Il 16/04/24 09:03, Peter Wang (王信友) ha scritto:
> On Mon, 2024-04-15 at 13:00 +0200, AngeloGioacchino Del Regno wrote:
>> There is no need to have a property that activates the inline crypto
>> boost feature, as this needs many things: a regulator, three clocks,
>> and the mediatek,boost-crypt-microvolt property to be set.
>>
>> If any one of these is missing, the feature won't be activated,
>> hence, it is useless to have yet one more property to enable that.
>>
>> While at it, also address another two issues:
>> 1. Give back the return value to the caller and make sure to fail
>>     probing if we get an -EPROBE_DEFER or -ENOMEM; and
>> 2. Free the ufs_mtk_crypt_cfg structure allocated in the crypto
>>     boost function if said functionality could not be enabled because
>>     it's not supported, as that'd be only wasted memory.
>>
>> Last but not least, move the devm_kzalloc() call for
>> ufs_mtk_crypt_cfg
>> to after getting the dvfsrc-vcore regulator and the boost microvolt
>> property, as if those fail there's no reason to even allocate that.
>>
>> Fixes: ac8c2459091c ("scsi: ufs-mediatek: Decouple features from
>> platform bindings")
>> Signed-off-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/ufs/host/ufs-mediatek.c | 55 ++++++++++++++++++-------------
>> --
>>   1 file changed, 30 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-
>> mediatek.c
>> index 688d85909ad6..47f16e6720f4 100644
>> --- a/drivers/ufs/host/ufs-mediatek.c
>> +++ b/drivers/ufs/host/ufs-mediatek.c
>> @@ -575,51 +575,55 @@ static int ufs_mtk_init_host_clk(struct ufs_hba
>> *hba, const char *name,
>>   	return ret;
>>   }
>>   
>> -static void ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
>> +static int ufs_mtk_init_boost_crypt(struct ufs_hba *hba)
>>   {
>>   	struct ufs_mtk_host *host = ufshcd_get_variant(hba);
>>   	struct ufs_mtk_crypt_cfg *cfg;
>>   	struct device *dev = hba->dev;
>>   	struct regulator *reg;
>>   	u32 volt;
>> -
>> -	host->crypt = devm_kzalloc(dev, sizeof(*(host->crypt)),
>> -				   GFP_KERNEL);
>> -	if (!host->crypt)
>> -		goto disable_caps;
>> +	int ret;
>>   
>>   	reg = devm_regulator_get_optional(dev, "dvfsrc-vcore");
>>   	if (IS_ERR(reg)) {
>> -		dev_info(dev, "failed to get dvfsrc-vcore: %ld",
>> -			 PTR_ERR(reg));
>> -		goto disable_caps;
>> +		ret = PTR_ERR(reg);
>> +		if (ret == -EPROBE_DEFER)
>> +			return ret;
>> +
>> +		return 0;
>>   	}
>>   
>> -	if (of_property_read_u32(dev->of_node, "mediatek,boost-crypt-
>> microvolt",
>> -				 &volt)) {
>> +	ret = of_property_read_u32(dev->of_node, "mediatek,boost-crypt-
>> microvolt", &volt);
>> +	if (ret) {
>>   		dev_info(dev, "failed to get mediatek,boost-crypt-
>> microvolt");
>> -		goto disable_caps;
>> +		return 0;
>>   	}
>>   
>> +	host->crypt = devm_kzalloc(dev, sizeof(*host->crypt),
>> GFP_KERNEL);
>> +	if (!host->crypt)
>> +		return -ENOMEM;
>> +
>>
> 
> Hi Angelo,
> 
> If retrun -ENOMEN, host will init fail.
> But previous is skip boost crypt feature only.
> It change the driver behavior.
> 

This is fully intentional: if a platform supports boost-crypt, this means that the
feature *MUST* be enabled, and must *not* be disabled if a memory allocation fails,
as that is relative to available pages at boot, and not to SoC feature support.

Keep in mind that the allocation was moved to *after* checking if such platform
does indeed support the boost-crypt feature, and it is critical to FAIL probing
if there was no memory to allocate the host->crypt structure.

> 
> 
> 
>>   	cfg = host->crypt;
>> -	if (ufs_mtk_init_host_clk(hba, "crypt_mux",
>> -				  &cfg->clk_crypt_mux))
>> -		goto disable_caps;
>> +	ret = ufs_mtk_init_host_clk(hba, "crypt_mux", &cfg-
>>> clk_crypt_mux);
>> +	if (ret)
>> +		goto out;
>>   
>> -	if (ufs_mtk_init_host_clk(hba, "crypt_lp",
>> -				  &cfg->clk_crypt_lp))
>> -		goto disable_caps;
>> +	ret = ufs_mtk_init_host_clk(hba, "crypt_lp", &cfg-
>>> clk_crypt_lp);
>> +	if (ret)
>> +		goto out;
>>   
>> -	if (ufs_mtk_init_host_clk(hba, "crypt_perf",
>> -				  &cfg->clk_crypt_perf))
>> -		goto disable_caps;
>> +	ret = ufs_mtk_init_host_clk(hba, "crypt_perf", &cfg-
>>> clk_crypt_perf);
>> +	if (ret)
>> +		goto out;
>>   
>>   	cfg->reg_vcore = reg;
>>   	cfg->vcore_volt = volt;
>>   	host->caps |= UFS_MTK_CAP_BOOST_CRYPT_ENGINE;
>>   
>> -disable_caps:
>> -	return;
>> +out:
>> +	if (ret)
>> +		devm_kfree(dev, host->crypt);
>> +	return 0;
>>   }
>>   
>>   static int ufs_mtk_init_va09_pwr_ctrl(struct ufs_hba *hba)
>> @@ -648,8 +652,9 @@ static int ufs_mtk_init_host_caps(struct ufs_hba
>> *hba)
>>   	struct device_node *np = hba->dev->of_node;
>>   	int ret;
>>   
>> -	if (of_property_read_bool(np, "mediatek,ufs-boost-crypt"))
>> -		ufs_mtk_init_boost_crypt(hba);
>> +	ret = ufs_mtk_init_boost_crypt(hba);
>> +	if (ret)
>> +		return ret;
>>   
> 
> Most ufs-mediatek platform dosen't need "mediatek,ufs-boost-crypt"
> Remove this property will casue most platform try error and add init
> latency.
> 

Yes this causes -> less than half of a millisecond <- of additional boot time
if the dvfsrc-supply is present but boost-microvolt is not.

I really don't see the problem with that :-)

Regards,
Angelo

> Thanks.
> Peter
> 
> 
> 
>>   	ret = ufs_mtk_init_va09_pwr_ctrl(hba);
>>   	if (ret)


