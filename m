Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AFDC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgk54MZ41PYHuB/Q4rLG9CYyOFNJDlQyyrk8XZCCg1U=; b=zbWdUDN7wndpOm808MQwZABZtE
	VLxGGpNvMPylIFNOIwbWTq4Nv0AQ6DhNXQrU9SvGrHaoAWCyKSw64vqE7GSvKW1dIBfdQdnX/uX3q
	m35whzbOx9yCfQc/kTccRlrM89PBKi6KXkfAyFLlmQpLOpiVNl0PB5SCpU5KPS+Ld22niYwrD/w/2
	XKB0pQoLblI2/H8X2m6DywqKtsKyTy+gV72TvwisNCmQ7q3MuBNOUkFthIgSgFJnvnjlO5fl5WMUK
	CcT6Jl54PTiS6EK9NUcr77T/5FqsQ6UuMovNWL89YBA9QaLHjLRq1lhdXn5zqX8V5XO4LqFMq38/Z
	fUNOxmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hOj-001w84-Pa; Fri, 24 Jun 2022 11:22:49 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4hOh-001w7C-V9
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 11:22:49 +0000
Received: by mail-ej1-x636.google.com with SMTP id cw10so4082106ejb.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 04:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tgk54MZ41PYHuB/Q4rLG9CYyOFNJDlQyyrk8XZCCg1U=;
        b=Oyq5vCrpAPNrAziFwKaF2lBkP2jNPRprPBFhuec6kn+YBvz5ss6Ytk/6xOrQO/eBwu
         8UKDIPAUP6m6QKDwOkcCGfwGNqMMxj9Lv7iBjtxheUp1JumjXMSZ4zVxBlNGypmVpEqE
         rkZQ2ZzxgmeGxcd64+Xm8PtvF/Gz27BFOwtrwgIu/RMjXfaTDMz9EPeA2d4u1lmmICyn
         4KerevADvvaCxSCLcYbGGjd9pacaZOPd29c512UV7Arvp0wI01ZPoIHagcw9J526IEi1
         /ltWhsiXxxeRXLwQk4upL1m46Xm4SElptteEJwp2Izm5+pob1ZNsb1mH67hFZj4mlfb4
         sjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tgk54MZ41PYHuB/Q4rLG9CYyOFNJDlQyyrk8XZCCg1U=;
        b=vOMTUpKGWnE/IXiAmjO4WdKRq0ZMCW/adgO1SNytljRHaMr8c4hpuZebAraN5i1ADh
         Z+50WzAbw6cOavrDQ2VEMHNS7aJHYh4bFFjYzkWLLpt6/r+MgjWXVitt/wno1XMjRdWN
         TtJlfyWDmfK/V7XPMgdKcp9zQ1reDTOvEZyEdMHMHuRl76LP6GKqbJz0EUydv78z91ag
         EY3AkPBAjB6VVIrqOIGhgFAoCB1Jol/rNjYG4E0NIzjniLNSa4yKAce9mMCUqKfaxAW9
         YZnwHTAHcGaurOw/2g+n8afOA43g6U5RXw5DrKBTp5QmJunDwEQVVaIuMkNyt5T4UuUo
         WOLw==
X-Gm-Message-State: AJIora+BDJQV+bWAN28ibR/rsB2bIsKRF2xf3M/XayjjqjTjORHibGau
	7N0Oi/dY0XLw94it4M+KbEFg0g==
X-Google-Smtp-Source: AGRyM1sYtcDa5bMUak2KZgL6+/Fc5vtdSfpUcIOTo5XhIbe5rtkcGY4Iq23VRgOKO7sKLDlaVq/HbA==
X-Received: by 2002:a17:906:4c9a:b0:726:38df:6f6f with SMTP id q26-20020a1709064c9a00b0072638df6f6fmr495588eju.485.1656069764388;
        Fri, 24 Jun 2022 04:22:44 -0700 (PDT)
Received: from [192.168.0.235] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g10-20020aa7dc4a000000b0043567edac3csm1795392edu.61.2022.06.24.04.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 04:22:44 -0700 (PDT)
Message-ID: <5cfb502d-951e-2b5a-aaec-a2ef4c71d5e0@linaro.org>
Date: Fri, 24 Jun 2022 13:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 04/14] dt-bindings: leds: Add Mediatek MT6370
 flashlight
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org, szunichen@gmail.com
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-5-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623115631.22209-5-peterwu.pub@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_042248_080041_4FF0799C 
X-CRM114-Status: UNSURE (   5.89  )
X-CRM114-Notice: Please train this message.
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

On 23/06/2022 13:56, ChiaEn Wu wrote:
> From: Alice Chen <alice_chen@richtek.com>
> 
> Add Mediatek MT6370 flashlight binding documentation.
> 
> Signed-off-by: Alice Chen <alice_chen@richtek.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

