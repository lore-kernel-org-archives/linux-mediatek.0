Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FADC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 08:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6/9Lbi9NXGVyx2M/GwqTcAQaMos4oEM2EADJm5/7JA=; b=IYBDyx7C6zH+/W9cwsDRqGmPM6
	1ROPaQLM1GLxtL/5F8CjMcgOT30ocl91XwPkIucChjbElcRHMXzaRmXKmJE3ddhsmFoVmcV20f+G2
	EWxxY410AEVgHmbx+kEhUAW3N6vzvPx4nVZRK6bSTuhBbLeE+/WM/GfteepxEa/2T/+TagYoiuQhp
	W/C4Bet+zf5J0P64v/ysCt3LgPJ8rtbkFZIgvBHLobLR8dLlvqIz0kQyqHpi0RXHrTm0fTM6bZcFv
	zHPZlbOhJiAKp9QcqXZ7PIDQP8rnDi5TY+xZeykkduBEwFSCeHQP3FYygBn2mtD3EYEaI34by2dU/
	avkcnf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOvV-000000086HY-4BeB;
	Wed, 27 Mar 2024 08:46:30 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOvR-000000086GQ-1Zl0;
	Wed, 27 Mar 2024 08:46:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPA id 44BE120003;
	Wed, 27 Mar 2024 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711529182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V6/9Lbi9NXGVyx2M/GwqTcAQaMos4oEM2EADJm5/7JA=;
	b=fUI+UlYj89U6BM+J15/EBp0MtnKjFnJM6AomUDVdkohOldxf0oyoLbAIL84DEZ3jAOfGWs
	L+AC0AAU6+p5tirDlSTz3J/v6xQjw42EECSdNlDtPqpT9Pj3o8DCrIksLLU2aTOjLGkx+b
	7Z0Rd9C9Ul0nT5abGD/q8OI1CKyxJSGDbEtHjIwO6qyp6ZDJrP0j0Phg15ZpmrfeAjJ6WM
	hjAmEkoGMLuMAeLhF9rMqSc4RxR8Z6I2dNzIYpDN1KrqEK71NlDsRk3CL5sc0CLYg+Jr9x
	9/Rq+6LqG++FKKGK6WX6GOfrb0A42Qj6rwlTF7zyIsQStaKSG88rOllE1rlhKg==
MIME-Version: 1.0
Date: Wed, 27 Mar 2024 11:46:19 +0300
From: arinc.unal@arinc9.com
To: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew
 Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir
 Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Ren=C3=A9_van_Dor?=
 =?UTF-8?Q?st?= <opensource@vdorst.com>, Russell King
 <linux@armlinux.org.uk>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Heiner
 Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 2/2] net: dsa: mt7530: fix disabling EEE on failure
 on MT7531 and MT7988
In-Reply-To: <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
References: <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-0-9af9d5041bfe@arinc9.com>
 <20240321-for-net-mt7530-fix-eee-for-mt7531-mt7988-v2-2-9af9d5041bfe@arinc9.com>
 <799572b672ea8b4756236b14068aef7c8fa726a6.camel@redhat.com>
 <d65f4c45-e616-4157-a769-c285cbad575c@arinc9.com>
Message-ID: <530da7c1-c058-44ef-84fd-86ff58f1501b@arinc9.com>
X-Sender: arinc.unal@arinc9.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_014626_049598_4045F0D3 
X-CRM114-Status: GOOD (  14.81  )
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

On 26.03.2024 12:19, Arınç ÜNAL wrote:
> On 26.03.2024 12:02, Paolo Abeni wrote:
>> If I read the past discussion correctly, this is a potential issue
>> found by code inspection and never producing problem in practice, am I
>> correct?
>> 
>> If so I think it will deserve a 3rd party tested-by tag or similar to
>> go in.
>> 
>> If nobody could provide such feedback in a little time, I suggest to
>> drop this patch and apply only 1/2.
> 
> Whether a problem would happen in practice depends on when 
> phy_init_eee()
> fails, meaning it returns a negative non-zero code. I requested Russell 
> to
> review this patch to shed light on when phy_init_eee() would return a
> negative non-zero code so we have an idea whether this patch actually 
> fixes
> a problem.

I don't suppose Russell is going to review the patch at this point. I 
will
submit this to net-next then. If someone actually reports a problem in
practice, I can always submit it to the stable trees.

Arınç

