Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EA6D216A2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgxlf8j6C6WxbcSqLlRz/GSOnVwKwwZyR7OiY8684pQ=; b=2hyweZtC7wKR6xHVFYA9x2mZpD
	1ugCJx2mgKs1G7xl8DxrtlGkz0dUvkiGG+zyQeDUtDwCSwuF4tEPhIC9LrCpGwbmk+5Le10NqrBEI
	S25llNQQtyzvTOJjYtGBRzRTnkPLxH0LBH9rTFj9tLJ4k3jLZF0TKlu9WKzlQMkKKIOyYrKa4fU3X
	TVUWi2wVDdc4pRVtw/4zwC2dmyqIKfrHRGTVurfGBu+Ndn5YLJ7nfe1nQibn5c5ePoNzR0gyilJLK
	JM+lmLEM1aQLrKwUYP2qkFiqYZSpCPYJRG4h1KEAwZqTQr9knYuJkszupWdAKisUkyClgc/EjR5aN
	xQlkat5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0hhN-00000008NGh-1IoD;
	Tue, 15 Oct 2024 13:34:53 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0heq-00000008Ml9-0IOb;
	Tue, 15 Oct 2024 13:32:17 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a99b1f43aceso781921966b.0;
        Tue, 15 Oct 2024 06:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728999134; x=1729603934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wgxlf8j6C6WxbcSqLlRz/GSOnVwKwwZyR7OiY8684pQ=;
        b=Htsir6WgyynqHD59n5/LmwgoscJEoRt7YMnZgyOjG85qD90VQzBpHbgYINsHdFUhCt
         M2NoL+YWOaoIRgTgecqa8L8T+SvoNJ2jXFOvXScVAsB6E49MK4SeupCaVAzg8PwLaV1i
         B1LLMc0269/7XclW0LOChDwb4ZqMeyNVnEU7qUvglIZV9d4qCiPShk8qmCPU8QrGbi/i
         Mb9VyDcVaHeGq/YL3eXpZkkitUi2RJLk27eJfobZ5ESlRcxL2asRHipWEJ0WfvOAUh+k
         rn48hdBotFwMrxpuda7aBTObhBcBDOyLrK9dVTwOcfjuFO2mtvoksks/G+0TyOEE/m/5
         9uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728999134; x=1729603934;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wgxlf8j6C6WxbcSqLlRz/GSOnVwKwwZyR7OiY8684pQ=;
        b=RM3/fKYLwlN2vPhUVH5CuzcAu6Z4rZEhxkp0sFWKI56fxO9iKOqCTKXBez7Yts7Yar
         zY2C6K56qt0hMhVV0I508q1n0hnTFF46ZgY4Z7JpkCG8hXTs6jjTxgfbIu8IOr88FSMX
         ZBLnnaB0iYiDagdBfYdr/EXJN3LoIdyP3Dey+VRTpmq5k05+UvkP4Rf9qYBScvbkeiv+
         Id9TYgQu/IdhgYF/7Iu6H+OnmxcwEUc4+yZF9XSUfYrExckDGQ2ldO/rl6dXZyZQDyDf
         Ju4J3GvwFsABoj6cY7/szxG2QG2NSxKO2Nc/SoY2GZ05gKEt/I7tQXumYpfHcMbhGZSO
         NkSg==
X-Forwarded-Encrypted: i=1; AJvYcCVadOhE5d4oMPNmtVz11HlyzuIfv7SPAkqoKKraCSzZlGP2P0DTsTscqfiSQgXOhel/zRaDY+dnK0/sxx7ygaE=@lists.infradead.org, AJvYcCWHi80B7dCEzLRwIbHKbWMyDSBDsIhVuOIkxhRRvxkmhGrxx/1vGodXek0bl0U4/vSQIWWWhM/4IhztlxZgd9n7@lists.infradead.org
X-Gm-Message-State: AOJu0YzlDk7Gdj422hgs8irVdxCl26ABMAW6eCXaWY7rFBMkYGHtGtZ7
	Zf+ntxOnlPyGsYZdjnordOBojDA36mZCS24NhHWinU2HP1to48XN
X-Google-Smtp-Source: AGHT+IHead+svkj8BMnd2AtLtotz8v11llLgziR4JZ6WubowTfOWTXfJTTlJA3fxQTd68GmzjhaI0A==
X-Received: by 2002:a17:906:7955:b0:a9a:f19:8c2a with SMTP id a640c23a62f3a-a9a335726dfmr74735966b.6.1728999133316;
        Tue, 15 Oct 2024 06:32:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:20d:1300:1b1c:4449:176a:89ea? (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2974960esm72107366b.62.2024.10.15.06.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 06:32:12 -0700 (PDT)
Message-ID: <137aa23a-db21-43c2-8fb0-608cfe221356@gmail.com>
Date: Tue, 15 Oct 2024 15:32:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
To: Felix Fietkau <nbd@nbd.name>, Nikolay Aleksandrov <razor@blackwall.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jiri Pirko <jiri@resnulli.us>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 bridge@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
 <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
 <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
From: Eric Woudstra <ericwouds@gmail.com>
Content-Language: en-US
In-Reply-To: <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_063216_153897_41DC2626 
X-CRM114-Status: GOOD (  22.65  )
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



On 10/15/24 2:16 PM, Felix Fietkau wrote:
> Hi Eric,
> 
> On 14.10.24 20:29, Eric Woudstra wrote:
>> It would be no problem for me to change the subject and body, if you
>> think that is better.
>>
>> The thing is, these patches actually make it possible to set up a fully
>> functional software fastpath between bridged interfaces. Only after the
>> software fastpath is set up and functional, it can be offloaded, which
>> happens to by my personal motivation to write this patch-set.
>>
>> If the offload flag is set in the flowtable, the software fastpath will
>> be offloaded. But in this patch-set, there is nothing that changes
>> anything there, the existing code is used unchanged.
> 
> FWIW, a while back, I also wanted to add a software fast path for the
> bridge layer to the kernel, also with the intention of using it for
> hardware offload. It wasn't accepted back then, because (if I remember
> correctly) people didn't want any extra complexity in the network stack
> to make the bridge layer faster.

Hello Felix,

I think this patch-set is a clear showcase it is not very complex at
all. The core of making it possible only consists a few patches. Half of
this patch-set involves improvements that also apply to the
forward-fastpath.

> Because of that, I created this piece of software:
> https://github.com/nbd168/bridger
> 
> It uses an eBPF TC classifier for discovering flows and handling the
> software fast path, and also creates hardware offload rules for flows.
> With that, hardware offloading for bridged LAN->WLAN flows is fully
> supported on MediaTek hardware with upstream kernels.
> 
> - Felix

Thanks, I've seen that already. Nice piece of software, but I'm not
running openwrt. I would like to see a solution implemented in the
kernel, so any operating system can use it.

