Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645BBC54E67
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 17:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sFjzuy7J8+w4dLV9YzHH2z7RTnEErpYFzircSGu8BM=; b=NwRuZDSJYz3hsVi1TxMePOgnM/
	Q8upsAHPwhv7Gx5vzUOKrBoCvkn+wAw9Da2/qbpI9C08xI8YdfngH/2/TmE1f3p4Clvh2fH0xz1rq
	Byd4EXXQKhDKhuRQzkdIMqu9BCRhfF+puj+Ex8Ty7Gz5e8TYRVKBO9YcLvDJQjd4hoh4ZXMIMBC1A
	n6S++OnuNEonNWpodq/PDkvV4YWoA6jUFmE+esFYg6HBO7zmF8zcumvdUCvGn6KDgkdI425kn4FZ/
	2rIqvD6V0pqr/ZIi+6koFwHI1KqYWsPTQ+kl3uaDXZ3QztVuf+aubkxW7cSRwRpJoPtBG0rRlnH+A
	D3/c80kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBKU-000000010eJ-0Ugo;
	Fri, 15 Mar 2024 17:26:50 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlBKP-000000010cL-26ue;
	Fri, 15 Mar 2024 17:26:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b6f86975so1637184b3a.1;
        Fri, 15 Mar 2024 10:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710523604; x=1711128404; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sFjzuy7J8+w4dLV9YzHH2z7RTnEErpYFzircSGu8BM=;
        b=Fz0bENv4g79XvDAukYPXyhOtuKR0dS5rB+S90wEIsQEprkfCAebtXcNWZbowUZjVzV
         FwubcxYUmO083IB7vVTws9wIr1JAjhTG+X5mxjwP7vJQGAYhu6rZGqVXKMW0VMlbavN0
         xai19mW72ltoXhjyYdfFFIVTXwrMACDC3Z7qpmqsZCL3vrqpyDy3kKvqdWpCOyyLPzp/
         isDKlSKK3UbmQBiu1bCoxpbUGFcIpqEz3Lacjt/uFkFHE40vMV0TOVkWQ3yfMRsWC4nf
         Mcb4xAq9Nc8MudqK9baq8TqSt6y5ssAmhWFUUNr4+6GwwGBh33HcBtr5kfFJvxAYpqKc
         AIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710523604; x=1711128404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sFjzuy7J8+w4dLV9YzHH2z7RTnEErpYFzircSGu8BM=;
        b=Ai3nuerxaHkgUqzEsTF24/qnBQuKsOTzq722yh6GrChzh47mEOFc+mnlM/V3L2HRAI
         9HE+3w/s9ZPObMukLy59nh8NgML0d7+u13Z93GzCPuqCEUgKpxNNzxaJiyl/mKqICQbC
         /OE9PsPi68ZrBLNLVtsnIu4FWblfbpdudgB7GfT63mRcoEX+84c1NnoPDveXBHxpFpcp
         YtFcfy4gS/NlnRbzLQBWooUF+dUG1SdrZHW8L69A9jER3fYFYxbcTtOkgFt0JS/aTPeG
         sZQWRliTBXkZTK0bnJrldHAdxxccOPwxZEaHFA3S3aFm+fdmn4zSc7KJid/2+JhFPaaI
         6uow==
X-Forwarded-Encrypted: i=1; AJvYcCWvvPB3tBUZWl2IFu/9d3aRdIl1PBmPedBaKDhzN3u+E70CyoyzLOU37vT3hQV4f3JYmpbRWzMvtiiR+i8jGsqUT2wIxPeknJNY48q8270asp+o8QKTQm49bEEpqX0/F2mUz3SLgRdZw77eqvS8mD2W7HOlB0dWUo0=
X-Gm-Message-State: AOJu0YyS4Hpr3I+SXKV1zMVU4MpQ85jxO1Vn9IhdMinC/dmtntZNz3Go
	zJbjsuwwsvu1SpUBKc1ZNE8jgku0xhZWWcz46s9XYSMntbbN55LA
X-Google-Smtp-Source: AGHT+IHx/Wktm2Eb4y94uYXrvycgK5Kv6k+ctHSA/s0OkYBbqKkOFZouLwcUIzdhckigvdF9YUlN0w==
X-Received: by 2002:a05:6a20:e10c:b0:1a1:847f:8fa0 with SMTP id kr12-20020a056a20e10c00b001a1847f8fa0mr7087522pzb.15.1710523604178;
        Fri, 15 Mar 2024 10:26:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t188-20020a625fc5000000b006e6f8e9ab6asm1706458pfb.15.2024.03.15.10.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 10:26:43 -0700 (PDT)
Message-ID: <94e3d09a-e6a4-4808-bc29-3f494b65e170@gmail.com>
Date: Fri, 15 Mar 2024 10:26:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7622: set PHY address of
 MT7531 switch to 0x1f
Content-Language: en-US
To: arinc.unal@arinc9.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240314-for-mediatek-mt7531-phy-address-v1-0-52f58db01acd@arinc9.com>
 <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240314-for-mediatek-mt7531-phy-address-v1-1-52f58db01acd@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_102645_581520_E0AB504A 
X-CRM114-Status: GOOD (  14.99  )
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

On 3/14/24 05:20, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The MT7531 switch listens on PHY address 0x1f on an MDIO bus. I've got two
> findings that support this. There's no bootstrapping option to change the
> PHY address of the switch. The Linux driver hardcodes 0x1f as the PHY
> address of the switch. So the reg property on the device tree is currently
> ignored by the Linux driver.
> 
> Therefore, describe the correct PHY address on boards that have this
> switch.

Can we call it a pseudo PHY to use a similar terminology as what is done 
through drivers/net/dsa/{bcm_sf2,b53}*?

This is not a real PHY as in it has no actual transceiver/digital signal 
processing logic, this is a piece of logic that snoops for MDIO 
transactions at that specific address and lets you access the switch's 
internal register as if it was a MDIO device.

LGTM otherwise!
-- 
Florian


