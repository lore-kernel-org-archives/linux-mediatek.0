Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CB0C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 19:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rG4sRsDd/6xRCJRJQvFE0uunSAdGcquD+BOsXJyzENw=; b=ZFgj1tX3wTuAfasAizp68fQDNv
	D6qA41Qh3o6wA+QYgSocLL78olO8IBKPzpHJcTPNMSnCeGqr8RMAre+ApSFoWUGWzemXVH5zZ/Mxc
	L+FDX8THmPfS+WhwHqBIrTTTl2CBTcqA/QmRfeSEEBbH2rXkweuB9WH/zjnqLB5ZiWz5aZ5OrlO3Z
	WfRlmwqZi+xA7j1qACwFukrkjJ7nvmzz45kObSr/R7GHOkFbRTvR7P2bkVz6hHFT4qA2AgHpGor+a
	0heYNTGYzPkIUEGR/eQXohvlkah3kH5hX00DDBACq0R3T10MNdnY3t11bvBPvpZ5YT91n98+eVK40
	VU+RPxWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJemv-0000000GOff-3Nc6;
	Tue, 18 Jun 2024 19:46:41 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJemr-0000000GOeX-1WUi;
	Tue, 18 Jun 2024 19:46:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2757AC0002;
	Tue, 18 Jun 2024 19:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718739994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rG4sRsDd/6xRCJRJQvFE0uunSAdGcquD+BOsXJyzENw=;
	b=VrwNhgu4xIFNCUD1woGi5FZoLAKdyDQMgjD9/8z/sKyQiL7FWRYAEO++yzN7nKhuA7ZeWn
	xz0geDfMNarScDQfAjQYQPz6z+1mywCeBV4Tb2DcnBh9ctGIQGCrNtaSlm3CeHfY8xf1pV
	57SKkizX812tx05B0P2lyIhFz0DBbK/XwxY3JalhVur9kPDDJw1GZZKXmPDV3/X0X4qBRE
	YBdsMCpV8yrcdiW5vhuZBmx2b2bGxCTWlOkTfKyfBETJfxvjxGU3D8SgpbGjO41kRzKqMD
	KigVoKD8vzxKfZX/j84pZ6vgKFG3Y6HYmO0Ax+Vo9sLKykbMy0ag/bt7InjxCw==
Message-ID: <5266ed1d-ebfb-41fb-9036-b9afcd7ce843@arinc9.com>
Date: Tue, 18 Jun 2024 22:46:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 2/2] net: dsa: mt7530: add support for bridge
 port isolation
To: Matthias Schiffer <mschiffer@universe-factory.net>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
 <499be699382f8b674d19516b6a365b2265de2151.1718694181.git.mschiffer@universe-factory.net>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <499be699382f8b674d19516b6a365b2265de2151.1718694181.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_124637_644789_CCE7BB90 
X-CRM114-Status: UNSURE (   5.99  )
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

On 18/06/2024 10.17, Matthias Schiffer wrote:
> Remove a pair of ports from the port matrix when both ports have the
> isolated flag set.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
> ---
> 
> v2: removed unintended formatting change
> v3: no changes

Works as expected on MT7530 and MT7531. Thank you for doing this!

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

