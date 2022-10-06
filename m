Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B03C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 14:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97WAAh8OYbPwE1VraZizCnXFTwIUHTAOrn+MgxKsawo=; b=uUlr59hCOgY6/Qe/jeZ1i5G2Qg
	G5gOXhq135CWOF7P6XswF1pha+1lK5mxh+L+aBUGQvz9L6jciXyL9DkZh1guaXX+vZVBA/ekQp871
	cxux1cDs3rDNDlXVOBxvYcTz3ZXzwPx7t7rrX/h2otIE33qZvpB3tGiW0OA7Vfsfu10OorKSi+f8m
	n4/HcDVxB3kWGFqQblk69FYWi1rimzbjaJl8Xk1ugLOPy0UhQ/ws7HnHledC21Y340VrdZaZhjoio
	Xug+BY9eX2XhpJqlcputx0LB0bgDkb5gjlA/dLKcH6atVg+dbFhx4rtTqTKsJCOcUNbRlDUYLhCgu
	tH8siB+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogSH9-0039YW-DI; Thu, 06 Oct 2022 14:55:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogSGx-0039UF-Rc; Thu, 06 Oct 2022 14:54:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DC2A7660230B;
	Thu,  6 Oct 2022 15:54:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665068085;
	bh=IQCnEzZigQHrzB+nUt6kW9RUJVaUj1MUSMnLbLmGB0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MFT/RB+BGh/FNY5GSkl5jKp9sP9xwE84tbkDIOznCxPf+FMu2zIXC/XDwxCXoFQL4
	 Rj/Ks/ayPrkbV+sZvxmJx3TmX8M9Pmt/hn73r1si5bLJlhhBN8RAluuFResJGsb9cO
	 3xQ3segLKiVnCr9/iPon1OvfkZuz32JitZ7y53uznY7vd8qIy89mDVQ3nNqIUS3gih
	 RnRoVUvdkMqaPM1Zo67ctZvYkHNfnI+howMIGp3+vWPqebhwtYMllBoeMyRlAwPuXN
	 hEolg09ECduKr0XDPVPbnCCXWgfg14CkF0Lz1dvaNuhXdVV+ZTYIFcdo+mRYzWQZ2j
	 T1nUxIrBYM13w==
Message-ID: <6dbfaee8-8c72-85b5-495d-dcb62f18c154@collabora.com>
Date: Thu, 6 Oct 2022 16:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] phy: mediatek: tphy: add debugfs files
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20220929080926.1272-1-chunfeng.yun@mediatek.com>
 <20220929080926.1272-2-chunfeng.yun@mediatek.com>
 <09bc1393-dd30-3c96-3309-f822994f4aab@collabora.com>
 <6ca1eb83b7a776fd6b7e58e6940eab5ce5f7fb63.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <6ca1eb83b7a776fd6b7e58e6940eab5ce5f7fb63.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_075452_162090_F54B3FA1 
X-CRM114-Status: GOOD (  18.39  )
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

Il 06/10/22 16:42, Chunfeng Yun ha scritto:
> On Thu, 2022-09-29 at 11:02 +0200, AngeloGioacchino Del Regno wrote:
>> Il 29/09/22 10:09, Chunfeng Yun ha scritto:
>>> These debugfs files are mainly used to make eye diagram test
>>> easier,
>>> especially helpful to do HQA test for a new IC without efuse
>>> enabled.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>> v2: add CONFIG_PHY_MTK_TPHY_DEBUGFS suggested by AngeloGioacchino
>>> ---
>>>    drivers/phy/mediatek/Kconfig        |   5 +
>>>    drivers/phy/mediatek/phy-mtk-tphy.c | 403
>>> +++++++++++++++++++++++++++-
>>>    2 files changed, 407 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/phy/mediatek/Kconfig
>>> b/drivers/phy/mediatek/Kconfig
>>> index 3125ecb5d119..e9fdfe9f519f 100644
>>> --- a/drivers/phy/mediatek/Kconfig
>>> +++ b/drivers/phy/mediatek/Kconfig
>>> @@ -27,6 +27,11 @@ config PHY_MTK_TPHY
>>>    	  multi-ports is first version, otherwise is second version,
>>>    	  so you can easily distinguish them by banks layout.
>>>    
>>> +config PHY_MTK_TPHY_DEBUGFS
>>> +	bool "Add T-PHY Debugfs Files"
>>> +	help
>>> +	  Say Y here to add debugfs files mainly for T-PHY HQA test.
>>> +
>>>    config PHY_MTK_UFS
>>>    	tristate "MediaTek UFS M-PHY driver"
>>>    	depends on ARCH_MEDIATEK || COMPILE_TEST
>>> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c
>>> b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> index e906a82791bd..d9509e1314a4 100644
>>> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
>>> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
>>> @@ -7,6 +7,7 @@
>>>    
>>>    #include <dt-bindings/phy/phy.h>
>>>    #include <linux/clk.h>
>>> +#include <linux/debugfs.h>
>>>    #include <linux/delay.h>
>>>    #include <linux/iopoll.h>
>>>    #include <linux/mfd/syscon.h>
>>> @@ -264,6 +265,8 @@
>>>    
>>>    #define TPHY_CLKS_CNT	2
>>>    
>>> +#define USER_BUF_LEN(count) min_t(size_t, 8, (count))
>>> +
>>>    enum mtk_phy_version {
>>>    	MTK_PHY_V1 = 1,
>>>    	MTK_PHY_V2,
>>> @@ -310,6 +313,7 @@ struct mtk_phy_instance {
>>>    	struct clk_bulk_data clks[TPHY_CLKS_CNT];
>>>    	u32 index;
>>>    	u32 type;
>>> +	struct dentry *dbgfs;
>>
>> Unused when !IS_ENABLED(CONFIG_PHY_MTK_TPHY_DEBUGFS)
> Yes, it will be NULL.
> 

I was meaning that you should ifdef that out...

Regards,
Angelo

>>
>>>    	struct regmap *type_sw;
>>>    	u32 type_sw_reg;
>>>    	u32 type_sw_index;
>>> @@ -332,10 +336,389 @@ struct mtk_tphy {
>>>    	const struct mtk_phy_pdata *pdata;
>>>    	struct mtk_phy_instance **phys;
>>>    	int nphys;
>>> +	struct dentry *dbgfs_root;
>>
>> Same here
>>
>>>    	int src_ref_clk; /* MHZ, reference clock for slew rate
>>> calibrate */
>>>    	int src_coef; /* coefficient for slew rate calibrate */
>>>    };
>>>    
>>> +#if IS_ENABLED(CONFIG_PHY_MTK_TPHY_DEBUGFS)
>>> +
>>
>> ..snip..
>>
>>> +
>>> +static void tphy_debufs_init(struct mtk_tphy *tphy, struct
>>> mtk_phy_instance *inst)
>>
>> Please fix typo "debufs" -> "debugfs",
> Will fix it, thanks a lot
> 
>> here and everywhere else.
>>
>> Apart from that, it looks good to me.
>>
>> Regards,
>> Angelo
> 

-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


