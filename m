Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A732FC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 15:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MdEQyvlBs8JPSR6sY8l1QfloixZaJaJWiIIgUApzqz8=; b=EXos2WntjBEdVn2UU/SIbptM2z
	oazN9uPXugDwCwauaf0Fogm51a2DZduEigZKJv4eGW2/3c5EBBUOC4l9SY4elznaIV6FHV67SzQby
	gWZuRdVABudomEDOG24MdviBcfkp6hrMCjcqm+cUbfTFPBFuW/Yi376RtLg6P7+8x2kwf+8pcfbVk
	SQXssMIQQCQBnSxz445/T/TjH1ZdqnyeZNOdCQLtdJnTc7kVjgM4B2Z3rv6n0bblCi1EnJ/hO+M5o
	Xn0llTCJgQ5atHjc+h8q0esLXAhTeDNBVgTGDCGBs543gndCceWbNSlPS5kW95OtnkvTGsJcA/5cV
	xC3PLKlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOIY-00000008tck-2JkY;
	Mon, 15 Apr 2024 15:31:10 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwOIU-00000008tZh-1SoN;
	Mon, 15 Apr 2024 15:31:08 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78d57b9f3caso210330385a.3;
        Mon, 15 Apr 2024 08:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713195063; x=1713799863; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MdEQyvlBs8JPSR6sY8l1QfloixZaJaJWiIIgUApzqz8=;
        b=D3Ra5Bm6mXaTU+mApSsseEXkM+7i/+ro/xekSN2ZnySvyeRcfz7+k7tFCeRnVN74tz
         hBPAI4bfCZIRF2hPv4lz2x221j5OUcRVVvvWDipOk5lri50IYY23M9FlmuRXBQ/5yasH
         pwo/mcugdU50VTzQlualx+Dd/3U3a0ROR65sO3vlX6QHdRKbtf4A0Jteg97i9O2mmfsU
         Fvh3abUSaRkZi+I/S+ABha2kYXiqG6p17r9yKgPYiOjk0jH0d5zNpEuG5Yh+G0rPBx9d
         q8vn+x/T133o0+ppWtuzxDgfPrk4UiMolEaxgbC3zQMcGxIERuiQ1n5hOoZMT0ofbl03
         PXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713195063; x=1713799863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdEQyvlBs8JPSR6sY8l1QfloixZaJaJWiIIgUApzqz8=;
        b=oF46mrYK/ACme1pggQEPt9KvWK5GWwlBxCWDKZ0byQ2ZYRIaIRZ8TuDPUrWIJh8Ckz
         EXDEjSAB4hAJkLbRw97+Ea97F2L/JAS/Oms3QsqYavS1IU25mp4S5hTqTtdrNBrJgfUm
         XRihMupEkrOqoM4LGLfVzI4x2L2RCT/GpiS88s8j2POuUvRu7XuDnVdgNvjjXGk1W+ne
         XbUbfQOyTrycCEh5qDLXqKh6kLfYn28dPW67Q3EOjXSBZdT6dHDf1YK6HVmct+DkELN9
         zHxsEMm4j8zuq8GCfh3Goa3rAD6+PwXqH+pS/SDcLe/WIj316psOyS4Jsg8YyttPNmv2
         Fvfg==
X-Forwarded-Encrypted: i=1; AJvYcCWlVIAl1z9AirSvmsaouHjz+YXubYjGj/b4pBIRnbwwKnuEx+63yt9uubxaA6HUb8Z1zI8OYoqGSCsaejqijH8EQy5Cn/9yQ1XzYpnxvGyMqLoqOWC+108X/tvfnlVyqYc2U4ydeUv/xnUVrNuknG06FnkNWYr0emQ=
X-Gm-Message-State: AOJu0YxQen5P61WmSWF5fbtkx9lQ9MFagZsEidNDuDCh07Pk6E518KJf
	DJYUwwOlrcNE9iN8EOTXzSjs4tR/56PlqFFPOMu4ocOFdYZ8BXqIURZbhg==
X-Google-Smtp-Source: AGHT+IEhtLO+7hPlAs3otp/4TH5Ey3+BrrnBrw7Dd43SvvDnFqbEILnl6s8hx5eye4E29FtScbMAIw==
X-Received: by 2002:a05:620a:4ad3:b0:78e:bf95:fba6 with SMTP id sq19-20020a05620a4ad300b0078ebf95fba6mr12625309qkn.60.1713195063533;
        Mon, 15 Apr 2024 08:31:03 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id xx18-20020a05620a5d9200b0078d632edfd4sm6479151qkn.14.2024.04.15.08.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 08:31:02 -0700 (PDT)
Message-ID: <459b31bd-64b3-4804-bc5a-c8ffd145e055@gmail.com>
Date: Mon, 15 Apr 2024 08:30:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530-mdio: read PHY address
 of switch from device tree
To: arinc.unal@arinc9.com, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_083106_469106_B58C7978 
X-CRM114-Status: GOOD (  14.71  )
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



On 4/13/2024 11:07 PM, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Read the PHY address the switch listens on from the reg property of the
> switch node on the device tree. This change brings support for MT7530
> switches on boards with such bootstrapping configuration where the switch
> listens on a different PHY address than the hardcoded PHY address on the
> driver, 31.
> 
> As described on the "MT7621 Programming Guide v0.4" document, the MT7530
> switch and its PHYs can be configured to listen on the range of 7-12,
> 15-20, 23-28, and 31 and 0-4 PHY addresses.
> 
> There are operations where the switch PHY registers are used. For the PHY
> address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
> into a macro and use it. The PHY address for the control PHY is 0 when the
> switch listens on 31. In any other case, it is one greater than the PHY
> address the switch listens on.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

I would go a step further and name phy_addr switch_mdio_addr, or 
something along those lines to clearly denote this is not a per-port PHY 
address neither a proper PHY device, but we've already had a similar 
discussion before about spelling this out clearly as a "pseudo PHY"....
-- 
Florian

