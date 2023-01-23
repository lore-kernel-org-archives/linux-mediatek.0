Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCC4C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 18:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h2cQoEb75EczKKjAWZYjz35p/GfaCp/uIVzj7rfHuXk=; b=Sk5np6tlqJXtzJYHkv4F7Utpoc
	zvfTsSHQ/pbdG5grD1fULTBbHXMElwQ2TOgKwV0LBHH9LPKTRL0tqH8c6CBXiz5XMwEi46uNJ+Gec
	340P4xvWZVain3EXNoBfnbyyK37ez5aTVLuFRKkTyefVc0jWduJAESvHnk0R65Z6RUvt6iN0cEPj7
	W6jTLYRaS2S3nbiPL1iSRTfb/Xqik8V7JQB9QgaEpKfEJVSE0aONpsenQz7SZMs+fWYqtMqcavnmC
	pnTNX5C5c6LzAZ93bIriXSylFG7v1y3ToISW9L96v1SpyjPGovddAQh1R423/Pa2IZpLAVgSRIPdX
	qTmlWxzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1w7-00145x-1o; Mon, 23 Jan 2023 18:52:55 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK1w1-00144k-Vd
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 18:52:51 +0000
Received: by mail-wm1-x32e.google.com with SMTP id k16so9806468wms.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 10:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h2cQoEb75EczKKjAWZYjz35p/GfaCp/uIVzj7rfHuXk=;
        b=XpG4yI3/+KzK/651AVNtQXF87SFqCv1BdZOVTWxCyvnrqmLbAjPrgKR+g9KZCHxmwP
         5hA3Rex9rTzQcVLyxyhmT/r5+97QWNHcMbdAO6vNUNyGCiSKApgKASAYT8+2qhBWhPw/
         hFytiZqMYyzkz+zUTebHScKj0hOoa8p9eNVsDrNu0V708RlYF6nHdX3s92uaTAn+gI9b
         hiniRGrVYil/QLPWoXnuIsP72DwIecqwbDFcaIhgFq3k3Trohb6m9T9HBotVrrYCfSeX
         cTfDt8omtqQIlRJI08xFo4saKDNIZy/IEX27ZG/HrObQePeqLgmNpuukPZmI9VdAzOKM
         mIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2cQoEb75EczKKjAWZYjz35p/GfaCp/uIVzj7rfHuXk=;
        b=p+CpO8mOVSI/Q0TPcNnzErmzllB2kvza+qvnAoooKyYoUTxca/seIavSAu7fPAzsTe
         IOu616cdhVTXTHVXMKItwh2RonSKNBsATw4ZeZvzsgom8C1YCh3S/SBNn8nynISRAWMp
         aDnClKdfE+169cBb3B2QEAmSJaOWZ8cKgPAD2KJjTLkVumBJG/xB9nPqso+P96E22WFY
         Y3xNkc9dv3V+qgmKRkOLJIzmgkpSHei06Dr9NulBy+ntYebqzlc6kNSzFYJUIUyEJG4h
         c2KBFhx9vydVZpvZTGK9IaudDR4H3DB62zcOWZHSF5trT65dEAlmGTHPaRLh8XDHZNzD
         r19A==
X-Gm-Message-State: AFqh2kq5hW/nwB4mDpNwP5CLC382iA++I3YE+Vscp+bAEEyqnSiRI0Fp
	iW7h38JsyXwiVuwkriVDATlXKw==
X-Google-Smtp-Source: AMrXdXsjZJWtWk61ODR4rKw5oKMzXA5JdwT6IU1QwVh5Rfk+vxs//732Udxrc+zaRJ/w1+a/X2T5ow==
X-Received: by 2002:a05:600c:4d81:b0:3d0:6c60:b4d1 with SMTP id v1-20020a05600c4d8100b003d06c60b4d1mr26206864wmp.6.1674499965361;
        Mon, 23 Jan 2023 10:52:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p1-20020a1c7401000000b003b3307fb98fsm11165968wmc.24.2023.01.23.10.52.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:52:44 -0800 (PST)
Message-ID: <b3f563e3-6ecf-75b8-0978-d00358bb8ac2@linaro.org>
Date: Mon, 23 Jan 2023 19:52:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v8 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365
 SoC bindings
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com,
 gregkh@linuxfoundation.org, daniel.lezcano@linaro.org,
 chunfeng.yun@mediatek.com, angelogioacchino.delregno@collabora.com,
 allen-kh.cheng@mediatek.com, nfraprado@collabora.com, andrew@lunn.ch,
 gtk3@inbox.ru, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230123163833.1007181-1-bero@baylibre.com>
 <20230123163833.1007181-8-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123163833.1007181-8-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_105250_062710_0F912371 
X-CRM114-Status: UNSURE (   5.59  )
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

On 23/01/2023 17:38, Bernhard Rosenkränzer wrote:
> Add binding description for mediatek,mt8365-systimer
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---
>  Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


