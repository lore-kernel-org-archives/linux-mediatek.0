Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE94C27C53
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 15:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzgUYlbwpAE7jfJG5Wq5ME+fPoSlySfMs6W+eYQNnaI=; b=ctwiGIqXq0+FmPikMBxykXw2a3
	1jzvF6CqIGLX9rW2hXD70R4/X29ODWwjJwhyLw7T1kl0RtBGFVAoJS+vanv3KZLzbJ2R6kf5yc4Xt
	6Ae4PQPWRK4vHS+3gWtMxU+w3aZ4bbRQ+4rfKOy0N4YF3UihgJyoCOsE4cZlH4+g8fxtjKn8uLhBj
	TX6S50Y8ncHTav2iyIah5YZCVD64Ar45uOh1nz3v3sASpmZpLaS2yMBpijMoKqemXqhPKBGM8lzAK
	kI2fzuLrLK3G9iMJwQ4Yc/xyWq9ERYZGqrVfzLpjcFVhvnug69LdPvFj09BCWz5qsK5G50fpE+HWS
	cYEf0gxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIrvM-00000007nfj-13lQ;
	Sun, 16 Jun 2024 15:36:08 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIrvH-00000007neT-05R5;
	Sun, 16 Jun 2024 15:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CzgUYlbwpAE7jfJG5Wq5ME+fPoSlySfMs6W+eYQNnaI=; b=vWmkIGWewCwx6GcJleZj4n7Q/q
	/r4y9PA8YSdD7Fu2GUNK0DH1Fm7DAbipBVkbVcczFnaZhOiReYm8cWth5bVEV5kwV9ho6RhEOLlx5
	PI/r27HWfDnHJKcnB0rWH3LReDyIrbo61cxA36REky69wMwQkV6vXBxVlWF05oj6N0Y8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sIrv2-000BgU-Kq; Sun, 16 Jun 2024 17:35:48 +0200
Date: Sun, 16 Jun 2024 17:35:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add support for bridge
 port isolation
Message-ID: <0dcdf71c-8b47-4490-bee2-8551c75f19e0@lunn.ch>
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
 <15263cb9bbc63d5cc66428e7438e0b5324306aa4.1718400508.git.mschiffer@universe-factory.net>
 <4eaf2bcb-4fad-4211-a48e-079a5c2a6767@arinc9.com>
 <8b80f4c7-a6bc-4ac9-bee4-9a36e70a6474@universe-factory.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b80f4c7-a6bc-4ac9-bee4-9a36e70a6474@universe-factory.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_083603_086541_15433912 
X-CRM114-Status: UNSURE (   9.91  )
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

> As far as I can tell, the rules are:
> 
> - non-isolated ports can communicate with every port
> - isolated ports can't communicate with other isolated ports
> - communication is symmetric

It is a bit more subtle than that.

By default, all ports should be isolated. They can exchange packets
with the CPU port, but nothing else. This goes back to the model of
switches just look like a bunch of netdev interfaces. By default,
linux netdev interfaces are standalone. You need to add a bridge
before packets can flow between ports.

Once you add a bridge, ports within that bridge can exchange
packets. However, there can be multiple bridges. So a port needs to be
isolated from ports in another bridge, but non-isolated to ports
within the same bridge.

       Andrew

