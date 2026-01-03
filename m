Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D08FC6174
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jan 2026 08:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HfLB7tnzgNN40ngj7Gx7V7TV8CQHLvbaKh+evyjPmCs=; b=pd9oIXGIieEeITWPbilhghZRfS
	wEzfPQZ3fchj+X7iE3CCXTCDIsl/dur7EXbfjgNcKataPnlGyYRpe1Gik/LOpILoqixTc7oVfoDib
	Fv7pqnhYq58ZDIMpaH1tT7nDXzXRHtYj7flCy6GNviShoqQ3Spxz1ouVFfACu9Sqo6u88lbU40rVq
	y+zXjkfAJ5Wlcx0tnjbqR3T9BEftCAbp9ODMNSw/XTSYi59XUxgt7S4djF1c75LSHT6cYlB27Acmy
	qIQx0mEilrcj9PxFhIhIj/YejP2rRlELYg+wTXTNUgZcN9KaP2TgNMvg+LgSgcRzW0/WyNNIZM3A8
	aqIUB43w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbww2-000000095wm-3JR8;
	Sat, 03 Jan 2026 08:24:30 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbwvz-000000095wD-2ZK5;
	Sat, 03 Jan 2026 08:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=HfLB7tnzgNN40ngj7Gx7V7TV8CQHLvbaKh+evyjPmCs=; b=yBi8kW9WY5LapE2JdHgh1+Bu0b
	ThNr1iKlzM+iWHqUHPWXG9J7lKrLhPM2ZcphNG0A3mIE/gypQRi47U3C8DlkFWXYsJPPec+D2nM0Y
	4m9tVfqorLqLbwubMojDUeCD1hvo9mEVn7Lccc5BBLC2qvXmFhpU/VoEHSdgJIqcvnNU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vbwvW-001FgS-Nr; Sat, 03 Jan 2026 09:23:58 +0100
Date: Sat, 3 Jan 2026 09:23:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: daniel@makrotopia.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	hkallweit1@gmail.com, linux@armlinux.org.uk, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: Re: [PATCH net-next] net: phy: mediatek: enable interrupts on AN7581
Message-ID: <58087e55-f227-4de8-833c-c27427822e0f@lunn.ch>
References: <20260102113222.3519900-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102113222.3519900-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_002427_661383_5A0E3C65 
X-CRM114-Status: UNSURE (   5.50  )
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

On Fri, Jan 02, 2026 at 12:30:06PM +0100, Aleksander Jan Bajkowski wrote:
> Interrupts work just like on MT7988.
> 
> Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

