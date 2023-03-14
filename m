Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A0FC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 16:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=; b=ITdjRprnMoEynKfH/M+eAWSoTm
	o/eIzixYxeQtfHogyGqZu6pEgPHRQNTGA0MkeYFe0UKmbWL8zy0tgb17BTMz8dxDzJ4WKuCHTjXZ+
	RwV/4GdA++EWcZxXSeDo0oq2Ae9ADjdW5P7wGu3OuUpEZfpU7Bajr5rc26Ziad19P+iTsuZjpN+C2
	yFpq7jW6gOWLwwWlvp1MCKoqNkd8/6XsirJ+DuOKo8Gvc4hVJYBGWoK48yq54T8cvyaIGVM3ly4xg
	F86JmrSX9L5O9Ltr/6og05REmq3K9h2ujSiHfid/nhjXUs+cSpl08196PyPPkjT3Y+7thhIdyXrn/
	riQjlNKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7a0-00AqhE-3C;
	Tue, 14 Mar 2023 16:32:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc7Zw-00AqeJ-1J
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Mar 2023 16:32:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id r11so12787742edd.5
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Mar 2023 09:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=HOMoHJbvrS91PZJdsSoMVF4wEKhsJzukL0cbjFvfv9908EoWA62ipm8dzNSPoyH2Ha
         7OrEZpotzbre+nBpyPdyCuM1aR627eF/GX/nRY34d9dg7fNOraC8g8rZ62ciV9E0hR8V
         3Y+INXEIbwCT8XLueIXSFY2B6uLFjwOHG7cb+vpszvgBJ8GHEy/28Ic8maoK3PKBHVM9
         fRqEFDoV4KXJPzGJVeUJWwCV2m6Ea2UK+eEQksGSdmaedxi7sxEBkXLx9uGM7ZPzKnWY
         G09Xgt268QjmkKJ8+FXqyp0Z7H5o5pmGIIV/JtvItiyFAVHe5RytDR3FtLM7nk8CmKeL
         5/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678811567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZMmUYtKJ8wmH3Y0b7DE4LXgBhnyqMdRf+GRKEQEn4c=;
        b=xwkOpCHIseunhXiFqF865IRt3OHKBIiEc+HsBJv3j/r3I870xNfPt7oyzxzjfUjiS2
         t0szQrDCAvh2C4qU6VaqIkKbzCbw0oZePc/kmuTTx7jTu0BpTmfkhkG+3VQZCfSHQKyq
         EXjU+DqhlNhgtOki/2NEEv0LG7bVjZzrNzde4bHCAN0Es0EyRt+lKBzo5FHNA8xg0KCJ
         5wIT/8Xa+ndfkLFLHdFGa7gmpd/K+7T5C1AVxwdoZc99+QiyaB2yJ5TxMsx1M6zStVVm
         NW5+6c54iMWf//WXHZGefEuS/E2qV5sLfgeCp4RAC8oGEHYvSFCSQdLNC1y5r6/JsY62
         LueA==
X-Gm-Message-State: AO0yUKXoGwc9LN52jIMfsDAnCATq+x41SIVdDS3L3FLzVdSDpJhm6Ldr
	uMqZT3+/7D9EEi1UfOCWNnwbHw==
X-Google-Smtp-Source: AK7set+myyCkcdJ6jQlFEHkzUZ2F1WAxX5BcejY0gf0Rd4/49aK9Lc6ALEebeykXKuMeNvyqb5FwSA==
X-Received: by 2002:a05:6402:74e:b0:4fd:23c9:11ed with SMTP id p14-20020a056402074e00b004fd23c911edmr5057745edy.17.1678811567132;
        Tue, 14 Mar 2023 09:32:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id cd3-20020a170906b34300b00921357fb28csm1341977ejb.123.2023.03.14.09.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:32:46 -0700 (PDT)
Message-ID: <bafa692c-f3a3-d317-278d-2dd3b5ff8af3@linaro.org>
Date: Tue, 14 Mar 2023 17:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/28] media: cec: ch7322: drop of_match_ptr for ID table
Content-Language: en-US
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Guenter Roeck <linux@roeck-us.net>
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <74ae8afe-c537-1714-77ec-8a80d8ddad69@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_093248_555722_65F98A32 
X-CRM114-Status: GOOD (  13.38  )
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

On 14/03/2023 09:34, Hans Verkuil wrote:
> On 13/03/2023 23:01, Guenter Roeck wrote:
>> On Sun, Mar 12, 2023 at 02:12:51PM +0100, Krzysztof Kozlowski wrote:
>>> The driver can match only via the DT table so the table should be always
>>> used and the of_match_ptr does not have any sense (this also allows ACPI
>>> matching via PRP0001, even though it might not be relevant here).
>>>
>>>   drivers/media/cec/i2c/ch7322.c:583:34: error: ‘ch7322_of_match’ defined but not used [-Werror=unused-const-variable=]
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> FWIW: There is also
>> https://patches.linaro.org/project/linux-media/patch/20230215214724.3798917-1-linux@roeck-us.net/
> 
> I superseded that patch in patchwork in favor of this patch since this is part of
> a larger series.

I am personally fan of FIFO, so Guenter's patch should go in.

> 
> Krzysztof, please let me know if you will take this series yourself or want me to
> make a PR for it.

I prefer if you take entire patchset.


Best regards,
Krzysztof


