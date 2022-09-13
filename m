Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8217DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 08:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ta8cGICr0VOJM3jC+pGpsMR/rkOeJqhzZDkRQ4xBHw=; b=mSzcBNVctR+kcELQ3GDIAXEJtx
	IgS4CGYH2NJkJgeaAkPSVdCmFfsnpmNChUTqPs4crDGzjIoPWO6JNHwrRfhbUtO2wI8P9JZ6MqaC8
	iYMlcBYxPfasVkRdajplC0Bmy+EZNPJEQAKR7ipcl80PIa2uyDw6d7qVM5x9lwKdqVdf5uMTobSKI
	kLy4eEoC11Z9roWfNX2OvgZmXfeHcsQ1e1rf9rKBlQSrtVTHhQZHastAWhChlpMsSmO88mjld39m7
	P9Pjem34zK/keIp81bEdFP7yxroErjNGfUUTV3BoQ8595F0kWrzxUpWB5YABXu/Zdy6XDb/4JwCNY
	R9wB5xKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY19W-004EfC-97; Tue, 13 Sep 2022 08:20:18 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY196-004ELT-9U; Tue, 13 Sep 2022 08:19:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663057151; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cbD2oH6qV+7f5NwVYgIJya2nvrNAGDpLFrbMwDhNRhRq0ADLO5oIbXtGn0ZFWg3c0wH64WMNrrxOmfk1KtU6Mn+04VafA9n4Uwt2U6R/iUCRywgzxhPUfYJ1msr6DG7vevuM2kEOPpI1sgPmC6EKMmlkjFFOyyqzCHOSFR5+aag=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663057151; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5ta8cGICr0VOJM3jC+pGpsMR/rkOeJqhzZDkRQ4xBHw=; 
	b=ZrR99btLqzgG+9bJWWYITysE2GBxYdI5P2IhlexV2cyxX7ySwd+GhWnz9Yh9v/SYZCzkOPDSZDLj3AYqqY+juPsOv1RZu7Ogeojk8mb05opMb6v+7gIRXeCrJxb/1XxoRwASJcuErKWTcsR2CQi110VygrpKD0A9Ac8JDssjlWs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663057151;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=5ta8cGICr0VOJM3jC+pGpsMR/rkOeJqhzZDkRQ4xBHw=;
	b=FIMUqSjX4QdqKRIUAo/ZmX4QYgTQV628cIf8ACY3Gc4sGipLUi5K8tD4+ZB2KbUZ
	NMXt/GQc/Kiuj1GsXiEmqc1MhTkN7XiQOJC2tlZDwHVCFnmEa/oMThCUcOto7R+DpTy
	O0cUbIdWZv4RXIaEFJXVXtE+0hTrXhlLyR6uBipY=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663057148935836.8616576818519; Tue, 13 Sep 2022 01:19:08 -0700 (PDT)
Message-ID: <a2dd3f5d-9d25-bb24-9db2-1587487c80a2@arinc9.com>
Date: Tue, 13 Sep 2022 11:19:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dsa: mt7530: replace label
 = "cpu" with proper checks
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>,
 John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-2-vladimir.oltean@nxp.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220912175058.280386-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_011952_450558_52291963 
X-CRM114-Status: GOOD (  18.22  )
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

On 12.09.2022 20:50, Vladimir Oltean wrote:
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

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

> ---
>   .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> index f9e7b6e20b35..fa271ee16b5e 100644
> --- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
> @@ -163,9 +163,7 @@ patternProperties:
>           allOf:
>             - $ref: dsa-port.yaml#
>             - if:
> -              properties:
> -                label:
> -                  const: cpu
> +              required: [ ethernet ]
>               then:
>                 required:
>                   - phy-mode
> @@ -187,9 +185,7 @@ $defs:
>           patternProperties:
>             "^(ethernet-)?port@[0-9]+$":
>               if:
> -              properties:
> -                label:
> -                  const: cpu
> +              required: [ ethernet ]
>               then:
>                 if:
>                   properties:
> @@ -215,9 +211,7 @@ $defs:
>           patternProperties:
>             "^(ethernet-)?port@[0-9]+$":
>               if:
> -              properties:
> -                label:
> -                  const: cpu
> +              required: [ ethernet ]
>               then:
>                 if:
>                   properties:

