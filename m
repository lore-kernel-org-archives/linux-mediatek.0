Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6D3C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 23 Jan 2022 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gLnFr7KXPNFKyoXR3sGzXH9W0/8/WwlRPgXeaeONp4=; b=EOMNpO/AVPGXJH
	HFjXKzX1XCwH6VJDMlWXliGNdQjSXAfA538TXsSpQKH5DySuMjAwNUsmSnHPN0H/4GDJgUHMgGztl
	SW5druEUnEqGwogbuyqJhmPWzKIdOMjOBK7RJHEEvX11rz5PcAgLfhf4vXBqce7tzgoIjkY9QE3yP
	zmFJuCwRNmxDX4OYT6EvcIpD0zc4EGN7972ZJmwhdwEQukgC7o6oIAMGJsOYGmF25pAEJ+uw362KU
	OPvBHvmknMCLwzJpcLm2tglNZ3P9CHGcL7/BSuZ07ANJK7X0hmu5vRKHXzbZ5DcCfs1+T77R6+hMy
	10M1CPqj+3QGbgDzXhTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBfIo-001FGE-HW; Sun, 23 Jan 2022 16:01:14 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBfCU-001DJO-1p; Sun, 23 Jan 2022 15:54:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=7QuzV0xUqMcqlybybHjjxruT8uYyoncKxFO84jO3pZw=; b=6RDIz5HpE/Hb76XWRZjGAksyKY
 ufq2ZfMZbZYskeE/CyfAwTIw7uqHxUZEbhvswZ5Lel1yuQFp33k+ktJTuvvmzj0+psykPL+FQwnMc
 n9oI4RcEi1LB5i5ImrzjA1iffn8B+LF1DOrstaDmET1hM0Isb4BRjw7xRix1PR+7LMkI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1nBfCC-002OMg-QW; Sun, 23 Jan 2022 16:54:24 +0100
Date: Sun, 23 Jan 2022 16:54:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Byungho An <bh74.an@samsung.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH] net: dsa|ethernet: use bool values to pass bool param of
 phy_init_eee
Message-ID: <Ye16MDZ/Bp2KZcJq@lunn.ch>
References: <20220123152241.1480-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123152241.1480-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_075442_136726_C54EAEC6 
X-CRM114-Status: UNSURE (   6.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 23, 2022 at 11:22:41PM +0800, Jisheng Zhang wrote:
> The 2nd param of phy_init_eee(): clk_stop_enable is a bool param, use
> true or false instead of 1/0.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
