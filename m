Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94618C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxL8IXJxK6nZZcgY+jbWAe4cJBK0AaStast6oXjM8uc=; b=h9PmWVzwrxW6GUCViNBnvK4WZc
	5q2IloXxIRXuCX+PAOVgigqeyyyKyzzfieuGYW7pa8BhT6k4iGXK8PdrzGGwv8mjYXi5B9dReq1Xz
	W5quSPhLJfS6fhT0cWGuDM3bFtRMFBu0C1P+yQSydKenxvfb5JA2zJTSOyqlQPaczWDzjns3fLRck
	SawZ7Bpbga98bokTm+x5MX/OHzL4LLjqFSn1CIkPdOZOTIrlatDKUGNWfA3F5VjDNstU/L9aKjekS
	tOEEkSOus3Q8IcdgVU20zUyx93ChIyzOpSMTemt0IMogHjj905BvIzadjikDoh6L4i/aexzfYJ4th
	Ywy+xeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDza-009M3C-1V;
	Tue, 24 Oct 2023 09:46:30 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvDzW-009M1g-1d
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:46:28 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083f613275so35048355e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698140783; x=1698745583; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxL8IXJxK6nZZcgY+jbWAe4cJBK0AaStast6oXjM8uc=;
        b=yEMFoAhG2vl3+pA8QbxcHsYGqCb4oz66Jy6NmmEnqdcTrSmJS7u8znP6VCCzdM39Z2
         LgvqTzrvjcnawYzFYF+K2kdqyyHSrUQfE84NdPxWMCepGjhA/REbp24r30nSTAfn5sFf
         nV2O3NtJ5Hl3CGtdoh7+C8Ixotkx1BrYG+nK+3Ix4x2Wf/yHhYNIz2UXsoX6mZzXaogg
         rcyO6avx6H18jzyqJdfjeaJzMl7Vz/myyIvKFTnyYs8oRSTXarrnNyzuKlMM3VkdbLus
         VsA3s5qaEd3YLcJEYszTTWYPQyrG3g3TdBJJDbrDXWnfvyLS/iyvKc4mj2OcuGpz4TLs
         7uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140783; x=1698745583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YxL8IXJxK6nZZcgY+jbWAe4cJBK0AaStast6oXjM8uc=;
        b=f5A2twIvPUul0IviPXNtggUE3doUhgfWIabAjyDziwl1ZzUhdPLuHy+f4KLbQQstLG
         JCiirnZbbFCwbYSCcNUX8EsPABuc+JRymwBdvPsfAg3rZc6iJt7pcepxwGl694pzljf8
         Xat09UQDm8hkiUkgvxidRRDrIjSWewexxA8hMP+FzcxpF+36geoud3oDoOyctxjpUlKG
         KE3yicrgu8rHDekY4qEio+PhYefAMuNO5BtgjKd/FDhpErKDigI2LfT/WI7IX4NPkn52
         pi+DDzHRHaBdSaI6GYnswFvcz0Jh4eKWh3C/e6w9cUVpgTusUVm6wgrX/SXmTyNXqy5T
         zl8A==
X-Gm-Message-State: AOJu0YzfDbXrGyUjsOgquhLSZXwdQ3bW4Ywffe7QHx/1OnmqhNaAmrHP
	08UhIl3oyoERZD6QYzjRK3YP7L4a+YEX3YPIHBD9OQ==
X-Google-Smtp-Source: AGHT+IGuXGfq4qBu5yB+kGBPSeAFqqYtQZB3elN3KJ3fMidrIDYRjfHKeVHnH6iQcYfviEGedXATNw==
X-Received: by 2002:a7b:c8c2:0:b0:409:101e:235a with SMTP id f2-20020a7bc8c2000000b00409101e235amr901405wml.28.1698140782643;
        Tue, 24 Oct 2023 02:46:22 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id r8-20020adff108000000b0032db1d741a6sm9602052wro.99.2023.10.24.02.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:46:22 -0700 (PDT)
