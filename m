Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C23C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 10:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRa8fd2YEIHvXJW6erDn27mDqiCsivgX1/NWkDYcYt8=; b=XQ+TMtcueY52Pr7RGQ7TyNVolT
	npftMcCl3+Kc3YpUHM1iTTTMwNyy8O4YaUk3kSqWTRky6cyowCpB25h9HLvuNQOS1HrkaqHom+xCl
	xr7Jr1taqbIUe2h5OfM5Ja/g1ieo4/SsK6nL1lcOKEWvL2NT6BcbKS2sWLFZo5XL9vp3p6m0jTYBr
	BQk8Y9q5NHM8tKex+SSH7IsV1/libplC7MRLfASfFb6XgKzqn7tRUa/NQBbuIdY2eOC06yo8UXAJg
	CCC4KDuLJKFKasoV5IhcziH2fkJr1nbukroh5ikoWm7ua7FdER37xYKcBfHbSG7T4OhSt3Wi++2Pe
	zbl6+JgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmMh-000000021FE-1gmH;
	Thu, 09 Jul 2026 10:52:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmMe-000000021EO-23HF
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 10:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783594330;
	bh=r6FjVnEXwE0IGEmKbTI/hDFm3Nf0DQ8S1T/ck81JAEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h2ekCjMHC5AgjXntNqWY2j4muZT4FhN2htvXPl6KTYk6Q165IBO2SsF+8avDrAiAB
	 EhRlP3kE/rtBT7T08UutOjZ0+eh2EJnuWkxuPSf6UcdNixIRWTr09OY8W2ap4y4tWk
	 HNkpSmpXODFp6wchiKv//DRKOxAVrC0A3ODgdVmC16tu1zKhfppxyTgOMl4ryDZnZ2
	 TsGTpWr1QlZL4/hGoSMJXgad7fYUfUGaeFspvSFQrXXz/b+XLWJBZmBlhoDG/JTay+
	 jjXJqxzewxs9WHRrPOrubkTnmrtNxLNtXNVZDm0KpyXDWOGKEdsEK4DYa2CvWjSCBh
	 XsUdhdJHIYmjw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E9ADA17E0886;
	Thu, 09 Jul 2026 12:52:09 +0200 (CEST)
Message-ID: <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
Date: Thu, 9 Jul 2026 12:52:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: Chen-Yu Tsai <wenst@chromium.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Mark Brown <broonie@kernel.org>
References: <20260709081928.612294-1-wenst@chromium.org>
 <20260709083024.330381F000E9@smtp.kernel.org>
 <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_035220_753339_E61B82D7 
X-CRM114-Status: GOOD (  25.82  )
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

On 7/9/26 11:27, Chen-Yu Tsai wrote:
> On Thu, Jul 9, 2026 at 4:30 PM <sashiko-bot@kernel.org> wrote:
>>
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315_PP mode ganging in the regulator driver, causing silent cross-talk between the CPU and EMI VDDQ regulators.
>> - [Low] Grammatical error in the comment explaining the firmware workaround.
>> --
>>
>> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC ---
>> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
>> Author: Chen-Yu Tsai <wenst@chromium.org>
>>
>> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
>>
>> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
>> DRAM.
>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> index 8e423504ec052..af05315092f53 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
>> [ ... ]
>>> @@ -1225,6 +1235,70 @@ &spi2 {
>>>        status = "okay";
>>>   };
>>>
>>> +&spmi {
>>> +     pinctrl-names = "default";
>>> +     pinctrl-0 = <&spmi_pins>;
>>> +     #address-cells = <2>;
>>> +     #size-cells = <0>;
>>> +     status = "okay";
>>> +
>>> +     pmic@6 {
>>> +             compatible = "mediatek,mt6319-regulator", "mediatek,mt6315-regulator";
>>> +             reg = <0x6 SPMI_USID>;
>>
>> [Severity: High]
>> Does this fallback compatible trigger incorrect mode ganging?
>>
>> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, which
>> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
>> Geralt's MT6319, vbuck4 is wired as an independent regulator for
>> pp0600_emi_vddq.
>>
>> If a mode change happens on vbuck1 (which is allowed by the
>> regulator-allowed-modes property), the driver will apply the ganged
>> mask and silently overwrite vbuck4's mode bits in the PMIC, potentially
>> forcing the RAM supply into an unexpected mode.
>>
>> Could this silent cross-talk between the CPU and EMI VDDQ regulators
>> lead to memory voltage instability?
> 
> This discrepency is actually bigger than Sashiko mentions. The ganging
> supported by the driver only applies to the PMICs in the Asuarada design:
> 
>    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
>    - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)
> 
> On the Cherry design we have:
> 
>    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
>    - SPMI ID 7 has 1+2+3+4 (big cores)
> 
> On the Corsola designs with beefier chips:
> 
>    - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused
> 
> On the Geralt design (this one):
> 
>    - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)
> 
> Any ideas on what to do about this mess?

wenst, I think that the only way to fix that properly is to add generic support
for buck phases ganging in the regulator API... because AFAIK there's nothing
right now.

 From what I remember from last time I looked, MediaTek PMICs wouldn't be the
only ones, there's something else that also has ganged bucks, and again if I
remember correctly, I remember seeing one platform data struct for each of the
ganging combinations in that driver.

So.. especially because MTK wouldn't be the first, I think the addition of some
kind of generic properties (and callbacks) for this kind of configuration in
the API would be both profitable and welcome.

Mark, any considerations?

Cheers,
Angelo

> 
> Another thing is that I kind of wonder why the mode configuration register
> setting isn't ganged in hardware like the enable and voltage settings.
> 
> 
> Thanks
> ChenYu
> 
>>> +             pvdd1-supply = <&pp4200_s5>;
>>> +             pvdd2-supply = <&pp4200_s5>;
>>> +             pvdd3-supply = <&pp4200_s5>;
>>> +             pvdd4-supply = <&pp4200_s5>;
>>> +
>>> +             regulators {
>>> +                     /*
>>> +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
>>> +                      *
>>> +                      * However, this device originally shipped with a broken
>>> +                      * firmware that causes register reads over SPMI fail.
>>> +                      * This is fixed in firmware version 15842.175.0, which
>>> +                      * is included in ChromeOS releases R150-16700.22.0 or
>>> +                      * R151-16721.0.0 and later.
>>> +                      *
>>> +                      * Assigning the cpu-supply properties for CPU6 and CPU7
>>> +                      * without the fix will likely cause CPU DVFS to stop
>>> +                      * working. Hence the assignment is left out to avoid a
>>> +                      * regression of the function. If the user is confident
>>> +                      * that their system has the fix, they can added the
>>
>> [Severity: Low]
>> This isn't a bug, but there is a typo in this comment. It should say
>> "they can add the property themselves".
>>
>>> +                      * property themselves.
>>> +                      */
>>
>> --
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260709081928.612294-1-wenst@chromium.org?part=1


