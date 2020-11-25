Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B814BC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 03:31:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F42022087C
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 03:31:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ozinmsgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F42022087C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S+SQzZh3VO5+IOyur8x7lfIPtsjKxaXF9tj2LnUO9Ns=; b=ozinmsgJrY/G/ezh2chP2S3Ls
	Ylp+CxUY740Uuia2Pn+0PbZo5zfx07Q85K3hWtz0SjjsXWkRG/xjFoZz9CAXV4Qa21jkml7GiXMiI
	h/kLzp4kvHGHQ4nUBe7mVBm+ibI2ZDsFZI1fo9OAp9Z9X+sLHDAoQlVhoxqOYAy0fFKH6q8zTKZTB
	CBDTzxl9qZW1tYekvZp0X2+azmxxCkf8+eXSRUqkNUZDC34Ds7+uSwtk2Uc/aDDXfKH6GgAAncoD9
	yemt7D0lrinNTOcjx9GwbvaTXXy+jcqGHW/HYRmM5n5sOeM2GtI9PYvHWCJk/GJQH6FFSuWio0YGK
	G8jzogn0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khlWX-00007G-CV; Wed, 25 Nov 2020 03:31:17 +0000
Received: from [2601:1c0:6280:3f0::cc1f]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khlWU-00006x-ET; Wed, 25 Nov 2020 03:31:14 +0000
Subject: Re: [PATCH] phy/mediatek: Make PHY_MTK_XSPHY depend on HAS_IOMEM and
 OF_ADDRESS to fix build errors
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>
References: <1606211233-7425-1-git-send-email-yangtiezhu@loongson.cn>
 <1606271044.32484.20.camel@mhfsdcap03>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d3cee8b0-b699-a51a-ff33-568e10cb2df7@infradead.org>
Date: Tue, 24 Nov 2020 19:31:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1606271044.32484.20.camel@mhfsdcap03>
Content-Language: en-US
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Xuefeng Li <lixuefeng@loongson.cn>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/24/20 6:24 PM, Chunfeng Yun wrote:
> Hi Tiezhu,
> 
> On Tue, 2020-11-24 at 17:47 +0800, Tiezhu Yang wrote:
>> devm_ioremap_resource() will be not built in lib/devres.c if
>> CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
>> not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
>> set, and then there exists two build errors about undefined
>> reference to "devm_ioremap_resource" and "of_address_to_resource"
>> in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
>> make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
>> ---
>>  drivers/phy/mediatek/Kconfig | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
>> index 50c5e93..66df045 100644
>> --- a/drivers/phy/mediatek/Kconfig
>> +++ b/drivers/phy/mediatek/Kconfig
>> @@ -30,6 +30,8 @@ config PHY_MTK_XSPHY
>>  	tristate "MediaTek XS-PHY Driver"
>>  	depends on ARCH_MEDIATEK || COMPILE_TEST
>>  	depends on OF
>> +	depends on HAS_IOMEM
>> +	depends on OF_ADDRESS
> Why not add them into deconfig but here? In fact I don't know which way
> is better and follow the kernel rule.
> 
> Vinod and Kishon, do you have any suggestion about this?

Putting them into a defconfig won't prevent random build errors
while putting them here will (or at least should).

>>  	select GENERIC_PHY
>>  	help
>>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
> 

The patch LGTM.

Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
