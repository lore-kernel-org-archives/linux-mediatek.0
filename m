Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E41E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 17:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlM0jpfN/0EIPKkVdkd7aPBaB5Buy5JIg07+r6DSxgQ=; b=P4RUXkTDlvmWyD7Ruwlmm3tuR4
	PqCAOZxix2aBAatpcfASUebW4UCquOOLi7RsKg0KnrcPWpdd+IKmU55RrSZaPvjk0r2JFrJseZ+DY
	Fk2Rw8qge1GYab5KNwfoCfYZAe7pO0AjRpiJ4xCO3QGcv+//R3YRS3TvPj39tMsQnjhnzvkLl7CvW
	bsjXWL0K7jZKMsb8qMekO+0Fz6pHcC8ekWaeMqqXoEXTkk7fixWcLgHFJ1WuwxAUeYg+IsUuV9x2a
	yjcgIwbC/HGRCUtNnSjp9RcnilHliOnJvTChWHRKkyjv3rzGIll6UfpIF8OsNU1VsQ0F6+IOTrLEa
	ga8sPLOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL452-0000000CHO0-1Pq6;
	Tue, 10 Dec 2024 17:31:28 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL43q-0000000CH6d-3mQK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 17:30:15 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7b6e8814842so50005085a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 09:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851813; x=1734456613; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RlM0jpfN/0EIPKkVdkd7aPBaB5Buy5JIg07+r6DSxgQ=;
        b=hi8nxKnf2B3zYy3ZRSv5Ea+r0gXNPMDa2AQU1LmVncSRmJ1PdvSppriuJY/FVvThpo
         itnGekwPWyQXS3VHUmMZEGWJjRXYMx1MQaNJOocWL5mQPdZFpTYoGu7l1pXJUgRjU7QU
         HR5IDdBe/n4SbeO7Kq1k7qff5oJl/BQcKlpGI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851813; x=1734456613;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RlM0jpfN/0EIPKkVdkd7aPBaB5Buy5JIg07+r6DSxgQ=;
        b=Y6AXsE9bsmtsBCC0Bkg+6qcnoM8pyGs92nmmftJx8Ubxv6djcz8oFpvI0wgpUYTJy6
         lDIcoJLWVHV3qqe90if8v98W1BC9fpuO/BJTXlRoj+5ILfKA84z3hwmHdedyADkTg/zK
         Y52/paoI0dK6Zy23r0In8Ug9t2pGUbU9zXd5GSQqDowtLUHCuqegD4tb4C59gvajDrfP
         OdY8Cb05eChQPfhQ/tq/+UU5oOIXDAyh+s3DGvI1cie3cW2rVeYGeE3thvUJGmfEHNYD
         VfRGAEu65CRgwypWCTns6KBji3PZbqAbm3hCnQzEA7PWLI6uQ6sG10kGpdBxNfGOh+VE
         8vxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd1c82bjJHjn7JX8YKBX+fRYwbvpZmi/x7sNPcwTC8NyX67IQGx3+R0x0BlgIIqeTS1jDvxscnQHmj4vkH1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDAnv3d7zfZbHrBtxJWAfq+OU0aSzNn3JwgEcoXWvTjJZnk+34
	XHyGKp8b0XdtZfD5h8OuxkCJ2VBR6TSPx1WzqPzkN1coYyjoULVdomCtKb+dbw==
X-Gm-Gg: ASbGncv/Djo10D4Q2RReiX5aD3rR6ZHbQMb7J4YgeIKQd9jBUPdWhM7YqE6pqym2Qel
	z6GfVGLtshxdwuGisiij1HCKaCCheEWr54a1XbfEIXFOP4Blr180oeWz8Ax1yvuQ5nkN3qcwOmt
	SOgQvkDI9jI0Wc5PuvAAhHL1mnqF4KBaN+XmCN15c+XCED4o/OLApAWNlIPcx6J9IDeF/FyX5dB
	IROo6GqdT41eM99IS5nF60gQ+tRtwkRz/Kxfa89H3oUwq48SHUZnj7UmykFiKTCtxjoLyrai83E
	kS06E1yVKq0NHk+Ndw==
X-Google-Smtp-Source: AGHT+IG1rCPaESNmGeL/pCfwE2PjnYtyp8mw3vbAdlrC5Z0UBjbzp0yHi4eT1rDWVtRv0ChBsv/7Ag==
X-Received: by 2002:ad4:5ced:0:b0:6d8:d79c:1cb2 with SMTP id 6a1803df08f44-6d8e712254amr258600446d6.21.1733851813313;
        Tue, 10 Dec 2024 09:30:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90299bccesm33827546d6.60.2024.12.10.09.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:30:10 -0800 (PST)
Message-ID: <bc03a1e5-b67c-42da-9856-7c77d6858138@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:00 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/9] net: dsa: b53/bcm_sf2: implement
 .support_eee() method
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
 <E1tL14E-006cZU-Nc@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14E-006cZU-Nc@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093014_933767_2786C97F 
X-CRM114-Status: UNSURE (   6.11  )
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
> Implement the .support_eee() method to indicate that EEE is not
> supported by two switch variants, rather than making these checks in
> the .set_mac_eee() and .get_mac_eee() methods.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

