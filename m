Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E91CBD3C525
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1RLVmWZRpVwJRzpSh3rndfAqydCA0xQpFJqAnYi0pM=; b=XnKS0oDJyHFyj5
	2SagnRfFQUqu6DkeYpjwxQcl0TGj8mlan5HRfBALFVfx/QuDb/a9n75SKKull0zPDtQw3x78aa78O
	XhRWNjwceLpG3PGHIvNc3M7n0em8orHz2gCAdMugnMs3XADitgz8aXmmCicXyIBY0wHC/ftXhK8og
	UZRlSibWVZnDAHLOwXtsrm3zrhhUHhHRenWvIUHxNpIXbYkFOYQ7Xmz+KCAivR0sscHUoRP3PvtAB
	ZM/qoNJFcr+q9hryzGdY3BkxVq+YEfK7pEWwiobJDwK63MlTP7vg7kq+0dT3IVRdsCPg5FPmNEU7m
	JQjyy/BVqzq6oK2zhGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1U6X-0000000FgR5-0F6f;
	Thu, 17 Oct 2024 17:16:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Txx-0000000FeVg-3UBa;
	Thu, 17 Oct 2024 17:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=m1RLVmWZRpVwJRzpSh3rndfAqydCA0xQpFJqAnYi0pM=; b=n6AJ/iLqfAT0IJvQR7XfL1e3qR
	0Lzs6X6mMsz4RjzDahPcA9umsCpgravM5zz6efj1Gxyy7NSheuaKnv3tTq6CN6I/dOgVxnHmhjzpq
	nepykm7SO1HHecJjOGiStB4h7pv2v5jjRxege7e1yYaDykRrrkiuRUzRJzdll5dUdt6c=;
Received: from p4ff13b65.dip0.t-ipconnect.de ([79.241.59.101] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1t1Txc-00AukV-08;
	Thu, 17 Oct 2024 19:06:52 +0200
Message-ID: <eb9006ae-4ded-4249-ad0e-cf5b3d97a4cb@nbd.name>
Date: Thu, 17 Oct 2024 19:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 net-next 00/12] bridge-fastpath and related
 improvements
To: Pablo Neira Ayuso <pablo@netfilter.org>
References: <20241013185509.4430-1-ericwouds@gmail.com>
 <9f9f3cf0-7a78-40f1-b8d5-f06a2d428210@blackwall.org>
 <a07cadd3-a8ff-4d1c-9dca-27a5dba907c3@gmail.com>
 <0b0a92f2-2e80-429c-8fcd-d4dc162e6e1f@nbd.name>
 <137aa23a-db21-43c2-8fb0-608cfe221356@gmail.com>
 <a7ab80d5-ff49-4277-ba73-db46547a8a8e@nbd.name>
 <d7d48102-4c52-4161-a21c-4d5b42539fbb@gmail.com>
 <b5739f78-9cd5-4fd0-ae63-d80a5a37aaf0@nbd.name> <ZxEFdX1uoBYSFhBF@calendula>
From: Felix Fietkau <nbd@nbd.name>
Content-Language: en-US
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <ZxEFdX1uoBYSFhBF@calendula>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_100715_168942_A08828E0 
X-CRM114-Status: GOOD (  18.15  )
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
Cc: Nikolay Aleksandrov <razor@blackwall.org>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, coreteam@netfilter.org, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Jiri Pirko <jiri@resnulli.us>, bridge@lists.linux.dev, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17.10.24 14:39, Pablo Neira Ayuso wrote:
> On Thu, Oct 17, 2024 at 11:17:09AM +0200, Felix Fietkau wrote:
> [...]
>> By the way, based on some reports that I received, I do believe that the
>> existing forwarding fastpath also doesn't handle roaming properly.
>> I just didn't have the time to properly look into that yet.
> 
> I think it should work for the existing forwarding fastpath.
> 
> - If computer roams from different port, packets follow classic path,
>    then new flow entry is created. The flow old entry expires after 30
>    seconds.
> - If route is stale, flow entry is also removed.
> 
> Maybe I am missing another possible scenario?

I'm mainly talking about the scenario where a computer moves to a 
different switch port on L2 only, so all routes remain the same.

I haven't fully analyzed the issue, but I did find a few potential 
issues with what you're describing.

1. Since one direction remains the same when a computer roams, a new 
flow entry would probably fail to be added because of an existing entry 
in the flow hash table.

2. Even with that out of the way, the MTK hardware offload currently 
does not support matching the incoming switch/ethernet port.
So even if we manage to add an updated entry, the old entry could still 
be kept alive by the hardware.

The issues I found probably wouldn't cause connection hangs in pure L3 
software flow offload, since it will use the bridge device for xmit 
instead of its members. But since hardware offload needs to redirect 
traffic to individual bridge ports, it could cause connection hangs with 
stale flow entries.

There might be other issues as well, but this is what I could come up 
with on short notice. I think in order to properly address this, we 
should probably monitor for FDB / neigh entry changes somehow and clear 
affected flows.
Routes do not become stale in my scenario, so something else is needed 
to trigger flow entry removal.

- Felix

