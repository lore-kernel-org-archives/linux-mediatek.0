Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=luTYtRIW3IobDiLOJWkWJLBTBRNjDi4zBd3qkW1b9OQ=; b=hGNNWk/nTX4PQa
	HYyeWD2vJWDMavzJQ2vGfUcJcpkiuKT4Lv+dnyB09/41D/UABRTTtM0wcn1hAGyf5+udEmrj5ga5c
	oXTjCyiAJ4litGje0XKcZ4ITZAP81GeI6XAeNFIEJW2s5jJs9D1iK9AQVAM3fBMzkHv3taD/TLkKR
	nk/wo/KjASFU6OAHavIG22DkZ8GOkmOSr2WgKlrYXQWOtJ4Rwk7vvIFRVFwa3qY6S80dUbE1kN7fK
	ttLPcurU5CnTPZMozpdQKv+Ex7cMSBu9yj0T2qd9dMoj/Vj8uggxQcfQ3F1wrqHAu58UnK2eD881+
	XGk+RUMGTU1YREg4j5kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqssQ-00CYkW-UE; Tue, 17 May 2022 08:48:22 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqssC-00CYed-5C; Tue, 17 May 2022 08:48:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so23692065wrg.12;
 Tue, 17 May 2022 01:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=dYNmO9yR7Q7576xbxhOmOadNAWD8PBDUv92pl5HZCXs=;
 b=F7g+xOm9FjaBFZkKHw9RG5giyrBniDa8HRlmwqzWRkPCGsgNMH0x3OgIgl6IHGcOu2
 m5iLNUOMlW+ZmanHnMaDUteT2t44SS4tMBmYlCBKLAMjyLPu3bCp3b1MMGoMSFNRYwUw
 GpdSvsmuxvpq7qXdxaWfZ+IEJVECVYTSRTHzHUDuZYmI3UFLsatDN9lYH0gWsy97yh4j
 UUYx7Ef9njEUVlgDrCQiPzJ9losGprQp0PSr2hKETLIs1i8oB73P300tJaQBpKx57Fj6
 xDoLCZfm/lttrhl62hal3RZB/yGZMeQTqnDv3jrBg+45yWqhjyVRzgcnZz9+yEwgs1Wz
 JdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=dYNmO9yR7Q7576xbxhOmOadNAWD8PBDUv92pl5HZCXs=;
 b=G1LDW7EGYcAIap18/IkWT+MTRYXdrKP7j56ILsAYyJZy9DDcZaqFRnaK5wLtN1bK7p
 g4FVR+OT3PZ6vuJ0YeMFkjN9xvNfbITH24cF9Y8nsslwPI7DUwBZB7qt5EBj4lmAyiOi
 FfuO+Shpq2O54JrrNCS21+oD6hQY8oeH26WDTTtrO3ZjS2v3QKQ5O66Xxb5zNbdeMvZy
 Ssx1OJSDqQRkvLXlgSJ43Enm1evgpCMdB7z51BXBOTOIPi/CTO4AXi2M3zI6OBeV+9Kr
 KRLRYH/SYLBilZOTjD3roqUrulWwSjbYP7pQjqJjNozLnbdDUClGBlr2ZV3yFlQdj+D1
 Z6mw==
X-Gm-Message-State: AOAM533u/60WpIWM64U76+wANouLmQLGkAvmD+AJyR2nXTao8Se79v1C
 +op0SYn6WpmpdBz+AnvISX8=
X-Google-Smtp-Source: ABdhPJyaSqlxkH+LHr5o/GxH2V7qOXxrecaZtXgSeCb5eYOvJdleQWKpRLslqOZqBFpTRdyVakQ1/A==
X-Received: by 2002:a5d:6351:0:b0:20d:1028:3c32 with SMTP id
 b17-20020a5d6351000000b0020d10283c32mr4847625wrw.331.1652777286426; 
 Tue, 17 May 2022 01:48:06 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm11324560wrd.86.2022.05.17.01.48.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 01:48:05 -0700 (PDT)
Message-ID: <739b3ccc-e8ac-2748-9d40-0666a4038876@gmail.com>
Date: Tue, 17 May 2022 10:48:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, y.oudjana@protonmail.com,
 jason-jh.lin@mediatek.com, ck.hu@mediatek.com, fparent@baylibre.com,
 rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-6-angelogioacchino.delregno@collabora.com>
 <8177c547-2a38-691b-0a32-bc7e6ba1e2ed@gmail.com>
 <b65546e1-2d3a-d525-b664-1730dc06994f@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 5/5] clk: mediatek: Add MediaTek Helio X10 MT6795 clock
 drivers
In-Reply-To: <b65546e1-2d3a-d525-b664-1730dc06994f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_014808_268424_726BE8A9 
X-CRM114-Status: GOOD (  29.77  )
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

Hi Angelo,

On 17/05/2022 10:07, AngeloGioacchino Del Regno wrote:
> Il 16/05/22 13:30, Matthias Brugger ha scritto:
>>
>>
>> On 13/05/2022 18:50, AngeloGioacchino Del Regno wrote:
>>> Add the clock drivers for the entire clock tree of MediaTek Helio X10
>>> MT6795, including system clocks (apmixedsys, infracfg, pericfg, topckgen)
>>> and multimedia clocks (mmsys, mfg, vdecsys, vencsys).
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Thanks a lot for taking care of this!
>> I just wonder if we couldn't build most of the clock drivers as modules like 
>> done for the mt6779. It would help us to keep the kernel image smaller.
>>
> 
> Hello Matthias!
> 
> You're welcome!
> ...but I simply couldn't stand at seeing partially working (..or actually, not
> really working) SoCs upstream. If something is upstream, it must work, or it
> shouldn't be here for real :-)
> 
> Regarding your question about the clock drivers as module... I believe we can,
> but that'd be only for {vdec,venc}sys and *maybe* MFG (gpu clocks): I don't know
> if it'd be worth to do, as these are about... 8 clocks out of... I haven't counted
> them, but more than 250, I think?
> 
> It *should* be straightforward though, just about giving them a tristate in Kconfig
> instead of a bool, but that would still be limited to just those three...
> 

I think you could guide yourself by looking at
f09b9460a5e4 ("clk: mediatek: support COMMON_CLK_MT6779 module build")


I think having clocks as modules is a criteria to be part of Android's Generic 
Kernel Image. Not that we target this here, just for your information (in case 
you didn't know).

> The reason for me excluding clk-mt6795-mm from this choice is that - at least for
> me - my development platform is a commercial smartphone, where the only thing that
> "saves you" is having some display output... I mean - I *do* have a UART port, but
> that's only because I've been able to solder thin wires on 0.2mm pads... you surely
> agree on the fact that this isn't a common practice, even across developers.
> 

Yes I was wondering if you got some development smartphone or you did the 
soldering. I have some solder knowledge but I think not enough to solder 
something like this :D

> Besides, if you think that clk-mt6795-mm should indeed be a module by default,
> well, that.. is.. possible - I don't see why it shouldn't be... obviously keeping
> in mind that this will largely slow down the boot process, which isn't a big issue.
> 

Well I don't want to bother you with minor details, most important thing is that 
we get support upstream... but ;) you can always mark the modules as compiled 
in, even if it's tristate, which in your case you want to do.

> In any case, it is *not* possible to compile as module *any* of the clock drivers
> that I have included in the CONFIG_COMMON_CLK_MT6795 (apmixed, infra, peri, topck)
> as.. you know.. these are "a bit critical" on older platforms :-)
> 
> 
> How would you proceed?
> 

I'd make all the drivers that theoretically can be build as modules tristate, 
you can then define for your development environment to make them build-in.

Sounds good?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
