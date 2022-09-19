Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E5EC54EE9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 06:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg2LdSzIVICz31LePZFG1Iioz/4ESF1qtF7G+S/AiOU=; b=wuRto+Bvp3BW7dS1tviCpOvJD5
	7wFWRqX9BuRTPqT+M8+Cf858VjwfS3qzTpGrH6TlyKcbSRaQItm1O6mncuTo0ARKOmrpPBwMB5y74
	MIXfgUN1mxejOYzuA1aO6qfE1ePv9AVe6RXGQgLKchu8idSetguD6kE8dN6ZAzA68czEyFKix9lBf
	DTkew2SF3w+yGZxNfu7jICRPS4vRtodC6xH3NmU7VRQoFI3eGYamVK7vXjBw/8nP/E6s34lj8zti+
	C5RO/p7b3V2FXPP7quSfjWrXva6uZ3hKTNW8nOuIrm5947j8ubgEmpC9+YM3aaar40NcPxGYreQhC
	WJHBc0Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaAbG-008qai-1v; Mon, 19 Sep 2022 06:49:50 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaAau-008qPC-NY
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 06:49:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j16so18354506lfg.1
        for <linux-mediatek@lists.infradead.org>; Sun, 18 Sep 2022 23:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wg2LdSzIVICz31LePZFG1Iioz/4ESF1qtF7G+S/AiOU=;
        b=LQ0PJ9UOqgyHgtKde1U+ptQ/Mn5uhuov1fljVavJrCae4aiLpr+S9LuMZGmwW8Er0X
         55L/sPk1gsFl2P+81tIVaB8A8UXNyxqJ1OP9BEefC10k6YGhdjTGhqIj4NOUg8r80QDx
         3rkVEyqttk4oI3ziHt2n99izkCrrda6v4MwZtAj8TdYbOaw/vRBn3mJ82CyCAzPS+6dK
         r3JToyYsi9a6jZo22NNWxc/ZMuaX9UmacwRVF4ByNC1z2QXb2eSNdzsiWs0CqdWtg/SL
         XcmEZ3GKGoh1qSiDd5wzZjp4jxyfM4wFuXHGMCGYzowZNhAUMbEq5wD33cVGKhiUqQBQ
         kDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wg2LdSzIVICz31LePZFG1Iioz/4ESF1qtF7G+S/AiOU=;
        b=GDPmIrcQOEMckrak93Qeo9ugHNm2EVWoTa+I7qbyObJGjE3Y0/CxkPBF7dK/GlrbIM
         Y0lg99ckiMA+nMINx68B25bfOZTprlOODuEhMPgOhVUaHWwYQrux9h5DH7NDpCw9lspK
         Vk5/diuRagnSwMEHFueEKhOhwR5BcykDZg43+dSDdDlrTWoLsaqc1ozY3ug+buAaM82V
         /cUn2dodDtP/VZtDyAPiBFoRqDME7y5QB9NtT6kVSosObf0fR7gTAWP+ToqpXE/+Hell
         rW0ZTCtg9sG0w6TbZdz5PGhL07dV38xCheG0zi8S9NGXI4pvUVY2MytJ99zENz6qOcgS
         nfqw==
X-Gm-Message-State: ACrzQf2fOPKx+8PsjPyE38v8ThPuzWc81af85Jf9uYvWWyh0pewcClqX
	vcf/PtMho14H7pCUAMqOtXcA6A==
X-Google-Smtp-Source: AMsMyM72JEClxw2NN07eQDI1hAMv1/diGyAp/pVGnimUheZZ+u+vF3d+fFkVgA8U2duV6CGVs7Sgpg==
X-Received: by 2002:ac2:4c4b:0:b0:499:3234:64fd with SMTP id o11-20020ac24c4b000000b00499323464fdmr5911754lfk.190.1663570164871;
        Sun, 18 Sep 2022 23:49:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y24-20020a199158000000b00498fbec3f8asm5053820lfj.129.2022.09.18.23.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Sep 2022 23:49:24 -0700 (PDT)
Message-ID: <f6542e2e-8214-a53d-70c0-5389e0b6e568@linaro.org>
Date: Mon, 19 Sep 2022 08:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 net-next 04/10] dt-bindings: memory: mt7621: add syscon
 as compatible string
Content-Language: en-US
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
 <20220918134118.554813-5-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220918134118.554813-5-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_234930_267314_8B01D6BC 
X-CRM114-Status: UNSURE (   7.92  )
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

On 18/09/2022 15:41, Arınç ÜNAL wrote:
>  
>    reg:
>      maxItems: 1
> @@ -24,7 +26,7 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    memory-controller@5000 {

This is still memory-controller, so node name should stay.


Best regards,
Krzysztof

