Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AECAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 08:38:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59C6C611C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59C6C611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANZtNnZyjlXevjxDfsEQTRVgA//ww7XoQ6vnTr9vzj4=; b=jsQ2xn8u8pCegdpOWcYOknXXg
	v8uc0AG0+TyWel229aML3S/1m9zgxFQRty0tcB6oTNnpBPfw2IdkzdHZXD9sLEqp5tL+yvPW46KBo
	BxKEBIVLJbzisvR5NZrFimD38mSzmqZe+y54MznZybDft+/u7bC48VI7HwwPW4oGcdep8zzmmPAvs
	DBS903iBkz2XfQCDb2nQscjcqNBXyk5VVwdkTp6P0FYnNyhRMf4bFNTPXUJqqu7QlFeMLWmFvA2s8
	VZjPTPgr70N1o03C8DiVDKLxeMspW1Y+BSSe9P6jMaRB5qKDfmOpogdxAceyiAvpyVQGg6owa0KfA
	8mVKrcnoQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWxWE-00FNXe-I7; Thu, 15 Apr 2021 08:38:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxVr-00FNSW-B2; Thu, 15 Apr 2021 08:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=hsxY7yFG9/dzr3NAqi1lNpn2kWlRTcdXcwXkSlGbHdA=; b=YTzTLhReEk5ElVLif1JeTyolHm
 P1f3Co/w2qQC66+zGputzTkBvIIdSGn23IlOl3MghKX1ZrBAi0t4ytKc8+I2Zhe0xylShxxpA7LU5
 xvkVXTng4cn6A3nZjEQtDi4+ThzUnIwGpCrC2u34PmL2LopB2RpiOWzNeZImeN/n4kUfBmDVlZef5
 1xm/hcIZWobgA/uEQpB7cgGZ2bOQjXtCAxYhrbGxwSy391IUbkPinxhs34IaLAUFX/GcjrMa4ZCtG
 EInlXytaR2le58dQFDhV7UAarAf7GZzxexzw6TI3RYPo1FESJoX7b4CmGaOnRgQ1ozm052inn/UKh
 eB8uziRQ==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWxVo-008Nq6-I4; Thu, 15 Apr 2021 08:38:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 432ED1F42C47
Subject: Re: [PATCH 3/3] arm64: dts: mt8183-kukui: fix dtbs_check warnings
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, matthias.bgg@kernel.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <20210414144643.17435-1-matthias.bgg@kernel.org>
 <20210414144643.17435-3-matthias.bgg@kernel.org>
 <CANMq1KAxZ+QiRR7LgR22pvhs4us=ne_VtSM-S_byCC0N__6BZA@mail.gmail.com>
 <d87f20bd-2195-663b-dd0b-ea1fa2f28a46@gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <82fdfa6e-9c4d-7146-fd90-353e350159c2@collabora.com>
Date: Thu, 15 Apr 2021 10:37:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <d87f20bd-2195-663b-dd0b-ea1fa2f28a46@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_013808_761487_B9E55B29 
X-CRM114-Status: GOOD (  17.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On 15/4/21 9:47, Matthias Brugger wrote:
> Hi Nicolas,
> 
> On 15/04/2021 02:29, Nicolas Boichat wrote:
>> On Wed, Apr 14, 2021 at 10:46 PM <matthias.bgg@kernel.org> wrote:
>>>
>>> From: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> The dsi children don't have any reg property,
>>
>> Confused, see below.
>>
>>> so we don't need address and
>>> size cells. This makes dtbs_check happy.
>>>
>>> CC: Hsin-Yi Wang <hsinyi@chromium.org>
>>> CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> CC: Nicolas Boichat <drinkcat@chromium.org>
>>> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>> ---
>>>
>>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 3 +--
>>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> index ff56bcfa3370..f4dca6a33168 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> @@ -251,8 +251,7 @@ &cpu7 {
>>>
>>>  &dsi0 {
>>>         status = "okay";
>>> -       #address-cells = <1>;
>>> -       #size-cells = <0>;
>>> +
>>>         panel: panel@0 {
>>>                 /* compatible will be set in board dts */
>>>                 reg = <0>;
>>
>> ^^ isn't that... a reg property?
>>
> 
> Yes, that's my fault. I'm not quite sure why we would need this reg property. In
> any case also we have it present "dtbs_check W=1" throws the following warning:
> mediatek/mt8183.dtsi:1234.22-1246.5: Warning (avoid_unnecessary_addr_size):
> /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges" or
> child "reg" property
> 
> 
> Can you have a look at that?
> 

I think it is needed reg. See at
Documentation/devicetree/bindings/display/dsi-controller.yaml

Regards,
Enric

> Regards,
> Matthias
> 
>>> --
>>> 2.30.2
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
