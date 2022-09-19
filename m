Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C600C6FA82
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 23:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0tsb5agSgpQCkBZksFTCdXOXRex2sVbdkU40ZWTz7SA=; b=Jm/zt+FvQ+ZjXiqIz4zROyPP8N
	QholgFDvPmHKJu1dr9gct+1rcr/M3iZ0texeao3xFfLxq3XhVaWci992RL5BOFkm9V1n0H5yzpwrE
	hGIb1tt4wR8A7oON8k/KuwsuAh1uaRJeKDCAq6CcAC4Jz/8mG/MwQq0rBAysfvtoYMqpg/9d6//zQ
	fsvAWUT+A9aezXxasBF/go7Db3dAQThz3X0KreLBoVXVCVWhC2mpVKHKSalrHO2ZArdVOMLVe7iut
	echY6+u73zmn89A5TfyxxUa68aKJJK9yjcRJqZH+w0pbwqhWAG1c3KUUXB7bYbA3HVLGzoPvtX9xL
	moWPD0FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQcm-00GXO4-OJ; Mon, 19 Sep 2022 23:56:29 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaQcc-00GXE2-Lx
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 23:56:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1663631777; x=1695167777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=++5axOCldtTWM+izrbSQWpROwyvWlmGRPLJdA2yng0M=;
  b=OMAP2xRv0I44KSDqAvJ3ptsZuyTvCmPrx2ZQENnDnmGbN+vG9mr9tZ3A
   U4c3lXQDmkB4xEC0f3ks4nWVGJ9XHFkG2qMpF6XKARQ2EjWlB7Y9bKfe3
   PZ9lEIj9IZJT9w146838o31vKTrfRc/rSVzIH4/ZGxlQl1UFluuBlrV5H
   EqHGGZt0cgRrkvF0IXQx5BHk3ZCqrgZBy8s8p+ZxnRDV7Eymhwjv0yNA/
   C6c4GPq6hoVYuiy+oj8jnZPw2kjhsuNuzlTUQ7oMlWVtAnuLZkTx5cfQ0
   prtxhl30CZzOey8PZITj/Biqy9Qnq+3D5CZhoXiT7YVRC1VGsdgtLRusD
   w==;
X-IronPort-AV: E=Sophos;i="5.93,329,1654531200"; 
   d="scan'208";a="211750578"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Sep 2022 07:56:09 +0800
IronPort-SDR: R8RjG7/LLY2eJByFmBeWhgVA/nxjEmJLvugYpOdEaHeWJSc2G7UkGlf0qVkdv2ZdiEI9gqc3Xn
 mol4FY2Jz3dokMv+I8aTUxhjmtKiD7cs6+oXe1RquBBSnxx/xbAtkIl0m0UfhBTcliMWRtP8LI
 IsCp5gR5hJyeiJCu/jpwx9DvpDsy9ZvFAYwbJRzL+r4mwloaO2UdRagJIbw9RndtN4i8uJvJ0i
 g8xMvUvUww66r6KJ54VmSjEQI9Ttx2argx4Svzyyev3iH81Mv8djiyARVba4EhNW76vep9uaxS
 ZLbT29/SzUAcSmSOowMYFySX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 16:16:16 -0700
IronPort-SDR: FfkjV4vj12F2t6Ha82dXE2IJENgqLoxGrlF2GrkxV6r63h3EW8tyAm2sZrxsk3oJ04FBce0eVp
 Dbiej5orN2Q0eIuR0DICdYlaCIUPIXOhgj8SnrVSteUBHLNXBRGx+hG/vBdgIWyPb7O0pNypNY
 kOkv+hUNLEMk78dp7bV8pfHkQxncH6ygbZCenvToW4VMXyxEakjreOTxGUr8+/HWl+k2F09QTa
 y3jn2BGFZmfOtx4S5KhTJ9wk/4sb67p+0A/7noJJb/OI/N2F/L08Y0cP6wPZzOEC4Vj6HBFxOL
 5TQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Sep 2022 16:56:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MWhQd3SPxz1Rwt8
	for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 16:56:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1663631768; x=1666223769; bh=++5axOCldtTWM+izrbSQWpROwyvWlmGRPLJ
	dA2yng0M=; b=KumYlcFECCyMFuCCbzzjbk2hBlrl09J7H1BVMMpdpWLqTeK1Udg
	BQJQNamL7noEQ2kcOpXY79ZFm5an7hgZYNIet+ruTqKUe+qcUHcR0timQfFKEfTT
	7+EU2aANdBVmxzOTCdnC3Inc+WyuGkoiyybBjJBZHjeFfNTvNNOrWnWtJOt+7C16
	4xnnoGJ2hsBWcHs8UXmd09FBjoVunvoEbalULcIh0Y9nt/2kAx6gYcjSMb9o+c0p
	sd2cnrprJIdrUMnVB0OwM0O2rS8UAgnvJDEjxWg63PVisyECEIb91ymOK/63rc3D
	O4eDxIUJvk8GQtdY7j66BU1zyADl90ojNnQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rZnSAGNbGmnL for <linux-mediatek@lists.infradead.org>;
	Mon, 19 Sep 2022 16:56:08 -0700 (PDT)
