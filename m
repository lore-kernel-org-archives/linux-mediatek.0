Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5189C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EvE+625dpoF9WqkII9k78FuZjrWxhhg/9uwlZ/B7YM=; b=0BQDGV2y/D3BZ8GqmKZN/q+k0m
	ulBeCfwGBX3nAXZiwQZuu/ESYbMlONyYGFn8T4RUFN27A39patLImvv9nZHxVlVs6SV8GmrR61CGp
	cYyS7AUpr6tNg/lNFY9RSpJSEZDBSdhQjfsPuD1kg5wJSAC4cDd97lh6wEBKze+bIHBVOxe4LTOjx
	oNzmU8Z0YzjMQMAEUfxJ3X7oWsnL3ig8euIEP3EUaGFD5uHHq/1X+ktu2Zg/YPGgU8WOF9xwx9iAL
	4akxQ0jUTk9XsIFF0jGMAvyepdrWO8w3KTkCqfDpVhM9l+FwGaA52Vyiy9FdWviuHNx/LaLDtkPlT
	h5qten3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0VC-00C0PD-FQ; Fri, 20 May 2022 11:09:02 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns0Uw-00C0HN-0v; Fri, 20 May 2022 11:08:47 +0000
Received: by mail-ed1-x52e.google.com with SMTP id fd25so10359360edb.3;
 Fri, 20 May 2022 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:message-id:in-reply-to:references
 :mime-version; bh=wlQFcAca27d557iyLHKZteGlwX1770hELz16/xPa+8Q=;
 b=bklKJ6UXW0xCPulf0dQx92suPVOMuz5yaRi7JTRNFJ7r4rIggcoMihm4zRWqbP8F5x
 9m3fANlOUQwSl7ioBZzNZBTs5jfsrLLwTTR96TwMQr1Mcat07nhwNMTja/igVl+wL/kQ
 PH03npVCT599dBx5BJe6bOQmfUACCoPKRfWG/44qMo+V3RAXVEl4WjxJdT17n67vwB7k
 ojWj8SNTvlWzIw/suxss3I4oPViyocM9sBbm3OaQKx8qi6TKMHOf9l5rPiUJYrwwcfsF
 x0G5lNy5dV17oAX2BbBEdNMK0PNrzNiR3amGgoRqnc8V78uLRpdziYwemlzLMi1w78cT
 703w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=wlQFcAca27d557iyLHKZteGlwX1770hELz16/xPa+8Q=;
 b=LDvSEI8A8yXXIzMfvKHUNvJgh2CCyA4i1hvUv4IbcHMR1Gt6MA1gjjXPdKJE+aHrbO
 CG3ndlP1QjeKLvVk1xc3puFyjWvEILa6bW9Vvo4/GHFP3LpTf3LQddR7NSUSmXExhxzS
 n6FsZvxi0GrCVBLmTU4E+6nw3QEc30S3n7bAOYGLRneD/GpftAxwv/w8++neaB1Kc2i5
 PQyYWDknjy6cfdFDFWGbVe+upVpcN0J8A3lxMvsJ3HDptwic3d/XnYKcuAn1d11tn5t/
 ICd5Rf7K2TmLItW3D44+ucU28RPUdsNDksUKNZbHkhPNoVS6EPu/W+MwuA9VxsjDnejP
 q6yg==
X-Gm-Message-State: AOAM532FsZl4Zlnu51CvYmQrgs7PBhV9aMLPHBCqfavLKjr4PaLdSNDO
 cc/No7gGRun9ROKESkENqzY=
X-Google-Smtp-Source: ABdhPJxf/pqeax60rE9s5Nx9mijIV86CCyBP/x+MpqXmCQE5BL3CUFZiZs7lK9NHw5gJl382GO8pjA==
X-Received: by 2002:aa7:d911:0:b0:42a:af69:e167 with SMTP id
 a17-20020aa7d911000000b0042aaf69e167mr10106367edr.54.1653044921181; 
 Fri, 20 May 2022 04:08:41 -0700 (PDT)
Received: from yassine-HP ([2001:1670:c:db50:2f51:85b4:f668:c64f])
 by smtp.gmail.com with ESMTPSA id
 eo20-20020a1709069b1400b006f3ef214e58sm3038018ejc.190.2022.05.20.04.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 04:08:40 -0700 (PDT)
