Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3301EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVDii5VLsnXEoasd6XoeZGK0rgCSIz9r+bWocJcfgjg=; b=LZMJVHlm1dkIzd
	LP0Zh1sKeaZeSY+KzlY5IUwcqQ9Ux/JPYYnqnQBaWEHzqdanDfaSSPbMZHwUktdyrKPwwMUzcON8T
	W1qML8EGG4bBRDbTx0XJsZkl5pjDrHX6KhJB83KmGUBEQfvbdf8fdfhCg5GkyH1eOhYylbKVJDg7s
	OzTS14OVDq4x2ikZOFcpDN11/lXIkX+jjfh3NOK+tIXHcStFVD+iKFk8Drz/TrhbgKnpvzu8gGRF8
	nNK2ctzDbpljktCzCP60oeYsXs6KgpK3YQ2MFkwty+KgEQ5BR3h5Q/nYBU0aTo6fRsEcs5xJi6ink
	KZYhshxGXAjYqXSH1gSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRIeJ-001It4-1l; Mon, 07 Mar 2022 19:04:03 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRIeF-001IqY-7I
 for linux-mediatek@lists.infradead.org; Mon, 07 Mar 2022 19:04:00 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E604B3F1C5
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Mar 2022 19:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1646679837;
 bh=J4AWHeY6kJDoGGWSDU0TUvtoqIxvWQeYEQ4e5H5diOY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=PrcFxoJ6T4Yxd5Rab2Ln5S2fje0tbX0vAu7TMaqbYXum5KUpuBUrmjXyxQ6Tx4cJ7
 ICIGsCnaASAS6Tn9qLu8hvlR5vd97gb28pbOUY0+U5RTVFrCDTsGeVLUi7SQkHTY7o
 u3JEVWUyYOH8BtJ/4fw7Vzhhgb/thyJsLSqGOiN/DkioqwemltpS5s/rA3BJo3z5aq
 Y2FKjT5+M/LdCvZeBIk6LY8WD7fVpJc0OD7Qhtxr2HUd2qnk4tb/pZRiEyExnpM5Zl
 f/KakqcABNSELxmSSNR9jhpMGLmSb6tbHXknTNTc7g7+xOw/E92HrLYWt5oNrn5tXL
 LcPdxoxCxzyzA==
Received: by mail-ej1-f72.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso7453617ejs.12
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Mar 2022 11:03:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J4AWHeY6kJDoGGWSDU0TUvtoqIxvWQeYEQ4e5H5diOY=;
 b=mXA1fEd1jxrADLINEHUHK9YIhGyXPYI+6re6fciqm9bWewPpT5lpQooR4oLEl6wB/3
 UA2Pyo1I+2RYIMiN5Uwhqvbjh6e86U8e/tEoSb706I+0Asp+J9UhtheEs5AQdEGBTAWK
 snVweuhoUOZpW+4x1ttia7tdZ5RebsPvazLwjuMNzPAtxKRY2pz4l1K3FEfPQeYKkcHv
 PrOOuBvelygHPqaDKidL+Jodd1bG8sb3/vBdfaFVFYTp3QZVoqZoiSIqOUrcYSCGvcDi
 b+Sq4COtofeaxuZTNrqDXLeT1GZUhE4umjKNamAUJozmsrq/5GPAXMJYWKlyz4d237lB
 nFTg==
X-Gm-Message-State: AOAM531psRfL0iMX4ZXhrYZEJef7i6XSeSm9wRZgi6GuYlWd5VMdzq9K
 oN4dtu3BEo/bzJiEM/MwYMbE5hwgdfdA416tb5RQ1maRj5LQzQZExhYRncET3kOuViThJ6X/INz
 aMlEAuiialwDkY9DzFbS70IKCCpvd7yXOO4Ean8wNvFszmBZuLw==
X-Received: by 2002:a50:aa87:0:b0:40f:28a0:d0d6 with SMTP id
 q7-20020a50aa87000000b0040f28a0d0d6mr12475411edc.368.1646679837655; 
 Mon, 07 Mar 2022 11:03:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKC+brW6i/AxkVvgIwi5JIxVP90rh2B8pfzbYSF4MakKIPVSeOvoB5oYLiqCOs67+OJ+fNaA==
X-Received: by 2002:a50:aa87:0:b0:40f:28a0:d0d6 with SMTP id
 q7-20020a50aa87000000b0040f28a0d0d6mr12475384edc.368.1646679837477; 
 Mon, 07 Mar 2022 11:03:57 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch.
 [188.155.174.239]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05640206cf00b0041655b577f1sm1268973edy.25.2022.03.07.11.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 11:03:56 -0800 (PST)
Message-ID: <a728aaa0-bde9-b9a9-971a-2e4b52f2b7bf@canonical.com>
Date: Mon, 7 Mar 2022 20:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] cpufreq: mediatek: add platform data and clean up
 voltage tracking logic
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-5-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220307122151.11666-5-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_110359_435212_042EE42B 
X-CRM114-Status: GOOD (  13.76  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/03/2022 13:21, Tim Chang wrote:
> 1. add required header files and remove unnecessary header files.
> 2. some soc needs different min/max voltage shift and voltage tracking
>    attributes. make these variables into platform data to support
>    future soc.
> 3. add need_voltage_tracking variable to platforma data. if true, it
>    indicates soc is required to realize the voltage tracking between
>    voltage of sram and voltage of cpu by software approach. otherwise,
>    the voltage tracking is realized by hardware approach.
> 4. add opp frequency look-up function as mtk_cpufreq_get() and
>    registered in cpufreq framework.
> 5. update voltage_tracking() logic and drv_init(). in drv_init(), it
>    always sets highest opp voltage before return. it could prevent from
>    high-freqeuncy-low-voltage issue if two or more clients using the
>    same regulator.

One change at a time.

> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>

Your SoB does not match from field.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
