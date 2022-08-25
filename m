Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465A0C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eX1BCgETxpvjvzuPzcdcjI9NXTy9Ze4DX2J+5QEsZk=; b=zvKnheBTy09/pz9mtHAqVYFktT
	CANDfRQmpcyjw7CpRsAIJFdzYrhqNwFwuIeUa59mzrCzcVzVVyut30UnLeI6Jmjj/nHHW9dCcvuET
	aVG9zVjroes4ZFyxjFitPEUXXL9NfH5joVmqrFsa2GSNLH6gK2rw9yW7LyFz80Rtz04s1lIi8I105
	8y2c8OvyhtVpPV+Kit9dUTc4zN9qbOBM8ECBgXe82mywDqt9QTZ5XKopmSvGpfL3Shkd/6sUNwx6L
	BSGvz+O1VVSFa+u83yNwZ5ellFoT0bRkhHBM/w6oTTpmHUMI0EXwEkbuLv4CL6SmJtZkTnVSpo5NV
	LcC4/69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Ct-007oXn-Be; Thu, 25 Aug 2022 06:19:11 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6A4-007nS3-PL
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:16:18 +0000
Received: by mail-lj1-x22a.google.com with SMTP id u24so12856909lji.0
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=6eX1BCgETxpvjvzuPzcdcjI9NXTy9Ze4DX2J+5QEsZk=;
        b=uDyBXqWr+lPD/ZmtW/w7/gh4xVS32yx21+JN2Wy4Cmt9g1koHNDeGJA9hP+dk+pQ9o
         sfFv/qebV6A4014opoAjppk7WLd46Ed2/jE7g7+muQiSKEDrHcq1ENIxXedpdCBje8Kw
         XTJBltrZ379R58fBjJArXmbzJFeSGZJsbrngePGfJKLe6GSdc5iRsEZdrr+C4BtfafNl
         XMRsdulD03jv+KGxjxPEn1P2VPIIGL3fUoGWALQBwkh4uYl3kcyG3Yp2pdcrFqO/b9t0
         0L8P+IKWwbV+BbFx9sYczk4dhfe9mAu9B7DO20XTRF+GHDysqh/mqE0ggNVvr15XB10s
         aFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=6eX1BCgETxpvjvzuPzcdcjI9NXTy9Ze4DX2J+5QEsZk=;
        b=oiRi/81WKp6zM2pU7R3P6jNkbeU7IdW7iQPfpjOeu8wdnMBi+4QqvvXNCXfGbVhvqR
         5UZUnfXplkW8TV+39+/uDngpGJRghJ1rCm8yvd2Hb3KtoxkT4akP/P/eZqtWTaKpf+Vm
         ZHgrYutyolwuFuNR13M4/WD9E+XHwcyHTXEJceQMQ7EVyQptZcAt3vzt+Imq4iQLQzhv
         vZ0QS7SfboQKTZ1Asfwkf4KCPd8H2d+0W5+mE06dZkCY54ToBelqq7DfTuHaVNhYIgNB
         HiIVodmuI9D9C3zqYDN+EXLFUToji8PqUr10+symiPxxJRTYWAud7lQ7H7RyHTAgGgGs
         /YXw==
X-Gm-Message-State: ACgBeo3Tpx8XXRzUbFdWpjHnYOsRhHKkerQ9Y0y2gImKEnZ4aznWKYQn
	IUOQn1Q69PUzRbZXA9+2/vFjxw==
X-Google-Smtp-Source: AA6agR5bwdz/qtNkVzzrjl5zRg+LBR0JoyjGsTqeu+pFcRYbZqsHQfZbNP9l4AVXS/xy6aLM8ep5gw==
X-Received: by 2002:a2e:a170:0:b0:261:e4e9:818e with SMTP id u16-20020a2ea170000000b00261e4e9818emr689248ljl.168.1661408172993;
        Wed, 24 Aug 2022 23:16:12 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id o11-20020ac24e8b000000b004926689d410sm315205lfr.171.2022.08.24.23.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:16:12 -0700 (PDT)
Message-ID: <8113a5d0-4029-2d0c-7c69-fa81d1b208e3@linaro.org>
Date: Thu, 25 Aug 2022 09:16:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 3/7] dt-bindings: net: dsa: mediatek,mt7530: fix reset
 lines
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Frank Wunderlich
 <frank-w@public-files.de>, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Sander Vanheule <sander@svanheule.net>, Daniel Golle
 <daniel@makrotopia.org>, erkin.bozoglu@xeront.com,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220824104040.17527-1-arinc.unal@arinc9.com>
 <20220824104040.17527-4-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824104040.17527-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_231616_842503_A1ECC9BC 
X-CRM114-Status: GOOD (  10.52  )
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

On 24/08/2022 13:40, Arınç ÜNAL wrote:
> - Add description for reset-gpios.
> - Invalidate reset-gpios if mediatek,mcm is used. We cannot use multiple
> reset lines at the same time.
> - Invalidate mediatek,mcm if the compatible device is mediatek,mt7531.
> There is no multi-chip module version of mediatek,mt7531.
> - Require mediatek,mcm for mediatek,mt7621 as the compatible string is only
> used for the multi-chip module version of MT7530.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