Message-ID: <314a5b37-bdc4-41d1-a3de-c6d557628be9@baylibre.com>
Date: Tue, 24 Oct 2023 11:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] arm64: dts: Add MediaTek MT8188 dts and evaluation
 board and Makefile
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231023083839.24453-1-jason-ch.chen@mediatek.com>
 <20231023083839.24453-5-jason-ch.chen@mediatek.com>
 <a1846955-e6d9-4217-8c9f-1f20be166f4b@baylibre.com>
 <CAGXv+5Gdr4DuiGAZFdVdqjj8Rv2Onq78k+=Mmu0MOe=rxQkr3A@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAGXv+5Gdr4DuiGAZFdVdqjj8Rv2Onq78k+=Mmu0MOe=rxQkr3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_024626_551909_7A581044 
X-CRM114-Status: GOOD (  21.01  )
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



On 24/10/2023 11:36, Chen-Yu Tsai wrote:
> Hi,
> 
> On Mon, Oct 23, 2023 at 6:55 PM Alexandre Mergnat <amergnat@baylibre.com> wrote:
>>
>>
>>
>> On 23/10/2023 10:38, Jason-ch Chen wrote:
>>> From: jason-ch chen <Jason-ch.Chen@mediatek.com>
>>>
>>> MT8188 is a SoC based on 64bit ARMv8 architecture. It contains 6 CA55
>>> and 2 CA78 cores. MT8188 share many HW IP with MT65xx series.
>>>
>>> We add basic chip support for MediaTek MT8188 on evaluation board.
>>>
>>> Signed-off-by: jason-ch chen <Jason-ch.Chen@mediatek.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>>>    arch/arm64/boot/dts/mediatek/mt8188-evb.dts | 387 ++++++++
>>>    arch/arm64/boot/dts/mediatek/mt8188.dtsi    | 956 ++++++++++++++++++++
>>>    3 files changed, 1344 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-evb.dts
>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
>>> index e6e7592a3645..8900b939ed52 100644
>>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>>> @@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
>>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r5-sku2.dtb
>>>    dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb

..snip..

>>
>> Order:
>>
>>
>> #address-cells = <1>;
>> #size-cells = <0>;
>>
>> pinctrl-0 = <&nor_pins_default>;
>> pinctrl-names = "default";
> 
> I think pinctrl-names before pinctrl-* makes more sense. We declare the
> names and by extension how many pinctrl-N entries are needed first. The
> vast majority of the arm64 device tree files have pinctrl-names before
> pinctrl-N. The only platform that exclusively has pinctrl-N before
> pinctrl-names is amlogic.
> 

AFAIK, people have it own logic explanation to justify order.
Personally, I use the dumb and generic one: pack related properties and 
alphabetical order.

Anyway, I don't have strong opinion of that

> If there's a preference for a particular order platform-wide or tree-wide
> then it should probably be documented somewhere?
> 

I'm agree

>> status = "okay";
> 
> I think #address-cells and #size-cells belong at the end of the list,
> even after "status", just before any child nodes. They describe
> properties or requirements for the child nodes, not for the node they
> sit in.
> 
>>> +
>>> +     flash@0 {
>>> +             compatible = "jedec,spi-nor";
>>> +             reg = <0>;
>>> +             spi-max-frequency = <52000000>;
>>> +     };
>>> +};
>>> +
>>
>> ..snip..
>>
>>> +
>>> +&pmic {
>>> +     interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>>> +};
>>> +
>>> +&scp {
>>> +     memory-region = <&scp_mem_reserved>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&spi0 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spi0_pins>;
>>
>> Order:
>>
>> pinctrl-0 = <&spi0_pins>;
>> pinctrl-names = "default";
>>
>> Please apply this to other nodes
> 
> See above.
> 
> ChenYu
> 
>>> +     status = "okay";
>>> +};
>>> +
>>> +&spi1 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spi1_pins>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&spi2 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spi2_pins>;
>>> +     status = "okay";
>>> +};
>>> +
>>> +&u3phy0 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&u3phy1 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&u3phy2 {
>>> +     status = "okay";
>>> +};
>>> +
>>> +&uart0 {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&uart0_pins>;
>>> +     status = "okay";
>>> +};
>>> +
>>
>> ..snip..
>>
>>> +             };
>>> +     };
>>> +};
>>
>> After that:
>> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
>>
>> --
>> Regards,
>> Alexandre

-- 
Regards,
Alexandre

