Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hq3vmW4ufB4rVbDUozcj55BlzglPNQZnCleRbCcAY8s=; b=2HVfRudQ213KrG
	XZggqLptizwr8wL8lN2BsmvHEZGcWbUvzqS+qaUG2RJXM+KzDFDQnak7dGf2FxBswyp/m/aohI0as
	3iHVCxGnF8Q8wMl+zJKqB1Q/+BcI3A0oJI7coQXrr8Tgcs5720+xQIGiMeTI1FZcQ7l2jQZ0KPxEo
	J6GSOiJeaH2surxrTuEJFQE+ilDprj6fUmRe9IyvEPZki0vmLEF2vl8q1rFNFzVzAT3s6G8ZAJkzr
	t9qP+6BcTguQibRFlnx8+xCUKFP36MjPk79+5VBKJRsQVl84Dj7h9WsayrcrW4osQQ3gQBtxT75Qz
	KA23IsE1hli+uhXnHKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0Q1-00ByID-Nl; Fri, 20 May 2022 11:03:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns0OB-00Bx9k-1W; Fri, 20 May 2022 11:01:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JDBwHrPbTJ4tpt77w2LqDDOJJbykW5Zyzao/0qPmwms=; b=Sz7ZNtXBGjyf2pVjOMm6Wuq8Uh
 tHPqBt53ptetctJ/cfzqlYwPHD0BHWHxROB4/EyLSkApyo90+Uwn3OlcELzWos+O+W78m+mjyLlm7
 geLivpuy3hVUXGAv2msgIU7ZC+3Iox8vqth8Y3WKEvYm9Y+xSV2K8MHESDjLQB8GYTHI/Mn1Jrcuk
 xRSpS4zFswZGo2riljh3VArfR8v6mycZAdigjCXfFGKkDu8NTPRyYc8RI1+yHEtFXD2g3A9czNzWj
 tYq6d7FqdETzM7iwVfzmmA2WZPrctbWUM9yH9/drolvEgl73guK9ZvyCEdvpoY00kt576gwsrPiZR
 UaYK337Q==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrzq3-002JNl-RG; Fri, 20 May 2022 10:26:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 321991F46241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653042389;
 bh=HDf0MWYOCR8r+DZXQalTBiAOnmPm5YoK5f5O0omhcKw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mdAaBJ/ldoxoFkOrLMDVKqWZzcLoxCeB7GE3uaRVXxTozO8Y5+Hp6X5lUigIWNr7J
 Ktc7zWDmESvVXtv2Iad6ze8Kgxdg2WAsPRxKwZN+IPNJjbKZInkZDd2mV5ih49Z67M
 XGN+NHSZr59Q4aDq3Zytr23c5wpGqtrewmWFxkoqJ2UkmvdNHFw7qnVk9yUd+BKAHc
 /oT1lON2DU9i2X04vG27EVMGu2kvfSCyrhA2Eo/Ij66jU4RO4TRI1h3sFvHlRB1j6A
 33qLkIzS/BpuXD0hf1mRa5PSa1hrhF4FCjI51q6AQKa9lzIUyAHlQSyQ8xjT2cT/uG
 sv+GathARu3Mw==
Message-ID: <c7b98ee4-cd4f-d7b7-726d-1acd4fafd50a@collabora.com>
Date: Fri, 20 May 2022 12:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/4] clk: mediatek: Add drivers for MediaTek MT6735
 main clock drivers
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>, yassine.oudjana@gmail.com
Cc: bgolaszewski@baylibre.com, chun-jie.chen@mediatek.com,
 devicetree@vger.kernel.org, ikjn@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 sam.shih@mediatek.com, sboyd@kernel.org, tinghan.shen@mediatek.com,
 weiyi.lu@mediatek.com, wenst@chromium.org, y.oudjana@protonmail.com,
 ~postmarketos/upstreaming@lists.sr.ht
References: <NJC6CR.M4CF312LSXXV1@gmail.com>
 <20220520093501.28758-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220520093501.28758-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_112632_329216_85B310EB 
X-CRM114-Status: GOOD (  25.42  )
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

Il 20/05/22 11:35, Miles Chen ha scritto:
> 
>>>
>>> Thanks for submitting this patch.
>>>
>>> I compare this with drivers/clk/mediatek/clk-mt7986-apmixed.c,
>>> and other clk files are using macros to make the mtk_pll_data array
>>> more readable.
>>
>> I'd actually argue that macros make it less readable. While reading
>> other drivers I had a lot of trouble figuring out which argument
>> is which field of the struct, and had to constantly go back to the
>> macro definitions and count arguments to find it. Having it this
>> way, each value is labeled clearly with the field it's in. I think
>> the tradeoff between line count and readability here is worth it.
> 
> It is easier for multiple developers to work together if we have a common style.
> 
> How do you think?
> 

In my opinion, Yassine is definitely right about this one: unrolling these macros
will make the code more readable, even though this has the side effect of making
it bigger in the source code form (obviously, when compiled, it's going to be the
exact same size).

I wouldn't mind getting this clock driver in without the usage of macros, as much
as I wouldn't mind converting all of the existing drivers to open-code everything
instead of using macros that you have to find in various headers... this practice
was done in multiple drivers (clock or elsewhere), so I don't think that it would
actually be a bad idea to do it here on MediaTek too, even though I'm not aware of
any *rule* that may want us to do that: if you check across drivers/clk/*, there's
a big split in how drivers are made, where some are using macros (davinci, renesas,
samsung, sprd, etc), and some are not (bcm, sunxi-ng, qcom, tegra, versatile, etc),
so it's really "do it as you wish"...

... *but:*

Apart from that, I also don't think that it is a good idea to convert the other
MTK clock drivers right now, as this would make the upstreaming of MediaTek clock
drivers harder for some of the community in this moment... especially when we look
at how many MTK SoCs are out there in the wild, and how many we have upstream:
something like 10% of them, or less.

I see the huge benefit of having a bigger community around MediaTek platforms as
that's beneficial to get a way better support and solidity for all SoCs as they
are sharing the same drivers and same framework, and expanding the support to more
of them will only make it better with highly valuable community contributions.


That said, Yassine, you should've understood that you have my full support on
unrolling these macros - but it's not time to do that yet: you definitely know
that MediaTek clock drivers are going through a big cleanup phase which is, at
this point, unavoidable... if we are able to get the aid of scripts (cocci and
others), that will make our life easier in this cleanup, and will also make us
able to perform the entire cleanup with less effort and in less overall time.

With that, I'm sad but I have to support Miles' decision on this one, and I also
have to ask you to use macros in this driver.


I am sure - and it is my wish - to see MediaTek clock drivers open-coding stuff
instead of using macros, but that's something for the future - which will happen
after the more important cleanups.

After all, it will be just about running "gcc -E xxxx.c" and copy-pasting the
unrolled macros to the clock drivers, which will be pretty fast and straightforward.

Sorry for the wall of text, by the way.

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
