Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D13C4708E
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 22:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlsqXR9Z8ZTnyT8kW7sPZRNV6TNSbNbBGDYLhcwR+Qk=; b=XUUIYb310I81Yjc2+wFQMIynSq
	jBN2YhlPXhUYZwQCOWmgtFCJRPn5giCvahYUUg0Dyf9W353shbByTECWnjcA9j9YPx1E1m1qLURGH
	FdlbijNDs+3HpfMq5XIhAOwn6YsDTp8JGwr4Q+CyiDmXQMeiP0WYJ7Q1EfLirsuTdM31hDa1CZwi6
	MFvS3VmDZd5SBvwOuoZdPGS7pwEPqAMHfAzmCI/LcmIw2penaFIMEbJ3Pvc3sJgfk+OH0kyfCw5cC
	cEkE3TVq9uh0RZFsyUe+ioLJjYUmGa81qIf/sDWLwpuFFJLAqrNApiW7GzI0dtak07egdXUbW1l5G
	7Qmjho+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCphQ-005Of2-Ts; Tue, 03 Jan 2023 22:24:00 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCpdN-005NOK-Tz; Tue, 03 Jan 2023 22:19:51 +0000
Received: by mail-qt1-x833.google.com with SMTP id j16so25737238qtv.4;
        Tue, 03 Jan 2023 14:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlsqXR9Z8ZTnyT8kW7sPZRNV6TNSbNbBGDYLhcwR+Qk=;
        b=dmdkMDc/YHWm0TNz0eIBJ/XGILOClmyM/tKG7ExtcmNQVXs/fIKkIPoNN5GAj+kfHM
         amZwwRfkXdlsCIe4MPIDUmxAgI79d4WRp1CfFsubKd+Xglfwgh0S8uWHwXVjyxaPwon6
         1H431Uw0nZWzBFhryBLFsWWmNtxz65F3TuT3sB3d03FlNLXaPspLhHX6gGwRIPhuPM7x
         iu4OWcuzeybA/bwM+UuVl3chiPPK4x76zRQm/7udJiJnjUhMeU7w3WQ4ukT7/nVPj4NJ
         PcxhPF8amBlnTFHlbeeJgHZ4TRzQM7hshDcGyf7N1fZhoOaNAlUHlfTPdYKYKG7FISsE
         eP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlsqXR9Z8ZTnyT8kW7sPZRNV6TNSbNbBGDYLhcwR+Qk=;
        b=xsq2Xb+1sHGZYyBpVpkTW92B4J4UyVQB0LZ4BFPTwDo51PB/88mor167j8fC521M45
         eG6ozQQ8NdwHvkJa3ILy70SVdBFW+8WO7L0P2S1jKsifxEokGKy6Gkrnze0j7dHM6dbV
         pZUAoM+gI0yrfXQc7vxC6GdtF4vhupA11iy65ZJCqTawEmebRxP3chkZp5YHPPHgYnj9
         F7osZm0gGLYXLrdKkpM4n/pWOVZSm4Hy/PkZrybDarp9aL/0EJ92+1YaLD1rRVO8gOQo
         stLXhBrvV7KsXrr9Us3g6OhEtujgQVcahcM7jjpBIj5s3tUsrJwSvAzUE/VQBb+lDox5
         litQ==
X-Gm-Message-State: AFqh2kpZHkSnnszYHFibtE8Rf01LoKmQr7tMlbcB0RY6zGvmfo5kLHV4
	cjXFU4lMAqAhmkjsBJCCvaY=
X-Google-Smtp-Source: AMrXdXsGsjsrB9AcKzMCzEqklUI9nm2c3uPSa70otNvz7vExtyhtj7gtbzCz9MgPJaULLoodG5H59g==
X-Received: by 2002:ac8:5211:0:b0:3a7:e384:92b6 with SMTP id r17-20020ac85211000000b003a7e38492b6mr64414936qtn.19.1672784386769;
        Tue, 03 Jan 2023 14:19:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id m5-20020ac807c5000000b003a530a32f67sm19430531qth.65.2023.01.03.14.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 14:19:45 -0800 (PST)
Message-ID: <d42ecd28-9fe8-9376-8c42-4245120cab9f@gmail.com>
Date: Tue, 3 Jan 2023 14:19:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 net-next 01/10] dt-bindings: dsa: sync with maintainers
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?=
 <arinc.unal@arinc9.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <clement.leger@bootlin.com>, =?UTF-8?Q?Alvin_=c5=a0ipraga?=
 <alsi@bang-olufsen.dk>, Linus Walleij <linus.walleij@linaro.org>,
 UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>
References: <20230103051401.2265961-1-colin.foster@in-advantage.com>
 <20230103051401.2265961-2-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230103051401.2265961-2-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_141950_070860_A8B9C498 
X-CRM114-Status: UNSURE (   9.28  )
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

On 1/2/23 21:13, Colin Foster wrote:
> The MAINTAINERS file has Andrew Lunn, Florian Fainelli, and Vladimir Oltean
> listed as the maintainers for generic dsa bindings. Update dsa.yaml and
> dsa-port.yaml accordingly.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


