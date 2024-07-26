Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11A0C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JQD2q8RvWQuzXzosr+bWqo76imbRZ5nybrBnsTkCjsI=; b=pdfNOgANuj/CgpyUQ1IKAZEKut
	zOdN76V1HHwEwTzhtj5roydT/91pG8Kwv+uN7HAgl64AvTX47BlDTRM1TqjsXLEj01CiHghxJluY/
	4CD+3c3pcXpAFPL+YKRhJhMsufcWslOIKBwer1TtElDclyYGKy7Ezk7adyuKvobriFxddqHRPWFdn
	Y/25pWUMxx27F55o1zaD7hs3Z71C40enU0UjKS7J7rG3Dk+coLiin76Ew8CziL8ZWtUiU1eG5BOsy
	1fUy5ZFETKWsOIzexTg/hQIK/6wrw29KmPTmwWcfIo7yts4oluWY9Sqz6HXPOHZzZly21AFe2Higx
	rVU9IbeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJo0-00000003oqz-1Ngn;
	Fri, 26 Jul 2024 12:12:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXJnZ-00000003om7-3zXO;
	Fri, 26 Jul 2024 12:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721995908;
	bh=GZxo54bJ3f7Sd7a1JaifGKOqZ+KwanL7RY55M2lnB/g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4ghq22hIr7fcrDa/seMdPi4r/UV0Ezaw3LfsT1qeXJdtLlHCSryyNyJHu9n+zb9H1
	 p7FBhMMjPLUE78ce5iW82MMpYFCuHwX+kUOOJ4XqC28qg5P2Sq0U1+NPNJI1oOf5az
	 OzVLZ5WSFixRy2yilz71K0OKguPwOCcc0JUJBYJuTsQOTcaHIFXI73j6idwR9gQTGY
	 kVpwFg6RIHsGYeYQskcgTZyiTuxzA4Dq8lrjp7tAYI7q+bsG1qf6g3ChFkHf7o6343
	 IJRqch/jf5qFoL38JTXCDsUTEHF0S3uR7c4/ifGhWLQ9kj71MBdeM5+ckeN1EePCTS
	 k7jdWQe/2f+eQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3F55837804C6;
	Fri, 26 Jul 2024 12:11:47 +0000 (UTC)
Message-ID: <f12ba385-090b-4772-8c52-e515e25b00ac@collabora.com>
Date: Fri, 26 Jul 2024 14:11:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195: Add missing clock for xhci1
 controller
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240722-usb-1129-probe-pci-clk-fix-v1-1-99ea804228b6@collabora.com>
 <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5H_pxR18sHeqdWPy9_FARrnLwyyOHV4VXCn9p5OExseiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_051150_303563_57F58855 
X-CRM114-Status: GOOD (  27.96  )
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

Il 25/07/24 12:34, Chen-Yu Tsai ha scritto:
> Hi,
> 
> On Mon, Jul 22, 2024 at 11:27 PM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> Currently if the xhci1 controller happens to probe before the pcie1
>> controller then it fails with the following errors:
>>
>> xhci-mtk 11290000.usb: clocks are not stable (0x1003d0f)
>> xhci-mtk 11290000.usb: can't setup: -110
>> xhci-mtk: probe of 11290000.usb failed with error -110
>>
>> The issue has been tracked down to the CLK_INFRA_AO_PCIE_P1_TL_96M
>> clock, although exactly why this pcie clock is needed for the usb
>> controller is still unknown. Add the clock to the xhci1 controller so it
>> always probes successfully and use a placeholder clock name for it.
>>
>> Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
>> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 
> So I asked MediaTek about this, and it seems the correct thing to do is
> disable USB 3 on this host controller using the following snippet. The
> snippet is copy-pasted from our issue tracker and won't apply directly.
> 
> This is also seen in mt8395-kontron-3-5-sbc-i1200.dts, on which xhci1
> is used only for USB 2.0 on an M.2 slot.
> 

Uhm, okay, but why should USB3 be disabled on a controller that supports USB3?

I agree about disabling it on specific boards that use only the USB 2.0 lines of
this controller, but doing that globally looks wrong... and looks like being a
workaround for an error that gets solved with adding a clock as well.

In short, the question is: why would that be the correct thing to do?

Cheers,
Angelo

> 
> ChenYu
> 
> index 8b7307cdefc6..2dac9f706a58
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1447,6 +1447,7 @@
>                                        "xhci_ck";
>                          mediatek,syscon-wakeup = <&pericfg 0x400 104>;
>                          wakeup-source;
> +                       mediatek,u3p-dis-msk = <0x1>;
>                          status = "disabled";
>                  };
> 
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> index 2ee45752583c..cc5169871f1c 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
>> @@ -1453,9 +1453,15 @@ xhci1: usb@11290000 {
>>                                   <&topckgen CLK_TOP_SSUSB_P1_REF>,
>>                                   <&apmixedsys CLK_APMIXED_USB1PLL>,
>>                                   <&clk26m>,
>> -                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
>> +                                <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
>> +                                /*
>> +                                 * This clock is required due to a hardware
>> +                                 * bug. The 'frmcnt_ck' clock name is used as a
>> +                                 * placeholder.
>> +                                 */
>> +                                <&infracfg_ao CLK_INFRA_AO_PCIE_P1_TL_96M>;
>>                          clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
>> -                                     "xhci_ck";
>> +                                     "xhci_ck", "frmcnt_ck";
>>                          mediatek,syscon-wakeup = <&pericfg 0x400 104>;
>>                          wakeup-source;
>>                          status = "disabled";
>>
>> ---
>> base-commit: dee7f101b64219f512bb2f842227bd04c14efe30
>> change-id: 20240722-usb-1129-probe-pci-clk-fix-ef8646f46aac
>>
>> Best regards,
>> --
>> Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>>




