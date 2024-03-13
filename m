Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7596FC54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 15:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmEhZmVSZBopL5MK9mOGygoyzG2onSwohVKSkd/C5f4=; b=WHqvM4SK/cu4yQ+/R9Mw2SlSAF
	r/7HSvEemK0uRRrcgU+BbxgrzM7IiBXDoiBls0A5IwaqRobuj0gHLyZ8vbUviDUh7dtggotfdxfBD
	sFz/ki/dkw7T0XdGNRqjteQX9OwbsGL1KVRmC2nlwiea1ldkY1hxlhasOnQl7i0Elww6weQdVzfg9
	3uyZSriQW3bdXoX2TJx3DqHX9kASXgaUlhGvuC+w9TC8xGpX7UC778aUEjKhn1pQfloO5DGVibHIs
	R/WRErVi2bMzYAxZ8sI7CsXBOSmq61fhrVrzPA3HYYwWFJRjImALrIBYvw3E/Kv6H14Sn1FNLCvTN
	s5IxhVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQt7-0000000Affe-0OYk;
	Wed, 13 Mar 2024 15:51:29 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQt2-0000000AfdU-1SJd;
	Wed, 13 Mar 2024 15:51:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0741CC0002;
	Wed, 13 Mar 2024 15:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710345079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zmEhZmVSZBopL5MK9mOGygoyzG2onSwohVKSkd/C5f4=;
	b=dCjpL1Qhypjdy9xlWHCA/0s3JSgZwPFzSzJHfAufqhwzFSQnY0+zHNZjLYvDXAlw0/LawK
	RDx8xDVnYHshm2m0NrGmnkPQDWIBGnvKiYvxhLRlypYgqMngW3pU9CyIxh0kSafHPT+hhY
	swkdzbS3JIH+qJ/PXMaqmQUuUrrxxoqq/xOtdYCSEWT5KTZM0jUYkHij2g5ubg/rD86p7g
	tQhMDJsq5axO88mK1AWI3lpN7C2ChszAxiZvqc1wHXVVVGuMeAUfGqhvEotfO42uiUtjOz
	9Ow132l3YSiEod4DqhAiKq5s6qZwH6Ma40k97EpgnTbhOHrmXMZgdrb3LRq5aA==
Message-ID: <757e7f93-9ebd-49e3-afd6-a40eb81a1a49@arinc9.com>
Date: Wed, 13 Mar 2024 18:51:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: dsa: mt7530: increase reset hold time
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f594a72a91d12f1d027a06962caa9750@risingedge.co.za>
 <20240312192117.7789-1-justin.swartz@risingedge.co.za>
 <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
 <e6525cac666a033a5866465abb3e63f1@risingedge.co.za>
 <2640a495-97a0-4669-a53a-e367af956a78@arinc9.com>
 <c4590e9519d0cd788d157a1e1510cc45@risingedge.co.za>
 <997db446-030b-4e6a-beea-0ae7d990e7e2@arinc9.com>
 <3146df060620f08a620417cfcf2b2179@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <3146df060620f08a620417cfcf2b2179@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_085124_563079_4A3700EF 
X-CRM114-Status: GOOD (  11.24  )
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

On 13.03.2024 18:38, Justin Swartz wrote:
> On 2024-03-13 17:04, Arınç ÜNAL wrote:
>> On 13.03.2024 16:13, Justin Swartz wrote:
>> I think you've missed that your patch is already applied. And it won't be
>> reverted for reasons explained by Paolo in this mail thread.
>>
>> https://git.kernel.org/netdev/net-next/c/2920dd92b980
>>
>> So if your patch here were to be applied too, the final mt7530.c would have
>> the LEDs disabled AND before reset deassertion delay increased.
> 
> Yes, I seem to have missed that. I thought your request for the
> patch to be reverted definitely would have been performed, or at
> least queued, seeing as you're the maintainer.

Yeah, one would think. :D Since your patch was applied in a good intent of
not having it miss the current development cycle, it was a bit rushed. So
before I could present a valid reason to revert the patch, the pull request
that included your patch was already submitted to Linus. So unless the
patch is something very bad which it's not, nobody's going to bother
reverting it.

I've sent another patch an hour or so ago that reverts it and implements
what we've discussed here. I will also make sure it is applied to stable
trees.

https://lore.kernel.org/all/20240313-for-netnext-mt7530-better-fix-xtal-frequency-v1-1-5a50df99f51a@arinc9.com/

Arınç

