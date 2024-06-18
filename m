Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3908DC27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 19:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QuFZH3mA3heT0Lg52N52SIqXngyM9XRruerZhqmjgPE=; b=cV6zQy5qlWq2nYgPPlKMRMFMz3
	ND50hVW9PzC1nJCWCJGTLZhK88bse4ALT86Z5mjQlETpWH58F+Q+hQiIABk5ziVROcFVfOZatjovR
	elXHxg5h+j1iCWt3ZdZO/9+woZCko25dh8Tkpgv/B1wWT0w9Hf4G1JmrOBw20zyTGQuU6tq9eavCs
	M2JmS3cZea6PF5VXwOfv/YmSm5HQfxkZPdpw93WVGre6qOhiHdzDJ318c0wJDRPQifLie9K9WDz/d
	9fKue3KEx6etQnej6x83KUCVYklDkPRVSSqRdd+Jcqjia9wKZe5t0mwipF/Tkj/3P90EIE2VWrfpk
	r/5Y/hYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJemF-0000000GOWu-2UW5;
	Tue, 18 Jun 2024 19:45:59 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJemB-0000000GOVx-1eDn;
	Tue, 18 Jun 2024 19:45:57 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F80860005;
	Tue, 18 Jun 2024 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718739951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuFZH3mA3heT0Lg52N52SIqXngyM9XRruerZhqmjgPE=;
	b=ONatoTr5auORsRR6M+opH/ZKTYexrJGegtk2isFpLjGtCTslOWea4YKS2AsJtgGMrEHYP5
	aSuMuN0OVU4y0eJPH7VKMncAJ4BFvrK/St6S5m8K7l7ZHbCc+QZD2+D/vuIX59wLYL8eRW
	hBa9Ibgo761ySe+01sO8cqspr/nKepWeWKLAD5Gthxv3U1fpYgT/JeVBkjUuzEu95P1CV6
	uWZo9rCiuS1aEwiIs5aNa+80q+ZDJ+Ey79UXw3Rg8LK9ceHcKUm+hf9Ek/1lq688d5EDOC
	GCjfAor9SETQsoSpGLeSIN14/lTQiir3AEN0ufnnLIe/WnBwY4xgHwVYAPXHnQ==
Message-ID: <c1417feb-d677-4e4d-bd1a-7ccb0d838630@arinc9.com>
Date: Tue, 18 Jun 2024 22:45:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/2] net: dsa: mt7530: factor out bridge
 join/leave logic
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
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <15c28e5ed5fa02ca7904c71540e254617d571eb8.1718694181.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_124555_609451_4682525B 
X-CRM114-Status: GOOD (  18.86  )
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
> As preparation for implementing bridge port isolation, move the logic to
> add and remove bits in the port matrix into a new helper
> mt7530_update_port_member(), which is called from
> mt7530_port_bridge_join() and mt7530_port_bridge_leave().
> 
> Another part of the preparation is using dsa_port_offloads_bridge_dev()
> instead of dsa_port_offloads_bridge() to check for bridge membership, as
> we don't have a struct dsa_bridge in mt7530_port_bridge_flags().
> 
> The port matrix setting is slightly streamlined, now always first setting
> the mt7530_port's pm field and then writing the port matrix from that
> field into the hardware register, instead of duplicating the bit
> manipulation for both the struct field and the register.
> 
> mt7530_port_bridge_join() was previously using |= to update the port
> matrix with the port bitmap, which was unnecessary, as pm would only
> have the CPU port set before joining a bridge; a simple assignment can
> be used for both joining and leaving (and will also work when individual
> bits are added/removed in port_bitmap with regard to the previous port
> matrix, which is what happens with port isolation).
> 
> No functional change intended.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>

Great explanation, thanks a lot!

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>

> ---
> 
> v2: no changes
> v3: addressed overlooked review comments:
> - Ran clang-format on the patch
> - Restored code comment
> - Extended commit message
> 
> Thanks for the clang-format pointer - last time I tried that on kernel
> code (years ago), it was rather underwhelming, but it seems it has
> improved a lot.

Cheers.
Arınç

