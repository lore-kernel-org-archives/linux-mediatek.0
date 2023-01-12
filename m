Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C55C54EBC
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fw3Q/H2DqZcykx9Yf41o4SkW0Lqzy2WimZ0SDIfRlGk=; b=r0BaduVP7vEBxyIVtbiuNtD89Q
	nneYWr3nDuq1MVQc2ZgLkvLEXtmUT8g6I52zMZ6Yx8gDQ8pKRsbYwN+deo5uW+TtB5KUJ6tT7WF+/
	+vic+OUriaLVXYbJxM6YiO3NHxXqWOrWGiBNbzM1HsbrUFSuE15Y1zruRaFBo6260xfGisyYt/kSk
	eRwhvYR1rtiGXwJxqRypUPjiNWjZ+QgXqy7O6P+JwmtLaxmKIlu/m6Qy8stotEcR9vOz26bKSwdV3
	TnoYgEaEn+hkVoqPE7LwwCCo+hIUbU+LnTK9ilOgKxzrFQWXL9mMZAdJc0VEdW2w5ATrSXdeabn4h
	k4xAJQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtTJ-00EEpS-G8; Thu, 12 Jan 2023 09:02:05 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFtSz-00EEkO-8t
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 09:01:51 +0000
Received: by mail-ej1-x629.google.com with SMTP id l22so13374758eja.12
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fw3Q/H2DqZcykx9Yf41o4SkW0Lqzy2WimZ0SDIfRlGk=;
        b=v7RpQTEjYePJD15M7bQOhOp9x1hrcoCCtsYjcZGrE2dnoQAko+4f180sMszd/yRtg3
         mVupZj8TJgJj1qJkhYYzbpqY3Gaf7ts3XhsdzPBbhIJ+PIagEIi89+ZprEVTLl9hiNyH
         OYJKzWF4AcP22D/wMUnwEq4+koIM5T8SbJ7YMVK6HRyXxczA4a6m3MrhFbbJQJpG/f3u
         c4AMTDWdNxebDmZ8SEBTCxyb5W57EzGcSBos1RLvk5eoeXKG8uBYMidcLpaRnChBj/25
         9Kp0QpR9UrQYplZd2dmgnTrQfaYnEyhUv/ew0g16feu+TK48/8IbpSVSdyM3+Wdl1nRi
         xTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw3Q/H2DqZcykx9Yf41o4SkW0Lqzy2WimZ0SDIfRlGk=;
        b=vOYbHpPpHwyu13fqsV6ggaE4+iQWLSyQLIMkGdbi50JpEh+UKBR7CSiVinIVPv7Gs5
         0GbZJXMfooE+rjacVli9U/HkffRv6tRn+dMw5Ax8ciUOqJUYjhe5udAQJqI5vYerDS6c
         wECJoF0IQlTwPRJxCXXzN9T6U7FjrlYFhXZy/8Mlouufxfhi+aV3pjSrcJTlP5506VjG
         G2BanOSUM6u8853na5aVot7d+jMfMZ7OOqB3IuT0DJvJBLVvNIa2qeAQtXjaNQuCFTmT
         QcKh4SvkguYKV9Qbnoa2U8wwqs+wH86SDfrVlZM8c6l4dDWP4CXZr14OuB7NcNpVwaId
         P4/w==
X-Gm-Message-State: AFqh2kr6SP/0DaodIT+sOUQUbJlhMdq/LdFJ7Crp4sbGVh3mzvIW8KRQ
	iRRdUE5E/Gyc8Nb7uwEVSLFiQg==
X-Google-Smtp-Source: AMrXdXv4mC7D8HDXP4WeWECNsQDB1gN1Ra2s3PCCbrk2dewthSPR0qKu3wp1FZvvgOfmypDSgOJ5JQ==
X-Received: by 2002:a17:907:a643:b0:83c:7308:b2ed with SMTP id vu3-20020a170907a64300b0083c7308b2edmr66493767ejc.17.1673514097334;
        Thu, 12 Jan 2023 01:01:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090699ca00b0084d43100f19sm5176918ejn.89.2023.01.12.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:01:36 -0800 (PST)
Message-ID: <1b5880bb-d0ce-9dde-2fe6-e058f6efb6f1@linaro.org>
Date: Thu, 12 Jan 2023 10:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: mt7621: add proper function
 muxing binding
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-4-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_010150_533036_9DD74B2C 
X-CRM114-Status: UNSURE (   7.65  )
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

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Didn't I already ack it?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


