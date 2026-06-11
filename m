Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5DECD98D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 12:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWWde8oTiwpIrCzHwuGTBaaddX/30yZJJn3ORVLoQD4=; b=rAc0iFUIljqodvyFLwSOnaRbRf
	owzvs1GKxr9ZuT49fqEfragiAUt8RtcZ7zasZ0+dF1P6nClzcp7FI/6OlngJKanqosKvM3zhRiJ3d
	X8cUb+oev+7JKHm2fPBGfjhyPbVTexpjbImib6Nn1pBnYkBHBPA+22l7Xvzl9ImR+k3f+RlcngLo2
	Fv46PT8CLuTw08TzDNzr33vCd10FIE100Kvrlt+mab2H0DIWNBAhkByxL3MN//sh5MzQwZI1wu8Pr
	X5TKzvpPVSzctSmcHPVPgPyMnju2torRshkN5HybhA1hWi6M1Gz/oyvZZO6qzx7n9VKoHeLQHoyHo
	7VyuB91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeRZ-00000009Nos-1SBT;
	Thu, 11 Jun 2026 12:23:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeRW-00000009NoC-3aob
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 12:23:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso7784546a91.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180610; x=1781785410; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWWde8oTiwpIrCzHwuGTBaaddX/30yZJJn3ORVLoQD4=;
        b=IHp/g95ILkuBdrYr/DlPEsmy7WHCKgH+xjOupBpr4OkBUgQJbDUcJngZthVM5cICSE
         bkMCoZ4kO8oGHry/zl8X/gMS4Yyffz7j12ykJhLeyNM/CjqEl1QnRNLKylAwGyExKNaH
         KhxJXX2IpcvvbnVNb4QqX2w5u9qhMS3uwiLDHW9LKfx9lC6PXb4SXju2DtaKari146R4
         5ENvXuOlJLT5pe79YBrT0qQJ9mA8q69MNleX+RpD+L5FyuapUp3S4FnRv2W1FhhDov2F
         fHe+G6t9ZNWOxWnFiMIMdzv2/rJ+Z0ZYOQEtuC2f/SUJC+QhV4KF0CdVgH91Pncwf+uA
         31PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180610; x=1781785410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWWde8oTiwpIrCzHwuGTBaaddX/30yZJJn3ORVLoQD4=;
        b=WMM069Zx6nX6FP1W2yYrYYM3t70JgBSfbtoPm57/lgwWu56vjecYJ8r7WHjZTil8j/
         XauPizLm1aFyjTBfvDTB8XijN6Zlcm0CHKvv2lvjrKsYdL1S6LGh7WROlGT1PXM6tZlE
         RK5tV8EzUby8ZVFXgNYSUfA5d8Z8k84tYilAKBce2wP9nj7fLHPPXvWlkzDQygUSHODy
         wMi73P9RqLD6XeaGWKGeZEJyR6xMvTcwU28+50eBVG7jIE1AvY2zB+O+PFwpghuLK09m
         Yb2LM8K1N+0wlJbKlXS2cdGLP683UiEQUzo9UeODBYdJpcyNoD5G84Wx8QsQyi+lbVfJ
         stTg==
X-Forwarded-Encrypted: i=1; AFNElJ9bVMfjuIdQ2iumHf/G/WPKap8XM8Q4KgqiKBk1uw5pNO4PjbK4Hm78C/IkoptatB47DmKzE9VIwCJLpCOMyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuvd6p4MoNNMAssKKHB79/0P790UZ6espcnducAu3FnNC9+xYI
	iSvNplZvmbHjydsfsFZJcsNh/5on2VoBfTr3rI0p3pBF0T/QODp+CqZX
