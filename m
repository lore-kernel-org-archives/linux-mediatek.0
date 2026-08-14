Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4467C5CFDB
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2026 14:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=; b=cxk01025SCk3LIpr0SC+Y6u6kY
	BEvN0NmqlWaD6KcZ7zzE1eRedPK97v341nDq8gVMHnckdDStsYLFZ9yK8jyTFgKie2Ck7irKnsw+O
	/heVfDcukYSfVBo/hMYrf3wQThNYenrQutAP2JxnnfEPglCK23NnviA2jpGI4F+Elm3eizkI1GbVL
	IwkYImTpvHuSUob+ftGlJO8ss1AGmvwzfBkwLG1h5/u1E/J4Ajar94PkCB//RSSCL0wDLQyXYSmVP
	udzWguesAs0M05HbvoLbRO28mjTAmh1jzdGbUFK+D80YK9KepgV2xQ/SuIceitlpexphZ6zdu9+ck
	f+DDEXLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusd3-00000002lW6-25Vh;
	Fri, 14 Aug 2026 14:11:25 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wusd1-00000002lV9-1Ru4
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Aug 2026 14:11:24 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-66b3803ef19so1810070d50.2
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Aug 2026 07:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786716681; x=1787321481; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=;
        b=Pq1DWYXcXaxWjxHLzhkiXdpz7uNtS4nWGYHIYJ7waa0wikhwPIOyPvp7WkiqBMOSeG
         wHpMjmNQ0s/Y7J4u8c4S7r1eCHpMuFoxj0uKyGZufQfrXpLNG86EEOqkFaTqF/Gj86rI
         QUCJmzzwovb6+zmoxeWASyE17pNIhc9HegcfhvZqTMtdFWBZQ1C1RSWZyhUC0f2bDhsh
         hkuJlQ6ueXaVhpIENybWwM0MAuf57xeId0tcFYOb0FiP1aOxQVRo8va1RTSuKPZKhSXw
         OlAT6nZEelyyF1z72uW0f+oKBTprdHSFLsQj1UZKNC1OemulaQDUKwp/P5QFO38982B3
         X3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716681; x=1787321481;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a6Tr53R1oyo5DF6Qa5INdwaCZq7w4p85RVWoodqQmV8=;
        b=V0QgP0MUOXYLnTHfhUFp4X85IOYzrWJIFPPyGGajX/UiZg4ykZ7UKOuP0mvgPS5f0k
         OWep/g8dwUfeYexyhI5RueUtc/W1CJBF0jTrEF8LvNSuj9zBT5LzcF92w/VvVsIVV/b4
         1KHETaIGxeILfgNZ8PmS8aEo+rEgMhbtPqRj4VXtBN7mqaVjfHX2KZ0frMduGEPR0gfx
         6jTI3tJ8x7Ex20jDA7AYu0IiPokxqplD2fr3uLxS3oXeEwgtkPFYtl8sJyTRttyOUjnF
         3h+ffqQ4XsLtPF8IBB6zG1kOycUxjUVvfb82XX9KaUAZ5MoF712X272pxCoJW1Kg104C
         bzeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHlu8YKkCpWoI4nEKmBanAG7iiV8jreBmbvVDHIin0DDr7gSmj0H/dkg9t1WldfLP1MaaItufBZ0hb8FYBCA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV6j7nDo8CtMbz/y8GQ6RHeA+6wWDtLWNXYhvZmUpflQTGNKAH
	o/NnkReO5SoJBn+Hb8Van/20ppRir24xHtVxlN39Xje7zRFV6T67L5pt
