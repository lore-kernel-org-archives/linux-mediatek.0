Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3F8ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76qBouYIHeC6d/ctco6Wmf4ZHs3wGtu4s1Cs+RWbvmI=; b=Srj3JidVEpJc+r+hz/YgNfC4hK
	rb5UakjK4E0rUQGp+MKMnjfHjjKOoDhG+yDxanyJbb/8JqtIAGt6mJf49jCIDE21x7zfRItQ6MGwL
	LhHVBbEiJmURpDHQwQVTCFFGSH/FNONOUQbZPlT6px86pjdCEmBiQR6V+qYzRoXYqfJ6oMNGn6IXY
	l5hUx6SuMBGiwvM4zUuGt9YiOha+DSToqCJfwBLk3i5AgRWdvrsQiljwtEkoLe4R3P+33Mho4HaxQ
	hB8aHZEuGV29hAZcN2bypv5+ctpvBcbLmIG9FgXbhw5vUIHPp+z+6X/LMZkQhTneCsAEO51ppFGVw
	qqv9kx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT5n-00Eqqe-SH; Fri, 26 Aug 2022 06:45:23 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT5l-00Eqig-2f
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 06:45:22 +0000
Received: by mail-lf1-x132.google.com with SMTP id bt10so820910lfb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=76qBouYIHeC6d/ctco6Wmf4ZHs3wGtu4s1Cs+RWbvmI=;
        b=wv+Xyza+ltAZ/PD/0TreZBciu5zRPf/PRZBnb5o2mANd+7GTTG1nuu0dL/DQDdHhYJ
         pG7GSLsTYDS+wHn4+4AlZOWOMGPRbSG7TYDmIg78dgSixEyISbKBWPaF/P1RBGUfGpIQ
         tRKFnWCkmBZWnRJRKNsBUqK+tU6ol1pKsXqXWgRF37hzHVyaNcxIpFxWbMH4Wcp0vw/a
         R+swT8rzKXaNHTEuYHex5nQgvIpSHXVltY/qkHU64n2WOr1wTt/xJ34ROF53svJqfU9S
         FSAuNfeZh676JzS3ssEWim1DWTi4NJRGn75HsBHgzfprjdQcL+TUR1OQHddPMjmy0Jmd
         xiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=76qBouYIHeC6d/ctco6Wmf4ZHs3wGtu4s1Cs+RWbvmI=;
        b=etA2v4PKt9kpcdRJHvJvMqfWE5sdsQmR/pgR1lOqeZCElEVFlfXCWO3YJaSbedoo9e
         NuLzPALCMv04VeSF19RywHVpxX98Rn8VLk9HDuJSeNElscyXumv/fxv0K4JA9ZpabrMo
         AGiiUum8X0wHMtrtbKRHOLc1XhZq87vMa7QPzqBzqH9sBNiCM6GxYt/PXu1vuWEztEIU
         amFxtvVqiGLfBTgTfjH+Ua0ehMBrjTQYcciy+BwXhhi9pmBm46n/XdCG0/r0uQ5/x+Nj
         NRQrMpiDhjHFG7CetknI3KBLKF4WT1pa19oWZUMVMh4DQ+JrkJqKBhDbicTD1YhNHjX1
         6EuQ==
X-Gm-Message-State: ACgBeo2hfXeUvmfsZxX6CKisKxLIQ5plxdfV5fNxy55vIMGtFAzBxAQc
	GxIS3XPi4YwThCcfmI5o57LVmg==
X-Google-Smtp-Source: AA6agR4SJUwINorjaTc/7IHwXWRWERcYLsGWka9nNqc0mk3QNBrJYwP+7oaIoI2J1QriQ4TjtdnkuQ==
X-Received: by 2002:ac2:52ad:0:b0:492:d8ae:364f with SMTP id r13-20020ac252ad000000b00492d8ae364fmr1907211lfm.249.1661496319499;
        Thu, 25 Aug 2022 23:45:19 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b0048af6242892sm274234lfg.14.2022.08.25.23.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 23:45:18 -0700 (PDT)
Message-ID: <f85c693b-daf4-c2d5-9ad8-88aef99eecaf@linaro.org>
Date: Fri, 26 Aug 2022 09:45:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 1/6] dt-bindings: net: dsa: mediatek,mt7530: make
 trivial changes
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
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
 <20220825082301.409450-2-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825082301.409450-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234521_152480_4515BC3F 
X-CRM114-Status: GOOD (  10.42  )
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

On 25/08/2022 11:22, Arınç ÜNAL wrote:
> Make trivial changes on the binding.
> 
> - Update title to include MT7531 switch.
> - Add me as a maintainer. List maintainers in alphabetical order by first
> name.
> - Add description to compatible strings.
> - Stretch descriptions up to the 80 character limit.
> - Remove lists for single items.
> - Remove requiring reg as it's already required by dsa-port.yaml.
> - Define acceptable reg values for the CPU ports.
> - Remove quotes from $ref: "dsa.yaml#".
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

