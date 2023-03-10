Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773AFC6FD1E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 08:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uB0rK1kBMI+Nt2y6Mc9XPaDU5dUgUBOxars7E0HbbVA=; b=WZ22EUDlZDTael/3sXtJjOMskK
	Js+Kb0441XydQ+fwdqrSXvgATi0ZEW035ZKMM4ERjcriLPc+tUBC6KHh+1tVv4zntOD5U75hm+T5+
	JjanCuUJaT5JIHKWW8N2cihxrfIZ0zvLUYS15zDlCeUT2p5wL5lRjrhf0oqDxKTNvoUawEikoWMSQ
	BxAvTEOoQFTgcfl0Pji4vtz5iL2cP5nFMf4BxxbprD93e9BiBXid1pMrlBPoRc8N0fz/3XjbuQsTb
	3amozBy1ZNtUFwNSO4q4LPpd9f0L3qQ8+O+PUs0nDcnx8Hyi2BSq4DqmWNgpkfiS3PrkeSzBtVi42
	7rlZngiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY7x-00DeJj-Q9; Fri, 10 Mar 2023 08:29:25 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paY7s-00DeIV-S7
	for linux-mediatek@lists.infradead.org; Fri, 10 Mar 2023 08:29:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id s11so17296642edy.8
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Mar 2023 00:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678436959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uB0rK1kBMI+Nt2y6Mc9XPaDU5dUgUBOxars7E0HbbVA=;
        b=zgXBVXiVl7XoFo76/yrd+B+8ZajxnPqv4LRc4lpDiXq7OdZ7PU/xXWxE7HWrpyTF/4
         N1lpTiy7Rd19f/jIRZij0fBTMeCwHLg6Fy+27lUQEeTbJhj52jiCJptd62K8WbgTSuAA
         cy5EVQC1vzd2U40ptkBfNGpr1GDVSRVl5mMIX1O/utfr3GQxRecLGhuaPwZwCGHZ8h/o
         tjsyIFnNU6Pb+rB8y+kcbencLHR5P36ivelAWTgGr/IE8D4nIhiNx9kNOkleDoXi3Mzq
         IEnEkctP6UNzz2Xj0yGHZr+ypNEX+hydG89RjYsnqy2hhsYic3rCyHHqAKdJspIs3x7J
         Ro3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678436959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uB0rK1kBMI+Nt2y6Mc9XPaDU5dUgUBOxars7E0HbbVA=;
        b=8ILuynuEEj6FildK7Um/RsX9+4a3K4RLUpt7egTUB9uGK0adEJeTi+ld5OdP1OYysf
         blosgaFRzK1L+XZsfi19TbsOAxT59S2AYYgzR6p1zviF3XpVbKqj9b/s6kOGkpXqJFb7
         d14V8umyh5N3y2e4lJb0adsGv6us8Ht0jbavfogZyGTfFbrlaAWWL0w135bAyURnuh5H
         cO6AwVqgsCRvW2xNzC7tmHDTvIYWfiOXJu6Kz4/gmaK8NiSxNDsSEY5scWdVaPl+2Srt
         JrP0tFxcJC+F8DCKLjHZUshu7uexxpsasb8FBz3kTZEtMjpNEgMkG/Y2RzkqTygRDuwr
         bMeg==
X-Gm-Message-State: AO0yUKV8KSqMjvSTxqSZWynTbrh5Ewv2dkkY5rKLFM7rDpSO9Djbqk9b
	U3I5WCfncR28/MUHoGSUjXcUvQ==
X-Google-Smtp-Source: AK7set8UQKKMmAOVRYKQ/i/KExXg3AgioafyC3Q1XOnef/dHb+v6PnHiGYD4PqIZELC7xxX0L8tn1Q==
X-Received: by 2002:a17:906:246:b0:8b1:fc1a:7d21 with SMTP id 6-20020a170906024600b008b1fc1a7d21mr30206548ejl.5.1678436959029;
        Fri, 10 Mar 2023 00:29:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id br5-20020a170906d14500b008ddf3476c75sm673322ejb.92.2023.03.10.00.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 00:29:18 -0800 (PST)
Message-ID: <22325550-5b32-d55a-e647-3890be6b475a@linaro.org>
Date: Fri, 10 Mar 2023 09:29:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 02/21] dt-bindings: display: mediatek: ccorr: add binding
 for MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Daniel Vetter
 <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Thierry Reding
 <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
 <20230220-display-v1-2-45cbc68e188b@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230220-display-v1-2-45cbc68e188b@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_002920_961414_1A299513 
X-CRM114-Status: UNSURE (   7.61  )
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

On 09/03/2023 15:22, Alexandre Mergnat wrote:
> Display Color Correction for MT8365 is compatible with another SoC.
> Then, add MT8365 binding along with MT8183 SoC.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


