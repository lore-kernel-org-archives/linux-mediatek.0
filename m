Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F76C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXgjHTAdytoLgUZyHzzq4dyrdO9fvokMGFShZim/Sxs=; b=yhuUsZ7BxStZXtcR29PUi8O8Jv
	f/+BYKIi2FN1uFCfCGe58HHfyTFn9XViRKPD4YlBsTkFEpX13X6/D8YUrZnwPZ2pEm6A7qZhrWNeV
	euObV+CZ4qFwTXs0QLEkIPj0hYfA79LixlYhp0gXQzQrk/AxoWmYm3cQYdC7cmaaIz7a+QP5iImdL
	rYfgovdAWMn0AUcMHZywuUttk4pbdTBi59VbWJ5ffdvd/6+wdYVcxCThRUHPHkAiP5bn1fHKTPKPX
	xWU1cGtGajY8fRLpeooBHo0fkLTodMM63JWi0UaRw8yv/XVKpL98BhLU0SlnW7X3iNF02PG+MTy90
	2nc2Fwyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJOA-004ba9-18;
	Wed, 16 Aug 2023 16:28:54 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWJO6-004bZZ-1K;
	Wed, 16 Aug 2023 16:28:51 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3a800814122so2612985b6e.0;
        Wed, 16 Aug 2023 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692203328; x=1692808128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OXgjHTAdytoLgUZyHzzq4dyrdO9fvokMGFShZim/Sxs=;
        b=qyw4CNHhKaU+ZrllPmAk3cWrbmVyZpXunhLa+YOqcH3nzzbq1D/DVyKIw2tKQB+8Ii
         4ExeXVyehEL8JzztUlM2IasuE9W/bpPCi5Oy6nh8OYSDJM6Ja8fPZzt69RbfnHNk2ekH
         RvoLxlm0LJqLVLCNEcLxJQnfxD9G1DkHbPlYwlKRg1+GRjV+ME7p5o/Dat4QRATgoYc4
         g48Asy+rNv5T6ouXLT/hmD8D6eaqU/5+MhSNxgmtDq08O77AlQhyq+yzlM0C0INS3fTC
         fpRth9QNiKiayu7KqDjn7TQOcnVI6Kud7adEhFsS0nnhNK0BKahchWp4eZMPjNPVNPL+
         yQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203328; x=1692808128;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXgjHTAdytoLgUZyHzzq4dyrdO9fvokMGFShZim/Sxs=;
        b=SDew9uaS5dPCOGAlAGC37xWD6cHKoBABUwSXFIcKCC0+XsVVM0mY0dp6RHcC7S190z
         a5sDk4dtO+24LrNLVWilBvJIImWWauXL+6r2OY9ln1gCrCxlYjjN+TJZoptIOuCJanIn
         XGGmdj0GsuO1L0H+2YTe1F5A12amw3RCa35lkejz3OPUStdD+Ly8SNqciqjwGH13wVMV
         DU4D6p7bG0kIIbqyebcVtUcBFzcN24IWzPGyTGa7ZasPtC2GYE6ZxV3jkaWjVodWsccL
         /V+Qri+RwdSEKc1CjLN20nadnDoJvcJCEzx7KdMdyijAmSXpmRbs5KWriAdqHvp2poq+
         7YTw==
X-Gm-Message-State: AOJu0YzmH/kxigNwEdKMW6Onf51fsel8qeXkcM1aOdomHXBA+ULlyRMi
	85lUnpGDUkP8ar7fSXkc6Vo=
X-Google-Smtp-Source: AGHT+IE7gF6G+GXuQtpoM6J4S+ngEbixSrE1pG1ziA+I7vG4LD60n9fDC6EXepNmmTmiT3gmnjdQoA==
X-Received: by 2002:a05:6358:7f04:b0:135:89d6:22e9 with SMTP id p4-20020a0563587f0400b0013589d622e9mr2669136rwn.13.1692203327824;
        Wed, 16 Aug 2023 09:28:47 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k7-20020ac80747000000b0040378535dccsm4553854qth.43.2023.08.16.09.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 09:28:46 -0700 (PDT)
Message-ID: <7d44ebf9-3d1c-d405-5c1a-5ce721dc37e8@gmail.com>
Date: Wed, 16 Aug 2023 09:28:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/4] dt-bindings: net: dsa: realtek: require compatible
 property under mdio node
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-4-arinc.unal@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230812091708.34665-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_092850_452511_FB045BFE 
X-CRM114-Status: UNSURE (   9.64  )
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

On 8/12/23 02:17, Arınç ÜNAL wrote:
> The compatible property must be defined under the mdio node. Enforce it.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


