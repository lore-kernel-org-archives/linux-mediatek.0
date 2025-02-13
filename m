Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DB7C021A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2025 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=; b=yTWXmf7DE/MGdwA3XTww3Dxnoi
	P8NksMm5none2On3YVG6sWXT4RTgv6O81iuD5dvSZ1/ZA7pXijw9lacen7EbOOxgJHxGyAqDPoBP5
	nZzPQ5HVyH6LXu54H4FxmtKYbq7yHesYBHI/6gc+7uAB3zJT6pE9cwRNc06UO9/z3wR/ALX+UXi51
	Jh3qrHQIuvdBAxNkZoKhxRPw0os421ottPZDa2HvqSgn+Dwk7pwpELjgkL+UUmjEgDaYtglhGb8bq
	HSUElWK0/UOYlNjKCAmpc3aniDzsFkzkTU795SyRf81d6MIZCoDfacXaMcnS+NfU/HQySSBdMsTeh
	dD4HomDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tib5l-0000000BWWW-29Ll;
	Thu, 13 Feb 2025 15:25:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tib5S-0000000BWRN-3vrs
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Feb 2025 15:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739460310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=;
	b=eRDzDO1QTFvwRvfN1az14h4iFgaeGVa/3H1CEg4F4F7lr457TzsWpj7NvpK05yrywlzwt9
	6SSeI1RXuzIpIA7Iv5WpL7NuZ98CK2l+cAxCA1PMSsZRpZ0ZgcKDsYVwiNCUNDOP0HaZWH
	bbxGgryvbcfvqTQe3rF3WDkDAKUI4hY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-cIR4a08OPveeOcieh1a8Zw-1; Thu, 13 Feb 2025 10:23:27 -0500
X-MC-Unique: cIR4a08OPveeOcieh1a8Zw-1
X-Mimecast-MFC-AGG-ID: cIR4a08OPveeOcieh1a8Zw_1739460206
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4395b5d6f8fso5492295e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Feb 2025 07:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739460204; x=1740065004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/JRSwFTLcKJvaGUhd7mNWEaWNfTd1j4s92cCD0xMuMs=;
        b=mo/PFA4Ye37Xr26Pg8KmJmqbQkmG64yOw66Ae0nTlQpNUhhLkLI2HCin3A+d+JNXVm
         AzL3N85ZR544xAtAdgE37/r92tzVEx1wiytN3rHZlUlBfJLWIgKLot8sxQcIrNvogk9O
         iXjTNW52s3x1dNbUNeBX6eiaqJNw5s5OZidYgNKR2d9C7viXZzBbinmB6Z1xWzGOruvS
         zLhQDFjdwu613uYADMN5JdRaDCDUtsmYA/bIcw71TVGDRdteC7VP9fxjxRllHtYPl55N
         JVyTSXeMz3KItcvdJwOZSy+ldruYxIRKnyVevj1a04VJZ9BakdSgtASkkvA1MKhzosaw
         7AfQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLk50Q1tRnT5ckJ9A17I+bo2tyNgQqJFl7znytAQltD5vCv7RzdcnMobkUaTr1Suu4v6oIp0RZFJWXCPGHTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzooRLHE9Bes5kIa6u5/Wd+/XRf+BZ+yX9FAOrVTdBqhOMnZ7gi
	85dtQfp5x2j5qlkAKNphKVHHAtBmmrFI3WPB6txpNEpm1ZjkkZQ0A8gl8+meIsB0hyFOywNecJr
	K6YCh97gmiX5iCqNd8NTQGQg+mWzYso3Z3XyNF8yCSDB25ClU+OamNOPs7BCHZFKHDjuWyQ==
X-Gm-Gg: ASbGncuA1mXpvn8uMiI/ANaLyIgyF3Qib7O/NsF4zAEv5oaLsIGKdWI6YNdx5Xy7wVr
	ieQJFyH6kHSfaWK9MbMp8uqxHjzrZP/iyiQiotTUY8dn6F9sNru6pCUZGQVzDmuwFFkyAIiM73x
	5DdPH/f8qo5l5sEXscu5BFwENOKtZTdjUGVrPBY6sY0+/pejJO9iZuTBgrfK4FE8Y5DAkJbhETa
	d4PAB2ZWmY1Z1vqXGp/FVq3FxyljldwbXo82jb0FdglOa55JBzG5sAh1CVxOvFqvgDiLeAanc0j
	tyrsT6tHYHSkP82nYlfbbw53YeniqLSC/B0=
X-Received: by 2002:a05:600c:3485:b0:439:4a1f:cf8b with SMTP id 5b1f17b1804b1-439600fd7dfmr54743575e9.0.1739460204561;
        Thu, 13 Feb 2025 07:23:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGymZURXlriQ+0kCVr74FRJDVtnnFD1vedc8hYAtNzuqdxLQ8CZrwzTUv5N0m6aIs3OGJqbiw==
X-Received: by 2002:a05:600c:3485:b0:439:4a1f:cf8b with SMTP id 5b1f17b1804b1-439600fd7dfmr54743035e9.0.1739460204161;
        Thu, 13 Feb 2025 07:23:24 -0800 (PST)
Received: from [192.168.88.253] (146-241-31-160.dyn.eolo.it. [146.241.31.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5655sm2157953f8f.77.2025.02.13.07.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 07:23:23 -0800 (PST)
Message-ID: <6032f70f-4609-46d7-bbfa-c29a63f402ec@redhat.com>
Date: Thu, 13 Feb 2025 16:23:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: ethernet: mediatek: add EEE support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Qingfang Deng <dqfext@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <20250210125246.1950142-1-dqfext@gmail.com>
 <a42ec2d4-2e4f-4d1d-b204-b637c1106690@redhat.com>
 <Z623GQHI_FHyDyjE@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z623GQHI_FHyDyjE@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Tud67qxEhrsk9KrV6PWk564Cd8wQSKxlK9-J1pBdcFY_1739460206
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_072511_048137_BCFB3EAC 
X-CRM114-Status: GOOD (  14.23  )
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

On 2/13/25 10:10 AM, Russell King (Oracle) wrote:
> On Thu, Feb 13, 2025 at 10:04:50AM +0100, Paolo Abeni wrote:
>> On 2/10/25 1:52 PM, Qingfang Deng wrote:
>>> Add EEE support to MediaTek SoC Ethernet. The register fields are
>>> similar to the ones in MT7531, except that the LPI threshold is in
>>> milliseconds.
>>>
>>> Signed-off-by: Qingfang Deng <dqfext@gmail.com>
>>
>> @Felix, @Sean, @Lorenzo: could you please have a look?
> 
> That would be a waste of time, because it's implementing the "old way"
> including using phy_init_eee() which Andrew wants to get rid of. It
> should be using phylink's EEE management.
> 
> The patches for the mt753x driver converting that over have now been
> apparently merged last night according to patchwork into net-next, but
> something's gone wrong because there's no updates to the git trees
> on korg,

this series:

https://lore.kernel.org/all/Z6nWujbjxlkzK_3P@shell.armlinux.org.uk/

is in net-next commit 443b5ca4d7245eec9a9192461113a4c341e441e5.

In the past few days there has been a few slowdowns in the kernel infra.
Perhaps some mirror or cache not updated?

Cheers,

Paolo