X-Gm-Gg: Acq92OFxUgyR84xYO+3rMXWm6J9q7XcGX023vikgSgPdrNaHiBDcjGoy49gJDHoH5Ba
	1t7Eh9bV+TMrS/QM2gVkuGqUI8U1MOfq6qgDyUKsFMjLAhbqdZjyT399T6dc2aU24UXpVbft3lr
	vXw7IdqPEFcJMEI5iaqhWXacgoT6T9aTUq4QaXEZ3bNyOcGpigzldIJeOMeT6gUulqxT/C4vf4T
	wwwhTGk1mNF7t6jJjDMd6t1CMXyBgaNP2DOLrdCy6IlhwesWsmo+N770bntOn7q33y2ixH5vxXK
	3kbkhudToBQRsJQK3SoSvhXj0kQZlGrcpmQirDfmrJzBCtp0OWe/AapfTMGGywltuiJ9y9EsU6/
	duN46S26ECAq6uoDzGzvXniUGwvWdbIr6aKxtd2ntzLl1N0tiZ43uGJC1Ba8DyzckC0Bhf6aOQy
	QAi1xhACKXKvv3Mc7V6eC5xT+/HkJFdYljBhJQIb4g/A==
X-Received: by 2002:a17:90b:3a05:b0:36d:b12f:613c with SMTP id 98e67ed59e1d1-3779f186dcfmr2904451a91.10.1781180609829;
        Thu, 11 Jun 2026 05:23:29 -0700 (PDT)
Received: from [192.168.89.2] ([27.232.220.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3774f4c2e5asm2564395a91.0.2026.06.11.05.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:23:29 -0700 (PDT)
Message-ID: <61bf60fd-2ccb-4d23-be5e-041c7c312510@gmail.com>
Date: Thu, 11 Jun 2026 21:23:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xfrm: extend ESP offload infrastructure for packet
 engines
To: Leon Romanovsky <leon@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
 <20260523121522.3023992-2-hurryman2212@gmail.com>
 <20260611115646.GN327369@unreal>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260611115646.GN327369@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_052330_903127_2C9378E2 
X-CRM114-Status: GOOD (  16.85  )
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



On 6/11/26 20:56, Leon Romanovsky wrote:
> On Sat, May 23, 2026 at 09:15:20PM +0900, Jihong Min wrote:
>> Some ESP offload engines operate on whole ESP packets rather than the
>> generic software trailer layout. They can generate outbound ESP padding,
>> next-header and ICV bytes in hardware, and inbound decapsulation can
>> return an already-trimmed packet with the recovered next-header value.
> 
> How does this differ from the existing IPsec packet‑offload support in the
> Linux kernel?
> 
> Thanks

Hi Leon,

The short answer is that the series did not explain the relationship
with the existing XFRM packet-offload model clearly enough.

Existing XFRM_DEV_OFFLOAD_PACKET already represents the high-level model
where hardware handles ESP packet processing instead of only crypto
transforms. What I was trying to handle in this series was a narrower
case: EIP93 is a look-aside crypto/IPsec engine, not the netdev itself,
so the Airoha netdev had to attach that engine into its TX/RX path and
let it generate or consume the ESP packet framing. The extra hooks in
this series were meant for that look-aside integration, but looking
back, the split between the existing packet-offload model and the new
plumbing was not clean enough.

At this point, though, I think the right thing is to withdraw this
EIP93/Airoha series.

The reason is related to the SOE work I mentioned in the other patch
thread. Many Airoha SoCs also have a higher-performance IP block called
SOE (Secure Offload Engine). I recently wrote and tested a driver for
that block, and I am currently carrying it here: [kernel: add bonding
LAG XFRM offload infrastructure and Airoha
support](https://github.com/hurryman2212/OpenW1700k-test/commit/fbfe8f919f836bb62b3849f803865a4d9b8dc76f).
With the EIP93 path I could get around 1 Gbps, while the SOE path can
reach about 5 Gbps in my current setup. Because of that, integrating
this EIP93 ESP packet path directly into `airoha_eth` is no longer the
most useful direction for Airoha Ethernet.

That said, SOE exists only on some Airoha SoCs. EIP93 can still be
useful on other platforms as a look-aside ESP packet offloader, but I
think that needs a cleaner infrastructure than this series had. The
look-aside offloader should be able to live as a separate module, not be
tied directly to one specific netdev driver, while still allowing
compatible netdevs to attach it into the XFRM path. I think that needs a
more general infrastructure extension, so I would rather revisit the
EIP93 work later on top of that kind of model.


Sincerely,
Jihong Min



