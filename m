Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DC9C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4spzynnZLzSXpZvD9M1NQEXqK2+5EzKlAxOSnoAYggE=; b=cRdW8OPoMikadzLfmhA3BDTxwL
	6/v+xjaG2Puf27IpsfPiXwbnfWRwjXY639dmAj1dZKB86OicA6RtpU7ADJQpEWoMFW15TEKYmvEr+
	QcxkntNNh5LNDmak0CMI+fhy15DuCHJvX8rJ0CHFic/neqv5DNE4Q29Ccce/sPFsYr66mK9LKkpSa
	RzHw4SmpTG/4WaHrqJw2PIfUkmh2Ul5y3uQvBUGelH9HKCMoQr1al3D1t/HkPa1kgj3IECXGgCYuj
	dtHteyOp/C662bmPR7dkwQJm/oUWjSVumA1vapl+2QdCipPEjn05ylD3HklaqThf7PVHRJXW8MIcA
	OW7CZWoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwMZ-007eFm-2f;
	Thu, 25 Jan 2024 09:49:35 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwMV-007eD4-2K;
	Thu, 25 Jan 2024 09:49:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8B8F14000D;
	Thu, 25 Jan 2024 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706176164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4spzynnZLzSXpZvD9M1NQEXqK2+5EzKlAxOSnoAYggE=;
	b=Xv9q88tEhpXwElHUBolfyOODB7HD7meHv1GR2s55oHM7A4OEjiWUqYzOFj8ciEdBzd44cO
	7DtlbABxYZ2vHFqx+n2QG0dgRKKIXy+iQ3u5T1hYXKi3aILRBwZEmjlN52xaLEikx9OOkS
	I2rRUS8pg6d7naLcCKGAVX8UVslHemONhgc8dqjmMqumdHGfhwQvyofeXBUOod+b54YSah
	bh7oM53p3eRvj8tG/acVjEZ2+A5lU3yYfebD8Kj2YnwUOPUyPjfYBq7vmhCh07/AnwYwtN
	ulNUGSGzpXLZXyALFeCVlleyTW5HYZdDQqImSNiGSJBP9NAkHB3jqZVwxsmcGA==
Message-ID: <accda24c-9f12-4cfe-b532-a9c60ec97fca@arinc9.com>
Date: Thu, 25 Jan 2024 12:49:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: fix 10M/100M speed on MT7988 switch
Content-Language: en-GB
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>
References: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <a5b04dfa8256d8302f402545a51ac4c626fdba25.1706071272.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_014931_933526_F3C5EE76 
X-CRM114-Status: UNSURE (   7.13  )
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

On 24/01/2024 08:17, Daniel Golle wrote:
> Setup PMCR port register for actual speed and duplex on internally
> connected PHYs of the MT7988 built-in switch. This fixes links with
> speeds other than 1000M.
> 
> Fixes: ("110c18bfed414 net: dsa: mt7530: introduce driver for MT7988 built-in switch")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>

I'm wondering why we manually set speed and duplex for these interface
modes in the first place. I don't how it works for
PHY_INTERFACE_MODE_INTERNAL but, at least for PHY_INTERFACE_MODE_TRGMII and
802.3z interfaces, phylink should already supply proper speed and duplex.

Arınç

