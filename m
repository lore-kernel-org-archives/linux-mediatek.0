Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F243EC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 10:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3TD34vPQZyiidhF1zkU6GCwiTZaGYr8zPWkji6mfAo=; b=EHtYyQo2jhbTeAK0NAJAEkRWbZ
	dFI2ptKnBb7UBIsId+nZWYKZDecIkGC85cPMNwm1oXRER90wXakoqnKS++akyf8PJOd43dxwXsR1W
	KP8Tkjd3PFLLQePzL8GumqVKeHFHgucMFcHm1SJ8ZcdVoZ9bc5PKNKrPpUqcGL9l1yNZjUu+ytB/R
	VMXH9nVfxaYp/VmmwWGapLJWGu/BHFVY/HDaMBQ+z4B83GvAkGr1ZueWoA2ssAbMCSJoGfei5uIWA
	CZSlNX1JuYVflUIM1MA5MTZBHoNjlQj/0vkTWn2/gF8kj6JrtWero+bJgcjNU9EaTFrJi14ewKGXw
	lAHyfkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWSs-00EEV4-Fy; Mon, 13 Feb 2023 10:53:42 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRWNe-00EC2R-UX
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 10:48:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id bu23so11667613wrb.8
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 02:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p3TD34vPQZyiidhF1zkU6GCwiTZaGYr8zPWkji6mfAo=;
        b=tIoLRNPjIuHeQWvUCCLKuYJfO5Q6G7tv8ssA+oxX00bP4qd5RCVEohrG4QZPbWnjw9
         7d/t4l9LHtIwGIT7M1R8xPn1Z1fRBZpzQ2I0hC3+X743PQ1Z1Go3vmfJpMXkBVDvRphi
         Dkt2q2WhhM1vvIGkb9kXD6jhv4F6QGMi8Unw7PXgPEo0J/U5OyNXTGIfIihh3Tf0ycDf
         nfd6JQzPW2LTrs8BZ8kiQqcAvygoRqqAoPInVXvDXUicVStg4QbBc2eWgHd4lhguV2Zh
         s8pC//RNGd8Ax8vVVT2m2b3sXWnpmpw79ZdzL078/54szk8a7xmORmhZLwILyQNwFjUa
         8Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3TD34vPQZyiidhF1zkU6GCwiTZaGYr8zPWkji6mfAo=;
        b=xk/swZueMJ+Vco/yhkGgwtpU3rbt+XYjT96CZNUQEbrB0Obsu5LZqMuJwLHh8pMt7E
         TXUgW/QejaPlF+F/N2AjGEBh/F/vFl6YihpDc1Ty0ICYJ7q7DQFNIYEkzC5mJ76ENC17
         RNoUcxO0Wl2Q16f4BUuFi+j2nFKlIfs8HhO8jCPUHPSJfdpGgfadP8vz5IjMbYlyqvxA
         FeUZSxFoxjfloZD493pyNI5ggsZDL5yAIF6ZZ9D4DBRZi+q4X7gGZqgVN1nF3A4N8pCe
         1kgKRrnZxsmcWxErF0hHk+vaH5To/VvYGOzsZHLhPuz7RbjUDSB6Gq4HqUCJvI8QRVdR
         bY0w==
X-Gm-Message-State: AO0yUKVbryFKixORQmxWNIzf3dGVW8wzIsOsY0frjsQX4aksGiXQo0ow
	ryPyfY8idm6oemq9i0QGO/mR3A==
X-Google-Smtp-Source: AK7set9JoeUT6UsF53tPOHgWzJ42AN1vOeyM1T1JG78R13UMithB6CVkZkXgY5gsq8Ll9FVc0eDF0g==
X-Received: by 2002:adf:d0c2:0:b0:2bf:e443:ea70 with SMTP id z2-20020adfd0c2000000b002bfe443ea70mr20501532wrh.1.1676285296828;
        Mon, 13 Feb 2023 02:48:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l19-20020a05600c2cd300b003dfefe115b9sm14931286wmc.0.2023.02.13.02.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:48:16 -0800 (PST)
Message-ID: <0c54d39b-59e1-2e58-21b4-405851211d03@linaro.org>
Date: Mon, 13 Feb 2023 11:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: net: dsa: mediatek,mt7530: improve binding
 description
Content-Language: en-US
To: arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
References: <20230212131258.47551-1-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230212131258.47551-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_024819_050110_AD7BCDAA 
X-CRM114-Status: UNSURE (   6.45  )
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

On 12/02/2023 14:12, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Fix inaccurate information about PHY muxing, and merge standalone and
> multi-chip module MT7530 configuration methods.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


