Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5255FC624C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 08:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=; b=U0KbSa3+tPwuzVb/AIOBaEZDos
	irnl8rEylYyrr7M4bUJhIIox8X+u8xBZl5RsDR5zoeAuEm5yGqgggDeVYba/4nKSpgG/9MoFYbG/z
	Vg/osiA4Q2r1t+ep9aLKa5cwesm09WqQ5WB1UmcUYZP7AjA/2YRSYkFg4xyO9QNFDwJaIdKGGiHy3
	XDxf+tdpNuAD7BsTI1ry1RFczRY8rHUfh+HyDwrLTR/NeYxotGLa7kZ4ZYTdUIV4VEWAXYDws5LNR
	A8y5v33sGNlm2wEBXUedFuajSziebtJWvmzoHmKIVWkulnDD+40tdf3Bx5vMaxjqdFa6s4bp4ar0M
	ljE6yyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvM-0000000BIGH-1GSq;
	Tue, 01 Sep 2026 08:32:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JvJ-0000000BIEc-1LKi
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 08:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788251570;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=;
	b=O+9b+eCRMVDBqXdPgTZjtjr7Jbq16nK0WgDjDRvSZLjqZfQDyoTTN7kGEwbb0EKqFNMcTa
	AcJ+c/JTHizSzaydhCIQf6OtI2BqSlkSJC2ddZJhaDHCAMtlb43nXuwVSUtPsGaLm6J7A0
	U4Pf42Ld+ZLEm/SrOke0QTRg2piWIqI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-LUp7lTCNOmWlD_QFf9qijg-1; Tue, 01 Sept 2026 04:32:49 -0400
X-MC-Unique: LUp7lTCNOmWlD_QFf9qijg-1
X-Mimecast-MFC-AGG-ID: LUp7lTCNOmWlD_QFf9qijg_1788251568
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cd83ca361so8317175e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 01:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788251568; x=1788856368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb1hPY3E5R+EwjHtwcdA5PerJF3fXh3Mowb0XNvM6wE=;
        b=lR1kwoUHhZGiSKotY6pt0WrUlvd/kHaLVQtB95fPOhosJWY9csivPvsh6HnovgM74C
         ktBN8P+d3kuDLDj4Etthv249x2/6EEKDVbFFCnFRW2wJp6F1jPLv7zZ6bMRXYDnJ4zI3
         8GzNk0RzNi84oUhrWXvkBbLZ1h+wbSI/BobnM8vYpxGIjTqdXF6kCmX5hf3fWwTK1Fqw
         dVJFeyAMWqOUeBxTEwBTvB/74u8OXpeu5s/d51TUGDUajnfdJu3UqRser8534ST+1knG
         UZ++aEMavsH+cbPXdvUFWRUVvoOAJE28cQUMfO/u0Hy2IbITCLUfE8cea0UdavcixNvn
         2Dzg==
X-Forwarded-Encrypted: i=1; AHgh+RruYMq98gZq8bkgdfgXh5IAwLYi4nxotmgigLyfvpdug7LyxUMn7zn6dAbCV7ZyUnquU2SvcwUJxxQ8iSnfwQ==@lists.infradead.org
X-Gm-Message-State: AFuF++mnfP02ABsJ9enYJ1wgTHUdZOigRar5b/WsliyXiezKMpRElzpp
	4oUqSdZ08Ksm4FuVrPDcLKn+V/m+TI3XJoVkSa0tmpR1O6/p7axKe68c3q1QTyKhlhKTBqn/ojE
	FEZwgUHJqY3jnNOF8G2I2jnC0B0JrSRTf+GoVjtBuagzgsueBil9qeC4SnCU6g5+hyKJaNptxEg
	==
