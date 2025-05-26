Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E57C54FB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 May 2025 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=; b=I8nSwZFmto6KJE8Lh15TUV4QzI
	RgcJlCzq0LrbF+2rU4ZD6MiuSkhv45qmDfEH8nlvqnefALkxNdcioL+m56cymDffDPioX3jNs6aLl
	veLzzAfXTxDUCO2pmzIWF72VOSpTjeOEoCaOwISzUPvo4cK2t7/4P+ZtCpL89WuY6uIf6KxtztzQa
	gCTLO9DRJaURlkFHVQGbVtTXKlf7y37d3oaVBbCZEH0IwIKr4gA9i5KrhZfNObgVEIUKjPJimuVta
	phw/rXC7K1FnAsE3Tk3pwWBkYHQgQy3S2VLav4Wn5/WkrNL2dqengRUOddWWbW06tjrCbPdJgI+Kq
	6csR4ZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaE8-00000009Br4-2Y9n;
	Mon, 26 May 2025 15:59:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJaAR-00000009BCq-1zuk
	for linux-mediatek@lists.infradead.org;
	Mon, 26 May 2025 15:55:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748274908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=;
	b=PO17gT8LfJOAyEZNrPb6zaXxcO9yg5XGvcIZJHsrwYqy9EfefGDyJFdb9/gGVzh8YfmqCZ
	UyWmcoMgIJ6It5Fv+E61+/xgnBiB4aCHPYTXKF+/U8/pt/v7pjVNkPkS7oGykIG+bq31b4
	+zJJAcwITkwSEAMQSye9iJA6d9A3ZmI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-7E6KEQzPODK8woGEeAYE8A-1; Mon, 26 May 2025 11:55:07 -0400
X-MC-Unique: 7E6KEQzPODK8woGEeAYE8A-1
X-Mimecast-MFC-AGG-ID: 7E6KEQzPODK8woGEeAYE8A_1748274906
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4c8c60c5eso1471743f8f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 26 May 2025 08:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274906; x=1748879706;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fARRLv2EAES/QT6e4xl4U/3Dyubza5vfMD7Ni6b9N0M=;
        b=FxKLEApwsjpQ4gNAGAuim3VjRtjY1KFbiLwaXjiZhM7FRQ2AEKHHlrPjZKF0udFQcU
         SXH4VlQ3aiRZITwmtXfLInvOXYmNoiDPlTBF24Bs0P1c5soyuiRn6RreP3S6kB8A/ux/
         kEzq0I3iDBnqjArqHWao0MMRUqQyw3uzaKq9QIigDhdWwdzVfNeVGYRxKO8CedhRk/84
         +zE9k/rtVbnJxjWkWGFuXcRB8g+f0Uqr6Orcgz4qHZmgMD1w3GtcVmquauQnRlF5/wG1
         6zcJCFJstYuFfNy/es66lqfFoSUKB64sfPPhsKw83cYgqXCCYcgvl1hWBUOQS0kIIB+6
         NFug==
X-Forwarded-Encrypted: i=1; AJvYcCUpJRWe9uN9dmjiZnqlyGtXCWm9zlEC2m1cgS+Oyc5taOZZtd+jtRa6OFp882puTv1e4Jyz4MNNhJABA0/Sbg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzvqh9YY5toMYk4Lh7c+kiOFynM7jkw8HDp1utIVYXztYo8zOoj
	Z5sXEPTLz8hQGMPvQhQMdzoaBII+vioz339DmxsymlKrRulfgAQqNRH64QHfEj8qbh+1BKPlCtg
	Zz7has0rfQIiyN1pY2Y4UQ4FuP7oBUKsZr9lUdMkXP93wuHaE+8QHnGGO5c/P7IHrw4tTiTYMtQ
	==
X-Gm-Gg: ASbGncvlhnx2FoX2q6R5wqvO+VUHI0JxexIiRGmspHL3Lzspy1AUqjcHPoXGUu606uy
	3DzrNIjjMr0L9DTUaU7KvItT2W/2gy4dNP8ZLUvONsO5VL8LnziQ9Q4Wjf/NkjCVkWCh+qfGK3Y
	KH3HU8wdR8u1H+kSYb+TEADoJr/m4NBDxgBO7qtKTNqvr6wi+rkNCg5xRzXWFV1c2hOcXZOnK4j
	d3maz+u1NVh2Lxfn60XsvivOzTS19CoFO/Nf3Gj+oJDgnhk3B170D+bl+YOy3a+V0hwmsh4KHQg
	L2y5Wx48Q3nxH5hvuUw=
X-Received: by 2002:a05:6000:1ac6:b0:3a3:6941:6013 with SMTP id ffacd0b85a97d-3a4cb489c46mr7644596f8f.40.1748274906111;
        Mon, 26 May 2025 08:55:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEniW4Fa0wQ5QCsDtszPeRRxDRH9P02gatIOFzZCMuokpVnrSJPxMGRC37ySpxpVr8XiaeDXg==
X-Received: by 2002:a05:6000:1ac6:b0:3a3:6941:6013 with SMTP id ffacd0b85a97d-3a4cb489c46mr7644577f8f.40.1748274905760;
        Mon, 26 May 2025 08:55:05 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810::f39? ([2a0d:3344:2728:e810::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4babec83csm14730739f8f.80.2025.05.26.08.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:55:05 -0700 (PDT)
Message-ID: <edb8881d-0cac-4f7e-b358-299bb30b5f27@redhat.com>
Date: Mon, 26 May 2025 17:55:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: phy: mtk-2p5ge: Add LED support for MT7988
To: Sky Huang <SkyLake.Huang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Daniel Golle <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250526091019.16096-1-SkyLake.Huang@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250526091019.16096-1-SkyLake.Huang@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: L-6JP-HlTdiTLmL_LfvT2Ex00hBrTAzU80z3bg-_c6U_1748274906
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_085511_582913_039CB7E4 
X-CRM114-Status: UNSURE (   8.38  )
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

On 5/26/25 11:10 AM, Sky Huang wrote:
> From: Sky Huang <skylake.huang@mediatek.com>
> 
> Add LED support for MT7988's built-in 2.5Gphy. LED hardware has almost
> the same design with MT7981's/MT7988's built-in GbE. So hook the same
> helper function here.
> 
> Before mtk_phy_leds_state_init(), set correct default values of LED0
> and LED1.
> 
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.


