Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735B2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IURNtvp/qA6Et9wbMABOWuFOahR+EuxRzrITEzDlEEA=; b=oFd8dhkTo/t4cx
	7cZK+BvOzvbAfYXy9Xis9mHV639qsYx5XMXYdhfFdKZ6crZs6M0vpzuGAlhd5CD3WYd4mYmuJqvas
	v+UUZxyovNH9HkEsOTly5crxOS5z25+V3URcdrVE0g0YSzQghvKzBQ18S24h9ptqxVKiYe14/5mMZ
	bsgJ1cdTGS7EQ+nMvvZbvlOxA6KFjAznHY3MKKbNhiFik09o3Pqmajkq1QF2+xlv1pTLrx7PhD29S
	kP+52tC1GNtXdDQJ1S1T2coRHYJLFjVUbSO8QBEVAKAnW5Ge5X8jKFkqXsPNIawYtcYwywcK1J7CL
	ZqDBdYnbu8TrBrmyrDvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIus-00EOl4-Qk; Wed, 01 Jun 2022 07:37:18 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwIuB-00EOM9-Da
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 07:36:36 +0000
Received: by mail-ed1-x529.google.com with SMTP id v19so980696edd.4
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 00:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8rVL+zCqV2ClaM1IvMumDzQRQgddNQZVClfHLs1uusg=;
        b=sKQZ120R1iNb1rrMlm+ciOWFgz2PLWOBBf6zbwbmdaEX01gTOn/F5DMc8O+KkNCiHw
         T0m20IjcUP0Eo8mLj+H/3+5syyMtRoDVL/qxR1hMbk+xqkOdvJyxyp/NmQntmgb9I/Yc
         qYzkVKnMibnBSzM81g/9+4tzNkOx2Da1ZcTaPbH07baNz3cxSOkhLHJwBjFq5Py8hrNF
         AxIj5Viuqo8Ew+VWIw8UYTSegDJPEe5MD3lpJPzUcbL+pHlyLXh2VZD9lfolWyqGBOSS
         DBHhSAi3rsjvnaRJKZxp8eOnMKiFDzetWvlMI+m3lx+rqJpy/8zmCVrvhXwrimuVrJdW
         INYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8rVL+zCqV2ClaM1IvMumDzQRQgddNQZVClfHLs1uusg=;
        b=jar++PDBOdPaDwJlw4SUAaXgQifummvUqjFpfS2ojL8leEaT/1kM0MWqvUh7YB7uyd
         3z6Rm0lbiu1rPyrHztS3PgCz5Wj3lPTKU6RpDc28TJuzMF654g4UEfKovUh37FP7n+5S
         lkAio6EzjDn0YiANY8P37uOAhJCKD8JVjt3euSZQhFTd43zElyzKzXWfooflXafyNo/h
         t6D/qtZnY1D/3aEsoz9V4kkNQkaJ0xzgrBgLR2dRSfljh9Xgbng9oV8rMIaR/SJrkyw+
         YwM7B0u1bXhXjOHMa0mQzvokOQYBqlMPr3g1x7dHKDIrNCCxheNSWNw67mphw96HCO3m
         LRRA==
X-Gm-Message-State: AOAM533g1MU4rdYSQ7oAtcXyA9nrSIzLMpnOTrcOo88lcpVxa352+Wvr
	XMt9tR0FGIxiKEZcg2jthMmBMg==
X-Google-Smtp-Source: ABdhPJxXmZbLT6U4B5wdKbc3qaM3fx5m6yRjmA3N01Sc1bKs2gwCTbf0eEckNJ1b2uUmeUtTa2N70g==
X-Received: by 2002:aa7:db02:0:b0:42d:c3ba:9c86 with SMTP id t2-20020aa7db02000000b0042dc3ba9c86mr20256525eds.337.1654068993673;
        Wed, 01 Jun 2022 00:36:33 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id f8-20020a170906824800b006fe7725ed7dsm372355ejx.34.2022.06.01.00.36.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 00:36:33 -0700 (PDT)
Message-ID: <2f292066-4cf0-165e-c4cd-fbba9c548b6b@linaro.org>
Date: Wed, 1 Jun 2022 09:36:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RESEND 03/14] dt-bindings: leds: mt6370: Add Mediatek mt6370
 indicator
Content-Language: en-US
To: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
 daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
 lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
 heikki.krogerus@linux.intel.com, deller@gmx.de
Cc: cy_huang@richtek.com, alice_chen@richtek.com, chiaen_wu@richtek.com,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220531111900.19422-1-peterwu.pub@gmail.com>
 <20220531111900.19422-4-peterwu.pub@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220531111900.19422-4-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_003635_523518_11A3C8F5 
X-CRM114-Status: UNSURE (   6.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31/05/2022 13:18, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add Mediatek mt6370 indicator documentation.

Please apply my previous comments.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
