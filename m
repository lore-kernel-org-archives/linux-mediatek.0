Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF39AC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 18:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=txgtixKW7VrUQkrQdJH5MMVOgQ+O3F4VEtjOSuR+WFs=; b=i+xQ6YCpl4DHliDaTvT952suoQ
	OEOfImn9bAHDebVEOX+sChKcAAjdLhQIoT2bOc0TB6rGauV9OGqTekjyGHsadCTl6LA7AfiEuvhW6
	yCQ18IQGfCZQ16lAQVvtowiJEtllEjs9+ghG0BY8F+Y7oQP4BV/VZeXe8tMUX00c3+1oHXLVI7BUN
	Q2xiLvq+W+3GNpDonqwFBfk3urdvPVFJfBB/l/YPcUcZz2e8x9B+bqAG5ThWoWib7QpXCRkv0ThU5
	4tYONpY+wwj8t9ghjTwVyNfE1//7iPvaTFnEFoNQAqBUZSQjwE/7to0uyNge23n3nMbACAoYIH9uq
	1SxWtacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS056-003BFI-Ht; Tue, 14 Feb 2023 18:31:08 +0000
Received: from [2601:1c2:980:9ec0::df2f]
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pS04u-003BDQ-2H; Tue, 14 Feb 2023 18:30:56 +0000
Message-ID: <8e6977b8-d256-4e51-82b7-e36d6ca259dc@infradead.org>
Date: Tue, 14 Feb 2023 10:30:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] IRQ_DOMAIN: remove all "depends on", use only
 "select"
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Donggeun Kim <dg77.kim@samsung.com>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Peter Rosin <peda@axentia.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Rob Herring <robh@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230213041535.12083-1-rdunlap@infradead.org>
 <b8fb48b9-349d-4723-9b35-6471cb65b6b5@app.fastmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b8fb48b9-349d-4723-9b35-6471cb65b6b5@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 2/13/23 00:05, Arnd Bergmann wrote:
> On Mon, Feb 13, 2023, at 05:15, Randy Dunlap wrote:
>> IRQ_DOMAIN is a hidden (not user visible) symbol. Users cannot set
>> it directly thru "make *config", so drivers should select it instead
>> of depending on it if they need it.
>> Relying on it being set for a dependency is risky.
>>
>> Consistently using "select" or "depends on" can also help reduce
>> Kconfig circular dependency issues.
>>
>> IRQ_DOMAIN is selected 109 times and is depended on 3 times in
>> current linux-next. Eliminate the uses of "depends on" by
>> converting them to "select".
>>
>>  [PATCH 1/3] extcon: max8997: select IRQ_DOMAIN instead of depending on it
>>  [PATCH 2/3] of: OF_IRQ: select IRQ_DOMAIN instead of depending on it
>>  [PATCH 3/3] rtc: mt6397: select IRQ_DOMAIN instead of depending on it
> 
> From a Kconfig perspective, your reasoning makes a lot of sense.
> 
> Looking at the bigger picture, I wonder if we should just remove the
> option and make it unconditional. It is enabled in ever architecture
> defconfig other than alpha and sparc, and it's selected by a lot of
> very common options such as I2C,  GENERIC_MSI_IRQ, GENERIC_IRQ_CHIP,
> and PCI_HOST_GENERIC. Enabling the option on Alpha grows the kernel
> image from 9010KB to 9023KB, or on m68k Coldfire from 3346KB to
> 3351KB.

Marc, what do you think about this suggestion?

Thanks.
-- 
~Randy

