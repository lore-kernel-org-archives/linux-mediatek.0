Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC71C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:17:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E774D2067C
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:17:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s6ofUGna"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E774D2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DuOxVc25QR4RrG5Vqwo5MXRUk3UT0NIDnB84X3ZSEfQ=; b=s6ofUGna1aVrF3oDJv6MwVBv9
	YKxI8MmsqPgcTvBLCV4EuYlI5Cm0rHH1QO5WQToqGMYusYDkz7XnvhgKr/yTC7/6nEdTYtShOjHmy
	FeqRC6IDSZWpJW0HKXRNjLeOx4coF+cihG3+TNpXxHKQ6VsPxJckGZN28KU0SEFqSbsvUl0kiUbyf
	LvH8yLkNsBCBjmK4nmM/nFby65Gr0fDXFwinF2e+RO1MVxXo/qj4yFqi1kr3xlOG56JeIIqSRTd3n
	lcQGEa/Pjzh57ZkeQbTvQOUxyFtMAGt6TaOnkTkTEjkJaXz6yBInSt6To+IIAsZoW8nvO7eorE35u
	y2M+PHltA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHlQ-0001if-SI; Thu, 10 Sep 2020 08:17:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHlL-0001hj-N7; Thu, 10 Sep 2020 08:17:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 3E3EF29B5AA
Subject: Re: [PATCH 1/2] arm64: dts: mt8173: elm: Set uart0 to mmio32 iotype
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20200910054635.3337487-1-hsinyi@chromium.org>
 <ba77586c-7902-9ce4-0f4f-ad1743596d85@collabora.com>
 <CAJMQK-j_Syejw1Bc53fN8OuRYppns7g_=EQW+PUDkQDhnwxvSw@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <944325c1-818e-934c-907d-7ff0493446b4@collabora.com>
Date: Thu, 10 Sep 2020 10:16:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAJMQK-j_Syejw1Bc53fN8OuRYppns7g_=EQW+PUDkQDhnwxvSw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041659_840700_6CD32852 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hsin-Yi,

On 10/9/20 9:57, Hsin-Yi Wang wrote:
> On Thu, Sep 10, 2020 at 3:20 PM Enric Balletbo i Serra
> <enric.balletbo@collabora.com> wrote:
>>
>> Hi Hsin-Yi,
>>
>> On 10/9/20 7:46, Hsin-Yi Wang wrote:
>>> Set uart0 iotype to mmio32 to make earlycon work with stdout-path.
>>>
>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>>> index a5a12b2599a4a..d54e62f72c65d 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
>>> @@ -1160,6 +1160,8 @@ &thermal {
>>>  };
>>>
>>>  &uart0 {
>>> +     reg-io-width = <4>;
>>> +     reg-shift = <2>;
>>
>> I am wondering if these properties are common enough to go to mt8173.dtsi
>> instead of here.
>>
> Since stdout-path is set on elm.dtsi (using uart0), so I add this
> attribute here.
> 

Why needs to be defined in the same place that stdout-path is set?

My guess is that reg-io-width and reg-shift are SoC specific, as they define how
the IO access to the register is done. In fact, I think that these properties
should be added in all the uarts, not only the one that has defined the stdout-path.

Cheers,
  Enric

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
