Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE8ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eCr/Ohj0kZaDpLmya5seSXAptOWWnifNHkRP0hKQPHU=; b=YZd7ZCEY2Yq0a89BgW+m1sBy3k
	MRKdfeNidUx6hqTNrsM2uca7uhYV/XmCzOzIEAJVx4ayKyzTwrSZ2rLCDegApk5uX8MNE8a6s+kbk
	Hay/6SYt5UpVIFXWCANYGEX+wOReGEAwhSz6i79WxZgkgufBidtyt3eAf2JTukCcqmzl6voAaup60
	OuiCDoNH2+4xwGdPrB8owao37PuGz1UrrBc1zyFO+G/kwXKl3WTkMLXAn3Fta9eZ++HvWFgKCuvtX
	5GLyhh0Fl5Sz+sze1OL+ktyvDulmKjrX9kbbnz1Ju1plPWSacLgwwmqm/v69G++EjdCSX8KbX0Gzj
	g/B48yxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZuk-005gKI-SC; Fri, 26 Aug 2022 14:02:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRZug-005fqf-J5
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 14:02:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so4466404wme.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Aug 2022 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=eCr/Ohj0kZaDpLmya5seSXAptOWWnifNHkRP0hKQPHU=;
        b=q0qzPf1nziC/DQNNLVQLS+/5Uc0MBYAygLzDVbUqGH/1jeVvU3gGjUoeZ+BOZ4o++H
         c3WMDjYshzjJEJlsFC+QdF9+Rt5odJ94r+B4wk+pXrYeY8lRuwQxGr+SXiTaY+J0kqOb
         3+OvtWjevF4RZnx1GlufEIFATNt6jgMYJusBNIfEzhhNvFJep8AKG7OYQiwDh1IvLcCE
         dLTRaM9frO9cjymw9bF2Lo/yW1L+C7Ryfb5Nl01+j7N8ket9PRAWuXMx8IF8zzocMNZN
         G9TJHA2P/fZWgH8pKQVPNHnXU2xbqsbTlH2mdbYojIwqoWzY1xDza1Dy/0wR4mWT/eKa
         sPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=eCr/Ohj0kZaDpLmya5seSXAptOWWnifNHkRP0hKQPHU=;
        b=SxJoEYH3NG+uo3GxfwutXz4yMQ1b2EyJ+UdY7V8bBA01ZvO2iPsfAZ0DAnNrROAdZO
         Or6xF7nmoBwBkZHmpiBwQj0fuaN9Jv5tKXmqrrD/PEFnei0Iwt8ANUvIZ0TzeOX4UGYA
         /JRxioJWjV4RUGX3srP04rAOte0jmzdPpKqkb72N/BvCYkKkOzkFEHvn62jP5ZuYoyZc
         0VaiR8qFyPWDHwZFJ42Q1Oy7pvYXthpbO0DbvmykkQ9BqALwzv/76hbnd42efCrdVGR+
         EiKnIhIokP5m7OWCJ7yRi7bNPytnHGfU50ML+mSuwm+OW50ctf4/CK0sdVEKO5QUYM0B
         x/nw==
X-Gm-Message-State: ACgBeo3wGkR9oTwpzkB4C3FUJQ3lH3sAzJV6G8gleSXeMjgL9rCb9xah
	sOEAaSmDC40SH6/vR7rLeokiJw==
X-Google-Smtp-Source: AA6agR7/NSeMRDVgG/yEJTSWQZQkmxXOs1otSi8LjI4tN8VM5kuDlQbvNw8kIMB+wkzE5oVTFW5Lgg==
X-Received: by 2002:a05:600c:1009:b0:3a5:4512:5f71 with SMTP id c9-20020a05600c100900b003a545125f71mr11571178wmc.134.1661522539663;
        Fri, 26 Aug 2022 07:02:19 -0700 (PDT)
Received: from [192.168.0.20] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.gmail.com with ESMTPSA id bi24-20020a05600c3d9800b003a4efb794d7sm2850243wmb.36.2022.08.26.07.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:02:18 -0700 (PDT)
Message-ID: <ac5d557b-ca4e-3e8e-9956-c6c5754fe5a7@baylibre.com>
Date: Fri, 26 Aug 2022 16:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] thermal: mediatek: add support for MT8365 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 matthias.bgg@gmail.com
Cc: rafael@kernel.org, fparent@baylibre.com, amitk@kernel.org,
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, robh+dt@kernel.org, rui.zhang@intel.com
References: <20220720181854.547881-1-aouledameur@baylibre.com>
 <20220720181854.547881-3-aouledameur@baylibre.com>
 <67796aa8-6509-620f-f96a-ff22218f1b0c@linaro.org>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
In-Reply-To: <67796aa8-6509-620f-f96a-ff22218f1b0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_070222_650490_89B88AD9 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Krzysztof,

On 7/21/22 18:37, Krzysztof Kozlowski wrote:
> On 20/07/2022 20:18, Amjad Ouled-Ameur wrote:
>> From: Fabien Parent <fparent@baylibre.com>
>>
>> MT8365 is similar to the other SoCs supported by the driver. It has only
>> one bank and 3 actual sensors that can be multiplexed. There is another
>> one sensor that does not have usable data.
>>
>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>> Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Just like in all other cases - you miss your SoB which is necessary for
> the chain.

Right, will add my SoB in V3, thank you!

Regards,

Amjad

>
> Best regards,
> Krzysztof

