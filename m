Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570CCC636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 09:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvHDMUzeluufEeHph0ENumOann+/QiEfW8b/S7gPi+s=; b=lE+NLRMVZ2Xc2xit3s04xlh4iE
	TOVnbLwLnifGzBlqeNkMHJZD0g/QX0pYaPFbf0ZQdfRQ6QqFNNkjpiiN8WZBIEX/Vup81Xf93dUde
	RVh2BryA+zQbkesY5cgkFZ7beIOe2MaOg86FsdqwIylv5Xy/8zDFkO+ZuH70/2B+o/yINWSYn26d8
	gsQiytNLnSZ3YePn08CinxJflis/H9C7HvewBbuzOMBCzNMIXiBHcaAxabl+eMAPW2CvdycOEMVwQ
	xXuAbbbnmhB+ZlIfUDp5fXgnfbKjgrgCBKnbTbyduw5lNZj/DKwG1EELf4m948CAsZdZsSRMyqwL3
	4lp2bSNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUul-00Dlhh-C3; Mon, 13 Feb 2023 09:14:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRUuh-00DlgM-JQ
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 09:14:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id o36so8216226wms.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Feb 2023 01:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvHDMUzeluufEeHph0ENumOann+/QiEfW8b/S7gPi+s=;
        b=DqxOfAQDiloqIH1ESZjz8i4hY8LwAwXX0Uj4PmkPJKImL9ngImlmoCt6yjADMW+J6w
         OPBkkP22o9JklNpmrh4Iumkr1YD2S7uBvXsnIPD/LITl8XEboQABQG3fOJ2pmXWs4Yzy
         MOF0lVY5f+5viifXXcXPCv+qdcwieOyCKTfqQi/r/S02KdGPPuVsedVHyiV7Xq8WCuj7
         +Db/eJ8AYJDZ00MFIOSHgLdQBxlM0//LMdPKFHxotBr+iC7zVBmR+uACznh50ZoOMl5j
         xkAvEvn7daCYW4nVODMgN09oP9eo2syMqOdQStqkV/0AM5vugIoaNm6AWkAEawxDRWHV
         aXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvHDMUzeluufEeHph0ENumOann+/QiEfW8b/S7gPi+s=;
        b=1Vc4v4kR5PiPs2umJb9uyYnbf8PvJEl1R3HVz09eVJE+KqyRG6lLp8Mw+ESxHdA4Mj
         m1sgy6YvhuZHGmRv1MHBA4Z6yZbSvG3ykjjjGVcS/7JFA0Mol0OPdIpxXeWiek+/mvO1
         daGR3JBsO9OHzbiGcfVCm/bcMMl4+1gpLVWKMSSY3ovEYu9pfnbawDEEW1yLH4zKx3Jx
         Mux4V/dFsMCe0wnS8EcHtPstebvR35ixwoJ6itZmyNbZb0oO1apFxV0HcD5uZh1e2jyN
         39DIdm1YbgOI0UWG0oSUNOyFyBAli1LPxGpXaXzgS7uSH03bYcK+l541nfxUAYyf2dsY
         Yecg==
X-Gm-Message-State: AO0yUKXAP7zcOIHe15uNlqLW7nzY5SAvt7XuFlF6l0G2YqJzGE6VyMpB
	AP+4CbaoIaS/8ChzJ/T3RfKkYA==
X-Google-Smtp-Source: AK7set9tgRo5lFAVpgHrCLNyV1ZeygrioZEaIMRiq+ujIM7Ea+or2IFx2u4OpkK9TZuPNQY9IXnHOA==
X-Received: by 2002:a05:600c:1898:b0:3e0:185:44af with SMTP id x24-20020a05600c189800b003e0018544afmr3825561wmp.20.1676279658073;
        Mon, 13 Feb 2023 01:14:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p3-20020adff203000000b002c3f6d7d5fesm10089446wro.44.2023.02.13.01.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:14:17 -0800 (PST)
Message-ID: <3578406e-a2ab-15a3-64fe-5873fc26477f@linaro.org>
Date: Mon, 13 Feb 2023 10:14:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v5 02/12] dt-bindings: net: mediatek,net: add mt7981-eth
 binding
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>,
 Vladimir Oltean <olteanv@gmail.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Jianhui Zhao <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=c3=b8rn_Mork?=
 <bjorn@mork.no>
References: <cover.1676128246.git.daniel@makrotopia.org>
 <43d5e9cbf0e75ea2c039ffc632aa5cc5c83a3c33.1676128246.git.daniel@makrotopia.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <43d5e9cbf0e75ea2c039ffc632aa5cc5c83a3c33.1676128246.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_011419_690438_B3376A03 
X-CRM114-Status: UNSURE (   8.74  )
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

On 11/02/2023 17:02, Daniel Golle wrote:
> Introduce DT bindings for the MT7981 SoC to mediatek,net.yaml.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Confusing diff but in general looks ok except:

> +
> +        mediatek,wed-pcie: true

This is now anything. I propose to cleanup the bindings first, before
adding new compatible.


Best regards,
Krzysztof


