Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807AE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 17:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8V1VSfxpMmVyfzg0oxisyMPMVlUfT9H28XgviyXUxg=; b=WC7KwBUXWiA3K4omwsA4WF1kjP
	nw+E6b9KJrXslQR7nd1a8fmtfILoDQhnUS+SeanjDAolgivt70MCnBvN5bxxcKSiIkcHzUZDFRBES
	OuWrZRW2u2nrZtZeoDOdhzHMW71A54tAPaxJqVAuOzCuTjdSRA9dvzfOdLWiTnEb6fJFV70A4AYgV
	KjBLMqp9Z+1fejtVjp6Y+2shpJJ+9qy6gP9V/tm0EEQ9QPK7ewIlc1EpMwG8nXuRxBxhLplK+z8LP
	KJy65tiXmJEH0oO+j31NXQ3+AmfwBFofZbHriRn3htG6NNq2/W2ynISnBTSj+oeybzsjU0odU1i45
	FXkpyAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL4B9-0000000CIgh-3s74;
	Tue, 10 Dec 2024 17:37:47 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL44v-0000000CHLw-2CRN
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 17:31:23 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6d92cd1e811so5523946d6.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 09:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851881; x=1734456681; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=I8V1VSfxpMmVyfzg0oxisyMPMVlUfT9H28XgviyXUxg=;
        b=Q+44RzXXNtJzVlaElmNI6NlSMuwAb7Ijv1+wpyncNdmjrxYy1H6QQlPlqMoGec4LLn
         c3DuuCOmrOlC90Zxb/oJOUOq96OuF0F1D5oLT7LM2gf7Hi5z9eQFR/Imr0I9/2QgAw34
         Hn6miydTsgXPTtHsx80AmpewK21PaE1aBECSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851881; x=1734456681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8V1VSfxpMmVyfzg0oxisyMPMVlUfT9H28XgviyXUxg=;
        b=J9VGaxqI+augTL2iLyuRDbG+IFnPd0kioQ/asBg95sDKgWov+UfJQoHeB86u+vFXXn
         NffvlaA44E2Yc0e/v/f4iAPWrsQCgtsJYnYMmN7Zi8SpABGQlDixLQEB8l6q8kL/XZog
         CIZtFtgbO05OdMkitysnU/5slzSOMd7bOcSuxBSg90YqcmzDhc2tsszcw+rFRkHvj4Ju
         9E25XCIFEwheXtI9Z0T7DJJtbkNuEAVI9E4qA8wgD+de5KoRB+9RsOJgUooH9BQpUs25
         MGMnl5p5sFVuKqrKQTZ4buUVr1nlHtDOgwh+d74hIYxdKCa2VIwPSjbI9RBJOTPdYWRO
         BEQA==
X-Forwarded-Encrypted: i=1; AJvYcCVxP8QI3pc6kHi7La++mLKnoOTNuxE7wL/t6qVGB+KpWs7F9JVEIfS8hz1VuwlElZ+RmvT1lwMGHVXbAPYHhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp60O6knYjyxMW5TzXK5xlGBCD6avh/+nKq8fhyJbkS5941FgL
	vypVGMM031uoalA+Wn4zFCrLHCLSwx2kBEEaOBk9myYNclsVlp5p9g609IkexA==
X-Gm-Gg: ASbGnctdmlE2UzxpghNQ+9ebO9s7fp/nI8Kd+9sBPMtzZOwDWHErCwhYBeObDz+PadK
	oIoMcd4cbE51mxoUzyQ0YmPCqYlmjlOnBQwf2F4yNr2yRtZh8X2oqcf3vzc1yja1VYQCzWPD3d1
	I9E8leEzookNywd8Saw64/jHY93hGFnydID22q9/0IZGV/1oSAtisw59FoRlgEtZYzuCPdxmEse
	Ub5I0oE6ppooekgSqvlAuXRmV/e/bW4fsTHrWw/z4TJV4OAG6CDSu3Fg3nHZwFiUEFiGgYTV5uM
	QOTtRHQjokWQTG6HlQ==
X-Google-Smtp-Source: AGHT+IEkXsMZtQi0SxzurdtQ2yYOsZORuFYzdKVntvRnhQDZ7kWPDMJ8dLi2pIgoKy3kpllxDZ6/fA==
X-Received: by 2002:a0c:f988:0:b0:6d4:1d7e:bc72 with SMTP id 6a1803df08f44-6d9212d6859mr53621046d6.12.1733851880717;
        Tue, 10 Dec 2024 09:31:20 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm44010436d6.72.2024.12.10.09.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:31:18 -0800 (PST)
Message-ID: <5531df46-8997-4d1f-8ddd-7ae9d5e56689@broadcom.com>
Date: Tue, 10 Dec 2024 09:31:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 9/9] net: dsa: require .support_eee() method to
 be implemented
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
 <E1tL14e-006cZy-AT@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14e-006cZy-AT@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093121_569254_43D41ADF 
X-CRM114-Status: UNSURE (   6.76  )
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
> Now that we have updated all drivers, switch DSA to require an
> implementation of the .support_eee() method for EEE to be usable,
> rather than defaulting to being permissive when not implemented.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

