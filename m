Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02E2C7618D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jlTXumnsAyLju3X5wGhezp0gUrPj0Pftji9EY7hYkTE=; b=mMRscX6XccZYyaGgYmxH6HMT82
	8oybwArG49l1wDfy0U19YN12ob4ckek4ph8J7PWgTq75A+icvZbe18FCIx92xfxJO4SE3OxYRUPYm
	bVzzCDYKGVOzPqVOjDnCmeG8jYe4nLdSf9GlrMbhFBav0QS06EIlUFY08yCesqG8crLaMZwcS5Qu3
	hbAyAFF0f5su29nX2UUGPKnqbeNEAJrpZt9hi8m2Wo+i6Qsk6MRUKmo7nzuhbd3Dbo+WKvERxC8Qc
	iJmL4sdTewY/iyjAZHD0N785RUnEv5N12JSbSigHDhb61vJPHEZd3PA5otTBHLU1hP0STgbhi14mC
	9gur02Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7mb-00AtFs-0R;
	Tue, 14 Mar 2023 16:45:53 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7mV-00AtBu-1w;
	Tue, 14 Mar 2023 16:45:49 +0000
Received: by mail-il1-x132.google.com with SMTP id l9so5839783iln.1;
        Tue, 14 Mar 2023 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678812346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jlTXumnsAyLju3X5wGhezp0gUrPj0Pftji9EY7hYkTE=;
        b=IMbOhb4nSM3i5CqrZuMYQyk4mi0FlTaUhqJ10ufd3Zycg2LInMrGQEru5ClVhMfZiY
         MBTA8wkxYs3c2KYTMoxKnrJ5Kdaoet53INo+0KJbWWMYRADfafbmB+FTNxreih/UUxFP
         sljADlzOvgFOuWq2vKJgWRE6/WfqMDh3/2rgEloxv7hXosmfx0f7oG5pDnBP+HE83aF/
         7QL1yXV2X8K2JtjI8IdwWJtckGXIUdEMPXKHAnfeJSzVfdVsGJdrKJ3b056R+slPWYAZ
         ZiycbkXMVD6nIUVxupHIdiUR4K+B4czNcaiRn6zXjSxrW1ZoSF2r8ENe7PRUrZDJB9Ih
         j9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678812346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlTXumnsAyLju3X5wGhezp0gUrPj0Pftji9EY7hYkTE=;
        b=ONlgec0Qh6Xueslxy2v7atKDo+MlbqVDBS63GpygZMkTQRCPIypJEzgKhLdzglYtvG
         JoKWn4arxuJPolJJwWeghSCu/20Hjqk0RYLhdFjk/gBxPZF3wg73Y077/iK5XLoYspfN
         8Y0Q1ihBtKO7H/EMzGqBRa4IIffxFeXNvs8i4Qucr1S2lq35tVEtIbLn05F7wDUrzkL8
         l1pegmA8oAophR4fmH2XqMJ+x8JkwkZu3bcy8U6vqlP4zIBpSmu6PNpyplKPakhGWzG9
         A9mwAAIwUnRD//Nk3NFp7MRAPjtQ0RoRqjqKI72juxawY1XNSYUM5PN2QueEiRmVpMva
         53wA==
X-Gm-Message-State: AO0yUKVn06qJ4IeVgYyqIV8TV7YbmynQyBNP6xljUqi91eBSnQUXTiaG
	3xCsfliu3nlrmA23ijRuIcQ=
X-Google-Smtp-Source: AK7set9fbVlYa4wCf6eJNIaNXA3YZoUWFsU4AD/JnVhm0i9hauk9yIMD83SJ3S82/ISaFKioIftPGQ==
X-Received: by 2002:a05:6e02:60e:b0:318:aa8a:6455 with SMTP id t14-20020a056e02060e00b00318aa8a6455mr2655484ils.19.1678812345622;
        Tue, 14 Mar 2023 09:45:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c22-20020a02c9d6000000b0040380d7c768sm903996jap.106.2023.03.14.09.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:45:45 -0700 (PDT)
Message-ID: <4a4e0ef5-30f8-39ce-28cf-ade2122e2aa2@roeck-us.net>
Date: Tue, 14 Mar 2023 09:45:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Joe Tessler <jrt@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Rui Miguel Silva <rmfrfs@gmail.com>, Wenyou Yang
 <wenyou.yang@microchip.com>, Bin Liu <bin.liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Yong Deng <yong.deng@magewell.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Sean Young <sean@mess.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
References: <20230312131318.351173-1-krzysztof.kozlowski@linaro.org>
 <b83d6b81-c4ec-4fb8-b626-84af80d1c4a3@roeck-us.net>
 <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
 <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_094547_647989_F14548B1 
X-CRM114-Status: GOOD (  13.26  )
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

On 3/14/23 09:32, Krzysztof Kozlowski wrote:
> On 14/03/2023 09:34, Hans Verkuil wrote:
>> On 13/03/2023 23:01, Guenter Roeck wrote:
>>> On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
>>>> The driver can match only via the DT table so the table should be always
>>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>>> matching via PRP0001, even though it might not be relevant here).
>>>>
>>>>    drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> FWIW: There is also
>>> https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/
>>
>> I superseded that patch in patchwork in favor of this patch since this is part of
>> a larger series.
> 
> I am personally fan of FIFO, so Guenter's patch should go in.
> 

FWIW, I do not care either way, I just wanted to point out that this patch
_is_ both relevant and needed, and that it (or, rather, the original version)
has been reviewed and tested.

Thanks,
Guenter


