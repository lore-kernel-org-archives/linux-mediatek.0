Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EDAC197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 19:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FSK6hIQJd016Vc2pUsye+fL2zqDQZTr43hPQ56brR4=; b=yKdE+1We1gPvw3098HyXOJJ5oE
	nI3NmHyt0hUyD3a6lmlP06pf2xnguCkW07JvNjSSFWxQmC+XgDqAaPgEMSBP8gL5kPwhoJLPW2j6E
	+Rey4VlNOjgNxF6PqspeqtCINDJl/CCz01aWdx8x7vS0u6UYf0k2FkMXhoyaes/pbTOC6GJfVFrmM
	DJ8OgzmGIoR0XVYhtBlKZ0DOlZZmI+EBG3tH3kjjZkWFd4amiSSO5xpdg79NKD7KepxCZ3AO5x+nD
	zGsBaJq/UOy4aEBLCKWcv2CQLFum38de8kkHJ3IW7/Y8TKuTQpR7qUHRqqgPo6Bl8jWqv/1R2Ld4t
	rn8kv9Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r59kc-00EgNB-0z;
	Mon, 20 Nov 2023 19:16:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58ey-00EDeO-0N;
	Mon, 20 Nov 2023 18:06:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=3FSK6hIQJd016Vc2pUsye+fL2zqDQZTr43hPQ56brR4=; b=YT8L408n63/T7fmlmYPXQBbbMJ
	y50+rdkUdNsr2i6IPZ2q2IijbpCBe9W/f7GpbgLA7wCdnjO1CcQuHLv0Ql493MQ0MmuiDp+WnhvWp
	VpEExfbZaDDRBM5OkA1fxyV9iDf0xznJwL7PMW3N3K0FHQpRudm6lx4VTHaWezGJstCkAvBRTiXrN
	itIcTM8+seqNQqd7zy2N7x/mE2b3CkTODKTy1kwIerV1gDAqi2tPaDWmkG3ApI+6uGnak/S6DPJ+o
	C0h2rLvMszVOyai7tffoieXyMXJb5PhV//xxAM6JFcRow5bfIYJv0jH5fr4FRC/+fLElCL2j69KYq
	XyPw0+rQ==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r58eu-00B3r6-0y;
	Mon, 20 Nov 2023 18:06:10 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6bee11456baso3905981b3a.1;
        Mon, 20 Nov 2023 10:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700503566; x=1701108366; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3FSK6hIQJd016Vc2pUsye+fL2zqDQZTr43hPQ56brR4=;
        b=aN1kNHXtrP6j67UWHQPgStadEJj/XF65KZx0tO37L86BwBzn+ZeWrk/iMcptpbcsnV
         9dXDWgwS38aXRW4U4SYoshGwg34uO+cq994fJBWL26FDYJCB8CvY3+aU9/XISpULrNiI
         FDUdzxl1WXIP2UXlrqLiUsn5ixr7xt5B6eJsOb6AwPe0lP2mJzKPHv1BcByKpPfo6zWO
         zcT3lDwxYB0Jb703dRRmnN+UuBzEwD/ZSusirjjhmCTF9h/Gu0AUMOtNneMpQVD21VdL
         l2B4A1baiAICcVn3iirWmX1EC500/R+CXXZb63GxxIHwa2yFdXHgfni00CzJs6rqP6Hd
         IHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700503566; x=1701108366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FSK6hIQJd016Vc2pUsye+fL2zqDQZTr43hPQ56brR4=;
        b=rI9DNpaxJRywzN3wbR/DEQ415vW6Tn/AHAQvjb0+NKeEFvLSkH9jV6rmEUxzj0l467
         NL7RIYEx1K8u8yPLf1LbcfDCYKDcYSYlXFgbnjmW7VotXfcOV8xvfYCZFQvOd17rfeVJ
         11Hc6VZSfo7X+cuvidH5waxjVlG8fuOjPdMSvWbZTG76gts0MxL55F/RzTQHCDaoo53b
         bGB0PWSiNHb1jPerbe3niJiCi41vLNCHZqK9Drkqh0pwDDotn8ANOs9UcICU5eqqBOF+
         79rD/Se9fqpkC9z+nXOgFVwCcmjgAlE+W2IadgNUTJTuN9AUFWx8wAR5Xa4qtNNYxTsy
         H9dg==
