Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DC2E7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 17:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=; b=riT0jl19r8TiQODDIpBB02kiYh
	ADZEOh0wIYHV+vxHKRHhWpTucYbcAPWMavRe7jIdax2W5BV+gfjmlwv+2Q4PRda/9hSIvv6vsUrds
	O79XpwqlYaCkemXXYE+1k8eH/cxeFbbdC2j3temUJAIw0lOK+1b7CpUuZLOJ8OgIS9+Y9aBvnrB8K
	bYlI0R3UGkUc2nyUB9RHc2BaZc2wCRlm1WNwDUWF6IjDaXSa9KD93LInDvYkJKvr2gozkEPI04iBU
	2OGcSO1f37WPBgi1MMSmK9jUU2fBPGcLCDFd6azdktpLObjwtKZ/KxjPcSuoI2TuR6ZsT/uZP+yuD
	6MHNObnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL475-0000000CHqp-0w4I;
	Tue, 10 Dec 2024 17:33:35 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL44B-0000000CHCI-36bV
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 17:30:36 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6d842280932so80698716d6.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 09:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733851834; x=1734456634; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=MDOPcnCgdJNcAL8yD9Z8NnmYJvHIW/5bQyr2ZU1XXOwvv90Oa4DAlox4vD9E+7djzp
         NfTQxWLdjWyqUsM/ViXLIpxaFY7zS+NEr9KCFhxs3K96nPsrRR0VKxO4ngEpKhYAnHHf
         8oPHT+M0XyDRcMzStPPw2D/i6mZONfuiJbqLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733851834; x=1734456634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJuaBgZKrdv+RWQeMRVkYJY5tTLwVPt/ydvjKnt3MWk=;
        b=L5o8LyB87atvdiCP35gsRzDJHsVlSWrh8FUXXN3CqRP1zXrt2dQTGiCp4lFeYvaV8n
         JfaasLSKK4bHf3/pZE2mRVGw/r/AIxqW4SvZxs9shij8NO3Fq1oXkCWPBwCMvMYceNoP
         y1JKCkZfEBMwD0tVZ5delZXMmX7TTeg5z/DEIPLPCsm7fQikz7zsyRtQUvv1W3wu2JAc
         BvGTdVxidPMYeeBIJE+czzYrs78PqtrapoHaMH5rGVZwqzGcHWgYVLJPa3xoJLw2Hjbb
         kxAjpXlRTyta3qdd9Q/4CKRvtFmj66g1idPAWMrhPH9zB2TOPwpCECckwaAk26iTHPFx
         s9Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVThB7rFavdrBVDD0R7TDYslRea+gdqx2oAyWNAiNeOk1Y8C0kSwlrPxJO4o4O2cn7LhUAeBESIGBhupfqIng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBqdY92R+GQJad4A4oOOC6yQ+e7NjEzpWv/uhu/NGT2R/SECUV
	wxzDJxXatUyVutDvsl9CkXM7crKSqCdUV+JP7MtuXyW2GqGg5EANi26WE6rNeg==
X-Gm-Gg: ASbGnctIuS1vWT2FZyvlTl0tHmmzzd4y+LHyIZ6ZTeK1z2Su8j/g51kPnbOZRnmLdBE
	ECjbgidf+wDuWEN8MPNnScxF+sV0lbBTmM7Su8+BNDuBMHinm3lkjmO96jUYGmVA6G1l7ESARro
	5FnZ87gvhK34J9T7TWX6mwAmTOiOJWPnZ3SBRR9o+bfz58mzVyb8AwJfOHg+YYu0AB554SV5J3m
	T8j2pH2N0K/1e1PYqjk3qcJ9fbL0/m4nx+lYQurl4SZJl0Ilu4aJkW/TXcptvsndyKjfaWFLjOZ
	7ZUE7OlV5CSwkLsgKg==
X-Google-Smtp-Source: AGHT+IE6XUMC4DYavb5+1QKRnRXxBw3DcgJT86nS/fMqAGO0LrolKsMBTfNYrj26qWBSVfQRCwVzHw==
X-Received: by 2002:a05:6214:2aa7:b0:6d8:b097:fad3 with SMTP id 6a1803df08f44-6d91e422080mr88765546d6.35.1733851834188;
        Tue, 10 Dec 2024 09:30:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d90299bccesm33827546d6.60.2024.12.10.09.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 09:30:27 -0800 (PST)
Message-ID: <d806f833-1801-4d99-8e35-7eb09108d549@broadcom.com>
Date: Tue, 10 Dec 2024 09:30:21 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 6/9] net: dsa: qca8k: implement .support_eee()
 method
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
 <E1tL14O-006cZg-VM@rmk-PC.armlinux.org.uk>
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
In-Reply-To: <E1tL14O-006cZg-VM@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_093035_773659_60823DBD 
X-CRM114-Status: UNSURE (   5.33  )
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
> Implement the .support_eee() method by using the generic helper as all
> user ports support EEE.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

