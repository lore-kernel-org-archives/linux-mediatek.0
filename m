Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CB7C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 13:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0b3lVbJ/u4Iyr/bGVB60L+I6TRPbyfigHd10qyDtAt8=; b=WMDjaz14yhomeYV/gUjrYLKdgt
	zno5ARKPl9aT7F4el2v5tORIJYhEQhTINudW8dXrqsjxLIpxH7tPU75BvjrPaY97xb8hfcUE2ZzYQ
	fVMjEK4Kz/LFxENkee3B1z63YnYIyoeYYhqlwn2Da/ltnx72aAP4VBCz2RR5x6PD8wEdo+FVy10TP
	UgRlEGY00EEvWLz+KdW0pZhH3Ns/smlkyIwsJAwW+zdzOEc9pZAnamOtxhD3B/pw7EIH+i3FWQncy
	8MZOs76dGbbsI/fRHWvxk/K1PNNsteOLjdJMuQqa4Yn6Ik5FBY/q25N8VO1SMN6DxrEP8Tvzulrjr
	MS2ysEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCj7-00000008bqi-3WXL;
	Mon, 18 Mar 2024 13:08:29 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCj2-00000008boE-3v4I;
	Mon, 18 Mar 2024 13:08:27 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3c1a2f7e302so2445910b6e.0;
        Mon, 18 Mar 2024 06:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710767303; x=1711372103; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0b3lVbJ/u4Iyr/bGVB60L+I6TRPbyfigHd10qyDtAt8=;
        b=F7crdzw5SxTDiN7rcXzevEfo+Rk3Vb36e8dd8KGZAhVgdLXbwSypmBP5KkfsYcaPdi
         hxVS2GsntONJAIOPTKdo0lIx+cEb6DrgajAMZ+r3TptaLpAmcL6on2pmcjOcJZ46VXWJ
         6e6r+tCHRWil0NEY61ZBQyDdNuTeHHwOVZFkiZX/OWqkC6BZtBIKWMo02VH7VGlAYkOZ
         V3h6zcCwy+hsnZZEBMWmqq60Ty7TC1cOUtFSsHih/8K5wUKTAUG0bzybKC92DTM4RROP
         c0iIXlrxmPmZyWaNqHSr4r63PSyHEbNRVpcnGHwNbbBEh0atMZBmDZda7hPfnL7ATMWc
         j53w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767303; x=1711372103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0b3lVbJ/u4Iyr/bGVB60L+I6TRPbyfigHd10qyDtAt8=;
        b=Aau6v1h1tzjR1BEEAe5hpXbdMyZDW/pjPlT3T3nPQEiaC2jAgRAaY5xxST3KE2AdGq
         I1SbGgOLljb95Og44bv0tLDF34gYXoeH1WqfXZ02QOBogMJ3d2BckgthqLP035ym9hB7
         x+UJMW70krtCU5XmH9Vqq9FC76uR5hGKN8GL2U0dRO1r81HLTefs3lHHfV1g2K0cPNU8
         JRslKOjMxmobWbX8QOvKQG5yEbRVku1NsKMjq+sUeYKBVc+43OFzbm9WH4gSYiad2Nuq
         vXcGtZY2fEtMEGtQRd8GbbJ2NtK4RYvc2dW5TeXzxW97AvIFXVYG25kI3MEdcVHXswfv
         6cbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL2AshjEUORCryqJXCfahVEtBwP1rYaNSmsvwbXIGWNO+WD/I7WNfSD5X/NDLutFVsmFSWugO9md9BlUYui9hTUI7HNovC4yv8DCSCO/xKQmYqHx1Scm9nx/KxeKPEiasidamxZiPWi+fRm3uZu/CoqcTgwq4MmEg=
X-Gm-Message-State: AOJu0YynjIj2ANmkMQSvQs4pWP/FrnNTrdXqr5lzoKq5jRd36AIRQNhC
	FO5qtQx2S62+KGQwU6y7A/K24BQesSpzhpL2/4cmrV3wz22EdHvw
X-Google-Smtp-Source: AGHT+IFe50KHFHexAqMvJ0KnSzN5auUkz3ombF0fqCQ23161eDZZjvx9TuaLT4tbp6XDv3V6+OkWNg==
X-Received: by 2002:a05:6808:2289:b0:3c3:82a1:e6e with SMTP id bo9-20020a056808228900b003c382a10e6emr7831238oib.53.1710767302926;
        Mon, 18 Mar 2024 06:08:22 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id l16-20020ac84a90000000b0042ee243ca95sm4953118qtq.50.2024.03.18.06.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 06:08:22 -0700 (PDT)
Message-ID: <50d8a099-1274-40a7-937e-b2618bfe65be@gmail.com>
Date: Mon, 18 Mar 2024 06:08:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: phy: mediatek-ge: do not disable EEE
 advertisement
Content-Language: en-US
To: arinc.unal@arinc9.com, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <65f7f17d.050a0220.c6db1.02bdSMTPIN_ADDED_BROKEN@mx.google.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <65f7f17d.050a0220.c6db1.02bdSMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_060825_004454_1D75DB04 
X-CRM114-Status: GOOD (  11.23  )
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



On 3/18/2024 12:46 AM, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There's no need to disable Energy-Efficient Ethernet (EEE) advertisement on
> the MT7530 and MT7531 switch PHYs. EEE works fine on MT7530 and MT7531
> switch PHYs. Remove the code where EEE advertisement is disabled.
> 
> This is a bugfix because there's a possible race condition where the
> mediatek-ge driver would kick in after the MT7530 DSA subdriver which would
> have EEE disabled until manually enabled.
> 
> Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Could we get Sean to chime in, maybe there was a valid reason to disable 
EEE advertisement in the first place?
-- 
Florian

