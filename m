Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35D0C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 16:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ArbnXthF17aFuK2Rgr6+egy+HB4WLw6ceMUfORh6l5Y=; b=yNncbmaLCWMi9LlqvHrdAmO8cs
	GqDZIthkZ/8AysvRxX/gZ2lcrsHptu4H5Rx1fkS02fhhiySFf5L3Q2KuRuXO9+M/CAmjnmkQxepSj
	qIOX0+DTocJTRPvxS9uiRKWMCuGIGM81x9d90vcHd8g8RH7DZdzZ/1I9u0+vTDOkmX+FFidViY/MY
	nhMmiTERDVn5zq9A7bTytf6g59GgSc8encMSaPBuSL/STOzW8oopfFU5Bh/5kBEk8vdfrDUVzgCWs
	gpR3oqHHrmUvgFxlkS+hVLnHflun7xiTV85wrksT6HdLGAR08wbwQSpq0b1P53/H1IM2jm7GCUP/Y
	E20pP2JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7Ur-00FDMe-0Z; Wed, 05 Oct 2022 16:43:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7N5-00F9OD-Na
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 16:35:49 +0000
Received: by mail-lf1-x130.google.com with SMTP id g1so26312075lfu.12
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ArbnXthF17aFuK2Rgr6+egy+HB4WLw6ceMUfORh6l5Y=;
        b=XvUHOrQG17fhHnlsoCT7GqSjckTrNFw6Vy+GWnTE4oAEokGaLPenF5tQfc3fhpUWo1
         qKFIPUF79oULb9lmZeVbm4Ukh3AyWcQkeK7IdEJR0M3pItEwdEyJVjZ6oSVH5OjsulVL
         HZ1HoQL8/yCWzDe5QrL1nFvG8v3C+O8QVE2ePiFpFcWTjGTl2hryRJG8gHO7Cx/+p2RH
         BdP6uRRj759ACtmumxm/aczNsEEz6BxVzoOJZX83Kx4eZtsdgm4Ujl1CGN2EVOy2KlhY
         rE/TdxZOHna+0XZkJVRv8dIUKwVvCE5nWCtP6xJH2EdC4wK1DJo3WrZuooZC83oKx6b6
         NLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ArbnXthF17aFuK2Rgr6+egy+HB4WLw6ceMUfORh6l5Y=;
        b=FOlUcjPOwflV0qLFkVHZxLxJHmfxPWh27K7vIO4tAQGcTAppnudMhF1yRQgwL3DSS0
         BWoI5cHup1mMwbDtmBLz1JLZ4cq+S/Kiw8fxRjgd0nZu8JasKA4Wy5WbyOFTjAhPWE9/
         E+2zVYvki9aqkMlKkJygdpCaPfqQR3meirUCSD4ww84AY1yGMc0KQndZPxfpR7RPGznS
         GUnQAN35VpHAcHyyJlUG632wsHC85RwTvZxbjVGxyBzEYCJPczvKjYuNQKsb4DNN/X2X
         8vpeH1djiPvvpSxuwoc8vRbItnwW0j2IBH16IrNZpXwDmZjBZBVFDgpH0qgITE7wBIHQ
         DbFQ==
X-Gm-Message-State: ACrzQf2pm9d4eTATJHT4Rb/Fej6Y1E1AFZia0SNq9GaD24bnLobUz5pP
	HMEmx0oMivEjexJuBh1RSlXeyQ==
X-Google-Smtp-Source: AMsMyM5LjKt7QvMVK5nxucMwvVVKZDMB0Zf8Ee6Jfz1lQgOYAmg2F5JK8113gHKmDPb4++HQwSS93g==
X-Received: by 2002:ac2:4f03:0:b0:495:ec98:bcac with SMTP id k3-20020ac24f03000000b00495ec98bcacmr224149lfr.339.1664987743632;
        Wed, 05 Oct 2022 09:35:43 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512231400b0048a9b197863sm2391823lfu.235.2022.10.05.09.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 09:35:43 -0700 (PDT)
Message-ID: <4e5c0d90-d1ec-15ca-c07a-d43f52d4d69a@linaro.org>
Date: Wed, 5 Oct 2022 18:35:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] dt-bindings: mfd: mt6370: fix the interrupt order of
 the charger in the example
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 lee@kernel.org, matthias.bgg@gmail.com, sre@kernel.org,
 chiaen_wu@richtek.com, cy_huang@richtek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <9dda705a8d67826306f6c6129722d3ad8edc96fc.1664816175.git.chiaen_wu@richtek.com>
 <CAL_Jsq+YeZRizJFYuU7RPTcFRe1cDjLgsTidisJ_P5PNC4eKiw@mail.gmail.com>
 <CABtFH5Ld91S65RiDu4iSpFhAMiFWaQdj-yDRM79=WUkArpA0JA@mail.gmail.com>
 <9004b427-66b7-f783-9258-4f6b893899ef@linaro.org>
 <CABtFH5LLxjaWHFLRGjVb9x1a_SJoHzD_GsOqn-e9uQAJ6mOocg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CABtFH5LLxjaWHFLRGjVb9x1a_SJoHzD_GsOqn-e9uQAJ6mOocg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_093547_812390_0BBD7756 
X-CRM114-Status: GOOD (  15.35  )
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

On 05/10/2022 10:59, ChiaEn Wu wrote:
> On Wed, Oct 5, 2022 at 4:33 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
> ...
>>
>> Eh, my patch was merged in July... and yours from September still does
>> not use updated multi-led bindings. Was it even tested before sending?
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> I must apologize for checking our patches are based on v5.19 (I also
> forgot to apply your patch before checking patches......), not the
> v6.0-rc series at that time.
> I will update the latest code and check my patch again and again
> before submitting the patch next time.
> I'm very sorry for this mistake.......

Always base your patches on one of: latest mainline kernel, latest
maintainer's tree or recent linux-next.

Best regards,
Krzysztof


