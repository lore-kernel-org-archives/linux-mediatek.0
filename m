Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D3BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 08:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvruhvfSfb6aAUvRXjHuZ4dOBn9FjRgTc3Be3wlyiPg=; b=ke8vtxGh6wE0N6
	RZEWM8bne7UAkvZcQTk+lk3rxpk6aJPQ31o+qHgVd9tpAF3pQ5iggcGhQEvfNHpqdFHvKNmS7Gp0i
	EL7xun+gKRdDDk1H3QepznDbDzyc2obGjrQm2efDz+ODgaDVlPgxLhajPiRR+9CaBhCwCm9WFxryi
	YaPHwBHRtuLbcpayN838z5vARQlcYKKHT6kDdQlRFi927X0jSan8eMldjJPOjduth4iMp0Ea1lRAC
	aMmzh564DxduXWEHneCaxxdJsvFJ44IQGymTxPINydU25kTu1JyBHBW3kV+fbtTqhV0uwsC7cpmpx
	/U0Mdr+2ChjaSUcMcqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7Z2-00BVIM-BZ; Tue, 29 Mar 2022 08:50:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7Yx-00BVH1-Se; Tue, 29 Mar 2022 08:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1648543851; x=1680079851;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0r3zs2np5g1OGyfR5AfBJmzryAoR1xJqsqcoDejQqWU=;
 b=SvzazobpV11jWeMgpXo0FTvE1SLSgCyZ7Xqqf+G+mtJGMfNJ9dbOCrDf
 ysi5EidKWkWJ49RAyHugcujFV5Kw0oT1phK7DlUFPa6sZN1D1b/yMAXmv
 RCdj/QsyqhI3Z1SjDcDYeAcyh/VPEi7+sI5OLoYwx9CjtHPiYDaJevD76
 8I6jXHHTjFr79/zR8y4Bgh1Gy35vFCZqn2MULJmTFkyb95PUicosRdfrd
 ZDbhw2po6iiow2+V+HMacAd2XS96BryxDwBl6ib89n3nhoZYszcVOAd31
 VA5WMVXwoTHyfGGelRpyFs3vNbtaDve3Zad+K6r7cbpt8O6NzEkpqUN+Y A==;
X-IronPort-AV: E=Sophos;i="5.90,219,1643698800"; d="scan'208";a="158497460"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Mar 2022 01:50:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 29 Mar 2022 01:50:48 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 29 Mar 2022 01:50:41 -0700
Message-ID: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Date: Tue, 29 Mar 2022 10:50:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Santiago Esteban
 <Santiago.Esteban@microchip.com>, Cristian Birsan
 <Cristian.Birsan@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 <linux-actions@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-omap@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
 <linux-arm-kernel@axis.com>, <linux-aspeed@lists.ozlabs.org>,
 <linux-rpi-kernel@lists.infradead.org>, <chrome-platform@lists.linux.dev>,
 <linux-renesas-soc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <kernel@dh-electronics.com>,
 <linux-mediatek@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
 <linux-tegra@vger.kernel.org>, <linux-oxnas@groups.io>,
 <linux-arm-msm@vger.kernel.org>, <linux-unisoc@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-realtek-soc@lists.infradead.org>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_015052_008233_4845F7E3 
X-CRM114-Status: GOOD (  16.75  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ansuel, All,

On 28/03/2022 at 10:55, Daniel Palmer wrote:
> Hi Ansuel
> 
> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>>
>> Hi,
>> as the title say, the intention of this ""series"" is to finally categorize
>> the ARM dts directory in subdirectory for each oem.
> 
> While I agree with this change and think it's for the good (browsing
> the ARM dts directory at the moment is frustrating..) I think
> buildroot and others need to be told about this as it'll potentially
> break their kernel build scripting for ARM and probably messes up the
> configs they have for existing boards.

This aspect mustn't be underestimated and I anticipate lots of issues 
during a long time on this particular topic of "build systems".

Another aspect is CI and public or private testing farms we all have 
running.

These aspects always refrained me to change anything in the naming 
scheme of our DT files, but if we go in this direction, we must really 
be prepared and I'm still not convince it's worth it...


If this has to happen, I would also like to queue some file name changes 
to do all modifications in one go in order to lower the annoyance level 
of those who would need to adapt to those changes.

BTW, is there a common scheme for dts/dtsi file naming? Is it more 
enforced in one way or another for arm64 in a sense that I can take some 
norm as an example?

[..]

Best regards,
   Nicolas



-- 
Nicolas Ferre

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
