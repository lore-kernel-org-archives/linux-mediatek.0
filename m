Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3CDCF042F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 02:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfdoDaDNFGa/UvS6MBSS/hgSRkJVU47o/qbHgzXkGRE=; b=XWdcLxs2+IYUX1dm+U8v06chw9
	BPEj4d6Bc8fy5ZOKJ4uw5QjwbB9+5D4IcYhp1IVGD2IkyvQft9m8dv8weAjvtdIVMlvs45qw7gj+I
	mYbWBfFgRBnYm1gJ23ijc498sJDyhio6vn8/o8FITOG8K/eaCRYrbVkITDKeRaeVm35vVgWXENZN2
	ludmj1QIvAwf0iWKmW84zkJfWhWRGL7d7MsZ/qHH/p4a8QiQYWEBxANJ+1AmjAToyu9Vako0OLWDH
	Tmjsd+U3C+2NVQOgxu9ta6Qc/PbewUGruEXJUvm52Tpqku/KUEen12bwP4/DLrIekuwPQ2BVRzk/L
	qH+to3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syM0p-00000007g9W-0Ex5;
	Wed, 09 Oct 2024 02:01:15 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syLpB-00000007dgr-2rj4;
	Wed, 09 Oct 2024 01:49:15 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1syLov-000000003B1-3nWX;
	Wed, 09 Oct 2024 01:48:58 +0000
Date: Wed, 9 Oct 2024 02:48:52 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next 0/9] net: phy: mediatek: Introduce mtk-phy-lib
 which integrates common part of MediaTek's internal ethernet PHYs
Message-ID: <ZwXhBG9-SpfyJjmL@makrotopia.org>
References: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004102413.5838-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_184913_745103_73C3BF7A 
X-CRM114-Status: GOOD (  12.56  )
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

Hi Sky,

On Fri, Oct 04, 2024 at 06:24:04PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> This patchset is derived from patch[01/13]-patch[9/13] of Message ID:
> 20240701105417.19941-1-SkyLake.Huang@mediatek.com. This integrates
> MediaTek's built-in Ethernet PHY helper functions into mtk-phy-lib
> and add more functions into it.

I've imported the series to OpenWrt and have heavily tested it on
various boards by now. Hence for the whole series:

Tested-by: Daniel Golle <daniel@makrotopia.org>

As already discussed off-list I've noticed that

[PATCH 6/9] Hook LED helper functions in mtk-ge.c

does NOT work as expected as it seems to be impossible to control the
PHY LEDs of the MT7531 switch individually -- all changes to *any* of the
MMD registers always affects *all* PHYs.

Hence, if you repost the series, I would recommend to drop 6/9 for now
until a solution for this has been found (such as controlling LEDs
switch-wide using the built-in GPIO controller, or somehow de-coupling
them and allow access to the individual LED registers like on MT7988)

After taking care of the minor corrections which have already been
pointed out by Andrew Lunn you may add

Acked-by: Daniel Golle <daniel@makrotopia.org>

to all patches except for 6/9.


Cheers


Daniel

