Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53AED0E6D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 09:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZOPzM8nTUFqwLn8ohf0g1jVEfJikuSPUMDsCZxkKDsM=; b=lYWyHkQ1FB0aMMZdol52e/dvls
	3ZZVGANwTDrxR/P4Z/B/T0ZJ//UyM5ctQfgFuL2sFOx3XEUcip3YK2cE//YN3pdNjuB7FtTFYcMq7
	KfcwiP0+6OC11fsv2gXQX5Srz+y95YIa1enSUPVXC0WCiUwMyxgfCJ7x/yoeM/elyBaviEVsFWBkE
	IQf7k6Z02ZDpfjxn8TvcFBUAApnIPzEKsV8DQpGiLgMtadO8S/9Ak+ZlBpo3DmnGVnY4j3iGMuVtN
	bDOO1UwgV1+or+TSM56IysgHxcYowKmQysBz6dH+KxikoXJ7Md2f7j2xt90AnXYh2DqLxDT9fxoLx
	Qe38GHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ohd-00000006hNk-3SXI;
	Mon, 21 Oct 2024 09:27:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2odd-00000006gcu-3K4m
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 09:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729502623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZOPzM8nTUFqwLn8ohf0g1jVEfJikuSPUMDsCZxkKDsM=;
	b=LAycIl5dpPbrEcT0Y6qkrq0DF/UKaZ2keuvnELpPQTNfH3aRLU0fgGOB/qVVkN0MvngJwt
	nLOg6mLn71e+2PYK0Jk3LLSX/aR8ApAsSNxZJuEBCAD2gYJlkQm03b5t1wnK0ktQXvoRqv
	AEJaP48dUjJ1ITCWN6LzIJUgEJ0og9U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-t51yIRAPO-yZc-mP-wuhDQ-1; Mon, 21 Oct 2024 05:23:40 -0400
X-MC-Unique: t51yIRAPO-yZc-mP-wuhDQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d603515cfso1883078f8f.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 02:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729502619; x=1730107419;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOPzM8nTUFqwLn8ohf0g1jVEfJikuSPUMDsCZxkKDsM=;
        b=HoBDySdMGkG9ubWO101Lw02j7ssdNP4o22yqy2TBZ1Rb/jNKPKk/4JVhTuOeoOlM7K
         imCGLLZOIj7CIkeaMPyws4QG2kbMG+hArsmZY2UjbxQ2D9sdo9ke6ab3VMBYHVmV06n3
         DWo2k7BJmqJDOzJO+dncyIUkh9YRSBtnsRuSDpW7g052hAIz4S19ThjloFRtcPuLdQ7B
         lWLjr8IXKYydHXoXybwPJ3ia0jfjtzC1W2AVFos/9E1STlDusTt76oodVfnHLxnklrAe
         Og2HUnVeN0FiU37ga40e6TNFL0STlUlfILdwGy/MONJiNuHb4vrqqEb5LBdnPPufoLbY
         QpHw==
X-Forwarded-Encrypted: i=1; AJvYcCUeiD2cayc56WGQ6+V/YHqx30xNmU6qCIVa3XNfSrRwSk3XCnx0a/ndcO/T1rOkKLWI26UZClwOarYrXrEgIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeir2e47UeKDc0OdBlCBHatoGA+uBsWxgUCq6xjVZ4yUwnFjZP
	q0rxcBHHETp45lqpz2zHGn8zRYJEpFn6zr54asyOsRA+Ev32+FBFKI+XJ1g1R2SsVepbRSHQGKX
	povYVmf1f6KwVcY2yQRbVsREs+U2UihJmv7/3zNeh2yALlyCcDRvnFWUPrV8xz00JXnnBQw==
X-Received: by 2002:adf:f591:0:b0:37d:39df:8658 with SMTP id ffacd0b85a97d-37eab72a94dmr6219396f8f.58.1729502619018;
        Mon, 21 Oct 2024 02:23:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHysyLKLLu8ecA+EiDeIyFSZdEdGbiDbJIKLmvhlv8Jpyw7lbNkChKbBAKP5wBfWcUaSVANmA==
X-Received: by 2002:adf:f591:0:b0:37d:39df:8658 with SMTP id ffacd0b85a97d-37eab72a94dmr6219383f8f.58.1729502618678;
        Mon, 21 Oct 2024 02:23:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1b73:a910::f71? ([2a0d:3344:1b73:a910::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cbe7dsm51045765e9.39.2024.10.21.02.23.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 02:23:38 -0700 (PDT)
Message-ID: <6b95c3c9-3b8b-4db3-b755-a3652c1a59cc@redhat.com>
Date: Mon, 21 Oct 2024 11:23:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] net: ethernet: mtk_eth_soc: optimize dma
 ring address/index calculation
To: Felix Fietkau <nbd@nbd.name>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241015110940.63702-1-nbd@nbd.name>
 <20241015110940.63702-4-nbd@nbd.name>
 <e67883e3-b278-4052-849c-8a9a8ef145f0@lunn.ch>
 <695421bb-6f31-4bae-8c8c-6d4fccf1b497@nbd.name>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <695421bb-6f31-4bae-8c8c-6d4fccf1b497@nbd.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_022345_955255_B2E3C254 
X-CRM114-Status: GOOD (  17.52  )
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

On 10/15/24 15:07, Felix Fietkau wrote:
> On 15.10.24 14:54, Andrew Lunn wrote:
>> On Tue, Oct 15, 2024 at 01:09:38PM +0200, Felix Fietkau wrote:
>>> Since DMA descriptor sizes are all power of 2, we can avoid costly integer
>>> division in favor or simple shifts.
>>
>> Could a BUILD_BUG_ON() be added to validate this?
> 
> Not sure if that would be useful. I can't put the BUILD_BUG_ON in the 
> initializer macro, so I could only add it for the individual dma 
> descriptor structs.
> Since the size of those structs will not be changed (otherwise it would 
> immediately visibly break with existing hw), the remaining possibility 
> would be adding new structs that violate this expectation. However, 
> those would then not be covered by the BUILD_BUG_ON.
> 
>> Do you have some benchmark data for this series? It would be good to
>> add to a patch 0/4.
> 
> No, I just ran basic tests that everything still works well and looked 
> at the assembly diff to ensure that the generated code seems sane.

Since this series is about performances, some related quick figures
would be really a plus.

At least we need a cover-letter to try to keep the git log history
clean. Otherwise cooking the net-next PR at the end of the cycle will be
a 10w worth task;)

Please re-send with a cover letter.
Thanks,

Paolo


