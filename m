Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0917C4828D
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Feb 2024 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ELaUvP6vFNPFJ2ZKRgKJo6kNHrp0SfSFHi0c7xhuBxE=; b=r+/dvydt37/hzNuwOPqirrfzXk
	2eIovgl6Wqh2TlHaJhsAibHX/ZafumDQkpcifC61cKJ8TS82E12oaKaouThllrfoOpxQC5dsCnVfG
	OxUlP8JBsvZEpVyC134vk8D/dX2+nqXfFTyyl0MG9SDLQPd/aWMNcqJMjpYq7qk0M1CN9IcW6fm4u
	FxHCLINoZMJUbrhYflu7wL7DKw2et1hJt20Z3iwdIOjtjLicSE1ygFMcb0shm/CcUGvQTcshnfSRp
	CWdBoRPAh4eSTqqS79f2xY4cfWTAt4yFWcREFuHgVR7CrGqzh1teTZD5FWcSA0WNZrIN0tEcwGOid
	QtWVCy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5Vz-000000050tO-0wzM;
	Mon, 05 Feb 2024 20:24:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX5Vw-000000050rw-0hxq;
	Mon, 05 Feb 2024 20:24:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19B8A61274;
	Mon,  5 Feb 2024 20:24:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B1CC433F1;
	Mon,  5 Feb 2024 20:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707164662;
	bh=pjvr/I7dTXNHnTgva7B7XrxHkICB2a+rNEz5glnuyBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I+cADej9tPj1U7p85slFv3035ULoHWZfHOsJjMLO63vRBly9U8yjv0Mu+Y0EBl3GJ
	 4wiVYwtX3vP41zR9xEa71opi5LhWWML01SCwQtTZQjrMXHeJwFywI8OBAeRh8Ae2Eo
	 khFRJobmKQMaqSbAhU2iJU8+7G9heW7XO94GjaIo=
Date: Mon, 5 Feb 2024 15:24:19 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
Message-ID: <20240205-silky-sensible-puffin-8e23ee@lemur>
References: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <20240201225943.abphuuavp7bkbrt6@skbuf>
 <1f0e67ba-edd7-4998-bc20-1de86bd53a68@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f0e67ba-edd7-4998-bc20-1de86bd53a68@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_122424_280274_AEF1D07E 
X-CRM114-Status: UNSURE (   9.22  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, tools@kernel.org, mithat.guner@xeront.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 02, 2024 at 12:11:37PM +0300, Arınç ÜNAL wrote:
> There're no brackets enclosing the Message-Id. That must be why Gmail
> modified it with the SMTPIN_ADDED_BROKEN disclaimer added for you. I can't
> come up with a theory as to why you've received it thrice though.
> 
> Konstantin, could you take a look at what happened here?

Oh, yay, another python email module bug. *sigh* It's not supposed to break
items enclosed in brackets.

I'll see if I can work around it on the submission side of things, but for now
the silly workaround is not to create branch names that are too long (which
results in message-ids that are very long).

-K

