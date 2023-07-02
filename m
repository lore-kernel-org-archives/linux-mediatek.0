Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EADD6EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 10:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E/AKobFXk2c7axAYUWlFRY5XKu7EkRHpm3DTOLsRDMw=; b=hunDvUxAe5bSlKAtma8sJci9a+
	k/dwM8XF6PbjIbCuzjcQhLWkogxYM5YwJ5p4dydrOh3iBzcO6z0O1d2jHvWRhvx2OfETElF9d5g99
	O98LNHH3g4QEjtcIznF12fTSlfWgTA+h0HTcwuMRCr/gZJrY2ADgmgYjTxllyKyoug3KwltPd8y4I
	Db+imsvSbOFB7ahh/7FhHygRmQvfijwkTgme2o9TnQ5CODK4XmcBPaxRnvN8WEulnVq++WyMWiMIC
	6F2mqHWneFuI7mvrmQZVvWx2xgOJcmrLIaD3lEfvteLyGqvPmbxiczFZZ/sNkzUy2LyKmeEp+K6NG
	hleWFpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFuLQ-007YfD-2E;
	Sun, 02 Jul 2023 10:30:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFuLM-007YeB-2L
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 10:30:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3141140f51bso4599220f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688293811; x=1690885811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E/AKobFXk2c7axAYUWlFRY5XKu7EkRHpm3DTOLsRDMw=;
        b=qYeuy69OwZ+bkpFiGmLnLvQV+HdgH8p5lPD1W6N+UirHmEQp/EQYsPcT5BdhVSXLC9
         AxItyQc+1FnHfifuChU4xhxfm/rXJSzZNe1KRhFTmyfN4i5VqMqZo7m82Zvib45z34Bu
         HJoNGec4gqBa5X3uvSyRZSyjR5GdzBYRmC4HJl27XkNvl9JATaW5R8srXSWZKJzBCnq1
         nBNkY0RsiWdUEgXR4T7JlB1riEbuVeeqWAcrn4JMABRXjWUHVz/TYNfaaHf7LUKHD5Vk
         DoQbA4SLBYpR04RSQxq9buZbfgKmRVdTaF2rkV4xq1XR3Ei78FSMxscPGsnWGayjAQHP
         +Kcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688293811; x=1690885811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E/AKobFXk2c7axAYUWlFRY5XKu7EkRHpm3DTOLsRDMw=;
        b=aMWrPwMLiUAy29Tb1c0A8klm8MuSybd0H+469+spLzRtNr90Jgg5QmANqt6LNYc6Ii
         XzzLs4SVlZpWuy9aYcLzOdAZUIL6kjqghP2LC9T8Ws8vFUX8ustKBNzX512k4Ve5rPph
         dEe0ky5MrTePdmVa1ilkBCX1pcvB57eLGwn87f1xxd3ovcu0SD8nuIINAOiGyfqW3zQe
         d4ArGt67RDEbWaGO3Kxzec+d9nIXfSQVx2f3Y1AwDd1Wmcs55KnzmqWtTkmwnAvE83h9
         zcDHiE8K3klzkBIwSXtIrfoaE24tVytEuCzkq7PaErmqWfNM0W4MmUtsHs2NnWfQeG9D
         zXEg==
X-Gm-Message-State: ABy/qLZFGsF4oKavj4VYDDYimVlH37WsZ1+cFK2x/NOq0lfkGKXjNowB
	KpU3zllFbntXC8F4YxIcKzg+uw==
X-Google-Smtp-Source: APBJJlGd1Q363NUQ95fT39f6EGsQ1a//7/2PXR2vnTVuYr5WHw1UQOY0P0dU26vA//L8rrC45Cvh2A==
X-Received: by 2002:a5d:4ac2:0:b0:313:e161:d013 with SMTP id y2-20020a5d4ac2000000b00313e161d013mr6654510wrs.15.1688293810652;
        Sun, 02 Jul 2023 03:30:10 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7dd47000000b0051bf57aa0c6sm8969693edw.87.2023.07.02.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 03:30:10 -0700 (PDT)
Message-ID: <3348348a-ee62-c9c4-d9b4-0df6745ff6a0@linaro.org>
Date: Sun, 2 Jul 2023 12:30:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/7] media: dt-bindings: mediatek,vcodec: Remove
 VDEC_SYS register space
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230630151436.155586-1-nfraprado@collabora.com>
 <20230630151436.155586-4-nfraprado@collabora.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230630151436.155586-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_033012_823071_EFA91AB7 
X-CRM114-Status: GOOD (  12.33  )
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

On 30/06/2023 17:14, Nícolas F. R. A. Prado wrote:
> The binding expects the first register space to be VDEC_SYS. However
> this register space is already assigned to a different node on both
> MT8173 and MT8183: a clock-controller node called 'vdecsys' which is
> also a syscon.
> 
> In order to resolve the overlapping address ranges, remove the VDEC_SYS
> register space from the video decoder, and add a new property to hold
> the phandle to the syscon, so that iospace can still be handled.
> 
> Also add reg-names to be able to tell that this new register schema is
> used, so the driver can keep backward compatibility.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


