Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84379ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 06:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dl8bj8J2OYumn/gfks6Y/TXqxWAUsjyKN5CBMLkq33M=; b=KyiI09Eg49TVy5KziQU/G2Tk5F
	9q//pjVkSsiMGveTfu+kBJFHcGPLrCwGE0ViHKVQqrIcioVw74WTr4ZQkCZu3fQ3tUVkb3H1kfZqe
	4AcE/CpgVLL+fOqq3HdlfwZT0CXCY99H2Ijl8o9MeGcHmYrukkzLoTmz7NVtafkg3HcAHLtJwQKe9
	yKEsQ9SyPq6pO9io4UPHOAAvzeMOJYL/pMHF5EUnvRsuT2G+NST1zHPB9n693fPjwBWhm3MKPcb0r
	ffhwSxNBl/l7z89tl8HkuUQ6edwJNmc1sHYCU7Epv4PrmAhfmZCiKlWh9glnH95cPE443QSdzZxEo
	ENTTkX9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGq9-004B3S-Al; Wed, 31 Aug 2022 06:04:41 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTGpr-004ArX-US
	for linux-mediatek@lists.infradead.org; Wed, 31 Aug 2022 06:04:25 +0000
Received: by mail-lf1-x12c.google.com with SMTP id m7so9574285lfq.8
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Aug 2022 23:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Dl8bj8J2OYumn/gfks6Y/TXqxWAUsjyKN5CBMLkq33M=;
        b=s+ld3BSW73VpjKfO2WLJyo8QMXPvYevRcq4PsaT3k2Z77qKdk8xKWjJckUUaWfvzr4
         YWyksAxTftPrsW0ppk7H7HitM7QBkNbDsEe2lUr+1cxY0DIUgs1AZjooirLpXWNVTIFe
         Oy9N2ufiwiT31+pU/7i2ANgmlzvXMLwrfmDJQoiEn4KgNO/wFYvu0BozmqYQelW3kvN6
         iMGYIV3a7efaPBH1DniQf9yKlOy7z72aD7wlQ/YWJ1LW9PR2JrdFT4QNQHCki8J/HXBb
         StVeaV3xBeut8XNSL/uttxlhjAlNWyfMYZBMtKmZg2uLKvzTsrKOgTHO5CYB/GgCVYyq
         ceNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Dl8bj8J2OYumn/gfks6Y/TXqxWAUsjyKN5CBMLkq33M=;
        b=DQBkXRemtXcEwnAImRvU445CtuDUHJxZUH5Jr859uDeqQ7+SFLwosjPxwLt7cxw1kp
         LOakx5PgNc+5M4WX3nzoAqUj7WigtZea4bkXcBv6QRY7fioQ/eJUdFpSOZUrrVEtsiWC
         bt4IWrg0bV6FzhUUWFz/IDpAIRT/xY+qwGkW5VI4hgA9K+b7zwJC/lB88rZPye+F15Hn
         MXbvVe/g2tn4ZYpRHq4KyfkTfHpSbf1rbiatb0xJGjDJunN1l2At/DzIa79sP2Ep42tF
         REP43ivklMYU7ZOoic1JCpOrWEuHR0eCSMAEINmhPnKX3SQDZdwzixO2MiJybStesEGn
         erjQ==
X-Gm-Message-State: ACgBeo1+4rwNvRieXQvH7Cy4AKocy7jFTwcleyFEw/0+keAf6/CHp3iz
	PpORHdLj40msUAYh50nRHZv1x++MT4izD0zd
X-Google-Smtp-Source: AA6agR4VDbEUmpQN/YYGQlYkrQzhU4Vr7ZnZNVwK+T0wj2HQ8et1E4vjPcFJasdVKjtvPACwyeVfzA==
X-Received: by 2002:a05:6512:1395:b0:48d:81b:4955 with SMTP id p21-20020a056512139500b0048d081b4955mr8308222lfa.307.1661925860150;
        Tue, 30 Aug 2022 23:04:20 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id k4-20020ac257c4000000b0049483572143sm300975lfo.283.2022.08.30.23.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 23:04:19 -0700 (PDT)
Message-ID: <22eb5611-84e2-23e9-f70b-48bef351133f@linaro.org>
Date: Wed, 31 Aug 2022 09:04:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220830063929.13390-1-zheng-yan.chen@mediatek.com>
 <20220830063929.13390-4-zheng-yan.chen@mediatek.com>
 <a209aea3-bf23-4670-91d0-e7f41ac57833@collabora.com>
 <bf2b277e-8b02-6a44-e463-6b7c4a697ce7@linaro.org>
 <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b61776761eb0ab9a0b1dcf29d908e4bfd789d2ac.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_230423_985934_3598648D 
X-CRM114-Status: GOOD (  11.85  )
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

On 31/08/2022 05:29, zheng-yan.chen wrote:
> On Tue, 2022-08-30 at 12:14 +0300, Krzysztof Kozlowski wrote:
>> On 30/08/2022 10:49, AngeloGioacchino Del Regno wrote:
>>> Il 30/08/22 08:39, zheng-yan.chen ha scritto:
>>>> Modify gamma compatible for mt8195.
>>>>
>>>> Fixes: 16590e634f1d ("arm64: dts: mt8195: Add display node for
>>>> vdosys0")
>>>> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>
>> Please also perform review on the commit msg and backport status.
>>
>> Best regards,
>> Krzysztof
> Hello Krzysztof, 
> Thanks for the review,
> I will fix it at the next version.

This was to AngeloGioacchino...

Best regards,
Krzysztof