Received: from [10.225.163.81] (unknown [10.225.163.81])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MWhQV5lcDz1RvLy;
	Mon, 19 Sep 2022 16:56:02 -0700 (PDT)
Message-ID: <7872df9d-db4e-0617-84eb-e47394774322@opensource.wdc.com>
Date: Tue, 20 Sep 2022 08:55:59 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v8 09/23] ata: libahci_platform: Parse ports-implemented
 property in resources getter
To: Guenter Roeck <linux@roeck-us.net>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Hannes Reinecke <hare@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220909193621.17380-1-Sergey.Semin@baikalelectronics.ru>
 <20220909193621.17380-10-Sergey.Semin@baikalelectronics.ru>
 <20220919215014.GA336081@roeck-us.net>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220919215014.GA336081@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_165618_734044_98D2526B 
X-CRM114-Status: GOOD (  23.94  )
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

On 9/20/22 06:50, Guenter Roeck wrote:
> On Fri, Sep 09, 2022 at 10:36:07PM +0300, Serge Semin wrote:
>> The ports-implemented property is mainly used on the OF-based platforms
>> with no ports mapping initialized by a bootloader/BIOS firmware. Seeing
>> the same of_property_read_u32()-based pattern has already been implemented
>> in the generic AHCI LLDD (glue) driver and in the Mediatek, St AHCI
>> drivers let's move the property read procedure to the generic
>> ahci_platform_get_resources() method. Thus we'll have the forced ports
>> mapping feature supported for each OF-based platform which requires that,
>> and stop re-implementing the same pattern in there a bit simplifying the
>> code.
>>
>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>> ---
>>  drivers/ata/ahci_mtk.c         | 2 --
>>  drivers/ata/ahci_platform.c    | 3 ---
>>  drivers/ata/ahci_st.c          | 3 ---
>>  drivers/ata/libahci_platform.c | 3 +++
>>  4 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/ata/ahci_mtk.c b/drivers/ata/ahci_mtk.c
>> index 1f6c85fde983..c056378e3e72 100644
>> --- a/drivers/ata/ahci_mtk.c
>> +++ b/drivers/ata/ahci_mtk.c
>> @@ -118,8 +118,6 @@ static int mtk_ahci_parse_property(struct ahci_host_priv *hpriv,
>>  				   SYS_CFG_SATA_EN);
>>  	}
>>  
>> -	of_property_read_u32(np, "ports-implemented", &hpriv->force_port_map);
>> -
>>  	return 0;
>>  }
>>  
>> diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
>> index 28a8de5b48b9..9b56490ecbc3 100644
>> --- a/drivers/ata/ahci_platform.c
>> +++ b/drivers/ata/ahci_platform.c
>> @@ -56,9 +56,6 @@ static int ahci_probe(struct platform_device *pdev)
>>  	if (rc)
>>  		return rc;
>>  
>> -	of_property_read_u32(dev->of_node,
>> -			     "ports-implemented", &hpriv->force_port_map);
>> -
>>  	if (of_device_is_compatible(dev->of_node, "hisilicon,hisi-ahci"))
>>  		hpriv->flags |= AHCI_HFLAG_NO_FBS | AHCI_HFLAG_NO_NCQ;
>>  
>> diff --git a/drivers/ata/ahci_st.c b/drivers/ata/ahci_st.c
>> index 7526653c843b..068621099c00 100644
>> --- a/drivers/ata/ahci_st.c
>> +++ b/drivers/ata/ahci_st.c
>> @@ -168,9 +168,6 @@ static int st_ahci_probe(struct platform_device *pdev)
>>  
>>  	st_ahci_configure_oob(hpriv->mmio);
>>  
>> -	of_property_read_u32(dev->of_node,
>> -			     "ports-implemented", &hpriv->force_port_map);
>> -
> 
> With arm:allmodconfig, this results in:
> 
>   CC [M]  drivers/ata/ahci_st.o
> drivers/ata/ahci_st.c: In function 'st_ahci_probe':
> drivers/ata/ahci_st.c:147:24: error: unused variable 'dev' [-Werror=unused-variable]
>   147 |         struct device *dev = &pdev->dev;
> 
> Guenter

Just pushed a fix for this in ata tree for-next and for-6.1 branches. The
problem should be resolved with the next linux-next merge.

-- 
Damien Le Moal
Western Digital Research


