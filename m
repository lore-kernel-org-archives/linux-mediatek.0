Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3804CD98CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=; b=aRIXxV/oowZaIEGr07RBHinvh7
	PtXWhUZNrO4T9VIg+68z8cPk8JasYfbrMiDsoz9N0SoyBQCtFeo4Rlqau8tO+WbER5pwwXLbiKb1T
	hkJ+1eRDqTSkNRHAd/9NCOJE3/HMRzhthNsr06rIFaLBFv9qz7/ZfpsictUziP/U6FF5qcW/G/vuQ
	aUTF7g0bxdwUO8KXaz0s9SSRX01tglrx/64UjDGh/VmMqQXreWKOvsPg9IEFdVk6RAZbtCptDfAlf
	7MgTykk6BBnU6kPQebtiEdIdaZPUsH8KHQPyEd6pDAaANCX2e3aX0r8a2Fj2dmebpbXLPfJD/EgT4
	/2ChNhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeLf-00000009NTa-2p6r;
	Thu, 11 Jun 2026 12:17:27 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXeLc-00000009NSk-1lEc
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 12:17:26 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36bdda53d99so3313935a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180243; x=1781785043; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=;
        b=Zq34GC3lPuXpWZlSum/dtsS65wH+rx6G7sodqUq8AMQ6LhyTgot8TvZP+IHth5ZdQG
         ZtyMdWF5yPHmpXQ4jlDyTjE5ivnLT4Otn4PV3CKd7l1LM5mlrX8xUAbpvULLMZF4KGVD
         fjRFzVNc7vA3NO261tzCPw4EZUApTYEi0k5d03yxw8zbQ7rb/+0Gc2lEvP1X6HndsCwc
         0ZHpKJpBp4X2FgzpSnBqF9WyIP853uj/J4ASaCWNniX9hereSB7YBes47rwkzU8YXsLh
         47s/BfJqZCAfCxmjeT2NCVecA2nSmxJalSus1Slppv+aEYDr/AZ8zwRnvDc5cJ/zDxEt
         Iwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180243; x=1781785043;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKVTpr4aNyZx4lSh79VinADzKQEIbf4Ts/2xtaUoVwc=;
        b=Jv2gaZz/gxRmMPNczMMEy+OfGNUd7fk/bQWPgnbWoAXlIeo70VBuPg/x8EaPQi7s9O
         02oFa4bZHeDzpd4dpgr7qrwzkuUCsVVHFh7PWhAL7JOp6Me4Ip1nVUkgKsndqfhfSVus
         ZDGwt+3xQOCIpeVjlmKMjEUAcjQ6MvxlENbXZ7I1hfHEO2G7ih9dPNc4IhICcDy+Rts5
         2t7S/HJg++UthL/nMX/6lJbnTXbiIqvJfAgyCxrw4d6eQt7h7iHf+zs/Y8NFQQCa9p5t
         bJOtTri1INYB3XacV9PhjgdkG1xBkTcQt4AMhKUR/l+bHg3lHRZJKJD56THzMcmgYr8Q
         PAig==
X-Forwarded-Encrypted: i=1; AFNElJ8kQomb4DOvU2A9i+G4XHdHthAB38HakGqOowcvsuaU6Kf7TbpU7P19XN76nLRZzgHuEKV44Es38jaiJ8r1Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlyW3IfxqHlYXGFJgL/tIJgPeesfflbmndJcu7MmRY6wfQoq7a
	gr3hy/TOx+u0JjG4fH+dxLUvFt2Jj7hs1XkVpqX6Cv9SJsMKJ0AFQVw/
X-Gm-Gg: Acq92OHXcKsqQmjPpWDgroei84CgNBlDa5P8r9mFftcDlv+imqpa+najolYksncABkL
	3KMAs5/34AiqFnaNrp77GKQTmFIUjLI1OhU3j4hJ/Naktd4+GPh1r2Z1SNDVBcQAbO8jO4hErAc
	BNM05Qvi8mOcGrwcnO849STKUWuEyf1UJghdx00pBRtcEO75DFWD9rVLC/0JPdUNt/OK442hJ62
	yNi1SbaZfJY0KNGtzbX10olkBcCBe9hgS0ECxYA1+/Vzpbv2xhRdnp7WfVzzrzzjxiiNLt8mdWO
	H6RKAyeqUQ5U8j6FtaqjYYUUSBQoFVotSN+ZKsBUciHcF3Hbt6zcI/XBvWhYCNtEKf+MWQln6uy
	VBqx6pAndaEeN9NNlQX4ob2lR+V/8wcPirIaJY8so6zkTraWbTO6gyBrjGfxOnshFDX0O4IyMp8
	zJiFNNUqM2rUpbI3G2Kinp8rFNmrlX4av5E/ipAzMNyObYTgooyE0w
