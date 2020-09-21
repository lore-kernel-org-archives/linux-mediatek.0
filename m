Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A4CC43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:11:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32D2A2193E
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 10:11:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FlGeWB5f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUDrcCnE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32D2A2193E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5xc3LLlKru3WIGaT57mIroousL5VSiLzeqwLI+6lSY=; b=FlGeWB5ffhdTyh70kh/laCSYp
	yCV3e5nl0Y3Onms3vIGmuTRi9OyzeLDef/q1KwrwLSSyurBdEJgJuEb3SA5H6osVT9SQiMKWg6hcE
	h1FwOWRIzq9pCg1KDTwOculRYqdPBC1Iw7esD5G4fkjXC8mTnFWq9pOdI8v0iJ4seOmktx69yakvw
	6g6Wm+braiR9+nHxq7eVDK5RjBF56pCLX+ilfeRCkiA5CEWX/SeUzKRnpKUjIMgUFxTfr3w+K9QU/
	31j7deCK4U1YrVrq8sCFKTAzDxeMniczkJoKMQ2GHyY4lRHsRo/LKeiaWUpJTVMycQ85lqiHGpFYW
	1kUJ7UdXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKImZ-0005xj-7x; Mon, 21 Sep 2020 10:10:51 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKImW-0005wg-DJ; Mon, 21 Sep 2020 10:10:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id w2so11535243wmi.1;
 Mon, 21 Sep 2020 03:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hF5Xe4zuKeuDnftfLSzTw6Ue5+aphrBIG5w4rc4SzI0=;
 b=KUDrcCnEC87hUXdHNGKHpmSN4RGpG4lGfUYnkcSIU+/DMB5UNxDLHnLgPXAfsdn1H5
 6ltC8XD5HE3eMaTQyPwLEVwHXFeWldTFjtofSfWrvr4Wht6pOyAoOcYj6KVtyv5oG+bZ
 ebKkDc5tiva0tFYGiDFVNK5Hbr7KZvacHLithwz7jB8hgg/qLUBx56eS5VQZI8CAAG2b
 GrvN7R3zK0BhGTG1Dyy7e1b6dET+ZXKs+rb3B348qkowBv2KlJR7u5yhfHcLNLtc+49/
 rpfCdwOJHKF8oLy5+FuQwQxL5NzVH3z5c6zD4X3ftvmQrzS4HeEsUXBqutxFkW+Du2Qr
 iecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hF5Xe4zuKeuDnftfLSzTw6Ue5+aphrBIG5w4rc4SzI0=;
 b=hDLEApkocfnKQxnuyt9E0jfKxuAM8nKLXGfrZjeEHC9Sv0N3ghca8TbQj9oCwECfwJ
 3ol7ZJkLSKm/ce7vgNuJK+9orOKPkZFCWacqvulVC2+XIXQbEhwsqjfBWmdcCy7t6tmr
 b3cnqxrnEdVZR75QdQMvf2cT/H0dWTbinXT3u0TeZSz1Y4721PTcMt9NdmTc9UYyuj0U
 DpTy7+g35FnlmH3Q7Ve+1KAL5NCtc0+Kz14RCLP/zCvaNkmpmOAX1bYNnOzKmm1KA0wG
 +Jf4ysFTJqFH8S9PTreEnBS/82d1rLeiE4P9MoPW3+qtg3HxADIIJFHWKV27GrM93Lwv
 PUnw==
X-Gm-Message-State: AOAM5336XKGG6R3qADVzp4gQLdivpsg9HkeFLFIEerzLgfM52gVGyTzP
 Lzu4WvnarCjd9XksUPtJeCo=
X-Google-Smtp-Source: ABdhPJy7EAdglywRorZS0QXaRmHGvnMqSYV56C3XdsnhvA/r8oTtCwgePUVMY+s1rH1ltxcbV1Oecg==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr29357116wmg.179.1600683047430; 
 Mon, 21 Sep 2020 03:10:47 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id y5sm19753599wrh.6.2020.09.21.03.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 03:10:46 -0700 (PDT)
Subject: Re: [PATCH net-next v5 0/6] net-next: dsa: mt7530: add support for
 MT7531
To: David Miller <davem@davemloft.net>, landen.chao@mediatek.com
References: <cover.1599829696.git.landen.chao@mediatek.com>
 <20200914.163228.1898649357949030454.davem@davemloft.net>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <c485e60e-21af-ffd3-856c-dbfd497cf6f0@gmail.com>
Date: Mon, 21 Sep 2020 12:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200914.163228.1898649357949030454.davem@davemloft.net>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_061048_480215_EB33EC1E 
X-CRM114-Status: GOOD (  18.27  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: andrew@lunn.ch, frank-w@public-files.de, f.fainelli@gmail.com,
 dqfext@gmail.com, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, kuba@kernel.org, vivien.didelot@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 15/09/2020 01:32, David Miller wrote:
> From: Landen Chao <landen.chao@mediatek.com>
> Date: Fri, 11 Sep 2020 21:48:50 +0800
> 
>> This patch series adds support for MT7531.
>>
>> MT7531 is the next generation of MT7530 which could be found on Mediatek
>> router platforms such as MT7622 or MT7629.
>>
>> It is also a 7-ports switch with 5 giga embedded phys, 2 cpu ports, and
>> the same MAC logic of MT7530. Cpu port 6 only supports SGMII interface.
>> Cpu port 5 supports either RGMII or SGMII in different HW SKU, but cannot
>> be muxed to PHY of port 0/4 like mt7530. Due to support for SGMII
>> interface, pll, and pad setting are different from MT7530.
>>
>> MT7531 SGMII interface can be configured in following mode:
>> - 'SGMII AN mode' with in-band negotiation capability
>>      which is compatible with PHY_INTERFACE_MODE_SGMII.
>> - 'SGMII force mode' without in-band negotiation
>>      which is compatible with 10B/8B encoding of
>>      PHY_INTERFACE_MODE_1000BASEX with fixed full-duplex and fixed pause.
>> - 2.5 times faster clocked 'SGMII force mode' without in-band negotiation
>>      which is compatible with 10B/8B encoding of
>>      PHY_INTERFACE_MODE_2500BASEX with fixed full-duplex and fixed pause.
>   ...
> 
> Series applied, thank you.
> 

Regarding the DTS patches: Please coordinate with me the next time. I want to 
prevent merge conflicts if both mine and your tree add patches to the files.

Thanks,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