Date: Fri, 20 May 2022 15:08:26 +0400
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock drivers
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Miles Chen <miles.chen@mediatek.com>, bgolaszewski@baylibre.com,
 chun-jie.chen@mediatek.com, devicetree@vger.kernel.org, ikjn@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 sam.shih@mediatek.com, sboyd@kernel.org, tinghan.shen@mediatek.com,
 weiyi.lu@mediatek.com, wenst@chromium.org, y.oudjana@protonmail.com,
 ~postmarketos/upstreaming@lists.sr.ht
Message-Id: <2MH6CR.16DFWCVHBCV@gmail.com>
In-Reply-To: <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
References: <NJC6CR.M4CF312LSXXV1@gmail.com>
 <20220520093501.28758-1-miles.chen@mediatek.com>
 <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_040846_103126_EDC6BCDA 
X-CRM114-Status: GOOD (  40.73  )
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


On Fri, May 20 2022 at 12:26:25 +0200, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 20/05/22 11:35, Miles Chen ha scritto:
>> 
>>>> 
>>>> Thanks for submitting this patch.
>>>> 
>>>> I compare this with drivers/clk/mediatek/clk-mt7986-apmixed.c,
>>>> and other clk files are using macros to make the mtk_pll_data array
>>>> more readable.
>>> 
>>> I'd actually argue that macros make it less readable. While reading
>>> other drivers I had a lot of trouble figuring out which argument
>>> is which field of the struct, and had to constantly go back to the
>>> macro definitions and count arguments to find it. Having it this
>>> way, each value is labeled clearly with the field it's in. I think
>>> the tradeoff between line count and readability here is worth it.
>> 
>> It is easier for multiple developers to work together if we have a 
>> common style.
>> 
>> How do you think?
>> 
> 
> In my opinion, Yassine is definitely right about this one: unrolling 
> these macros
> will make the code more readable, even though this has the side 
> effect of making
> it bigger in the source code form (obviously, when compiled, it's 
> going to be the
> exact same size).
> 
> I wouldn't mind getting this clock driver in without the usage of 
> macros, as much
> as I wouldn't mind converting all of the existing drivers to 
> open-code everything
> instead of using macros that you have to find in various headers... 
> this practice
> was done in multiple drivers (clock or elsewhere), so I don't think 
> that it would
> actually be a bad idea to do it here on MediaTek too, even though I'm 
> not aware of
> any *rule* that may want us to do that: if you check across 
> drivers/clk/*, there's
> a big split in how drivers are made, where some are using macros 
> (davinci, renesas,
> samsung, sprd, etc), and some are not (bcm, sunxi-ng, qcom, tegra, 
> versatile, etc),
> so it's really "do it as you wish"...
> 
> ... *but:*
> 
> Apart from that, I also don't think that it is a good idea to convert 
> the other
> MTK clock drivers right now, as this would make the upstreaming of 
> MediaTek clock
> drivers harder for some of the community in this moment... especially 
> when we look
> at how many MTK SoCs are out there in the wild, and how many we have 
> upstream:
> something like 10% of them, or less.
> 
> I see the huge benefit of having a bigger community around MediaTek 
> platforms as
> that's beneficial to get a way better support and solidity for all 
> SoCs as they
> are sharing the same drivers and same framework, and expanding the 
> support to more
> of them will only make it better with highly valuable community 
> contributions.
> 
> 
> That said, Yassine, you should've understood that you have my full 
> support on
> unrolling these macros - but it's not time to do that yet: you 
> definitely know
> that MediaTek clock drivers are going through a big cleanup phase 
> which is, at
> this point, unavoidable... if we are able to get the aid of scripts 
> (cocci and
> others), that will make our life easier in this cleanup, and will 
> also make us
> able to perform the entire cleanup with less effort and in less 
> overall time.
> 
> With that, I'm sad but I have to support Miles' decision on this one, 
> and I also
> have to ask you to use macros in this driver.
> 
> 
> I am sure - and it is my wish - to see MediaTek clock drivers 
> open-coding stuff
> instead of using macros, but that's something for the future - which 
> will happen
> after the more important cleanups.
> 
> After all, it will be just about running "gcc -E xxxx.c" and 
> copy-pasting the
> unrolled macros to the clock drivers, which will be pretty fast and 
> straightforward.
> 
> Sorry for the wall of text, by the way.
> 
> Cheers,
> Angelo

Fair enough. I'll switch to macros in the next version.

Thanks,
Yassine



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
