Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472BDD4114C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jan 2026 09:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=; b=bz2ZGAsaypyJTsO7eDaclHniVk
	WZ4sH7Ckdv+Bfb5byl/L8vX5nDuxiQ+5UQkDPoTzbK7kJAmTGz/tWkZF1dsRxOw1yLkOlaqPYDluS
	TOQ6KqlFxD1sVXNVaFgfe9RnRQaqMcTH3EzoaHTRPE4G4+Qxqj1rW0KdKgEDMiTbF/tG9gGId/QQN
	XyIGN3xUw0wP/dP5r0NrjjfQeZQmgipZtEM1AJAweV3QSVBYuadLIYJiIb5o/3RglTlFGTfFZl28o
	J3V3WyxB2ponGJaMzKmAFp4rGGCPlM8a1Tk8p+hyE6DvChZKbwaY4MZTeSA3bKuqIaAawCPwY1Hj5
	VT25PcFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJnc-0000000C5EA-3Hxs;
	Thu, 15 Jan 2026 09:37:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgJnR-0000000C5Cb-2RdL
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Jan 2026 09:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768469860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=;
	b=aYl//qPToN/cJ6yM1jx0vbmF57kCkD7l7Ib5Jow0HugKwdY9F6hMxgzwNnMaXvSX0TsNiW
	OoSWB01RMRa+H08M+DvQMCCtuk+w9yyuI3nnT86EF/njrxAod6odzVrBiRTAHE1R7+qI3e
	lF0DTEDrXCh4cMkm5ZuStfevxOvw5yI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-9nILkaegMuqCWeRE1DuLIA-1; Thu, 15 Jan 2026 04:37:36 -0500
X-MC-Unique: 9nILkaegMuqCWeRE1DuLIA-1
X-Mimecast-MFC-AGG-ID: 9nILkaegMuqCWeRE1DuLIA_1768469856
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so8446555e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 01:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469856; x=1769074656;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbyX5I3XmcBb65h/6RUQRH0oiD3GDHhpS2uLRUVlL/Y=;
        b=RP0iTmDy1zXXq+AVL9XgX6eXZH5IP/w6LRNZH9G0ZBHORkzbC4ZVGlW4IYnV21L8DP
         fEUlvFVS8a3gYwq9HRHfnruUD9gISnNP6/Au9gx/9ckVAnHw43/2P3eT9v66In7ipm+s
         ULXFbJs7n6PvxD9U6w8pQKnphOcd2TPADMHxidPbV0QlR+15ElQClDoMnO0tRS26lSXr
         xohn/Pqpgw0wuk0IYQKpT5R+pO5bvxUIFtxyHgvm9/TUmvYTohSXnCOFu+CqW4mITo95
         hgsQtpJEk8LmaCfLDzRciytDVvMSXavduOJz7gtMzSeELlgl6q9PI8V91AY7OAserXdF
         fAMQ==
X-Forwarded-Encrypted: i=1; AJvYcCULOJSdhBdQOAy3lDhw5LDhVjYCu9fzxIoAOA6cgEhz8Ee32cRAuZyCPOWfX1Vp36KSIH9hK6G3sZ90bfQQ6g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6B8Oz044xrMdSBI+iybpnji3dNSpiQB411duxqf3eQRqN18Jq
	7TSjl0w2xT6EqH4zZKMeebv7kNq4NGQJ9CdLufOF+R4ID4iyWW+rbxx6caWtKjfUMQWKPMLWTFw
	WRqlr8rl8IGFT5qDoMPz6sVXXg1j/+2Vy2ZTEcHZXhwxC+BM6pBfP8FPKacQbA9CfSmX+H5Y/vA
	==
X-Gm-Gg: AY/fxX5CsTmAr/AYo84wTB3HJwRFhMlEgGpORXgODPuUyg6NS+mZ0Rq+q8b5fHhAU83
	UWOqow3fK1+bPm0yKHf+fcZIIlx5OHrnmigsYVGLiGOsmIhOIsh26NBo5URysrwNi7YP+YPbAUd
	V68Pzb7HBakItB2944WSbrfqO4VRFoHEHchEcyxzuDZKxCs5F1EODBX3LuhP0VSVVjiGCIUE9Er
	04hojW+iMzFoO36Sl3uawGtRy2cTpfBBCGFx19M+p3FyfLfDvYj6T7y7sNexzJZyuecTck2UOsC
	eb20GLBJKr7C6QXSmOhS1ykOX99RpiLtNj0UZ7K10+LUxhdCw52YtYFvg9JhQPc2bmfaicxfvSX
	wwXc9FuRuDZsQ3Q==
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801a3a5f92mr13914125e9.14.1768469855731;
        Thu, 15 Jan 2026 01:37:35 -0800 (PST)
X-Received: by 2002:a05:600c:34c3:b0:480:1a3a:5ce6 with SMTP id 5b1f17b1804b1-4801a3a5f92mr13913865e9.14.1768469855311;
        Thu, 15 Jan 2026 01:37:35 -0800 (PST)
Received: from [192.168.88.32] ([212.105.153.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428af0c7sm37233455e9.4.2026.01.15.01.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 01:37:34 -0800 (PST)
Message-ID: <173d1032-386c-4188-933c-ca91ce36468f@redhat.com>
Date: Thu, 15 Jan 2026 10:37:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and
 phy_get_tx_polarity()
From: Paolo Abeni <pabeni@redhat.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Vinod Koul <vkoul@kernel.org>
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com>
 <87o6n04b84.fsf@miraculix.mork.no> <20260111141549.xtl5bpjtru6rv6ys@skbuf>
 <aWeV1CEaEMvImS-9@vaman> <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
In-Reply-To: <33ff22b4-ead6-4703-8ded-1be5b5d0ead0@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Gp3f8Nsgi3zR0V3QWO3N983LB3cq6kuKy2UDMOjYiUQ_1768469856
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_013742_016693_91F03D9A 
X-CRM114-Status: GOOD (  13.20  )
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

On 1/15/26 10:34 AM, Paolo Abeni wrote:
> On 1/14/26 2:10 PM, Vinod Koul wrote:
>> On 11-01-26, 16:15, Vladimir Oltean wrote:
>>> On Sun, Jan 11, 2026 at 12:53:15PM +0100, Bjørn Mork wrote:
>>>> Vladimir Oltean <vladimir.oltean@nxp.com> writes:
>>>>
>>>>> Add helpers in the generic PHY folder which can be used using 'select
>>>>> GENERIC_PHY_COMMON_PROPS' from Kconfig
>>>>
>>>> The code looks good to me now.
>>>>
>>>> But renaming stuff is hard. Leftover old config symbol in the commit
>>>> description here. Could be fixed up on merge, maybe?
>>>>
>>>>
>>>> Bjørn
>>>
>>> This is unfortunate. I'll let Vinot comment on the preferred approach,
>>> although I also wouldn't prefer resending to fix a minor commit message
>>> mistake. Thanks for spotting and for the review in general.
>>
>> Yes fixed that while applying
> 
> Could you please share a stable branch/tag, so that we can pull patches
> 1-5 into the net-next tree from there?

Vladimir, could you please re-post patches 1-5 after that Vinod shares
the above? So that we don't keep in PW the dangling (current) series.

Thanks,

Paolo


