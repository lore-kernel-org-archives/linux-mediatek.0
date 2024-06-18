Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED40C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 04:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7eoG87lpKHygI/hoj/AcOkMNGo9t/VxMJbEW0DRK/g=; b=bE4LoOsxpQxK3tv+0Ltkb8yc7v
	IVpLGEf5Hlf+P6DaLi+RAQIWPY6LjO3L+/VQ1DhhkCYZxLHgDiYqEjlnsmRAXM3VFJuey9oohgJ06
	oT8mOvmztq3SESyhumzr5h8Dnxs02vk23CYteaPAAACN3mXB25zjr80X9qo9i6TEPJy8u8TOI/Qyo
	jo5L3LQjsXEwBvuu2uo435Xl5rFHrXtTZG8gJV7KKj60V7pflchS84/Bli7+xcLXzHC64WFoWXYG1
	i1rKO8xjmmOpNMWUmmjyGrYfrPUh216YeJZycMJF76emSzwaWpmTpZyBft1j3mlTmj2440KcJJjEH
	7XP9Cbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQlV-0000000DakE-365Q;
	Tue, 18 Jun 2024 04:48:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJQlR-0000000Dahq-2Pfx;
	Tue, 18 Jun 2024 04:48:15 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 60A05C0002;
	Tue, 18 Jun 2024 04:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718686090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7eoG87lpKHygI/hoj/AcOkMNGo9t/VxMJbEW0DRK/g=;
	b=fUwcSHORmHty6Dm5gHlhI4nkyC50zcXGuZhVE6qise2i7+ptZ7H3xU7U3CF3Osv4Ptp+JZ
	0NkkZ6aU4F7tVZ5kutiYhJUAunMO3fTqry1ukSTISwjVMrLIr+6pkv6oZEfX65EFeZM8AW
	UBEUDxVytLb8qUDj+skoV/a2zPsa8g3Rp3MgBhdlXxWm/HKt8TdvDHGtAVX110HLxRjCTm
	69iPUqjdbvYwkSyi0uWC5Uy/RO5NMdYTWm8/5noPbcEf8IrlxZvXTEZJuxvZFcV7Y07FMi
	KwtA+nmr/QCV4wOequ3tg7DAgmSncmy+GyTV75KwoPMYneq+4TzhlaKqfvvlfg==
Message-ID: <555b23dc-e054-426b-a26b-6313f260064f@arinc9.com>
Date: Tue, 18 Jun 2024 07:48:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530: factor out bridge
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
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718603656.git.mschiffer@universe-factory.net>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <378bc964b49f9e9954336e99009932ac22bfe172.1718603656.git.mschiffer@universe-factory.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_214813_804458_B63CABEE 
X-CRM114-Status: UNSURE (   7.92  )
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

On 17/06/2024 21.30, Matthias Schiffer wrote:
> As preparation for implementing bridge port isolation, move the logic to
> add and remove bits in the port matrix into a new helper
> mt7530_update_port_member(), which is called from
> mt7530_port_bridge_join() and mt7530_port_bridge_leave().
> 
> No functional change intended.
> 
> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>

I see that my review of the previous version of this patch was completely
ignored. Why?

Arınç

