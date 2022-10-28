Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4E0ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7ksD5OAGesupj2q/XJlihyrsrRV0FXKxDbYSlmixcY=; b=i2R6ObFukepO71LstTFtmnVPx3
	O2xNnClagu8Nlab/SE419sErwrx/+ZPQV1k9tfEJajBEovs4tLrqGnnysVOhppywIKQVZDKEyuhGN
	TboKD0dSnsYI7jnm6nBMtXq0i5Jr+0dPGL7FA9mUNDO5lbFWdvSLxOWNu+kCLJ8xkjLOsl1bEWesA
	g3PXlmElyAt2UklQMkyiSpBHDXeIn3I0uSaMSqJ9PBG4Cy/WRD2/IEANnwHpVZ2WnQ8zMDLf9SZxW
	HnkTDl7XNp0v1ldOl7/rq/lVdYZr+zYSS1w0J7zRLDN/hgbrm/J+BSvEWd6mwFd94oQqXj4V0gIJk
	lEuUun3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVIx-001yvl-SC; Fri, 28 Oct 2022 19:46:11 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVIg-001yYV-SW
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 19:45:56 +0000
Received: by mail-qk1-x72c.google.com with SMTP id i10so3988560qkl.12
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 12:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7ksD5OAGesupj2q/XJlihyrsrRV0FXKxDbYSlmixcY=;
        b=GMbLCwoELVulpoDUfdY2c5Oidtr0Q2mDZYzsKsi0Mb50lPciaEKXt/dwa0PMQcaP6V
         /uf7Ih55/qvFVQLLUHEboG0EcbvwJa3erb+DHdmqr42gMdUhmZRiDkF45RiCcYXdkBNN
         vyGHwkNLBcqovgezhsQvBTd6qggJVBiRCis96q5uGvUkXfuYiVj+zcyIB+upe6luzoUV
         2VPZuXMHwICL2dyurHHVuvpzeEYWc/Hkhk6GJNVYf7O+p1xfxth6eSMOFbo80062bd2n
         TkEFCcpFEkGKCGF50gPn9TOrAwdfe0ZEk7ymN8CP8sD3Ds83pgttoTjfKlmkgVmS+N9L
         nPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7ksD5OAGesupj2q/XJlihyrsrRV0FXKxDbYSlmixcY=;
        b=k+nHC4dRmRPshVCGtCzrpRoXQi1gz+LgFnKEE7pCLUZ8Fa1ammDhdMk9bcOqgaGnZK
         mgAZfEoSkVXJBmgfoWaoZEFsY+AsyUGcQtjR4Tg/T5EmiHATN7YeMbEhLZO0ijGYxTU1
         uCUsjIh5ziTxAox4kRmvuhcZUaD2Apar9nAu9+wIGVARwfH24w0RCBwYP/QyBQAfZQu9
         TPihnDQopDV0XrM4oJsymODEcTKuQefReyD/F6exEY1X1vTLNVQbGMTCG6HqMK3dpIMw
         S5tFNVV39bEFrI83e0Q5bcJ2Hp2uFsCyjaRqknJPxacyn1V6Cc/z3EGdTWQiz3+ZvZHQ
         tFrw==
X-Gm-Message-State: ACrzQf31A0NJwmWl4x79UHcdOFO9UcsMsVBlbRlU0vdiLvspg+9m+v/v
	dhV/NH4MEemmokfZWqh42pp3Sg==
X-Google-Smtp-Source: AMsMyM55GEMVMF1srCOUQORSp0UYryYV3Ubolr2dJzAddzVtL+bSj3gMTzd1NTTw+XMQunZCATLOdQ==
X-Received: by 2002:a05:620a:6ca:b0:6ec:553a:cf33 with SMTP id 10-20020a05620a06ca00b006ec553acf33mr756670qky.132.1666986349347;
        Fri, 28 Oct 2022 12:45:49 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u6-20020a05622a010600b0039cc64bcb53sm2802673qtw.27.2022.10.28.12.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:45:48 -0700 (PDT)
Message-ID: <89a32ecf-2d9e-c50d-4da1-eb24e8f26d2f@linaro.org>
Date: Fri, 28 Oct 2022 15:45:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
Content-Language: en-US
To: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 "chunxu . li" <chunxu.li@mediatek.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com>
 <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
 <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_124554_962941_3387810F 
X-CRM114-Status: GOOD (  12.81  )
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

On 28/10/2022 14:26, Ajye Huang wrote:
> On Sat, Oct 29, 2022 at 1:58 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> 
> 
>>>
>>> +  dmic-gpios:
>>> +    maxItems: 1
>>> +    description: GPIO for switching between DMICs
>>
>> Switching how? Enabling? What is the meaning of each GPIO pin value?
>>
> I think I should add more like an example,
>   description: dmic-gpios optional prop for switching between two DMICs.
>                     Ex, the GPIO can control a MUX HW component to
>                     select dmic clk and data form a Front or Rear dmic.
> 
> Do you agree with that or have other suggestions? If do, I will send
> the v3 patch for you to check, thanks

Sounds better.

Best regards,
Krzysztof


