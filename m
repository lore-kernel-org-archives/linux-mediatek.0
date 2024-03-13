Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBEC54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9En6uzyrXqEpXMyli+a5bbxKTYmfpSeoH7e6bqHXIiQ=; b=3ruIRUnO1F6fA7k5gToXjoXfmS
	pwPGZj03tct4qk4g8XGxdsjXkOV4aPVdHu5377+Og+gSqKrC8/0zEDLiA9jJIdvmSssB76A1RZ5KO
	ozqeXz5TNlZBod5CHDtt/qzWAEPGafWG4e8ZpHnVqX6rkWyv7tMuheacqVjyKaHe412fcXRzNE3tv
	lRC1kT6HuAaE6WZzMPSed5fnD7GRmfCCC2/0iGZdCou5QKXoQhE/ScTnA9NgnFCn2rPj5gOJgZmFp
	viJSk1DUvDaPXi/UAN1qHpIIuoHVYyiMx068V5GixQaMQgDUmwo1IZ2VS+gdgWWHQUPrNPO39bfsb
	1yVdKHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNNL-0000000A0B9-2LY7;
	Wed, 13 Mar 2024 12:06:27 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkNNI-0000000A09z-05Xk;
	Wed, 13 Mar 2024 12:06:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 07BCDE000D;
	Wed, 13 Mar 2024 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710331580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9En6uzyrXqEpXMyli+a5bbxKTYmfpSeoH7e6bqHXIiQ=;
	b=E/IpBBLuJBUaF1nTLhkj0clPsXeXOXtqG75qHpr/AVJ1aTjlVT21OMhyXGkpR+bpiWuG0j
	dUjfrM6hzo4yaJgWljTIc3wqJz+rCFpDqcHZskzh7aP2wtcQezWwjX79pzhZR7eTrY3b9j
	+fApCe8Na+0M6PeDYARhae3X7kNi7BMTvLDZUQeG6KkJiFQ2b9LAMH4s4x/D1+keTLLvhn
	CWC8DZ+/4XERrEe0jJFN0+RSbX9wwyKgXE6Nf694GNk4xkK3vJ40ChxPy4RDeCIyJoVdkv
	cYoNvo+hWM25HLfFHCO/L++ZcWLunYW1aWYbPMZjVcNjLDT6F9JsKktOuNl1OA==
Message-ID: <2640a495-97a0-4669-a53a-e367af956a78@arinc9.com>
Date: Wed, 13 Mar 2024 15:06:04 +0300
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
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <e6525cac666a033a5866465abb3e63f1@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_050624_249918_8B8610F4 
X-CRM114-Status: GOOD (  15.00  )
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

On 13.03.2024 14:52, Justin Swartz wrote:
> 
> On 2024-03-13 10:59, Arınç ÜNAL wrote:
>> This ship has sailed anyway. Now the changes the first patch did must be
>> reverted too. I will deal with this from now on, you can stop sending
>> patches regarding this.
> 
> At least if the first patch isn't reverted, the approach used is
> less likely to result in the problem occuring, IMHO.

I disagree that the previous approach is less likely to result in the
problem occurring. If you don't like the delay amount we agreed on, feel
free to express a higher amount.

I also disagree on introducing a solution that is in addition to another
solution, both of which fix the same problem.

> 
> The delay between deliberately switching the LEDs off, instead of
> only waiting on chip reset logic to handle that, and the reset
> assertion could be considered a "reset setup" period to complement
> the original reset hold period.
> 
> Increasing the hold period to what should be 5000 - 5100 usec,
> definitely made the problem go away my testing, but the previous
> approach is (if nothing else) more explicit in its intent.

I don't want any unnecessary complications on the code I'm maintaining. I
already gave a clear intent on the patch log that introduces a simpler and
more efficient approach, it doesn't need to be on the code.

Arınç

