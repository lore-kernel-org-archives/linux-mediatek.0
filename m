Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAE6ECAAD2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Aug 2022 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kS++P7f/sxm+5fpcUlBki4yBaSJvYpRpgROhsMETBW8=; b=AdPnLBntqbXK+Lh6c5nhPuqQQe
	V8vaR2GUyv4S22l7KgGspkkWm9hiVP/crzoS7JGHXRNHSXkPvisQIxRZGc6kxetdwQCGTGnYQ3XpX
	BDVu8DSmYxbcJ3pYulVETRMODUtkmnqoAVbyLm9ee5giK1Cfl5pFBiw81kO2GS70PB8S9hc0DQAmB
	Od+eWepw+51kYIp+IdxnHSLUg1BNN5NJ9VccaVLyBQAyIPN6kmEzCCHWS4cEVFLyGpmCIT7wDLtRH
	1QlfRnTAgsXVS8T3IdCARTH3W6Am1YgYLEMy86dXh8CvC/l4uCDhY3Di5mCCTWl3bMXRsmKef64AP
	P5RRjkZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT6g-00Erkg-Ez; Fri, 26 Aug 2022 06:46:18 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRT6O-00ErIP-12
	for linux-mediatek@lists.infradead.org; Fri, 26 Aug 2022 06:46:02 +0000
Received: by mail-lj1-x22e.google.com with SMTP id q16so691188ljp.8
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Aug 2022 23:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=kS++P7f/sxm+5fpcUlBki4yBaSJvYpRpgROhsMETBW8=;
        b=g2PebV7DA2dG91zJ+3A5Ck9fY4G2rWpOELAfA2Ey7hk2LYZzSBnkKYTY7Zr6rAbdFd
         q46AAJBJE7yTCTd+hQDxa0jNPkVOv6mbAFOM4C+ydfPvRyUAa72QWu+0x1jf6bRp+k79
         lnGUQedJWnwGTSwtefSnqfcdXKg/IVEad78NLN2cumTD4n0okhNXYRHGQtKwsTfJ5sJn
         Wqz+JOCykDAXL+y297nti4d0npk/wvA06rQKSCKAFQeCih8lregz+K+CbeJZe8GzmywA
         PdzsHZaJNXcDaszh3RQOSIntAryy2ULRKf0t72Ibxvpf1CrUBguJYGKnt6cX4aKaaVBP
         DhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=kS++P7f/sxm+5fpcUlBki4yBaSJvYpRpgROhsMETBW8=;
        b=WbV9eENJ948hLzggklAaI+PbwVk3sEN9TbTRl8MSljnhrDKOTpFgvLScd0DIBwv/Qj
         Arp0KK0byCAZ9cHPS0gkwYmpOSOcQsOiH2/5LADcbv49XUWyy7b6/8DGpF5vPZgGRwpd
         UEONQTtcYSnLb0umti3irmSwSDJKET4ShhBfob7xI0ssruy9xBsNTGHLWUkJTVOyl5vr
         55HvLiF49/2znBDpdbmpDzACQkjdzv+kilYFw129Vg357JGdD5TzCTk1C7fy+Nssd1r1
         sHwj26FK1wtmOWheBQ15ZIASFP0yXPuo9PgVEsiTSOKvFJPfbjX4vpumttlGs07xynPi
         USRQ==
X-Gm-Message-State: ACgBeo2ysJaLpCY0cqihXRUnql8xBhm1vg16UTGXqGFoIwrGkHZcLDcH
	1Rpba/irnWLNeCEkz6fvErOy/A==
X-Google-Smtp-Source: AA6agR4P1Lppd9IyB4a2iit7fR1482AuCseveFfT3iZ+aY3X33NJaw9K20gOE/6FuNs2mXlh6X8R1A==
X-Received: by 2002:a05:651c:90a:b0:25d:57c9:30c4 with SMTP id e10-20020a05651c090a00b0025d57c930c4mr1790962ljq.386.1661496357412;
        Thu, 25 Aug 2022 23:45:57 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id f18-20020a056512229200b0048a73d83b7csm262960lfu.133.2022.08.25.23.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 23:45:56 -0700 (PDT)
Message-ID: <c5e22875-745d-7334-84bf-d854b2011af3@linaro.org>
Date: Fri, 26 Aug 2022 09:45:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 0/6] completely rework mediatek,mt7530 binding
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825082301.409450-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_234600_117227_E9706ACE 
X-CRM114-Status: GOOD (  14.20  )
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
> Hello.
> 
> This patch series brings complete rework of the mediatek,mt7530 binding.
> 
> The binding is checked with "make dt_binding_check
> DT_SCHEMA_FILES=mediatek,mt7530.yaml".
> 
> If anyone knows the GIC bit for interrupt for multi-chip module MT7530 in
> MT7623AI SoC, let me know. I'll add it to the examples.
> 
> If anyone got a Unielec U7623 or another MT7623AI board, please reach out.
> 
> v6:
> - Do not remove binding for DSA ports from top level.
> - On the first patch, remove requiring reg as it's already required by
> dsa-port.yaml and define acceptable reg values for the CPU ports.
> - Add Krzysztof's Reviewed-by: and Acked-by: to where they're given except
> the first patch because of the changes above.

Review should have stayed. It's a close to trivial change.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

Best regards,
Krzysztof

