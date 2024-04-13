Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E975C4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Apr 2024 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMuDWobyhc6cTTfs7M8U5paRYn4OZERBL5XjyvqDKH8=; b=yFGw4KGE5k6Bi84yZToHMtmNEe
	Sb64SKsE0d1XNZyLLtXyiZn4x4Ao5Q1m6FeWN9NiwWzXPep1o9kJIrwn2X/+dgsst7+cW4nbI9rrU
	3W7gBQi5C214p3MmFk6jv4FM8BoLFcuqootc+ebvy+OCiRH9hgNJdIbw0JdQtaT9h8XMHeKIDSNrd
	pzHfgAgzXsCuW14SfI63yH/TGyu65yUhFQ6H2sjCrWTXiJRvv3FUIfO4VRoJC6UUmiJbTEZ0p+qZr
	TZJDd6SSF/KNCLXXmR9YySDCZ2jlurWC9+78J/KCTD83oYp//Dd8CvKJLghy/2gjM3knZ7bwk1DCc
	nQhUJAKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvYp5-00000002kMf-1LGK;
	Sat, 13 Apr 2024 08:33:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvYp0-00000002kLm-042X;
	Sat, 13 Apr 2024 08:33:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D19820005;
	Sat, 13 Apr 2024 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1712997188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AMuDWobyhc6cTTfs7M8U5paRYn4OZERBL5XjyvqDKH8=;
	b=njRiwiJzcw/zScEsD9X4BYX0AH7AyjMl23+luEYmIYHVA/RSNCW3DzNRO2mHicsTbvn8Wk
	ecK/F2YoDZSxuAPeEsDRjDpzgNWBS+7hVWH322G6HLdOum6MENyuVxnT+JA6yqf788eh9A
	RJv6lIV8F2w6AEakkXxHJ5ErkbMBrwgg5HkaUwHnBBPID7D5V+5iriWZXuLCYQmYc8AJiy
	NL3/EOrhVGfrvqltmbnA2eMHXIYyWAXgNSLq23knxiYqmqpL+uIKwD0e6SoZnrJzKo+WAL
	ppZrlyYaS7nfsv09FzxUdopXBPMeBHNALjz78GXSFdgLN7M82t5UAqfdEkLu5Q==
Message-ID: <aca6d1a6-913f-43f0-a75f-dc2fbdaa6d6a@arinc9.com>
Date: Sat, 13 Apr 2024 11:32:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: provide own phylink MAC
 operations
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <E1rvIco-006bQu-Fq@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <E1rvIco-006bQu-Fq@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_013314_217009_FB8B8466 
X-CRM114-Status: UNSURE (   4.56  )
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

On 12.04.2024 18:15, Russell King (Oracle) wrote:
> Convert mt753x to provide its own phylink MAC operations, thus avoiding
> the shim layer in DSA's port.c
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Simple ping test using a user port works fine.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Thanks.
Arınç