X-Received: by 2002:a17:90b:5607:b0:35e:d015:d675 with SMTP id 98e67ed59e1d1-3779d7a1208mr3111460a91.7.1781180242867;
        Thu, 11 Jun 2026 05:17:22 -0700 (PDT)
Received: from [192.168.89.2] ([27.232.220.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3775558f317sm2486069a91.9.2026.06.11.05.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:17:22 -0700 (PDT)
Message-ID: <bfc283bc-a5db-4e96-a447-e8e79cc97d34@gmail.com>
Date: Thu, 11 Jun 2026 21:17:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: inside-secure: add EIP93 ESP packet backend
To: Simon Horman <horms@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260523121522.3023992-1-hurryman2212@gmail.com>
 <20260523121522.3023992-3-hurryman2212@gmail.com>
 <20260527100824.GJ2256768@horms.kernel.org>
Content-Language: en-US
From: Jihong Min <hurryman2212@gmail.com>
In-Reply-To: <20260527100824.GJ2256768@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_051724_471171_219BDD6B 
X-CRM114-Status: GOOD (  22.30  )
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



On 5/27/26 19:08, Simon Horman wrote:
> On Sat, May 23, 2026 at 09:15:21PM +0900, Jihong Min wrote:
>> Expose an EIP93 packet-mode IPsec backend for netdev drivers that need
>> ESP encapsulation and decapsulation offload without advertising EIP93
>> itself as a netdev.
>>
>> Add provider selection, capability reporting, SA lifecycle management,
>> IPsec request completion, and provider fault notification around the
>> existing EIP93 descriptor path.
>>
>> Assisted-by: Codex:gpt-5.5
>> Signed-off-by: Jihong Min <hurryman2212@gmail.com>
> 
> ...
> 
>> diff --git a/drivers/crypto/inside-secure/eip93/eip93-ipsec.c b/drivers/crypto/inside-secure/eip93/eip93-ipsec.c
> 
> ...
> 
>> +static void eip93_ipsec_abort_requests(struct eip93_ipsec *ipsec, int err)
>> +{
>> +	struct eip93_ipsec_sa *sa;
>> +
>> +	while (true) {
>> +		bool found = false;
>> +
>> +		spin_lock_bh(&ipsec->lock);
>> +		list_for_each_entry(sa, &ipsec->sa_list, node) {
>> +			spin_lock(&sa->lock);
>> +			if (sa->aborting) {
>> +				spin_unlock(&sa->lock);
>> +				continue;
>> +			}
>> +
>> +			sa->aborting = true;
>> +			found = refcount_inc_not_zero(&sa->refcnt);
>> +			spin_unlock(&sa->lock);
>> +			if (found)
>> +				break;
>> +		}
>> +		spin_unlock_bh(&ipsec->lock);
>> +		if (!found)
>> +			return;
>> +
>> +		eip93_ipsec_abort_sa(sa, err);
>> +		eip93_ipsec_sa_put(sa);
> 
> sa is the iterator for the list_for_each_entry loop.
> However, here it is used outside of that context.
> 
> 	"If list_for_each_entry, etc complete a traversal of the list, the
> 	iterator variable ends up pointing to an address at an offset from
> 	the list head, and not a meaningful structure.  Thus this value
> 	should not be used after the end of the iterator.
> 
> 	https://www.spinics.net/lists/linux-kernel-janitors/msg11994.html
> 
> Flagged by Coccinelle.
> 

Hi Simon,

Thanks for the feedback, and sorry for noticing this mail so late.

Your point is correct. The `list_for_each_entry()` iterator should not
be used outside the loop like that. If I continued with this series, I
would fix it by keeping a separate selected SA pointer before dropping
the lock.

At this point, though, I think the right thing is to withdraw this
EIP93/Airoha series.

The reason is that many Airoha SoCs also have a higher-performance IP
block called SOE (Secure Offload Engine). I recently wrote and tested a
driver for that block, and I am currently carrying it here: [kernel: add
bonding LAG XFRM offload infrastructure and Airoha
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

>> +	}
>> +}
> 
> ...


