Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EDEC27C53
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jun 2024 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w5rwYa7bI68oLnkoYbazba1jipftrm7TeicnDw0Zws8=; b=OT8RwB02l9mLjRqb7VTQETWWwy
	6M3vO4yrZkxtUKD8w+zOXfxnfCvXlYkIucyE3dT1DnbFGYceCCFYw0cLh5yapeJd2PPpTQFHXYLKq
	yhsj02b82a0eK4YDR9TB+2OEWiHDO3/GVj/qrz6VCVUXx5ji9Pz5fTt3U3ViBdD047DswflW99scJ
	qeai3XxuQAdZ0gxZcHgb093mAmLCRC/LJG6xAl7fiD9H3QUG+FT2JE42WLIQPsihps538zd261+55
	/36fpk1UHobtO0BQCTI9QUEXMOunkNNaxDl9PpxuwVuOldi4GsTjwLI0j7FPEfrUlznQEo6o08Bpy
	JImco3Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4kf-0000000CWy9-1UH2;
	Sat, 22 Jun 2024 17:42:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL4ka-0000000CWwO-3kNe;
	Sat, 22 Jun 2024 17:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=w5rwYa7bI68oLnkoYbazba1jipftrm7TeicnDw0Zws8=; b=RYVH1pldyhqC5cJIpFRMib/IKx
	0a0Navc+8oGu/NcUrNmMVRDhCMDQMk8g64AhzlgmziYjKH5Qz4FHScUlRTuaIo1SzY2KDQ2OGcP27
	MNNPE5gv7h1p8Hg2qUURub2dzU+J/zLwLMeRwN8zqxC6kiYhlGZD64SeuHpyFRDm3Dew=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sL4kN-000k5J-B6; Sat, 22 Jun 2024 19:41:55 +0200
Date: Sat, 22 Jun 2024 19:41:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v8 09/13] net: phy: mediatek: Add token ring
 access helper functions in mtk-phy-lib
Message-ID: <2c0ce908-55a5-4194-ac7b-68828ed10399@lunn.ch>
References: <20240621122045.30732-1-SkyLake.Huang@mediatek.com>
 <20240621122045.30732-10-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240621122045.30732-10-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_104208_952675_3BE8E692 
X-CRM114-Status: UNSURE (   8.41  )
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

On Fri, Jun 21, 2024 at 08:20:41PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patch adda TR(token ring) manipulations and add correct

s/adda/adds

plus "adds the correct macro names for"

> macro name for those magic numbers. TR is a way to access
> proprietary register on page 52b5. Use these helper functions

registers

> +/* ch_addr = 0x2, node_addr = 0xd, data_addr = 0x8 */
> +/* clear this bit if wanna select from AFE */
> +/* Regsigdet_sel_1000 */
> +#define EEE1000_SELECT_SIGNEL_DETECTION_FROM_DFE	BIT(4)

Should that be SIGNAL?

	Andrew

