Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDA4C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 08:55:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B0FE613DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 08:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B0FE613DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HZ6QKv+QgzBWrGmSVx1rdwTx1bgmMjyE3xz+p8EVQWI=; b=aV/VohZyN5338ExBfkbNkM+Q7
	nIEA9Xn+8D3ZVKFA5DAUleyJ8c76vfBSZy5oIUotV1v3ygCnTdI4q1xEiqXUqnnVUWkYVDemhavPV
	DLqSqCJIDNVv1RawUkxXkddr5nN1XAQz0b0CqNKOgGPa+vKomhosTyx5l9+9yKX0stM8JZR3qc1+o
	ct/Ic9pj2fNi1zNDvnvWa63GfTQt7vIOi7OOxEDPHzEDPwSkAZUsrrNb6CBxZrn8zltV/18SbpnrR
	1tzXzvC8SFYFUrlVLAfyRf1odr+FPsPDzne0MspVFfaVe8XcnbO5lfSbWk/faR8McYpTZxSAE8/4r
	4XebiJmSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhTbO-007Z14-Sy; Fri, 14 May 2021 08:55:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTbD-007Yz6-Ex; Fri, 14 May 2021 08:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1sOhhft2cvrnQj2ja0Hg2Dl3P0atV6mOwL8KaCpEStQ=; b=YhkfD/0mFaXwk9M6RDI/ST4ccP
 hwr2w/Es6WEbn1wQxwHzNV7UZuGV0CARzeQQzCZDVYLCyOfeA0klskj3JAhNrFQnOsCoABAUmsFhX
 DRPfuBwRyZGWUpqUvmHQDJSr7Mv6PSCzmqxpX77bmE/9OvfHBnvT69a94uO/LcJac449h2q4buNMc
 RoqwxbeteCMruzsJRT1c1xPFZx2VrNqKtTpy+sbnLPYyFRn+8o+cvSR+H550Ax6wKPYuKPI4j8QZd
 /DG0qJqImy0ntseI0m5Wv1L698E6sVTiVhgZSoAdWtIgHFJoTcBkNTAY7umME6V98smex82qIXy5x
 9ymn4B2w==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhTbA-00Bpur-HP; Fri, 14 May 2021 08:55:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2055F1F430D3
Subject: Re: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
To: Ikjoon Jang <ikjn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, linux-input@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Hsinyi Wang <hsinyi@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210510092631.3141204-1-ikjn@chromium.org>
 <c5a253ba-6451-c538-39ea-c339c176afbb@gmail.com>
 <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <daeb031a-1992-704b-49bf-c935078f15f8@collabora.com>
Date: Fri, 14 May 2021 10:55:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CAATdQgDfQUVQQwL1KQZvRffUgE+ADcwjBReWhCnmNL3SSgoE-A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_015508_743807_00765839 
X-CRM114-Status: GOOD (  23.61  )
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

Hi Ikjoon,

Thank you for the patch.

On 13/5/21 3:45, Ikjoon Jang wrote:
> On Thu, May 13, 2021 at 12:38 AM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Ikjoon,
>>
>> On 10/05/2021 11:26, Ikjoon Jang wrote:
>>> Add a 'cbas' device node for supporting table mode switch in
> 
> tablet
> 
>>> kukui devices.
>>>
>>> Kukui platforms with detacheable base have an additional input
>>> device under cros-ec, which reports SW_TABLET_MODE regarding
>>> its base state (e.g. base flipped or detached).
>>>
>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>>> ---
>>>
>>>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> index ff56bcfa3370..40030ed48854 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>>>                       compatible = "google,extcon-usbc-cros-ec";
>>>                       google,usb-port-id = <0>;
>>>               };
>>> +
>>> +             base_detection: cbas {


This should be just cbas, remove base_detection. It was a bit confusing follow
these series. If [v5, 2/2] is already applied in hid tree, I'd suggest send a v7
version including:

[v7, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
[v7, 2/2] arm64: dts: mt8183: add cbas node under cros_ec

Both patches can go through the Matthias tree, but the first one also needs an
Ack from Lee Jones, MFD maintainer, which I think is not cc'ied, so unlikely to
give you the needed ack.

Thanks,
  Enric


>>> +                     compatible = "google,cros-cbas";
>>
>> I'm not able to find any binding description for this. It seems linux-next has
>> driver binding to this compatible, but the description is missing.
>>
>> Can you please clarify.
> 
> Yep, that's correct.
> Let me resend this with v2 after the dt-binding patch is applied.
> 
> In this series, I requested queueing these to hid tree:
> 
> [v5, 1/2] mfd: google,cros-ec: add DT bindings for a baseboard's switch device
> https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-2-ikjn@chromium.org/
> 
> [v5, 2/2] HID: google: Add of_match table to Whiskers switch device.
> https://patchwork.kernel.org/project/linux-input/patch/20210415032958.740233-3-ikjn@chromium.org/
> 
> Later I found that I missed a comment from [v5, 1/2]
> But only [v5, 2/2] part is already applied to hid tree as I asked for it.
> 
> I sent a v6 dt-binding patch is here (not yet applied)
> https://patchwork.kernel.org/project/linux-input/patch/20210512100832.3878138-1-ikjn@chromium.org/
> 
>>
>> Thanks,
>> Mathias
>>
>>> +             };
>>>       };
>>>  };
>>>
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
