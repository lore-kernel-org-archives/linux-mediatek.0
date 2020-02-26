Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67A40C4BA21
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 20:37:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3554F24653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 20:37:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YleVLSrU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3554F24653
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5QF3tlkB9J/i7cM5YFnqBV4KvGSybQpwg72J08wuoc=; b=YleVLSrUA5Y/Zp
	nm7J3uu/XlRnf4IBzr4/5vIbDcHpqjnTiCtq1DxSv9UPhfzvxDxSuLRxoPADYwdvqjc/Yi5RSBsvK
	1HxuBnzaaaV84LK54Vsma8qkQJt/ak4avvlY0jowq6irkdfzqMMkPbLrF90x1gYO50QhTL3Eo29td
	4NilcXwI8gf1gZSuOrTHCFQXsNix1PBr7NQIz7Du3lbX4pEijFQ8645YHL/ACclLHaRfpqkmpjOet
	iWj9AC45v94zHMDw4wF/OrS91oAPVZ5Rjj8hbovyZHVbxWAM41X+Hc9SePk2XD+2VeKALJpxTLwOd
	2B7rLIJ86tQn5/0j8O6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j73QM-0006Bz-V0; Wed, 26 Feb 2020 20:36:54 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j73QB-00062V-Dw; Wed, 26 Feb 2020 20:36:43 +0000
Subject: Re: [PATCH v9 3/4] soc: mediatek: Move mt8173 MMSYS to platform driver
To: Ezequiel Garcia <ezequiel@collabora.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, robh+dt@kernel.org,
 mark.rutland@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de,
 airlied@linux.ie, mturquette@baylibre.com, sboyd@kernel.org,
 ulrich.hecht+renesas@gmail.com, laurent.pinchart@ideasonboard.com
References: <20200226105419.632771-1-enric.balletbo@collabora.com>
 <20200226105419.632771-4-enric.balletbo@collabora.com>
 <54b3cfed-92f3-54c8-05a1-90ef4c057e4c@infradead.org>
 <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <470ab4e2-ab10-19bd-aea4-9b081c9978a8@infradead.org>
Date: Wed, 26 Feb 2020 12:36:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <da1b0908ddac65d370609f35c78d4a618ac70268.camel@collabora.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>,
 Collabora Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya Wang <seiya.wang@mediatek.com>,
 sean.wang@mediatek.com, Houlong Wei <houlong.wei@mediatek.com>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Allison Randal <allison@lohutok.net>, Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2/26/20 12:29 PM, Ezequiel Garcia wrote:
> On Wed, 2020-02-26 at 07:40 -0800, Randy Dunlap wrote:
>> On 2/26/20 2:54 AM, Enric Balletbo i Serra wrote:
>>> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
>>> index 2114b563478c..dcd6481a14d0 100644
>>> --- a/drivers/soc/mediatek/Kconfig
>>> +++ b/drivers/soc/mediatek/Kconfig
>>> @@ -44,4 +44,11 @@ config MTK_SCPSYS
>>>  	  Say yes here to add support for the MediaTek SCPSYS power domain
>>>  	  driver.
>>>  
>>> +config MT8173_MMSYS
>>> +	bool "MediaTek MT8173 MMSYS Support"
>>
>> Hi,
>> Can this be tristate instead of bool?
>>
> 
> Wouldn't that conflict with
> the driver being a builtin_platform_driver,
> or am I just confusing things badly?

OK, it probably would conflict.

Thanks.

>> +	depends on COMMON_CLK_MT8173
>>> +	help
>>> +	  Say yes here to add support for the MediaTek MT8173 Multimedia
>>> +	  Subsystem (MMSYS).
>>> +
>>>  endmenu


-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
