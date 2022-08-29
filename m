Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F245ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 09:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9x7MrBDZZXO7wYq4wLaj2YiQyKj0UASH1XG+L4cp738=; b=qZUlB8uh8mJ92Zh3PX37sT425n
	kqG84s8fvVZYqgDAaDtQi7yhocM9dwk3VHkEB9nKFmwslsSNlA48LbmkZx4k5nDe8XVgTilDgsba2
	DnZRjFIHAcJJrfiPKSroBJUod9LMA5x6n7S7elMRMsp4wQfi87xhdO69V0PAHTEtaKm/MjFvbcCf5
	DC6+RzXVG/y49+d13aqSsDcectGBA/pF4SGg7hrjGSGUAy6M5aay0jPa6Kbl0SOknKnHOOmXUbjlo
	YyI0MDJM3RGOfqjzkT07sPRPr7K8mIzdlBQojEaXzThq+tkTOzJhgy5QH/bB/Cu+u9ZGRWdCMI0nW
	vtomBOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSb7e-006l6L-Vd; Mon, 29 Aug 2022 09:31:59 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSb78-006kpn-C9; Mon, 29 Aug 2022 09:31:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 186426601DB2;
	Mon, 29 Aug 2022 10:31:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661765482;
	bh=vj0TZu2ctXuLgzUFUUVacwwsrQ4oDpOKmllM1Y9zDdk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hgwIRCJXGnE9dl7xULH91Ei9q6Ctojg6u8vx4hspoFV6G0rm+fHoPjMzCNYlPVshN
	 nneu/iBSUYJu+jugutZply26bKo0b4RIZmACogZIKqWB0C3uATjLajmAZhdhv696VJ
	 MkbtFRrvbJNtzoE5SBJWoEpYE89khHwKnVef3QF1aHoLb0Dd6KGLlYQY2CgdtWCCAb
	 KdgsY1Iz3V+cDFVYeiCxO2LGN0hrZ4uBcdfdJPmodmSnvdMRFU2JPO2AmQzEj8CJoj
	 0DSx1IlAigoyWUvXegEnM7TgJgKKRy21yKD1GsGV3VKU1OYushCtuAH45XMbKPRH4+
	 OJBp/UdhT/8Zw==
Message-ID: <5350956c-fbab-6eee-071a-8b24b74e741c@collabora.com>
Date: Mon, 29 Aug 2022 11:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock drivers
Content-Language: en-US
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Miles Chen <miles.chen@mediatek.com>, yassine.oudjana@gmail.com,
 bgolaszewski@baylibre.com, chun-jie.chen@mediatek.com,
 devicetree@vger.kernel.org, ikjn@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 sam.shih@mediatek.com, sboyd@kernel.org, tinghan.shen@mediatek.com,
 weiyi.lu@mediatek.com, wenst@chromium.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <NJC6CR.M4CF312LSXXV1@gmail.com>
 <20220520093501.28758-1-miles.chen@mediatek.com>
 <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
 <lAB8fLfWTwUu6FUqPZWoKNEC0ZPYHnvo05u6BGriYQVjanlTzorHaZAflEbzoml-0UVZe-02r6CfzKwGdBCp7E0YeT_hF86P26r-Zeivda4=@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <lAB8fLfWTwUu6FUqPZWoKNEC0ZPYHnvo05u6BGriYQVjanlTzorHaZAflEbzoml-0UVZe-02r6CfzKwGdBCp7E0YeT_hF86P26r-Zeivda4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_023126_821589_9B9CA00D 
X-CRM114-Status: GOOD (  40.47  )
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