X-Gm-Gg: AR+sD11LaWX+u4pZiU0XzxJbrFFFeu+lofwdbssFcmydQNk4V5ZMTjrJa7G0vXC0WRU
	pjGAHJ2oICB1+7qXb/4r29RbaRMtP8xt6crXQSrhS0oNKFNCz5EygpfKIP1LwlehNEyBUhuQWzG
	GRaGixLIVd65FHYcG+VmSYS72QMFaKs+JI1Ku9vOG/JlQINcT/PsONNrktGUAuxuZ64ChQ1cHTZ
	JEPsRIykmqTUG7kpmm6/GaS63vfedbN0yLPuK27X1aH9VuxvvjW1/A5dPe+PmDtBWkwAnwkPWXu
	HGgW+j6/vZJo65I8IICHwNokpu2ZKAxdF7Lz0WpA9dqXHLG5sG6US3M0ryHE/GrrIH28/bZfQbd
	2AFBMzK7F9LTaXkviI8iLqOk0TOEGaZ2sUGLlrV/sl+gmOBMKzTiq/Od0G584GbL7nm9btPfd15
	zrei93mBf8U5fQYTcUMutvp7+P5PoXkG2PcFN23UoEe7o4caGIG0+5MjUioyrTa/b8+CZcN+y3v
	eVNyeC6wY4XxXuPGOpPvynfoN9eONbcQ7J65ewK5RR2mJY=
X-Received: by 2002:a05:690e:1c0a:b0:66c:4163:c4e6 with SMTP id 956f58d0204a3-66c72c75dc1mr2777139d50.26.1786716681408;
        Fri, 14 Aug 2026 07:11:21 -0700 (PDT)
Received: from gmail.com (250.4.48.34.bc.googleusercontent.com. [34.48.4.250])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c79390cd0sm895319d50.19.2026.08.14.07.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:11:19 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:11:19 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: =?UTF-8?B?Wmhhb3BpbmcgU2h1ICjoiJLlj6zlubMp?= <Zhaoping.Shu@mediatek.com>, 
 "willemdebruijn.kernel@gmail.com" <willemdebruijn.kernel@gmail.com>
Cc: "kuniyu@google.com" <kuniyu@google.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "imv4bel@gmail.com" <imv4bel@gmail.com>, 
 "eilaimemedsnaimel@gmail.com" <eilaimemedsnaimel@gmail.com>, 
 "alice@isovalent.com" <alice@isovalent.com>, 
 =?UTF-8?B?SFcgSGUgKOS9leS8nyk=?= <HW.He@mediatek.com>, 
 =?UTF-8?B?SGFpanVuIExpdSAo5YiY5rW35YabKQ==?= <haijun.liu@mediatek.com>, 
 =?UTF-8?B?SXZlbiBZYW5nICjpmLPlhYkp?= <Iven.Yang@mediatek.com>, 
 "horms@kernel.org" <horms@kernel.org>, 
 "kuba@kernel.org" <kuba@kernel.org>, 
 =?UTF-8?B?WGlheXUgWmhhbmcgKOW8oOWkj+Wuhyk=?= <Xiayu.Zhang@mediatek.com>, 
 "pabeni@redhat.com" <pabeni@redhat.com>, 
 "edumazet@google.com" <edumazet@google.com>, 
 "willemb@google.com" <willemb@google.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 =?UTF-8?B?TGFtYmVydCBXYW5nICjnjovkvJ8p?= <Lambert.Wang@mediatek.com>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
 "davem@davemloft.net" <davem@davemloft.net>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "sd@queasysnail.net" <sd@queasysnail.net>, 
 "ncardwell@google.com" <ncardwell@google.com>
Message-ID: <willemdebruijn.kernel.82fd3c4505e2@gmail.com>
In-Reply-To: <ddb39bf238a544cb5c8a178dd0fc6e5cb682bbb1.camel@mediatek.com>
References: <20260813014056.160533-1-zhaoping.shu@mediatek.com>
 <willemdebruijn.kernel.1372b82f50882@gmail.com>
 <0e1f71c4417099399eda78fd2a082b2444e42af9.camel@mediatek.com>
 <CAF=yD-+AF1aW5D5H_QPKE1yxyU2wLxOmT8c2Fm4CJsPY=BjW-g@mail.gmail.com>
 <ddb39bf238a544cb5c8a178dd0fc6e5cb682bbb1.camel@mediatek.com>
