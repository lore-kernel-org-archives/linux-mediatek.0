Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCD1C54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 20:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L9q2h8CYQgav6n1YqnS/t2FEJImcD0uzrXWt33zLYY=; b=fICiuGJhxCLzd0Uotf2pmCsgew
	E9vZyIM0eRFd+H2IIxeGoUqya+LLq/veD83V+Pty+Kix9l3ydAjm2m7ihcFitXCGFoTReNrij9kpz
	5ddfUPcn8ivY3jjI2hVlSZSsmftaJfb/DgYc5ysel69mG79kEw7x2iO7NLCmQT4FvNI34cCbhCAB8
	q6r1RTeHiLs7VX5JyNtxg9oek6bKSnauG3RMcx5ubQ13RH29JA7kcuFk0ezF+UyDGsBPK5M544fg7
	TgEXjEyM10cUx4DDmT+4JhHYC3kR8GjpMBG2vbnGqD8LtLQRZTuFJNlWA3WbZLX63D4qBxoWvkaoK
	CGRF9nNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkUxw-0000000Bmji-1aWm;
	Wed, 13 Mar 2024 20:12:44 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkUxr-0000000Bmhh-3nSb;
	Wed, 13 Mar 2024 20:12:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 98BFCFF803;
	Wed, 13 Mar 2024 20:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710360756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0L9q2h8CYQgav6n1YqnS/t2FEJImcD0uzrXWt33zLYY=;
	b=WzTIhz4NH+AgR1EkATjBon5oOy+42v7M5LraE2D1hM726qOvt60LMbr0NHMMvYx0CSQVe3
	KmyyAvSCcIJ932cUajDFov4Xt+SOUhWdnKSLOwwKn6Rc7O5YseMAagkzf2h9Unhg5Khj6l
	noeCKKIpuYMfns0efz6lwMK6y8T8eBGdcgRnosXPUwzdIOjEQ4plA7SbnYxJ8VMSzowcbx
	JTcs+N0/dsVqR6Gb5TsTLFHpPD+921X90J7JTwokRi4Ad3OyabHYdvZNP977VUrDp2TjlH
	IrVU8DBgb/eq1ku0CKjYfa1Fwh6X4HvChT8lUU/Qt1vmAyiE/OTM+PjB+faw1g==
Message-ID: <48fadb58-4b81-4271-919c-102943354c01@arinc9.com>
Date: Wed, 13 Mar 2024 23:12:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: prevent possible incorrect XTAL
 frequency selection
To: Jakub Kicinski <kuba@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Justin Swartz <justin.swartz@risingedge.co.za>
References: <20240313085546.710679b0@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240313085546.710679b0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_131240_148955_49C1D1C0 
X-CRM114-Status: UNSURE (   5.29  )
X-CRM114-Notice: Please train this message.
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

On 13.03.2024 18:55, Jakub Kicinski wrote:
> On Wed, 13 Mar 2024 14:25:07 +0300 Arınç ÜNAL via B4 Relay wrote:
>> Reported-by: Justin Swartz <justin.swartz@risingedge.co.za>
> 
> That's way insufficient for the amount of diligence and work Justin did.
> Co-developed-by, at least, please.

Fine by me. Do I need to resubmit or can you add it while applying?

Arınç

