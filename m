Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A309FC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWsuDoawFPLcyrwnf5NObGaugP8ud2LBAqOfjRNz1Zk=; b=je2M8r0bSXzXaZlqHz2gIg9pHx
	0q2wBjHB50KDGYjfzz+3SnyX/CYgWysf4063MEIrBPLOTzSEjx9F54+FOUMbKGW+0/Skt7vwgm76M
	DlEwsqyAMCIV8asyk2zhjDV2RMITrNnqsqXEJMc71kYofdPQILDxVuWIFSYRszfIS3vYZIBYins2x
	rj115t+/5Bl4+k8sw3Rg6Y93+kmVehG5wiW5zCmINT5UQGNlVYvZLaKANzrETRNoN55GQl02hhFfE
	wk+WjU52EAvW/18Lx4VZzfChn8B+BsIiP7HQ+1rBaELONDezeE8WZXXERFbCatz4f1S7Y3V94F7XH
	Ft/5Be6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvNa-008GNV-HY; Mon, 25 Jul 2022 10:32:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvNO-008G9w-4K; Mon, 25 Jul 2022 10:31:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A01F666015E7;
	Mon, 25 Jul 2022 11:31:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658745108;
	bh=Kzl6rJAX0GE+A+bAr17TGLG58H0MIyUfgGavzI2ADVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dH6TcisVVQQWZ1moaYXa3FpXe5qu6/whfdViIddJFf3N/UhJ0RgBggkYUBfbOaRts
	 appcv0aLiHHo4JaPh1DSLYXkQOBHjIguBUlAnEpcNBy0Vvow0kw7p/VdKzLtcTSqs0
	 iySYxJxFCTfG/NIrW+6WMQ4JuD3jG0PbZvBuJ2IHSxoRNPljU09n7n7fwhAdapGGm9
	 dEUnTOaFLHW1klsUMRQdZA0HMRT3NfKIv/P2fABP5URL5wIKkJGePEE0OH2jH45Rqw
	 dQwSevPd2dswQ0wH7uD9F6zyAI3U451lzwweuuSrMcwPoG4wW+UbNrLnx3rEedJ72C
	 4jp54+HrjQPqQ==
Message-ID: <bcb8c2b4-a1ab-8646-9fcb-034a70f5a329@collabora.com>
Date: Mon, 25 Jul 2022 12:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: dts: mt8173-oak: Switch to SMC watchdog
Content-Language: en-US
To: Pin-yen Lin <treapking@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220725082447.2613231-1-treapking@chromium.org>
 <5856610d-510f-46dc-63b2-79e571956a7c@collabora.com>
 <CAEXTbpeHy6-WjLOyWFkncoHzBPM+6qq4w-kUoZj7=05gf8YBjw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAEXTbpeHy6-WjLOyWFkncoHzBPM+6qq4w-kUoZj7=05gf8YBjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_033150_336679_DA5081A2 
X-CRM114-Status: GOOD (  31.84  )
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

Il 25/07/22 12:19, Pin-yen Lin ha scritto:
> On Mon, Jul 25, 2022 at 4:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 25/07/22 10:24, Pin-yen Lin ha scritto:
>>> Switch to SMC watchdog because we need direct control of HW watchdog
>>> registers from kernel. The corresponding firmware was uploaded in
>>> https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.
>>>
>>
>> There's a fundamental issue with this change, I think.
>>
>> What happens if we run this devicetree on a device that does *not* have
>> the new(er) firmware?
> 
> I haven't tried this patch with an older firmware. I'll manage to
> build one for this.
>>
>> The kernel *shall not* get broken when running on devices that are running
>> on older firmware, especially because that's what was initially supported
>> and what is working right now.
> 
> Actually the current approach does not work *right*. The device boots,
> but the watchdog does not work properly.
> 

Is this a Chromebook firmware specific issue?

> Also, all MT8173 ChromeOS devices have this firmware updated, and we
> don't have other upstream users apart from mt8173-evb. Do we want to
> support the developers that are running upstream linux with their
> MT8173 boards?
> 

Upstream shall not be just about one machine: if we add support for a SoC there,
we shall support the SoC-generic things in the SoC-specific DTSI, and the machine
specific things in the machine-specific devicetrees.

Chromebooks are not the only machines using the MT8173 SoC (Chuwi, Amazon also do
have products using MT8173), so we shall not make the main mt8173.dtsi incompatible
with these machines.

>>
>> For this reason, I think that we should get some code around that checks
>> if the SMC watchdog is supported and, if not, resort to MMIO wdog.
> 
> What is the expected way to support this backward compatibility? Do we
> put the old compatible strings ("mediatek,mt8173-wdt" and
> "mediatek,mt6589-wdt") after "arm,smc-wdt" and reject it in the
> drivers if the firmware does not support it?

I don't know what's the best option to support both cases... Perhaps a good one
would be to check (in mtk_wdt? or in arm_smc_wdt?) if the arm_smc_wdt is actually
supported in firmware, so if the SMC one is registered, we skip the other.

>>
>> Regards,
>> Angelo
>>
>>
>>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>>> ---
>>>
>>>    arch/arm64/boot/dts/mediatek/mt8173.dtsi | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index a2aef5aa67c1..2d1c776740a5 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -528,10 +528,8 @@ power-domain@MT8173_POWER_DOMAIN_MFG {
>>>                        };
>>>                };
>>>
>>> -             watchdog: watchdog@10007000 {
>>> -                     compatible = "mediatek,mt8173-wdt",
>>> -                                  "mediatek,mt6589-wdt";
>>> -                     reg = <0 0x10007000 0 0x100>;
>>> +             watchdog {
>>> +                     compatible = "arm,smc-wdt";
>>>                };
>>>
>>>                timer: timer@10008000 {
>>>
>>
>>



