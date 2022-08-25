Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E22BC28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 06:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfntWEQSpTDyvI8gHYn0S5Jpd2fjYD1CiZx7MTC/KrE=; b=24SZSONmP3Bs/5wHqHmrE0eiqh
	ExywqaNPDfnIYap4AAihXUpbb2TqV32X6SDcpXA/fYk8Cphpekuniai5dh/hIgRuYJH1fS8MuWd8F
	lhJiPbtdf5jfpsv2frX5Yd0BPvumuVjcVxgvoX9QOuEXIFmQBs27fPEcXlSxLpdseptX78DMN8skN
	k1Z7iUjuP68jfY2Goyt3ZrU6XHxyTXnz6+9sXNs4/SclRcuh9R2pFKIa8jQJKQ3rVpo98fM+eU54R
	JAQ0RmWqJYa26p035Jf/qcSjVl7IWQwCRd6eItgFqOwexhyiPBJQaIc2Cfc9ZM9gnHAyCAnH9gq2J
	rqZwel0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR6Bf-007o3y-7l; Thu, 25 Aug 2022 06:17:55 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR69o-007nMl-Da
	for linux-mediatek@lists.infradead.org; Thu, 25 Aug 2022 06:16:01 +0000
Received: by mail-lj1-x22f.google.com with SMTP id d9so2361961ljl.8
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 23:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QfntWEQSpTDyvI8gHYn0S5Jpd2fjYD1CiZx7MTC/KrE=;
        b=DvcAOKz8GbCyAUdmQkk9/3dFgH47rjnGUVOltexjeECkSMon4HqpDRiFYLAKXcYlJZ
         WA2yFT/Hl1GydqsB2axTuFnm5AGm+lX0jhSB8DfbLBec45/3XkFohFAqxWJp0kb260c5
         f8N9jtLxxP7yz9QS/fdPFg9dl/ZnexVQFWjXEWpct3nR2fW5pegVGudCijwzJq+h6Rdi
         eWEqMwPN+UNQoB7MZCRKxWcF1Fkf6gU0AJm4rF5uoWcTEcTQ6cglJjlw+NJME20DWHoa
         yyO+i4V2VvjMAfR1Dc3U0QFcgVlBs7Z3qtTFaYsVELfbcR+Ur4vzqBO/tgwYSSb9UxfO
         nZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QfntWEQSpTDyvI8gHYn0S5Jpd2fjYD1CiZx7MTC/KrE=;
        b=oXzHIZO9osVvkg6SOeKm0reXawDq2PbbLaxiMQOfBiJIjBPjtEOrncIM1gOJHS1P1h
         RqR98HjbiSD3WXmwv2g0Mrc84jDem+XJBebAjGwLhx49jxn8kv45DrRXbsFNBcXbWNbr
         nLMjtigGt76gcSGbfXK+CyMW5o1n6ejNc7jc85oPt1tBGHEa4+IDGKQUo+OEmpiz5FD+
         kvyahz5trX7IkZvy4hrw9AnvoGebNphTSQKytcTuWJ9azvxp2T3CocbHT1SaoUwoiy2k
         XaSxGKjATavGpZWcSExwVtx3esHRnBrPMOrmWW3gwkt5bhkF45mmm5ktc4M8lzr/l0fo
         PpUA==
X-Gm-Message-State: ACgBeo3QjJSP7HEQhcu546JEVRRBi1lW5ByRTAHUDrl2c0wrP1U39nXz
	OXKfp6JIN3JSPKcG/Se/Rj0/Hg==
X-Google-Smtp-Source: AA6agR4+sOKC06+N9A+9hxnC1nzfJP86yWP8N1RKdOPXieGnNCPeH85sdxO03GEFWs4prufMigm7BA==
X-Received: by 2002:a2e:bf23:0:b0:261:bd22:b2ba with SMTP id c35-20020a2ebf23000000b00261bd22b2bamr625734ljr.438.1661408156648;
        Wed, 24 Aug 2022 23:15:56 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id t3-20020ac24c03000000b0048af749c060sm316214lfq.157.2022.08.24.23.15.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:15:55 -0700 (PDT)
Message-ID: <a66d7c9d-7859-90af-8e93-ae2fc03b767a@linaro.org>
Date: Thu, 25 Aug 2022 09:15:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v5 2/7] dt-bindings: net: dsa: mediatek,mt7530: fix
 description of mediatek,mcm
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
 <20220824104040.17527-3-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824104040.17527-3-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_231600_478746_021904F2 
X-CRM114-Status: UNSURE (   7.80  )
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

On 24/08/2022 13:40, Arınç ÜNAL wrote:
> Fix the description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

