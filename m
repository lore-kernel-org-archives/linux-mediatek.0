Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CFEC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 18:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQtHmdymRkBmerXzn40vH/gbxlQTSF1+Xj0FQ10cpzI=; b=r7NYvYoMDS4qBhnD7Wd37y5x3X
	ITXFJfzzv0ZPmPvsenWzVZkLZru1ZGD+FGYCWWVH0D3w5TlghYy+49dz23CBdH28PDKRXGnI5RoYy
	Slj+M7a5g6C25x+PakfWv5pgy8DvjmV/TxG59v8nKFff7XEUhO1rOJKFZcWUUiXUwjrnIzEPvyh7w
	MFNK/7ujWVDvhTC96rEZ5RaaaKB31LjRagMB/4EmUARMUS/prhmRgZoZTcVqrpYbi3hdyJr2gaLiU
	EoG759XV/okyqACyHM/MjuV/CmNiu4fwAdKlthh9+UroSSDXk69vqwh6iUrI6ELqr3Cp2g0PGMFR2
	hYszQ5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXnql-00CJ4i-Qk; Mon, 12 Sep 2022 18:08:03 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXnqZ-00CIuu-Sl; Mon, 12 Sep 2022 18:07:53 +0000
Received: by mail-qt1-x836.google.com with SMTP id z18so6834396qts.7;
        Mon, 12 Sep 2022 11:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lQtHmdymRkBmerXzn40vH/gbxlQTSF1+Xj0FQ10cpzI=;
        b=pShthJ/cr5irBOubNxXcPwaiRunxAF+tNPHCFo9+aBuUE2MdRqk8gJg83jqJGU4irt
         LBcMgNXPaIbPcti4hOe1rZXv7UoPzUHHiNpSAUfL1VX3XtEqlrk0VwnkuzU9ORkLQV3S
         t9LX/iGgbjHWZmQJaoy2UdNMgOVymohv4jpp5b+6F9ghJn2H8Nvf/Lhs08D6ffZ1HrGX
         tLsGqDEAank1i7TfYyvDG5geZMYt893ytTbpZF/hHyeCqJOl3+6fvOnv3Sole+OzZp/f
         xSlP1sDaLbzm2oR50sr6ZfZnFgy4OZJAFqGg5aVixhsCoLlQuFcUPxrEg0fSk96OOOxP
         dylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lQtHmdymRkBmerXzn40vH/gbxlQTSF1+Xj0FQ10cpzI=;
        b=j9goid+q90C3QSIbfMxydnbV9GGgUJOM2fXKvo4PR+f1nTOOJNgvDm9w3CkLr3OLsr
         3TTPryL5sftAFObs/7YT4v9ODJXenwAp6Fu6CjBXOPpuDPDr6yH6XUUTPJl2qLArOzRU
         TEcdrfjE21JcxPBvomVTGwEZbFBwkssZV9W3Kvqdn2arFLWlgkBgtbh2WwnSkxKmqbwx
         3c7hRsLcVxNG3djSuKNifWR9hNI7FZAgFqlDI4Vkb3H03PVooSAjgApuxAeEkdDWYhTz
         uYsQiMEdkZXdZyRd3/5ZqrovLS7SaEVtqraF3o+2RpZpQw96uL3/PAym5mkFlBru6/Da
         uuUA==
X-Gm-Message-State: ACgBeo0z7JFplbU1047zOov89+UJKR7rySq4mWYvZd22h9QxUX1cGKGD
	Z5BwumiJFF1oNya40vhb2+Y=
X-Google-Smtp-Source: AA6agR53uiIhgcty3BD/2Ymi486R3A1bjk5LjIdQ159ktZPMsFAli5ZnpZpURisIP1zemMQqeBYjhw==
X-Received: by 2002:a05:622a:13ca:b0:35b:a248:c8c2 with SMTP id p10-20020a05622a13ca00b0035ba248c8c2mr14068787qtk.407.1663006065587;
        Mon, 12 Sep 2022 11:07:45 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id f8-20020a05620a408800b006bc192d277csm8575137qko.10.2022.09.12.11.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 11:07:45 -0700 (PDT)
Message-ID: <cb4e3c49-1216-2b61-3766-9507e523973e@gmail.com>
Date: Mon, 12 Sep 2022 11:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 2/3] dt-bindings: net: dsa: mt7530: stop
 requiring phy-mode on CPU ports
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>,
 John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-3-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220912175058.280386-3-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_110752_000301_0C403B95 
X-CRM114-Status: UNSURE (   8.96  )
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

On 9/12/22 10:50, Vladimir Oltean wrote:
> The common dsa-port.yaml does this (and more) since commit 2ec2fb8331af
> ("dt-bindings: net: dsa: make phylink bindings required for CPU/DSA
> ports").
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

