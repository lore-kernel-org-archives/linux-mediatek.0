Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD839C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9OKGIq0j9v1xkGEDa6JJVUiIcQkL1viOfsS1LX3+W28=; b=tZ8EIVAnsKVSfbrqW2r0WlrLL7
	8U/LZdp7r0JOVZp71Q7zOYXwdB+zqU9y8ft3+5Xqx0zNQVfSMrrNfgpq+w7vVsu80tQ8P2j9C7Kdr
	r2aBkmVojWBEf3cT3I5dxBhLaJo39/KRW9kOv1SpKcw3ap4rNhMMVEk5kFWYgZ97DFjM1nPpRexKu
	y15RfhuvvuGJ1lDeWBDoVLo0FePGllDQ3N/N30qIFebWw5cgdOmPaKi7yHWzSmXBpS2ZBjT6GGd2q
	7ZyTOAZltpVhXD1zLiJzwow7Fk4ncg2m5YlPJnolsudy5pQH/ub4R9LqjPJCI6iWheBNwjAhrXGJ2
	sMGhXwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLIV-0000000ARwu-2Dqt;
	Mon, 29 Jul 2024 07:59:59 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYLI4-0000000ARsC-0dvk;
	Mon, 29 Jul 2024 07:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239970;
	bh=fzVSMdR2QxHZlMfsS7rulnJXcfjo/rELHom0IR6qjsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=zHQiCVl2n0w7TV43R1MMuAInYVtVCnw5Mls9c6zb7s742CpKptJrfechxO3jWcbPD
	 aWLabwPjjBXHbXY8b86v83LeK3T7Pj3zPoni9gM5JbcmCTPFvMlheP4Ygacl58Fvus
	 R2bPjPNa+ISI1dkutCDNA9ATWs5Ie3vmdxOrJ6Wa2TXn1EU7p5x3KeJB1hAOgv46tm
	 SO+nH7Qs/oW1yWEkaTzfid3X4a4cjzCNLgm7SqDNUVQgSmHGFEMpPDvRL2YdpeYMoq
	 vG36aU6ca4xoQbq82O8OqP61VbSbXeUpsSZOqKvRrJitTpa/7fcAAzH/QrAKxvKUu1
	 tVgTtLwPfVwJg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1324A37809CE;
	Mon, 29 Jul 2024 07:59:30 +0000 (UTC)
Message-ID: <51f0f4f3-11a5-4d74-981e-3f24f8475c7f@collabora.com>
Date: Mon, 29 Jul 2024 09:59:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1
 controller
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
 <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com>
 <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5G92=-k5MDH4BPcM8tgPwcGTJ60trJwr7BwTGHD=wpnDw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_005932_348106_A267B692 
X-CRM114-Status: GOOD (  28.07  )
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

Il 26/07/24 17:11, Chen-Yu Tsai ha scritto:
> On Fri, Jul 26, 2024 at 8:11 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
>>> Hi,
>>>
>>> On Mon, Jul 22, 2024 at 11:27 PM Nícolas F. R. A. Prado
>>> <nfraprado@collabora.com> wrote:
>>>>
>>>> Currently if the xhci1 controller happens to probe before the pcie1
>>>> controller then it fails with the following errors:
>>>>
>>>> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
>>>> xhci-mtk 11290000.usb: can't setup: -110
>>>> xhci-mtk: probe of 11290000.usb failed with error -110
>>>>
>>>> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
>>>> clock, although exactly why this pcie clock is needed for the usb
>>>> controller is still unknown. Add the clock to the xhci1 controller so it
>>>> always probes successfully and use a placeholder clock name for it.
>>>>
>>>> Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
>>>> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
>>>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>
>>> So I asked MediaTek about this, and it seems the correct thing to do is
>>> disable USB 3 on this host controller using the following snippet. The
>>> snippet is copy-pasted from our issue tracker and won't apply directly.
>>>
>>> This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhci1
>>> is used only for USB 2.0 on an M.2 slot.
>>>
>>
>> Uhm, okay, but why should USB3 be disabled on a controller that supports USB3?
>>
>> I agree about disabling it on specific boards that use only the USB 2.0 lines of
>> this controller, but doing that globally looks wrong... and looks like being a
>> workaround for an error that gets solved with adding a clock as well.
>>
>> In short, the question is: why would that be the correct thing to do?
> 
> We can disable it in mt8195-cherry.dtsi then?

That device does not use this controller, so yes we can disable it, but that still
doesn't resolve the issue pointed out by Nicolas...!

Please note that the issue that he sees doesn't happen only on Tomato, but also on
other MediaTek MT8195/MT8395 boards - and applying this commit makes disabling the
controller, or disabling the USB 3 lines on the controller, kinda redundant, as
this will effectively fix probing it... but again, fixing the actual issue with
this controller is something that must be done.

Disabling the controller on Tomato is a different topic - here we are discussing
about fixing the issue, and that will happen, again, on any board that has this
controller enabled with USB3 lines. :-)

So, unless there is any specific reason for which applying this commit is a bad
idea, or any alternative fix to this that is better than the proposed one, and
not a workaround... I'm applying this one.

Cheers,
Angelo

> 
> ChenYu
> 
>> Cheers,
>> Angelo
>>
>>>
>>> ChenYu
>>>
>>> index 8b7307cdefc6..2dac9f706a58
>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>> @@ -1447,6 +1447,7 @@
>>>                                         "xhci_ck";
>>>                           mediatek,syscon-wakeup = <&pericfg 0x400 104>;
>>>                           wakeup-source;
>>> +                       mediatek,u3p-dis-msk = <0x1>;
>>>                           status = "disabled";
>>>                   };
>>>
>>>> ---
>>>>    arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
>>>>    1 file changed, 8 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> index 2ee45752583c..cc5169871f1c 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>>>> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
>>>>                                    <&topckgen CLK_TOP_SSUSB_P1_REF>,
>>>>                                    <&apmixedsys CLK_APMIXED_USB1PLL>,
>>>>                                    <&clk26m>,
>>>> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
>>>> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
>>>> +                                /*
>>>> +                                 * This clock is required due to a hardware
>>>> +                                 * bug. The 'frmcnt_ck' clock name is used as a
>>>> +                                 * placeholder.
>>>> +                                 */
>>>> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>;
>>>>                           clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
>>>> -                                     "xhci_ck";
>>>> +                                     "xhci_ck", "frmcnt_ck";
>>>>                           mediatek,syscon-wakeup = <&pericfg 0x400 104>;
>>>>                           wakeup-source;
>>>>                           status = "disabled";
>>>>
>>>> ---
>>>> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
>>>> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
>>>>
>>>> Best regards,
>>>> --
>>>> Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>>>
>>>>
>>
>>
>>


