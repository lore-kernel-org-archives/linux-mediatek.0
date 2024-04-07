Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6C8CD1292
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 20:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqPFMxPYby+J6LOpNiRlS3fZk7myPWtR33WdlGfj4Uk=; b=BOb7HPiUzB6W/NkmmXpWtwtZbD
	r3VuX9N4CbfELyuEdAp7V3O9K4dTmy6sVZIsLWm6x8hufnAFUeqyuUn54HG2ZWn2KdX8r+GuUnK1M
	IC3H8cxwEi0dk8K1zi64tKKnpEljqyJZTw8ewg8jjX0iVOyRdr5f0XLpkRJKEp3M928hZDa6OUULG
	6t0Nv6X2g7xNT3YXE0N4h9ZJ7lbwOB0BTaAZZDmAV8X3+FerF/pq1bDfJVc4Rgk88CPeCzvWKuTHW
	IZKiNnriLayp+82wdghZLXC9J9rCCUaADoNbc2NWhTFdToIbGvJ8GqTBHG9KUNZRlINRtP270X7Jt
	pc2Qv3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYwg-0000000DRil-1nyl;
	Sun, 07 Apr 2024 20:16:54 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtYwc-0000000DRhK-0aGb;
	Sun, 07 Apr 2024 20:16:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D18E240003;
	Sun,  7 Apr 2024 20:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1712521003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cqPFMxPYby+J6LOpNiRlS3fZk7myPWtR33WdlGfj4Uk=;
	b=cAvcni4BP60iaVFboWrtOxvXFE9l8ZvLvSqszuZod4vOtTDQ+Py69N1RbOk84057wVe+6H
	bDWabimDbsWqoPILMaiu8UNZKP6vQJo/UTRsCj0nh5nJQ44CeH+2T6c2SLgGYlT8SKMbeW
	kuZioa0klbBnL1aElnHIrGB8suCni9h/BEozAnxz2u3hSgHYhoFm+bLxG3LNgYkVWjQHoz
	oTyZNruV8wtBGJgwv5ls3rsEydy0FV+xBg7Knew5NdLQLv74/f2YBaww5/pff3NVacHzk9
	/FoTP6RgQg2/M/y0MlgAbZEtk+rxEtc1v5HE8a29Vwz5vhQLiF403bavyUltRQ==
Message-ID: <9b604134-0787-40cc-a6e2-34efb757478a@arinc9.com>
Date: Sun, 7 Apr 2024 23:16:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: trap link-local frames regardless
 of ST Port State
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240407-b4-for-net-mt7530-fix-link-local-when-stp-discarding-v1-1-b4b20ac93457@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240407-b4-for-net-mt7530-fix-link-local-when-stp-discarding-v1-1-b4b20ac93457@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_131650_348965_38C7A9A1 
X-CRM114-Status: UNSURE (   4.90  )
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

On 7.04.2024 21:11, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> In Clause 5 of IEEE Std 802-2014, two sublayers of the data link layer
> (DLL) of the Open Systems Interconnection basic reference model (OSI/RM)
> are described; the medium access control (MAC) and logical link control
> (LLC) sublayers. The MAC sublayer is the one facing the physical layer.

I forgot to add a Fixes: tag. I'll send v2 in a few days.

Arınç

