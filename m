Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5CAC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Sep 2022 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHO9Oub3AWfaHbTOpsrzZ/pzJ9xYr1AJ+giPFPn+MDc=; b=eY4fsYiJTPnF3ylpWJXGTvttlR
	XvoXZO6v2ZMCcnWoeC2dVmxjggNp6402w7IJ3Ll4OmvDUY+9BiCbDdvHMq3YjRJ287yGNSayxl/1R
	cO5CwGf18AXXk0/ym4LfALNJkLxi9zYmwtP5Pbo3cKJtcPOrtyIuO+XiyAzhQTmov57tosI2kYqOc
	RrqfB5V/+XdTaht+dp0WNlFns7/AEpj39T1NNZjCUCb0Q8SUHV8JL7/qJ/Zd6UDg7tVA3FJWEgbI5
	EJ7ruZtDPSVh/AfyJK3uYAytkE4UsWAEG92a8WRAC6VJp3DHi73GetZPKi1wSv7YlL+T17uQUELyf
	C/U0yJsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXnip-00CErF-Iw; Mon, 12 Sep 2022 17:59:51 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXniZ-00CEiB-J9; Mon, 12 Sep 2022 17:59:36 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id s13so7308497qvq.10;
        Mon, 12 Sep 2022 10:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CHO9Oub3AWfaHbTOpsrzZ/pzJ9xYr1AJ+giPFPn+MDc=;
        b=J9B8zEU7+ett8TMV8ZXNPGPVLYXOcNXPmnAnX41l/9CGeTLHcl6JtxRpGeROo9oRcw
         KMuev5+nvz1u8Eq5sQPseBMb/axiCNXJRXXpW8LEOYLh86K2md0Xkkw5P0X+oAVHbWoV
         Opu4MXvr3sQfznIj9ZaTp2j989/+s26ryhgiKCnXcRukG2BQEr7eyeP4wTKD1FJLhLaA
         hthhKBc1VD/1soBjEvcNVS7JuWz84iODX6BWJQgCeAI43APmmiHdjiUzxfGc72Ip7PRB
         NgWoa6orDQYkjwmPOA3q+hrsTm1sVveha2n3o4IKJHwuxXmv1d5XRe3D+MWFo1h8yjLm
         2P/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CHO9Oub3AWfaHbTOpsrzZ/pzJ9xYr1AJ+giPFPn+MDc=;
        b=BYYau8jFS1VKWfEOCawfqiPQscmzhsRAZKmfx53PvZD7sB+f3QpWueqkJevVTCemng
         wimq5Nn/B/wLC1tF2N68K1r/Yccq44FfoKnpvrO2mROgEOItVtwHC9aDm9cKVC24KXQp
         SoIE1D4Z5RutW2o2MN+LrQhvRnLoh0mzQOKH8fyUFyzq0LmkMuPFXBQ4R0fM9SfFZU+8
         DqDiRCgxQoMvWvOew90z/CyW6/wOprQumyfJR/mqoALr8BFgSz+pQiROHwmaTKaKvyYY
         Q7cYAhy+TYDSISTWG1BdBuuueI6ceBji0g3sfQDv7noy/cAd0a/f+zvkd/kwhtIe/ZtJ
         dPDw==
X-Gm-Message-State: ACgBeo0G6MXJoqtQFHMTslUtIb7kLQMas2JJcvEYn2J/YWTTs+eWu898
	Rdk7tblYw9EW1SncgeNv4aY=
X-Google-Smtp-Source: AA6agR4Z11EbeI0t6KZTwNsIwAisWHJpNPfYOW2De1jkWsiY73doZY5h2vh1cU7a2aVkj/2Q0FIBTg==
X-Received: by 2002:ad4:5941:0:b0:47b:5b81:e329 with SMTP id eo1-20020ad45941000000b0047b5b81e329mr23750234qvb.24.1663005572129;
        Mon, 12 Sep 2022 10:59:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id d24-20020ac84e38000000b003445b83de67sm6909654qtw.3.2022.09.12.10.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 10:59:31 -0700 (PDT)
Message-ID: <d406b917-9d01-0f97-8d29-24008f27d379@gmail.com>
Date: Mon, 12 Sep 2022 10:59:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dsa: mt7530: replace label
 = "cpu" with proper checks
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
 <20220912175058.280386-2-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220912175058.280386-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220912_105935_722443_34E932E5 
X-CRM114-Status: GOOD (  14.76  )
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
> The fact that some DSA device trees use 'label = "cpu"' for the CPU port
> is nothing but blind cargo cult copying. The 'label' property was never
> part of the DSA DT bindings for anything except the user ports, where it
> provided a hint as to what name the created netdevs should use.
> 
> DSA does use the "cpu" port label to identify a CPU port in dsa_port_parse(),
> but this is only for non-OF code paths (platform data).
> 
> The proper way to identify a CPU port is to look at whether the
> 'ethernet' phandle is present.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

