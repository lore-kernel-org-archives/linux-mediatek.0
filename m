Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8A3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 10:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAbXbdR8tn/A2daiEKjdd5EXe8n3nNMCBEueeiNA9No=; b=gluWpcnN4RIntj/MB+3s3GhdsX
	6WSBCBPvcgtVkXsgkRUdPtMm9nZb1CCh8DpHdFxMoK/2x03JKJYDVMfrRH9ZcI+o8SHRSJulBx4d4
	CBLrmy4mI/m3LF7ECqiz7ocBuJgl2QDI5fnwRsZD4K4zJBnr8bV/z/C6hBC1D/7d0FVwiObRduWDu
	neqcOAuRpGKW8fI5vuknJVN83QbWneG0Ns0TmugLgk4CwsyxqY0tvhffL6QTf9tii7XDQ8Bttm/E+
	YLiFPD7g9KJQsaXJscV1uNc02DPvBSaXfZyEPA6p3/BLBikDFgcWyma+49QD0UO2heeBxUMTvDGWi
	el8EA/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3uw-00CGNY-3a; Mon, 21 Nov 2022 10:20:46 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3ut-00CGLn-OP
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 10:20:45 +0000
Received: by mail-lf1-x131.google.com with SMTP id bp15so18079975lfb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 02:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAbXbdR8tn/A2daiEKjdd5EXe8n3nNMCBEueeiNA9No=;
        b=OI1XsvQpRL7N+A4Y6vFvLTfNAWBX/8JMNw497sYjny8nlWJDx6nne21keEKIl1qk8/
         jv4Dp5XtoJxqmN2cPzrcJoTDgPXwV+2wczYbNmGlNX8bNBDEzYDMrPEmeI5HQvfIw643
         1THrDHjyySVoeCWcMaF2IjE7zklji2cqvegFMb7GKBAheFg31z0ZpJm6Za/z+rn0PB7n
         TsMR/yxX7girVOvpBWVZz5F+OFkAWz2K+LOJHrqfkkAxTMjBLNjDzoMBgHQbRDGGnJVa
         2gmYWZGchaKED5M73rIZF/doalshfZOvvALDhuK3SfuTE8FLpPs/po2SAt8nEg3Z5GIM
         yX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gAbXbdR8tn/A2daiEKjdd5EXe8n3nNMCBEueeiNA9No=;
        b=wbBeUqSUXaUTlBsSEUzEIhyj/6mECaaLlAMddA2JwrrMrQdnimED2/VC+Ls2QK88op
         J497XQE/l5FnuH2DjGOWO/Pv/uMwQ3G3XNeRJkHQ8UDgsZKnoPiSp2kw01DSbjo4vkry
         iJHpYo4BcBR3ABeQigzkq5LbkWwa4lP1BH6j0MMZ6Kt4bTcemLxVRI8JhWyuyH9TjoJa
         8jVbjWkXw/mxPqK4RbOpwkZvb6G8TFkDc5eUgx2mMKEBtTg4Z4xqbH9xOBH6VeQ+kDj2
         j08BmBTrL9VrTKnpFnWNhYxDA3iwBemTtCBRtDWY4aO6zUE2dMc3Sr4x7jeYHzGFnB1e
         gX7Q==
X-Gm-Message-State: ANoB5plgHl/NvopEVP68FI+d3YVMVXg6k1AYvoss0t23mBpq2QF2sXAP
	BMfKmbYuKzImWkl0u/QVwJlccw==
X-Google-Smtp-Source: AA0mqf5lJ3tRXmh+b1RKIxv3rj+0BDyqQr6TMSlqVaIkj+RLm4eY0HIc7UPyX+LJx3lQG0cCxCzmBg==
X-Received: by 2002:a19:4359:0:b0:4a6:ea05:73fe with SMTP id m25-20020a194359000000b004a6ea0573femr5428665lfj.181.1669026042125;
        Mon, 21 Nov 2022 02:20:42 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id dt27-20020a0565122a9b00b00492e3c8a986sm1959308lfb.264.2022.11.21.02.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 02:20:41 -0800 (PST)
Message-ID: <b8d16deb-2933-2a91-4cdc-89e3122fe89f@linaro.org>
Date: Mon, 21 Nov 2022 11:20:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-5-bero@baylibre.com>
 <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org>
 <7ha64o9h1d.fsf@baylibre.com>
 <76cae9bf-c81a-684a-c22b-9548dd82c8d4@linaro.org>
 <CAP2ifjMQAx23xc0p_LZ9Dj79Hx1cyLZ-tx8HrGUbtDR-SmdECw@mail.gmail.com>
 <CAP2ifjNeGqrr+LcMBAsVjEm8ciZ=zXxZxq3wppQ3Y37LbmvroQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP2ifjNeGqrr+LcMBAsVjEm8ciZ=zXxZxq3wppQ3Y37LbmvroQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_022043_818115_56541F51 
X-CRM114-Status: UNSURE (   7.55  )
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

On 21/11/2022 02:58, Bernhard Rosenkränzer wrote:
> On Sun, Nov 20, 2022 at 3:38 PM Bernhard Rosenkränzer <bero@baylibre.com> wrote:
>> I can prepare a "remove pins-are-numbered" patchset
> 
> ... and I did.
> https://lore.kernel.org/linux-devicetree/20221121015451.2471196-1-bero@baylibre.com/

Awesome, thank you!

Best regards,
Krzysztof