Subject: Re: [PATCH net v3] net: gro: Fix nesting of TCP GSO SKBs in
 skb_gro_receive_list()
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_071123_411151_C07D5807 
X-CRM114-Status: GOOD (  31.01  )
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

> > > > Would it be better to test skb_is_gso(skb) and only skip fraglist
> > > > GRO
> > > > for HW-GRO skbs, rather than disabling it for all skbs?
> > > 
> > > Yes, for tethering packets, HW-GRO skbs are aggregated by
> > > skb_gro_receive(), while others go through fraglist GRO. However,
> > > care
> > > must be taken to avoid packets arriving out of order. I will work
> > > on
> > > it and submit V4.
> > 
> > Oh right.
> > 
> > As long as the choice is only between fraglist GRO or not fraglist
> > (rather than GRO or bypass GRO), it should not introduce any new
> > reordering concerns.
> > 
> > But the decision cannot be made based on skb_is_gso(skb) of an
> > arriving skb. Because when such a HW-GRO skb arrives a SW GRO context
> > in fraglist mode may already have been opened, and it is too late to
> > convert that to non-fraglist.
> > 
> > So essentially HW-GRO and fraglist are mutually exclusive.
> > 
> > > > 
> > > > If treating the features as mutually exclusive, another option
> > > > would
> > > > be to replace these datapath checks with disabling one at
> > > > configuration
> > > > time, in netdev_fix_features.
> > > > 
> > > 
> > > If V4 work well, there will be no need to check netdev->features.
> > > Linux kernel GRO will be more robust and able to handle scenarios
> > > where both NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are enabled.
> > 
> > What is your plan for v4?
> Based on kernel 7.2.0.rc7 code:
> Add logic in tcp4/6_check_fraglist_gro() as follow:
> if an arriving skb is the first packet in the GRO list.
> 	NAPI_GRO_CB(skb)->is_flist = !sk && !skb_is_gso(skb);
> 
> /*
> * Otherwise, the arriving skb is not the first packet, which means
> * that struct sk_buff *p exists.
> */
> if (!skb_is_gso(skb) || !NAPI_GRO_CB(p)->is_flist) {
> 	/* Aggregate the skb using p's GRO method. */
> 	NAPI_GRO_CB(skb)->is_flist = NAPI_GRO_CB(p)->is_flist;
> } else {
> 	NAPI_GRO_CB(skb)->is_flist = 0;
> 	/* Flush p and start a new GRO list using the non-fraglist
> method. */
> }
> 
> Another code change in
> tcp_gro_receive() {
> 	...
> 	if (unlikely(NAPI_GRO_CB(p)->is_flist)) {
> 		...
> 		/* if aggregate method changed, flush current gro list
> */
> 		flush |= NAPI_GRO_CB(skb)->is_flist != NAPI_GRO_CB(p)-
> >is_flist;
> 		if (flush || skb_gro_receive_list())
> 			...
> 	}
> }
> 
> After this change:
> - NETIF_F_GRO_HW and NETIF_F_GRO_FRAGLIST are no longer mutually
> exclusive.
> - In tethering scenarios, TCP fraglist GRO applies only to consecutive
> non-GSO skbs(!skb_is_gso(skb)).
>   others will adopt skb_gro_receive() path.
> 
> Please provide some suggestions on the changes above. Should I prepare
> V4 patch based on these changes?

Thanks. This sounds good to me.

The risk is that GRO might be less effective at coalescing, if HW-GRO
and non HW-GRO packets alternate regularly.

The alternative to make HW-GRO and fraglist GRO mutually exclusive
does not have that problem, but on the flipside cannot use the fraglist
optimization (esp for forwarding path).

So no free lunch. Either works.

