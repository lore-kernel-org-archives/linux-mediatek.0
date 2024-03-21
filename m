Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC37C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I2pXI4/0hBNvbyQ/dot/0DGP1257vPUhZWe3mI3ouZA=; b=Os+BktYwX4xUHQT8alJT7nuP6f
	1kmjy+Lvp2NRScyi1W2z3uFiCZS15L0GCXCMz6wTQDsiLecb7P4vdmpEv0H1jhrNiTEwJi1SjAvVw
	QNYuGzBzHmy4QitLD6XSui13HhGBGJQqliacUT05Kz7gFZtK+ZtWjpKwaf48zOPe2+yiCwAYgszP1
	kLdMrDLSce4mqmZNKNuVJYnJJFeb5tJjJbJMNc1wt4r0O7H2xI1UF6cZwy18feI6bFtOm1PYAm4iQ
	XAES+UMBFPEijIWtYUmaTz6EF9AeVv09YksZ+S7WYB12s7ufKnaXIFlJe5+ssuYm0XWkkJkLDNvBq
	6yhAEAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIKB-00000003697-3ROk;
	Thu, 21 Mar 2024 13:19:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnIK8-0000000367y-0AFc;
	Thu, 21 Mar 2024 13:19:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D17DA6118C;
	Thu, 21 Mar 2024 13:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D109C433C7;
	Thu, 21 Mar 2024 13:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711027149;
	bh=AQiVU6QDBK9keYmpVAn9qAMVZHSVfZCCrd90QaWx1Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=US4NyYmO+vr/1M7HF2tzRimSFK18hbGocDhHbiUlo7G1pqn0qc0vhb7fW/4M0XYST
	 eiCkPbe8OP8p3aWVMafV8hGp451QD4uRzoA+maDjioFTGjYZ3TBYjiaWYmC+HurTWY
	 fy7JoENbFyfEIPqwC96GGEINpHULXLsUNh2tuf20=
Date: Thu, 21 Mar 2024 09:19:02 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>, 
	DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
Message-ID: <20240321-tentacled-pearl-ferret-efd5be@lemur>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
 <f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
 <49d23df1340f342822702de0439674ddbc5bff6f.camel@redhat.com>
 <7a7e6c46-03a4-48eb-9f46-84a05259cf26@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a7e6c46-03a4-48eb-9f46-84a05259cf26@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_061912_216552_06C1FF4E 
X-CRM114-Status: GOOD (  11.89  )
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

On Thu, Mar 21, 2024 at 02:29:19PM +0300, Arınç ÜNAL wrote:
> > For future memory: I think the SoB in the cover letter is not required,
> > and is, at least to me, a bit confusing.
> > 
> > No action needed here, I'll keep this unmodified, but I suggest to omit
> > it in future submission.
> 
> b4 puts it on the cover letter so it's not my doing.

This is done because many subsystems use the cover letter as the merge commit
message. Those subsystems who don't follow this practice don't generally care
if there's a Signed-Off-By in the cover letter anyway, so I don't see why this
is a concern that it's there.

-K