X-Gm-Message-State: AOJu0YwtgtjuJPE9setJ0Xgh6gwSaoK32JuJPAogdc0lx8xT7FCODaGB
	yWRkBe6dzZQiNJFY0FzW7QA=
X-Google-Smtp-Source: AGHT+IGO3eORy+QU7Y4Eg/NiKQZ92ctoAEBjj6cxDbk30MRETyQXcSRJ9Gn8gejNB1dZIMHMvWbKCw==
X-Received: by 2002:a05:6a20:9f8b:b0:187:27d3:1592 with SMTP id mm11-20020a056a209f8b00b0018727d31592mr7033765pzb.37.1700503565687;
        Mon, 20 Nov 2023 10:06:05 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o73-20020a62cd4c000000b006930db1e6cfsm6679891pfg.62.2023.11.20.10.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 10:06:04 -0800 (PST)
Message-ID: <3a9d2d26-87c5-47b2-b03d-81b398a54abf@roeck-us.net>
Date: Mon, 20 Nov 2023 10:06:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: mediatek: mt7988: add wdt support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <4d7db8786dce35273db516f3d41228bc27a08fe9.1699980962.git.daniel@makrotopia.org>
 <3f5ed9656ea66637d259e9771ed852511369ba9b.1699980962.git.daniel@makrotopia.org>
 <dd9c2e72-c0dd-4e94-9474-a20b4598a0d4@roeck-us.net>
 <ZVuYdZQbwj4tAfER@makrotopia.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZVuYdZQbwj4tAfER@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_180608_389815_857AD072 
X-CRM114-Status: GOOD (  28.30  )
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

On 11/20/23 09:33, Daniel Golle wrote:
> On Mon, Nov 20, 2023 at 09:19:46AM -0800, Guenter Roeck wrote:
>> On 11/14/23 09:04, Daniel Golle wrote:
>>> [...]
>>> @@ -89,6 +93,11 @@ static const struct mtk_wdt_data mt7986_data = {
>>>    	.toprgu_sw_rst_num = MT7986_TOPRGU_SW_RST_NUM,
>>>    };
>>> +static const struct mtk_wdt_data mt7988_data = {
>>> +	.toprgu_sw_rst_num = 24,
>>
>> Kind of odd to have this defined locally, while the others are in include files,
>> but not worth arguing about.
> 
>>From I have just learned from Krzysztof Kozlowski those headers shouldn't
> even exist in first place, as the listed IDs are not actually referenced
> anywhere in the driver, hence they aren't actually bindings [1].
> 
> Quote from that thread:
> | >>> Where is the driver change using these IDs?
> | >> It isn't needed as the driver doesn't list the IDs. [...]
> | > Then it is not a binding.
> ---
> 
> Now that they do exist it's too late to change that for everything
> already existing, I suppose. However, it also doesn't seem like adding
> such a header for MT7988 as well is going to be acknowledged, hence we
> will have to live with the inconsistency in the driver in which older
> SoCs will obtain the number of resets from a macro in their respective
> dt-bindings header while newer SoCs won't have such header and hence
> it will have to be defined in the driver itself (as that's also the
> only place where that number is being used).
> 

As I said, not worth arguing about. However, it seems to me that "too late
to change that for everything" isn't really correct. If MTxxxx_TOPRGU_RST_NUM
isn't supposed to be in devicetree include files, all those defines could be
removed from the from there and be added to the watchdog driver. I don't know
about the other defines in include/dt-bindings/reset/mediatek,mtXXXX-resets.h -
many of those _are_ used in dtsi files, but many others are not.

In summary, while I don't really know/understand what is supposed to be defined
in include/dt-bindings/, whatever is known to _not_ to be there (such as the
total number of reset pins on a SoC) could be moved into the driver(s) using it.

Of course, it might well be that there is a rule saying that anything in
include/dt-bindings/ must not be removed from it even if it is not supposed
to be there. In that case, my apologies for the noise.

Thanks,
Guenter


