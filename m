Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B14CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:26:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5761B61BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 18:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5761B61BC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Qtz23bOd0ur7qhs6hkNuUCHmIMs6H1pjqMz6NNpqhs=; b=NwiZ7cozcVSBlp
	anTnBtb8D5NjFUDwR6fKY9mNGrKreJn9HAP3glpl+WoAaPyHHOgWQInA0Y72moj9+ku8sHPwqdzlV
	pFDjh91iZw7r6BALLatTocewjTVaO+/cc1K7vqCDvp9Hoqb1b+QbMPqhl7taoo9oaxayeOwY9FtQB
	EinnOj/AiC7BUTursX3Mwug8LQRmYxm5fKptrWN776oUrSQqPqVX+em0FQOp1tie0N42+Al8y2iku
	608RPSrcLhM0zIIC25Pb0acmv/eP4dn7PidGMj0rgDkc/GiEZ+FSOWT8LOWbt39Gq0/YysCxTebmo
	YTKDT4XFlkLhw+RcOk2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnPdA-00667m-IR; Wed, 17 Nov 2021 18:26:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnPcy-00665X-Az; Wed, 17 Nov 2021 18:25:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 z1-20020a05600c220100b00337f97d2464so4297877wml.1; 
 Wed, 17 Nov 2021 10:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=G7G8W0BwjuPQUTXmQCbe21vRGF/FX9hA/NUXXvMNUjA=;
 b=bNJZubZrX9lNwlAaeq6JY34hjksclyRVH4bz88ZHSTUulSsCKkizYd38z4TPV15nx9
 G9uVCl/6Blbv41M2mN7lK+91g8T0lJIET9KfbAvwGV+KBQ46v/Y4MaT1oQZfKeJIJ2uB
 2041ZRN39sxrqXFgldaYqNzm1x0fu9X5nn6HRdDFJUl89bNnt9d7Me9zvRIle5F6PPqc
 zTZwWOvWw6BTlXoFHEHL+fnZyFlN0suNcXwuH/PqXC60Tb7Y1rfDLN820NPcS4MkS0fc
 jN7iGJbsdYeUeeQaUf3UirkNVykZsvbkDPJq8tbb9vSQbQw5AtgxBEH/rEYok+ITn4mD
 IGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=G7G8W0BwjuPQUTXmQCbe21vRGF/FX9hA/NUXXvMNUjA=;
 b=H0wfv5NJl9xgOezxRCQbvcxkfDtfVSz6eJ9BVgvYzmX3GenRHr7Anx//Ch2IGeFBuc
 NhpSJSqahlEl0tlr+bpMeusLVcX1NZWMRwOPASiYI4vO9OBWfIas8TKygFcTOtLaSDy/
 yOw+aNkUjmBfTxU9c2rT4asgpxubQ42VtZs0j8I/nepiTxL9g3yUPAxxA8zVA6A4/Zi7
 UfMCDqlGBU4Q8pax+KyCG/hHz1T0IIu+aHHhH3DHLLNWFZRzv4b8susHHoZ1ePU6v0pu
 egkuDHt8Fe9YhPxOwavYbYo1EkATm7Tjhl9DR73544C3tMSEsi1WjvwwZGrueC5YFyhE
 wrfA==
X-Gm-Message-State: AOAM533eyIGlxTtqJoKxun6TFLXnMighxF2w0OW7L8fZa1RqefuVI2tV
 4+DOXeRPoy4VoodmPcZf1A4=
X-Google-Smtp-Source: ABdhPJz7prFVL8Kf87mpUo4bZKTKleodF0ij46ILO/eK+EJgDoglCzg3ljYPbM7CH5KcGXrbrxiOIA==
X-Received: by 2002:a05:600c:3586:: with SMTP id
 p6mr2159019wmq.34.1637173547010; 
 Wed, 17 Nov 2021 10:25:47 -0800 (PST)
Received: from [192.168.0.18] (static-160-219-86-188.ipcom.comunitel.net.
 [188.86.219.160])
 by smtp.gmail.com with ESMTPSA id 10sm894453wrb.75.2021.11.17.10.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 10:25:46 -0800 (PST)
Message-ID: <174aef7b-64ac-ab45-5283-01662dcc86ce@gmail.com>
Date: Wed, 17 Nov 2021 19:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] arm64: dts: mt8183: add dpi node to mt8183
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pi-Hsun Shih <pihsun@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, DTML <devicetree@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20211110192417.4177741-1-fparent@baylibre.com>
 <03de9880-1f1a-b07b-6ec3-279945e08cea@gmail.com>
 <CAOwMV_wmyFiSxdU7BZ-u+OLfStp+4jrwmmo-QaNvZn0HBH7Q1g@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAOwMV_wmyFiSxdU7BZ-u+OLfStp+4jrwmmo-QaNvZn0HBH7Q1g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_102548_434594_C8E4B6E5 
X-CRM114-Status: GOOD (  17.31  )
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



On 17/11/2021 19:21, Fabien Parent wrote:
> Hi Matthias,
> 
> 
> On Wed, Nov 17, 2021 at 6:33 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>>
>>
>> On 10/11/2021 20:24, Fabien Parent wrote:
>>> From: Pi-Hsun Shih <pihsun@chromium.org>
>>>
>>> Add dpi node to mt8183.
>>>
>>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>>> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>> ---
>>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
>>>    1 file changed, 11 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> index ba4584faca5a..7c283c0b68b5 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
>>> @@ -1443,6 +1443,17 @@ dsi0: dsi@14014000 {
>>>                        phy-names = "dphy";
>>>                };
>>>
>>> +             dpi0: dpi@14015000 {
>>> +                     compatible = "mediatek,mt8183-dpi";
>>> +                     reg = <0 0x14015000 0 0x1000>;
>>> +                     interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
>>> +                     power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
>>> +                     clocks = <&mmsys CLK_MM_DPI_IF>,
>>> +                              <&mmsys CLK_MM_DPI_MM>,
>>> +                              <&apmixedsys CLK_APMIXED_TVDPLL>;
>>> +                     clock-names = "pixel", "engine", "pll";
>>
>>
>> We are missing the output port node, don't we?
> 
> The output port node is defined in: [PATCH 2/3] arm64: dts: mediatek:
> mt8183-pumpkin: add HDMI support
> Unlike MT8173, there is no HDMI IP in the MT8183 SoC.
> 

Ok, I missed that because the thread is broken. Would you mind to just resend 
the whole series?

Thanks,
Matthias

>>
>> Regards,
>> Matthias
>>
>>> +             };
>>> +
>>>                mutex: mutex@14016000 {
>>>                        compatible = "mediatek,mt8183-disp-mutex";
>>>                        reg = <0 0x14016000 0 0x1000>;
>>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
