Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58156E77180
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 19:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=; b=cRE6JLrRrdhU/dgYS1+elBSa2w
	kZSfpORTd2i8W+oMdq0Y3MTVz4dnBoLE9boTxcAWSMHwyEYOgh8qOsJd5iDwA376JzaFxN7/TFopQ
	O160kvP3HOH0sw8717Dg9ojoJoNogSeW8doHjC2sGgrbMZHCNXEg8c4kMPpLOOseR43p2G1TZxR7J
	RgtXdXSNmU4KfRFfYw5UG5tTwGaZCC+9WMvq0EaRQbZ2QRi2UGVt+wAoHTqM7yU9LbMBs9yWpSGrB
	OdFiKEnejGAdlI1qGnljBmXTopnMJ909Yg+8Cg71qAfloavI7gBFPnT3CAZPYfHp3eWT0kLD99PVw
	iXAhHF6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL60e-0000000CXA6-1U6m;
	Tue, 10 Dec 2024 19:35:04 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL60a-0000000CX94-3m96
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 19:35:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2ee51f8c47dso4373719a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733859300; x=1734464100; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=;
        b=htl1+IhqJpUD32ERTOIRsw5tPU6EMW7yYxuX4NtDJFqOKW299I+f0+d+2za9WHUd45
         gTRfS3FFM3k/WTMwRu0knoJ+eB2mI9srjppkM4XPaVH7tBFPuc04282GOd4ID3Ws/s7M
         /Kbz+1HbrXJhkT+6o6Tg8kqygTHc922i2Z3uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733859300; x=1734464100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwV717DZF6jBbGmMqY4Lay6suGsxDvolISQzDQbt+mE=;
        b=VUUI80JTLlKCVfmwhgGq87TAc+krJUKKco5g6IEY6rXTp6reQVh+E+lsGrS2u9QSCl
         dToZsIdHtB2sx/YHvzGgkQtkjiAgN/Zhqp0FxNYoe8fNjZ5TpeZ74hBkj3n7xrLiefpm
         hTeHJNLr/RX1wSeWgO179TSc4WXHYlTeQl3Pa6KFYy1YgTXlfR3VE4AEGdYvLCHnJBK3
         /Cti6COaeNkbR6XrVaFHXBGhADH55P9io2lXcrYUl92E/v221wDCR6s+tlZ/e3w0TrpB
         m3y9CuaK4SYtbAEe5c9fuatTS5B291Iruw3eeX5tj4wwPw5GO3f5aJLoB2Uo8RZsqVfK
         0o6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBRlkUyF6viLoyaEnJ2v0SKQJrMplHceBjc+l6iDOrlqPTknh7lO79LC0x8Tv8GEQR8MTA4vzatp7CGpG7ug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsXlEqm73fxU14//IAgImyk1U9oUuAsaTve5KvvLUuBUOMIzXl
	OHaJ6OIQx5uzaZwZExykZ5ML35MU2ISLwtwkDewfEsFPvgQv7s6lT3hEs2heEg==
X-Gm-Gg: ASbGncsjCHsCMtimqgd4C5JRcoAdGbHFGFzuuFVr64A81zN9+EDRFppB4t104poF1vb
	RWKwDlFbkbF87Ant+enRPntZ64fXZgNsYUb3pxFKvPYpkw5nB4GexmbL7TmfChU+Z0GRGAXeyZt
	NXbLCY8xAh5tMWJlTT7kciprdmmbMqJQnBRpYgy9pZsLJxWyjoiGqp+f76a36BaBq/on1Z9M2Bl
	Lbq3BvOC0UyuJMJXMNX+aBoXbMrKksmxlHTG3do1Y5Q0LJS1Z1LO30HTuIov5j8ZiYSUoOUSS7i
	ld6A77o2/0BBRYLU1A==
X-Google-Smtp-Source: AGHT+IFBOs/F/U4/hLKU6kyWf8O6LlmYbxeJeYss/dK1iAbYGZxIT+jEyZtSoRHQ4kvolIcl2McsnQ==
X-Received: by 2002:a17:90b:3a83:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2f12808c035mr266194a91.30.1733859299825;
        Tue, 10 Dec 2024 11:34:59 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f958d6sm10127971a91.17.2024.12.10.11.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 11:34:58 -0800 (PST)
Message-ID: <8a7bd584-d4e7-4a68-a562-08f2603ff49c@broadcom.com>
Date: Tue, 10 Dec 2024 11:34:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/9] net: dsa: add hook to determine whether EEE
 is supported
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ar__n__ __NAL <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 Simon Horman <horms@kernel.org>, UNGLinuxDriver@microchip.com,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh <woojung.huh@microchip.com>
References: <Z1hNkEb13FMuDQiY@shell.armlinux.org.uk>
 <E1tL144-006cZD-El@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <E1tL144-006cZD-El@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_113501_361429_86127A2F 
X-CRM114-Status: UNSURE (   7.06  )
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

On 12/10/24 06:18, Russell King (Oracle) wrote:
> Add a hook to determine whether the switch supports EEE. This will
> return false if the switch does not, or true if it does. If the
> method is not implemented, we assume (currently) that the switch
> supports EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