Il 13/08/22 12:44, Yassine Oudjana ha scritto:
> On Friday, May 20th, 2022 at 11:26 AM, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:
> 
>> Il 20/05/22 11:35, Miles Chen ha scritto:
>>
>>>>> Thanks for submitting this patch.
>>>>>
>>>>> I compare this with drivers/clk/mediatek/clk-mt7986-apmixed.c,
>>>>> and other clk files are using macros to make the mtk_pll_data array
>>>>> more readable.
>>>>
>>>> I'd actually argue that macros make it less readable. While reading
>>>> other drivers I had a lot of trouble figuring out which argument
>>>> is which field of the struct, and had to constantly go back to the
>>>> macro definitions and count arguments to find it. Having it this
>>>> way, each value is labeled clearly with the field it's in. I think
>>>> the tradeoff between line count and readability here is worth it.
>>>
>>> It is easier for multiple developers to work together if we have a common style.
>>>
>>> How do you think?
>>
>>
>> In my opinion, Yassine is definitely right about this one: unrolling these macros
>> will make the code more readable, even though this has the side effect of making
>> it bigger in the source code form (obviously, when compiled, it's going to be the
>> exact same size).
>>
>> I wouldn't mind getting this clock driver in without the usage of macros, as much
>> as I wouldn't mind converting all of the existing drivers to open-code everything
>> instead of using macros that you have to find in various headers... this practice
>> was done in multiple drivers (clock or elsewhere), so I don't think that it would
>> actually be a bad idea to do it here on MediaTek too, even though I'm not aware of
>> any rule that may want us to do that: if you check across drivers/clk/*, there's
>> a big split in how drivers are made, where some are using macros (davinci, renesas,
>> samsung, sprd, etc), and some are not (bcm, sunxi-ng, qcom, tegra, versatile, etc),
>> so it's really "do it as you wish"...
>>
>> ... but:
>>
>> Apart from that, I also don't think that it is a good idea to convert the other
>> MTK clock drivers right now, as this would make the upstreaming of MediaTek clock
>> drivers harder for some of the community in this moment... especially when we look
>> at how many MTK SoCs are out there in the wild, and how many we have upstream:
>> something like 10% of them, or less.
>>
>> I see the huge benefit of having a bigger community around MediaTek platforms as
>> that's beneficial to get a way better support and solidity for all SoCs as they
>> are sharing the same drivers and same framework, and expanding the support to more
>> of them will only make it better with highly valuable community contributions.
>>
>>
>> That said, Yassine, you should've understood that you have my full support on
>> unrolling these macros - but it's not time to do that yet: you definitely know
>> that MediaTek clock drivers are going through a big cleanup phase which is, at
>> this point, unavoidable... if we are able to get the aid of scripts (cocci and
>> others), that will make our life easier in this cleanup, and will also make us
>> able to perform the entire cleanup with less effort and in less overall time.
>>
>> With that, I'm sad but I have to support Miles' decision on this one, and I also
>> have to ask you to use macros in this driver.
> 
> I'm picking up this series again now after taking a long break to allow for
> ongoing cleanup and refactoring work to settle down. I was going to make this
> change but then I couldn't find the PLL macro defined in any common header.
> It seems that it is defined in every driver that uses it, with slight variations
> in some of them. Should I just do the same, or would it be better to define it
> in clk-pll.h? Also, would now be a good time to unroll the macros in all drivers,
> or is it still too soon?

Hello Yassine,
I'm sorry for the very late reply to this topic, but I just got back from vacation.

Please follow the current way of defining the PLL macro into the SoC-specific
driver: MediaTek folks are in the process of implementing Frequency Hopping (FHCTL)
on supported PLLs so "some things may change"... maybe in your driver too... I'm
not sure, though, whether MT6735 does support FHCTL and anyway, even if it does,
I would recommend to just go without it as a first step, as adding FHCTL capability
will be done on all(?) of the supported SoC clock drivers as soon as it lands.

> 
> Another thing: Since I've been out of touch with the cleanup work for a while,
> it would be great if someone makes me aware of any pending cleanup patches that
> I should know of so that I base my patches on them and avoid duplicating work.
> 

Simply check linux-mediatek, but I don't think that there's anything in the
pipeline that would be blocking your MT6735 drivers.

Cheers,
Angelo