X-Gm-Gg: AR+sD11WOSk4PqRvVFUd+OMOlMR0sKysfAKzslzyDv6yGfkQ53jaGnwifEJifFdVbqX
	nk7IsaYGB72g/xOKz3RMBo/C9CQV2/vjAeaTJoRbYiNBodnmdh/lkIH0dIVbpx2dU65jZZEejck
	C7zmZcGDmpsVfcNPsp++/fyj4czixoB1XWGUdTGRJOowADS5+RywRxDPfJ9PeXdzNWNoiOePuu6
	IQfg5fGmy7zbUe4CmVnHiflsNaSWmPPFIZiH5GXC6ac6m/tEEN75oUzZy7emDIPq/oKt7Z/AXkK
	RCa92kW9709H5GevYk+2W9d8oUCd0XoqR4ABGEHEsaNR87t9aC/zFHF6iygVW8Y+hKUUHLt0xDA
	qe5aRz2KYX+t4tgM4CUv/ICE00353+Od30uGZC+v/dKXNz6LeMd059vUVmgv5CSpwtiDMbTWqNQ
	==
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr404159575e9.12.1788251568038;
        Tue, 01 Sep 2026 01:32:48 -0700 (PDT)
X-Received: by 2002:a05:600c:b85:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49cc96ad411mr404158475e9.12.1788251567565;
        Tue, 01 Sep 2026 01:32:47 -0700 (PDT)
Received: from [192.168.188.103] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm310558275e9.1.2026.09.01.01.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 01:32:46 -0700 (PDT)
Message-ID: <68c51086-eb10-4074-8495-b31c8e8a21e0@redhat.com>
Date: Tue, 1 Sep 2026 10:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/2] net: ethernet: mtk_eth_soc: populate
 lpi_interfaces to fix EEE support
To: Aleksei Sviridkin <f@lex.la>, "Chester A . Unal"
 <chester.a.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, Qingfang Deng <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260827211652.63504-1-f@lex.la>
 <20260827211652.63504-3-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260827211652.63504-3-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DDiYeffiM4BH--IG3OxNxugi_5nf8nuJzs83Hzo5P7U_1788251568
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_013253_442561_F686811B 
X-CRM114-Status: GOOD (  18.71  )
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

On 8/27/26 11:16 PM, Aleksei Sviridkin wrote:
> phylink_create() decides once and for all that a MAC supports managed
> EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
> lpi_interfaces. mtk_add_mac() leaves lpi_interfaces empty.
> 
> So ever since EEE support was added, ethtool has answered "Not
> supported" on every MAC that uses mtk_phylink_ops, and
> phy_disable_eee() has locked userspace out of turning EEE on. MT7628
> is unaffected, as rt5350_phylink_ops has no tx_lpi methods.
> 
> Leave 2.5 Gbps out of both bitmaps. MAC_MCR folds SPEED_2500 onto
> MAC_MCR_SPEED_1000, so MAC_MCR_EEE1G would govern LPI on such a link,
> and that is unvalidated rather than known unsupported: MediaTek's SDK
> driver sets the EEE force bits for 100 Mbps and 1 Gbps only, and the
> unit of the wakeup timers is undocumented with the port clock at
> 2.5 times the rate.
> 
> LPI stays off until userspace enables it, but the EEE advertisement of
> a PHY that advertises it out of reset comes back, since phylink stops
> force-clearing it.
> 
> Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> 
> On the netsys v3 switch MAC the xGMII filter empties lpi_interfaces
> outright, as PHY_INTERFACE_MODE_INTERNAL is the only interface it
> supports. It is a fixed link port with no PHY, so phylink had no EEE to
> manage there before this patch either.
> 
> Pre-existing and not addressed here: mtk_mac_enable_tx_lpi() programs
> MT7531's reset wakeup times (17 for 1 Gbps, 36 for 100 Mbps) whenever
> it runs, as its own comment says, so they now apply to every SoC driven
> by mtk_phylink_ops once a user enables EEE on an eligible interface.
> Those values do not appear to have been confirmed for MT7981, MT7986 or
> MT7988.
For a 'net' patch, I think it makes more sense to restrict the lpi
interface to the chip revisions with support confirmed.

/P


