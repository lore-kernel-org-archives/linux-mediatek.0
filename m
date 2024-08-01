Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 325CFC3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xicDpp2Pybe+VM3D+eIlwcNQ7VkGdkDp4enPEYyuvI=; b=e3XruSeeTWe6hAUScfCXs0jUMj
	oiE9URSjStfwGlSwMqjY7rDbtsueBcEgkrh7H2g+NoynuP4D5FR2TxC2kK30u4trSeuPjlA+yrfZC
	wvCLSJ/KsGvqRQQgf0Xct9e2XLrM5BkEJ8soz3N5f0T9TeyYr/zBz7S1WR5T95ncyM+d4ESDtscOp
	AfiAgrhs+zEiv04/SxK6eeVCmA5fR412+JV822yycEL0cjbO7KAUu99kVCiWDD+eEWWDm19dyHdU1
	+zjUDGlsM2fnGgv1FUBng2DPvnFKxzM3RoLbU4pLf8oZOey9DYKrbaVRI59XxZFRoXHplMoz5YsW3
	GK3mlwdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaR4-00000006N7p-0pa8;
	Thu, 01 Aug 2024 18:21:58 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZaQZ-00000006N4b-0yjm;
	Thu, 01 Aug 2024 18:21:28 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1fd640a6454so57615675ad.3;
        Thu, 01 Aug 2024 11:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722536486; x=1723141286; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8xicDpp2Pybe+VM3D+eIlwcNQ7VkGdkDp4enPEYyuvI=;
        b=gIdZcIRODbbTcNyKfHxbestXGexTPEyiSt3vD1hIILLEZvCYLRDao6+kXBSwZQ28Xv
         x1o7CEQOqIVE3YWKbHFEhn5Of6JcP8nfD4LYMMyw0H4ELZFf+NqZxr9IIP3Yp+J7PNk+
         DBWNIBTRfTgnM0tZpLjlM3ecMKONV4XlnjkLp7GyRDtQiigB9PB8WTVgT7a/+6fLEbTf
         Se3GNqP6kfU9jIRUllyqFhOx5r8t94aqhsF1T2W0Ust1YRMLSbIPAxOiCdzZRJ/UDQUg
         hlcgqCst3+IMhHZIcv5iiRRPrhu9oNbkrpNQAx5IDd/FO0m2b43VsXg9QkHT1QJwGSAr
         5lqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722536486; x=1723141286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8xicDpp2Pybe+VM3D+eIlwcNQ7VkGdkDp4enPEYyuvI=;
        b=ZdMl95DNbjPBIrq4AHqkt+e6PaQDCiMY3knkLOeDola7MwsA2EMCNMJFULpTW/HGGB
         yYkDU46kCFmJlc2GvN0NJ+ewomMZeMO1RAOJe6Vz1Anck2lXoZGxr2KKyA7OdzRy5em+
         jIrf+yP/v+3SscXSOBIlJhK6OQBwrhr+QIS3seJQrgIoWu0pLdGakEcp/mgRrRvkuCg2
         TcG4owxd24JP7M1sRNcRNIprKA8m6a8VYoGRyt/++Ef/++a2iZQat0bQHpTpxRS585n5
         FvZrHKWqakANEL1mn5d3w5yufJ3qp+bh7G52YusHlJH2mmgrR7Ukah/sbFZrwGxU7tXW
         dchA==
X-Forwarded-Encrypted: i=1; AJvYcCWnqr+DbNIjUt6bwA4GDkIGXqNwMhMnWTudu8S44NL+GUPyvq9Qxy9ilPbzBRaglPrJo6aaPAhJZc51VusQ7oz6Vnf008kFC20nAnXT5ONBKjgEfRt5avVcNs9VuIJySogJnh2Ga5RLz6xknEzS1YsIh6wEOCTlK5Y=
X-Gm-Message-State: AOJu0YxUHIdK5f7HydM4A0zdqt+Sk0Ir87nn0Kbo9r+WDRwuR/pkmXN6
	bLzeRmM6qxLg7cS+0ebz58wEc929npnF+iwnQmErEV2x23GBKnLe
X-Google-Smtp-Source: AGHT+IElt3mXJkSXP29i902rBSXpOxzh9qQMuW9h8m3PGOg9TjhDId7phPJigjHSBnWYVJ9bWg+izQ==
X-Received: by 2002:a17:90b:4d12:b0:2c8:5cb7:54e5 with SMTP id 98e67ed59e1d1-2cff952d021mr1260405a91.32.1722536486216;
        Thu, 01 Aug 2024 11:21:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4cf69esm3690327a91.35.2024.08.01.11.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 11:21:25 -0700 (PDT)
Message-ID: <dfd6dccc-f82d-4642-b4a9-30d3b8ee308b@gmail.com>
Date: Thu, 1 Aug 2024 11:21:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530:
 Add airoha,en7581-switch
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: arinc.unal@arinc9.com, daniel@makrotopia.org, dqfext@gmail.com,
 sean.wang@mediatek.com, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
References: <cover.1722496682.git.lorenzo@kernel.org>
 <f149c437e530da4f1848030ff9cec635d3f3c977.1722496682.git.lorenzo@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <f149c437e530da4f1848030ff9cec635d3f3c977.1722496682.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_112127_302712_C1F8FF99 
X-CRM114-Status: UNSURE (   7.40  )
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

On 8/1/24 00:35, Lorenzo Bianconi wrote:
> Add documentation for the built-in switch which can be found in the
> Airoha EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


