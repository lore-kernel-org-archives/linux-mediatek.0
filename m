Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3D1C02182
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jan 2025 23:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuYhx4ivzz0E1AuPp+VdpQD15ncC9/RM8+DNV9taH/M=; b=njkQP9mxzjBYxXj+n43eliLq8U
	b3M/eAhrr69XED8VbBFkXZ0vT1vZ0HlpiO1VFoDLyqInn5qEo6Ef41PqCQgAjYwLFqfDFtmCXJsRW
	i8TF9xNEEvXeTnIF5qrI/mDaBbgvqWLSFiRsMiJCoH4jdmN4O1nuusAXQjW21Dh04TvCVuymUisni
	lMhmp/zG596Qnj7E+DPCtnBfh/D8FrpYsIqtBcCzuf1t4cYT1dA7vd3V/5NPXp5imxIAASB0MJ2wO
	m/5yAdWetDijidKgXfSmm1mUmUYTVTX2C5ENXt8/lvWL9zHDkP7/srI9FTPpB+cj6novrpHx7g8tX
	3VavOhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taO2Y-00000008zhL-0ji8;
	Tue, 21 Jan 2025 23:52:14 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taO1F-00000008zbf-3ela;
	Tue, 21 Jan 2025 23:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AuYhx4ivzz0E1AuPp+VdpQD15ncC9/RM8+DNV9taH/M=; b=A6QEpfly++bM7NYGmP3SnrNw46
	tzmrW4bt3urzf1A4m8tC0jM+IPQbXwCo6UjGQnaXpgaSxnQwj7NTl3gMT250EkSz8azZGdC6FTKkH
	mAQZcJBLjsXeUD+EdhuPJGZtujaBkPOe/s9/hh4QEdd4cm5G6OWOqq+jSIct6tfDA4Qg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taO0v-006mUm-5p; Wed, 22 Jan 2025 00:50:33 +0100
Date: Wed, 22 Jan 2025 00:50:33 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: Elad Yifee <eladwf@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>, sr@denx.de
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <6359f0e9-6f13-4b87-993a-313a378742d5@lunn.ch>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <20240729183038.1959-2-eladwf@gmail.com>
 <TYCPR01MB8437EC132CBC033368FC40A998102@TYCPR01MB8437.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYCPR01MB8437EC132CBC033368FC40A998102@TYCPR01MB8437.jpnprd01.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_155053_909637_1B3B4017 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, Jan 06, 2025 at 10:28:46PM +0800, Shengyu Qu wrote:
> Hello,
> 
> Sorry to bother, but what happened to this patch? Is it given up or
> something?

There appear to be open questions about it. Those questions need
answering. Also, the net-next is closed at the moment for the merge
window. So a new version will need to be submitted once net-next
reopens in two weeks time.


    Andrew

---
pw-bot: cr

